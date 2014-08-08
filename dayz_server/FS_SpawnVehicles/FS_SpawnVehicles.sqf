/*---------------------------------
Author: frodster / Judge Bread
Re-write by Player2
---------------------------------*/

private ["_vehLimit","_p2d","_fnc_spawn_vehicle","_fnc_GetStaticVehicleLocationConfig","_fnc_GetStaticVehicleUsageConfig","_found","_usageName","_array","_count","_vehicle","_locationConfig","_locationArray","_existingVehicles","_locationArrayCount","_nearbyList","_nearbyCount","_usageConfig","_useHandle","_inUse","_index"];
_vehLimit = _this select 0;

/*** DEBUG MESSAGES ***/
// Set to true to display debug messages to the RPT file.
_p2d = P2DZ_Debug_StaticVehSpawns;
/*** DEBUG MESSAGES ***/

if (isNil "_p2d") then {
	_p2d = false;
};

if (isNil ("StaticVehicleUsageConfig")) then {
	StaticVehicleUsageConfig = [];
};

if (isNil ("StaticVehicleSpawnConfig")) then {
	StaticVehicleSpawnConfig = ["AllVehicles",""];
	diag_log ("Static Vehicle Spawn: ERROR: StaticVehicleSpawnConfig missing. Please check the Locations file.");
}
else {
	if (count StaticVehicleSpawnConfig == 0) then {
		StaticVehicleSpawnConfig = ["AllVehicles",""];
	};
};

/****    FUNCTIONS START    ****/

// Switch off the relevant static vehicle usage element to disable future executions.
// Parameters: LocationArrayName and Index.
fnc_SwitchOffUsageConfig = {
	private ["_spawnLocationName","_index"];
	_spawnLocationName = _this select 0;
	_index = _this select 1;
		
	if (_index > -1) then {
		StaticVehicleUsageConfig set [_index, [_spawnLocationName, false, false]];
		diag_log (format["Static Vehicle Spawn: Static vehicle spawn locations for %1 switched off.",_spawnLocationName]);
	};
};


// Spawn a vehicle.
// Parameter: vehicle and array containing location configuration name, usage (bool) & index of usage config.
_fnc_spawn_vehicle = {
	private ["_vehicle","_usageConfig","_position","_p2d","_dir","_veh","_marker","_objPosition"];	
	if (!isDedicated) exitWith { }; // Be sure to run this
	
	_vehicle = _this select 0;
	_usageConfig = _this select 1;
	_p2d = _this select 2;


	_position = []; 
	// if allowed vehicle was retrieved.
	if (!(_vehicle == "")) then {
		// add vehicle to counter for next pass
		serverVehicleCounter set [count serverVehicleCounter,_vehicle];

		if (_usageConfig select 1) then {
			_position = [_vehicle,_usageConfig,_p2d] call server_staticVehicleSpawnInit;
		};

		if (_p2d) then {	
			diag_log(" "); 	diag_log(" ");
			diag_log("= 	STATIC VEHICLE SPAWNS - SPAWNING VEHICLES		=");
			diag_log("-->Type Of Vehicles: " + str _vehicle);
			diag_log("-->Amount of Positions: " + str(count _position));
			diag_log("-->Position List: " + str _position);
			diag_log(" "); 	diag_log(" ");
		};

		{
			// only proceed if two params otherwise BIS_fnc_findSafePos failed and may spawn in air
			if ((count (_x) == 2)) then { 
		
				_dir = _x select 0;

				//place vehicle 
				_veh = createVehicle [_vehicle, (_x select 1), [], 0, "CAN_COLLIDE"];
				_veh setdir _dir;
				_veh setpos (_x select 1);		

				_veh call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};
				
				if(DZEdebug) then {
					_marker = createMarker [str((_x select 1)) , (_x select 1)];
					_marker setMarkerShape "ICON";
					_marker setMarkerType "DOT";
					_marker setMarkerText _vehicle;
				};	
			
				// Get position with ground
				_objPosition = getPosATL _veh;
				if (_p2d) then {	diag_log(" "); diag_log("Static Spawn Vehicle of Type: " + str _veh + " Created At: " + str _objPosition + " With Direction: " + str _dir); };

				clearWeaponCargoGlobal  _veh;
				clearMagazineCargoGlobal  _veh;
				// _veh setVehicleAmmo DZE_vehicleAmmo;

				[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
			} else {
				diag_log("Static Veh Spawn: Position Failed: " + str _x);
			};
		} forEach _position;


	};
};

