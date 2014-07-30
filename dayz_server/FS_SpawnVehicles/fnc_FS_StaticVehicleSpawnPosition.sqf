/*---------------------------------
Author: frodster / Judge Bread
Version: 1.0
Description: 
Find a suitable spawn position if possible using the available arguments.
Manage the location array's elements so as not to search or use the same location information more than once.
Arguments:
- Vehicle class
- Spawn Location Array
- Usage Configuration
- Debug Messages (boolean value to determine if they should be on/off)
---------------------------------*/

private ["_vehicleClass","_spawnLocationArray","_usageConfig","_resultLocation","_locError","_locationFound","_arrayCount","_maxCount","_counter","_usageSwitchedOff","_debugMessages"];

_vehicleClass = _this select 0;
_spawnLocationArray = _this select 1;
_usageConfig = _this select 2;
_debugMessages = _this select 3;

_resultLocation = [];
_locError = false;
_locationFound = false;
_usageSwitchedOff = false;
_arrayCount = 0;
_counter = 0;
_maxCount = 5;

if (isNil "_debugMessages") then {
	_debugMessages = false;
};

// Check if passed in argument is an array. If it is, get the count of elements.
if (!(typeName _spawnLocationArray == "ARRAY")) then {
	_locError = true;
}
else {
	_arrayCount = count _spawnLocationArray;
};

//	Set relevant max counts or set _locError (location error) if no data.
if (!(_locError)) then {
	diag_log (format["Static Vehicle Spawn: Started for: %1", _vehicleClass]);
	if (_arrayCount == 0) then {
		diag_log ("Static Vehicle Spawn: Static Location Array is empty.");
		// Turn off static vehicle spawn usage.
		[_usageConfig select 0, _usageConfig select 3] spawn fnc_SwitchOffUsageConfig;
		_usageSwitchedOff = true;
	}
	else {
		if (_arrayCount < _maxCount) then {
			_maxCount = _arrayCount;
		};
	};
}
else {
	// Switch off static vehicle spawn as errored
	[_usageConfig select 0, _usageConfig select 3] spawn fnc_SwitchOffUsageConfig;
	_usageSwitchedOff = true;
};

// Find spawn position for vehicle if possible.
while {((!(_locError)) && (_counter < _maxCount) && (_maxCount > 0) && (!(_locationFound)))} do {
	private ["_index","_tempLoc","_location","_randomNotFound","_isIgnoreValue","_isTooMany"];
	_index = -1;
	_tempLoc = [];
	_location = [];
	_randomNotFound = true;
	_isTooMany = true;
	
	// Find a valid location that should not be ignored.
	_tempLoc = [_spawnLocationArray] call fnc_GetLastArrayElement;
		
	if (_debugMessages) then {
		_index = [_spawnLocationArray, _tempLoc] call fnc_LastIndexOfArrayElement;
		diag_log (format["Static Vehicle Spawn: %1 - Checking Location: %2", _vehicleClass,_tempLoc]);
		diag_log (format["Static Vehicle Spawn: %1 - Location Index: %2", _vehicleClass,_index]);
	};
	
	// Check if valid location was retrieved.
	if ((count _tempLoc == 0) || (count _tempLoc > 3)) then {
		diag_log (format["Static Vehicle Spawn: ERROR: Incorrect coordinates for vehicle spawn location: %1", _tempLoc]);
		_locError = true;
	}
	else {
		_location = [_tempLoc select 0,_tempLoc select 1];
	};
	
	if (!(_locError)) then {
		// Check if there is a vehicle already at/near the position.
		// Enforced here so that we can remove the location/element from the array regardless of its usability.
		_isTooMany = _location nearObjects ["AllVehicles",50];
		if ((count _isTooMany) > 0) then {
			_locationFound = false;
			diag_log (format["Static Vehicle Spawn: Too many vehicles at %1", _location]);
		}
		else {
			_locationFound = true;
			_resultLocation = _location;
		};			
	};
	_counter = _counter + 1;
	if ((count _spawnLocationArray) > 0) then  {
		// Remove the location from the next search.
		_spawnLocationArray resize ((count _spawnLocationArray) - 1);
	};
	
	// Check for size of array after resizing.
	if ((count _spawnLocationArray) == 0) then {
		if (!(_locationFound)) then {
			// turn locError on to ensure loop does not continue.
			_locError = true;
		};
		// Switch off static vehicle usage for future runs.
		[_usageConfig select 0, _usageConfig select 3] spawn fnc_SwitchOffUsageConfig;
		_usageSwitchedOff = true;
	};
	
	if ((_counter == _maxCount) && (!(_locationFound)) && _debugMessages) then {
		diag_log ("Static Vehicle Spawn: Max attempts to find spawn location reached. Exiting.");
	};
};

// Finished using Location array. Update StaticVehicleUsageConfig.
if (!_usageSwitchedOff) then {
	StaticVehicleUsageConfig set [(_usageConfig select 3), [_usageConfig select 0, true, false]];
};

// Check for a valid result.
if ((count _resultLocation) == 2) then {
	_resultLocation = [_resultLocation select 0, _resultLocation select 1];
	diag_log (format["Static Vehicle Spawn:     Vehicle: %1    given Location: %2", _vehicleClass, _resultLocation]);
};

_resultLocation