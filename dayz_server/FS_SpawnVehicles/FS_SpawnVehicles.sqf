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
	private ["_vehicle","_usageConfig","_position","_p2d","_dir","_veh","_marker","_objPosition","_dontSpawn","_reasonForNoSpawn","_nearbyList","_nearbyCount"];	
	if (!isDedicated) exitWith { }; // Be sure to run this
	
	_vehicle = _this select 0;
	_usageConfig = _this select 1;
	_p2d = _this select 2;
	_maxSpawn = _usageConfig select 4;

	_position = []; 
	// if allowed vehicle was retrieved.
	if (!(_vehicle == "")) then {
		// add vehicle to counter for next pass
		serverVehicleCounter set [count serverVehicleCounter,_vehicle];

		if (_usageConfig select 1) then {
			_position = [_vehicle,_usageConfig,_p2d] call server_staticVehicleSpawnInit;
			_spawnPos = _position select 0; 
		};

		_existingCount = _vehicle call fnc_p2CountStaticVehicles;

		if (_p2d) then {	
			diag_log(" "); 	diag_log(" ");
			diag_log("= 	STATIC VEHICLE SPAWNS - SPAWNING VEHICLES		=");
			diag_log("-->Type Of Vehicles: " + str _vehicle);
			diag_log("-->Amount of Positions: " + str(count _position));
			diag_log("-->Max Spawned In: " + str(_maxSpawn));
			diag_log("-->Current Spawned In: " + str(_existingCount));
			diag_log("-->Position List: " + str _position);
			diag_log(" "); 	diag_log(" ");
		};

		private["_vehSpawned","_attemptCount"];
		_vehSpawned = 0; _attemptCount = 0;

		if (!isNil '_existingCount') then {
			_vehSpawned = _existingCount;
		};

		while {_vehSpawned < _maxSpawn && _attemptCount < P2DZ_maxVehSpawnAttempts} do {
			private["_randCountPos","_randSelPos","_spawnPos"];
			_randCountPos = 0;
			_randSelPos = 0;
			_spawnPos = [];
			_randCountPos = count _position;
			_randSelPos = (random(_randCountPos));
			_randSelPos = floor _randSelPos;
			_spawnPos = (_position) select _randSelPos;
			if (_p2d) then { 

				diag_log(format["--> Vehicles Spawned: %1 of %2 | (Failures: %3)", _vehSpawned,_maxSpawn, _attemptCount]);
				diag_log(format["--> Selected Random Pos: %1", _spawnPos]);
			};

			// only proceed if two params otherwise BIS_fnc_findSafePos failed and may spawn in air
			if ((count (_spawnPos) == 2)) then { 
		
				_dir = _spawnPos select 0;

				_nearbyList = (_spawnPos select 1) nearEntities [["Air","LandVehicle","Ship"], P2DZ_StaticVehSpawns_DupeDistanceCheck];
				_nearbyCount = count _nearbyList;
				if ((_nearbyCount) > 0) then {
					_dontSpawn = true;
					_reasonForNoSpawn = "Vehicle already at spawnpoint";
				} else {
					_dontSpawn = false;
				};

				if (_dontSpawn) then {
					_attemptCount = _attemptCount + 1;
					if (_p2d) then {	diag_log("Static Vehicle Spawn: Failed for Vehicles: " + str _vehicle + " Reason: " + str _reasonForNoSpawn); };
				} else {
					
					if ((_vehicle) == "SUV_TK_CIV_EP1_DZE1") then {
						private["_randCount","_randSel"];
						_randCount = 0;
						_randSel = 0;
						_randCount = count SUV_VEHICLE_LIST;
						_randSel = (random(_randCount));
						_randSel = floor _randSel;
						_vehicle = SUV_VEHICLE_LIST select _randSel;
						if (_p2d) then { diag_log("P2DEBUG: Random SUV Selected: " + str _vehicle)};
					};

					if ((_vehicle) == "350z") then {
						private["_randCount","_randSel"];
						_randCount = 0;
						_randSel = 0;
						_randCount = count (Nissan350z_VEHICLE_LIST);
						_randSel = (random(_randCount));
						_randSel = floor _randSel;
						_vehicle = (Nissan350z_VEHICLE_LIST) select _randSel;
						if (_p2d) then { diag_log("P2DEBUG: Random 350z Selected: " + str _vehicle)};
					};

					//place vehicle 
					_veh = createVehicle [_vehicle, (_spawnPos select 1), [], 0, "CAN_COLLIDE"];
					_veh setdir _dir;
					_veh setposATL (_spawnPos select 1);		

					//add to veh spawned
					_vehSpawned = _vehSpawned + 1;

					//remove magazines
					clearMagazineCargoGlobal _veh;

					//remove weapons
					clearWeaponCargoGlobal _veh;

					//remove vehicle weapon ammo (eg m240 on humvee ammo)
					//_veh setAmmo 0;
					
					_veh call player2_removeVehicleWeapons;

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
						_marker = createMarker [str((_spawnPos select 1)) , (_spawnPos select 1)];
						_marker setMarkerShape "ICON";
						_marker setMarkerType "DOT";
						_marker setMarkerText _vehicle;
					};	
				
					// Get position
					_objPosition = GetPosATL _veh;
					if (_p2d) then {	diag_log(" "); diag_log("Static Spawn Vehicle of Type: " + str _veh + " Created At: " + str _objPosition + " With Direction: " + str _dir); };

					clearWeaponCargoGlobal  _veh;
					clearMagazineCargoGlobal  _veh;
					// _veh setVehicleAmmo DZE_vehicleAmmo;

					[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
					_vehicle = _this select 0; // just in case it was modified by suv/350z changes...
				};
			} else {
				diag_log("Static Veh Spawn: Position Failed: " + str _spawnPos);
			};


		};


		
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
					_staticVehicleUsage = [_x select 0, _x select 1, _x select 2, _index, _x select 3];
				}
				else {
					_staticVehicleUsage = [_x select 0, false, false, _index, _x select 3];
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
		_numToSpawn = _x select 2;

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
				StaticVehicleUsageConfig set [(count StaticVehicleUsageConfig), [_name, true, false, _numToSpawn]];
			}
			else {
				StaticVehicleUsageConfig set [(count StaticVehicleUsageConfig), [_name, false, false, _numToSpawn]];
			};
		};
	} forEach StaticVehicleSpawnConfig;
};
//www.ZombZ.net
// Spawn the vehicles upto the vehicle limit or lower the limit to what can be spawned in.
if(_vehLimit > 0) then {
	private ["_allowedVehicleCount"];
	if (_p2d) then {	diag_log("count StaticVehicleSpawnConfig: " + str(count StaticVehicleSpawnConfig)); };
	_dontSpawn = false;
	_reasonForNoSpawn = "None";

	{
			private ["_randCount","_randSel","_vehicle","_locationConfig","_locationArray","_existingVehicles","_locationArrayCount","_usageConfig","_useHandle","_inUse","_index"];
			_vehicle = (_x select 0);
			_locationConfig = [_vehicle] call _fnc_GetStaticVehicleLocationConfig;
			_usageConfig = [_locationConfig] call _fnc_GetStaticVehicleUsageConfig;
			_useHandle = _usageConfig select 1;
			_inUse = false;
			_index = _usageConfig select 3;
			if (_p2d) then {
				diag_log (format["Vehicle spawn %1 started for %2", _x, _vehicle]);
			};
			
			[_vehicle,_usageConfig,_p2d] call _fnc_spawn_vehicle;

	} forEach StaticVehicleSpawnConfig;
};
