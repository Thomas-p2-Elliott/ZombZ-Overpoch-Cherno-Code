/*---------------------------------
Modified by Player2 for www.ZombZ.net
---------------------------------*/

private ["_vehicle","_usageConfig","_staticLocationsName","_staticSpawnPosition","_useStatic","_staticPosition","_debugMessages","_direction"];

_vehicle = _this select 0;
_usageConfig = _this select 1;
_debugMessages = _this select 2;

if (isNil ("_debugMessages")) then {
	_debugMessages = false;
};

_staticLocationsName = _usageConfig select 0;
_useStatic = _usageConfig select 1;
_staticSpawnPosition = [];
_staticPosition = [];
_direction = "";

if (_useStatic) then {
	private ["_locationArray"];
	_locationArray = [];
	
	// compile location name string. if array get static position value.
	_locationArray = call compile _staticLocationsName;

	if (typeName _locationArray == "ARRAY") then {
		// call position function with arguments - vehicle, locationArray, usageConfig and true/false for debug messages.
		_staticPosition = [_vehicle, _locationArray, _usageConfig, _debugMessages] call server_fnc_staticVehiclePosition;
	} else {
		diag_log (format["Static Vehicle Spawn: ERROR: %1 is not a valid static vehicle spawn array name.", (_usageConfig select 0)]);
		_errored = true;
		StaticVehicleUsageConfig set [(_usageConfig select 3), [_staticLocationsName, false, false]];
	};
	
	// if valid position retrieved. Return valid coordinates.
	if (count _staticPosition > 0) then {
		diag_log("Static Vehicle Spawn: Valid _staticSpawnPosition: " + str(_staticPosition));
	};
};

_staticPosition