// Get the relevant Spawn Location array configuration.
// Parameter: vehicle
// Returns relevant StaticVehicleSpawnConfig value for vehicle.
_fnc_GetStaticVehicleLocationConfig = {
	private ["_vehicle","_staticLocationsName","_typeName"];
	_vehicle = _this select 0;
	_staticLocationsName = "";
	{
		_typeName = _x select 0;
		_staticLocationsName = "";
		if (_vehicle isKindOf _typeName) exitWith {
			_staticLocationsName = _x select 1;
		};
	} forEach StaticVehicleSpawnConfig;
	_staticLocationsName
};

// Get the usage configuration for the location name.
// Parameter: Location array name.
// Returns: Array containing location name, usage (bool), in use (bool) and index of StaticVehicleUsageConfig.
_fnc_GetStaticVehicleUsageConfig = {
	private ["_locationNameToFind","_staticVehicleUsage","_index","_staticLocationsName"];
	_locationNameToFind = _this select 0;
	_staticVehicleUsage = ["",false,-1];
	_index = 0;
	if (!(_locationNameToFind == "")) then {
		{
			_staticLocationsName = _x select 0;
			if (_staticLocationsName == _locationNameToFind) exitWith {
				// If global var is off then set static vehicle usage to false.
				if (DZE_FS_UseStaticVehicleSpawn) then {
					_staticVehicleUsage = [_x select 0, _x select 1, _x select 2, _index];
				}
				else {
					_staticVehicleUsage = [_x select 0, false, false, _index];
				};
			};
			_index = _index + 1;
		} forEach StaticVehicleUsageConfig;
	};
	_staticVehicleUsage
};

/****    FUNCTIONS END    ****/

// Create the StaticVehicleUsageConfig array.
// Each element contains the [LocationName, UseStatic (bool), InUse (bool)]
if (count StaticVehicleSpawnConfig > 0 && (count StaticVehicleUsageConfig == 0)) then {
	{
		private ["_name","_found"];
		_name = _x select 1;
		_found = false;
		{	// Find if the location is already added.
			private ["_usageName"];
			_usageName = _x select 0;
			if (_name == _usageName) exitWith {
				_found = true;
			};			
		} forEach StaticVehicleUsageConfig;
		// location not added. Add config depending on size of location array.
		if (!_found && (!(_name == ""))) then {
			private ["_array","_count"];
			_array = call compile format["%1",_name];
			_count = count _array;
			if (_count > 0) then {
				StaticVehicleUsageConfig set [(count StaticVehicleUsageConfig), [_name, true, false]];
			}
			else {
				StaticVehicleUsageConfig set [(count StaticVehicleUsageConfig), [_name, false, false]];
			};
		};
	} forEach StaticVehicleSpawnConfig;
};
//www.ZombZ.net
// Spawn the vehicles upto the vehicle limit or lower the limit to what can be spawned in.
if(_vehLimit > 0) then {
	private ["_allowedVehicleCount"];
	if (_p2d) then {	diag_log("count StaticVehicleSpawnConfig: " + str(count StaticVehicleSpawnConfig)); };

	{
			private ["_vehicle","_locationConfig","_locationArray","_existingVehicles","_locationArrayCount","_nearbyList","_nearbyCount","_usageConfig","_useHandle","_inUse","_index"];			_vehicle = (_x select 0);
			_locationConfig = [_vehicle] call _fnc_GetStaticVehicleLocationConfig;
			_locationArray = call compile _locationConfig;
			_existingVehicles = allMissionObjects (_vehicle);
			_existingVehicles = count _existingVehicles;
			_locationArrayCount = count _locationArray;               
			if (_existingVehicles < _locationArrayCount) then {
				{	
					_nearbyList = (_x select 1) nearEntities [["Air","LandVehicle","Ship"], P2DZ_StaticVehSpawns_DupeDistanceCheck];
					_nearbyCount = count _nearbyList;
					if ((_nearbyCount) > 0) then {
						dontSpawn = true;
						reasonForNoSpawn = "Vehicle already at spawnpoint";
					} else {
						dontSpawn = false;
					}

				} forEach _locationArray;

			} else {
				dontSpawn = true;
				reasonForNoSpawn = "Too many existing";
			};

			if (dontSpawn) then {

				if (_p2d) then {	diag_log("Static Vehicle Spawn: Failed for Vehicles: " + str _vehicle + " Reason: " + str reasonForNoSpawn); };

			} else {

				if (_p2d) then {	diag_log(" "); diag_log(" "); diag_log("Spawning of " + _vehicle + " is Ok! No duplicates!"); };
				_usageConfig = [_locationConfig] call _fnc_GetStaticVehicleUsageConfig;
				_useHandle = _usageConfig select 1;
				_inUse = false;
				_index = _usageConfig select 3;
				if (_p2d) then {
					diag_log (format["Vehicle spawn %1 started for %2", _x, _vehicle]);
				};
				
				[_vehicle,_usageConfig,_p2d] call _fnc_spawn_vehicle;

			};


	} forEach StaticVehicleSpawnConfig;
};
