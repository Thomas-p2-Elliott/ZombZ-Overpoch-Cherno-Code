/*---------------------------------
Author: frodster / Judge Bread
Re-write by Player2 for www.ZombZ.net
---------------------------------*/
private ["_vehicleClass","_spawnLocationArray","_usageConfig","_debugMessages","_resultLocation","_locError","_locationFound","_usageSwitchedOff","_arrayCount","_counter","_maxCount"];

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
_maxCount = 100;

if (isNil "_debugMessages") then {
	_debugMessages = false;
};

if (_debugMessages) then {
	diag_log("Static Vehicle Spawn: " + __FILE__);
	diag_log(str _this);
	diag_log(str _spawnLocationArray);
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
	if (_debugMessages) then {
		diag_log (format["Static Vehicle Spawn: Started for: %1", _vehicleClass]);
	};
	if (_arrayCount == 0) then {
		diag_log ("Static Vehicle Spawn: Static Location Array is empty.");
		// Turn off static vehicle spawn usage.
		[_usageConfig select 0, _usageConfig select 3] call fnc_SwitchOffUsageConfig;
		_usageSwitchedOff = true;
	}
	else {
		if (_arrayCount < _maxCount) then {
			_maxCount = _arrayCount;
		};
	};
} else {
	// Switch off static vehicle spawn as errored
	diag_log("Array Failed: " + str _spawnLocationArray  + "	Switching off Usage of this vehicle for future checks...");
	[_usageConfig select 0, _usageConfig select 3] call fnc_SwitchOffUsageConfig;
	_usageSwitchedOff = true;
};

//www.ZombZ.net
//if no issue with _spawnLocationArray for vehicle
if ((!(_locError)) && !(_usageSwitchedOff)) then {
	_resultLocation = _spawnLocationArray;
	_resultLocation
} else {
	diag_log("Static Vehicle Spawn: Error: No SpawnLocatioArray Found!");
	_resultLocation
};