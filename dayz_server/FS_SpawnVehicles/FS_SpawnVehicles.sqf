/*---------------------------------
Author: frodster / Judge Bread
Version: 1.0
Description: 
Manage the spawning of vehicles on the server.
Vehicle will be spawned at static location if position is available else it will utilize the default dynamic vehicle spawn system of Epoch (created by the Epoch dev team).
Arguments:
- Number of Vehicles to spawn.
---------------------------------*/

private ["_vehLimit","_fnc_GetAllowedVehicleCount","_fnc_GetAllowedVehicle","_fnc_spawn_vehicle","_fnc_GetStaticVehicleLocationConfig","_fnc_GetStaticVehicleUsageConfig","_debugMessages"];

_vehLimit = _this select 0;

/*** DEBUG MESSAGES ***/
// Set to true to display debug messages to the RPT file.
_debugMessages = true;
/*** DEBUG MESSAGES ***/

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

// Returns the last non empty element of array. Else returns empty array.
// Parameters: [array]
// Returns last element or [].
fnc_GetLastArrayElement = {
	private ["_locationArray","_resultElement", "_arraySize"];
	_locationArray = _this select 0;
	_arraySize = count _locationArray;
	_resultElement = [];
	if (_arraySize > 0) then {
		_resultElement = _locationArray select (_arraySize - 1);
	}
	else {
		diag_log ("Static Vehicle Spawn: No valid static vehicle spawn positions left.");
	};
	_resultElement
};

// Finds the last index of element in array.
// Empty array elements are ignored i.e. [].
// If not found or empty element was provided then, returns -1.
// Parameters: [array, value] (array to search; value to find)
fnc_LastIndexOfArrayElement = {
	private ["_array","_valToIndex","_arrayIndex","_arrayIndexNotFound","_found","_element","_ignoreThis"];
	_array = _this select 0;
	_valToIndex = _this select 1;
	_arrayIndex = ((count _array) - 1);	// Last element of array.
	_arrayIndexNotFound = -1;			// Default value returned when not found.
	_found = false;
	_ignoreThis = [];
	// loop until value is found or all array's elements have been checked.
	while {(!(_found)) && (_arrayIndex > _arrayIndexNotFound)} do {
		_element = _array select _arrayIndex;
		if ((count _element) > 0) then {
			if ([_element, _valToIndex] call fnc_fs_ArrayCompare) then {
				_found = true;
			};
		};
		// if not found iterate.
		if (!(_found)) then {
			_arrayIndex = _arrayIndex - 1;
		};
	};	
	
	if (!(_found)) then {
		_arrayIndex = _arrayIndexNotFound;
	};
	_arrayIndex
};

// Compares two arrays.
// Parameters: [array1, array2]
// Returns true if arrays match, false if not
fnc_fs_ArrayCompare = {
	private ["_array1", "_array2", "_i", "_return"];	
	_array1 = _this select 0;
	_array2 = _this select 1;
	_return = true;
	
	if ( (count _array1) != (count _array2) ) then {
		_return = false;
	}
	else {
		if ((count _array1) == 0) then {
			_return = true;
		}
		else {
			_i = 0;
			while {_i < (count _array1) && _return} do {
				if ( (typeName (_array1 select _i)) != (typeName (_array2 select _i)) ) then {
					_return = false;
				}
				else {
					if (typeName (_array1 select _i) == "ARRAY") then {
						if (!([_array1 select _i, _array2 select _i] call fnc_fs_ArrayCompare)) then {
							_return = false;
						};
					}
					else {
						if ((_array1 select _i) != (_array2 select _i)) then {
							_return = false;
						};
					};
				};
				_i = _i + 1;
			};
		};
	};
	_return
};

// Switch off the relevant static vehicle usage element to disable future executions.
// Parameters: LocationArrayName and Index.
fnc_SwitchOffUsageConfig = {
	private ["_index","_spawnLocationName"];
	_spawnLocationName = _this select 0;
	_index = _this select 1;
		
	if (_index > -1) then {
		StaticVehicleUsageConfig set [_index, [_spawnLocationName, false, false]];
		diag_log (format["Static Vehicle Spawn: Static vehicle spawn locations for %1 switched off.",_spawnLocationName]);
	};
};

// Returns the total count of vehicles in the AllowedVehicleList.
_fnc_GetAllowedVehicleCount = {
	private ["_vehicleCount"];
	_vehicleCount = 0;
	{	
		_vehicleCount = _vehicleCount + (_x select 1);
	} forEach AllowedVehiclesList;
	_vehicleCount
};

// Returns an available vehicle if possible; Else returns an empty string.
_fnc_GetAllowedVehicle = {
	private ["_resultVehicle","_index","_random","_vehicle","_velimit","_qty","_lastIndex"];
	while {count AllowedVehiclesList > 0} do {
		//BIS_fnc_selectRandom replaced because the index may be needed to remove the element
		_index = floor random count AllowedVehiclesList;
		_random = AllowedVehiclesList select _index;

		_vehicle = _random select 0;
		_velimit = _random select 1;

		_qty = {_x == _vehicle} count serverVehicleCounter;

		// If under limit allow to proceed
		if (_qty <= _velimit) exitWith {};

		// vehicle limit reached, remove vehicle from list
		// since elements cannot be removed from an array, overwrite it with the last element and cut the last element of (as long as order is not important)
		_lastIndex = (count AllowedVehiclesList) - 1;
		if (_lastIndex != _index) then {
			AllowedVehiclesList set [_index, AllowedVehiclesList select _lastIndex];
		};
		AllowedVehiclesList resize _lastIndex;
	};
	
	if (count AllowedVehiclesList == 0) then {
		diag_log("DEBUG: unable to find suitable vehicle to spawn");
		// No valid vehicle to return. Set return value to a null object.
		_resultVehicle = "";
	}
	else {
		// Set return value to available vehicle.
		_resultVehicle = _vehicle;
	};
	_resultVehicle	
};

// Spawn a vehicle.
// Parameter: vehicle and array containing location configuration name, usage (bool) & index of usage config.
_fnc_spawn_vehicle = {
	private ["_weights","_index","_vehicle","_isAir","_isShip","_position","_dir","_istoomany","_veh","_objPosition","_marker","_iClass","_itemTypes","_cntWeights","_itemType","_num","_allCfgLoots","_usageConfig","_debugMsgs"];
	
	if (!isDedicated) exitWith { }; // Be sure to run this
	
	_vehicle = _this select 0;
	_usageConfig = _this select 1;
	_debugMsgs = _this select 2;
	
	_position = []; 
	// if allowed vehicle was retrieved.
	if (!(_vehicle == "")) then {
		// add vehicle to counter for next pass
		serverVehicleCounter set [count serverVehicleCounter,_vehicle];
		// Find Vehicle Type to better control spawns
		_isAir = _vehicle isKindOf "Air";
		_isShip = _vehicle isKindOf "Ship";
		
		// Get position for spawning in the vehicle
		if(_isShip || _isAir) then {
			if(_isShip) then {
				// Static Vehicle Spawn
				if (_usageConfig select 1) then {
					_position = [_vehicle,_usageConfig,_debugMsgs] call server_staticVehicleSpawnInit;
				};
				
				// if static vehicle spawn did not set a valid position. Use default dynamic vehicle spawn.
				if ((count _position) != 2) then {
					// Spawn anywhere on coast on water
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [MarkerPosition,0,DynamicVehicleArea,10,1,2000,1] call BIS_fnc_findSafePos;
					//diag_log("DEBUG: spawning boat near coast " + str(_position));
				};
			} else {
				// Static Vehicle Spawn
				if (_usageConfig select 1) then {
					_position = [_vehicle,_usageConfig,_debugMsgs] call server_staticVehicleSpawnInit;
				};
				
				// if static vehicle spawn did not set a valid position. Use default dynamic vehicle spawn.
				if ((count _position) != 2) then {
					// Spawn air anywhere that is flat
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
					//diag_log("DEBUG: spawning air anywhere flat " + str(_position));
				};
			};
		} else {
			// Static Vehicle Spawn
			if (_usageConfig select 1) then {
				_position = [_vehicle,_usageConfig,_debugMsgs] call server_staticVehicleSpawnInit;
			};
							
			// if static vehicle spawn did not set a valid position. Use default dynamic vehicle spawn.
			if ((count _position) != 2) then {
				// Spawn around buildings and 50% near roads
				if((random 1) > 0.5) then {
				
					waitUntil{!isNil "BIS_fnc_selectRandom"};
					_position = RoadList call BIS_fnc_selectRandom;
				
					_position = _position modelToWorld [0,0,0];
				
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;				
					//diag_log("DEBUG: spawning near road " + str(_position));
				
				} else {
				
					waitUntil{!isNil "BIS_fnc_selectRandom"};
					_position = BuildingList call BIS_fnc_selectRandom;
				
					_position = _position modelToWorld [0,0,0];
				
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [_position,0,40,5,0,2000,0] call BIS_fnc_findSafePos;			
					//diag_log("DEBUG: spawning around buildings " + str(_position));		
				};
			};
		};
		
		// only proceed if two params otherwise BIS_fnc_findSafePos failed and may spawn in air
		if ((count _position) == 2) then { 
	
			_dir = round(random 180);
		
			_istoomany = _position nearObjects ["AllVehicles",50];
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many vehicles at " + str(_position)); };
		
			//place vehicle 
			_veh = createVehicle [_vehicle, _position, [], 0, "CAN_COLLIDE"];
			_veh setdir _dir;
			_veh setpos _position;		
			
			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText _vehicle;
			};	
		
			// Get position with ground
			_objPosition = getPosATL _veh;
		
			clearWeaponCargoGlobal  _veh;
			clearMagazineCargoGlobal  _veh;
			// _veh setVehicleAmmo DZE_vehicleAmmo;

			// Add 0-3 loots to vehicle using random cfgloots 
			_num = floor(random 4);
			_allCfgLoots = ["trash","civilian","food","generic","medical","military","policeman","hunter","worker","clothes","militaryclothes","specialclothes","trash"];
			
			/*for "_x" from 1 to _num do {
				_iClass = _allCfgLoots call BIS_fnc_selectRandom;

				_itemTypes = [];
				// Check for isNil required for versions prior to 1.0.4
				if (isNil ("DZE_MissionLootTable")) then {
					DZE_MissionLootTable = false;
				};
				if (DZE_MissionLootTable) then {
					_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iClass)) select 0);
				} else {
					_itemTypes = ((getArray (configFile >> "cfgLoot" >> _iClass)) select 0);
				};

				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances select _index;
				_cntWeights = count _weights;
				
				_index = floor(random _cntWeights);
				_index = _weights select _index;
				_itemType = _itemTypes select _index;
				_veh addMagazineCargoGlobal [_itemType,1];
				//diag_log("DEBUG: spawed loot inside vehicle " + str(_itemType));
			};*/

			[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
		};
	};
};

// Get the relevant Spawn Location array configuration.
// Parameter: vehicle
// Returns relevant StaticVehicleSpawnConfig value for vehicle.
_fnc_GetStaticVehicleLocationConfig = {
	private ["_vehicle","_typeName","_staticLocationsName"];
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
	private ["_locationNameToFind","_staticVehicleUsage","_staticLocationsName","_index"];
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

// Spawn the vehicles upto the vehicle limit or lower the limit to what can be spawned in.
if(_vehLimit > 0) then {
	private ["_allowedVehicleCount"];
	// Below fix not really required. Can be alleviated by increasing the numbers in the AllowedVehicles array to be >= MaxVehicleLimit.	
	// Fix to ensure higher MaxVehicleLimit does not cause the "Error Zero divisor" spam in rpt.
	// Therefore only spawn the amount of vehicles possible.
	_allowedVehicleCount = call _fnc_GetAllowedVehicleCount;
	if (_vehLimit > _allowedVehicleCount) then {
		diag_log (format["Vehicle Spawn: ERROR: Number of vehicle's to spawn %1 greater than total count of AllowedVehicles %2",_vehLimit,_allowedVehicleCount]);
		diag_log (format["Vehicle Spawn: Increase the number of vehicles that can spawn by %1 to take account for this shortfall.", (_vehLimit - _allowedVehicleCount)]);
		_vehLimit = _allowedVehicleCount;
		diag_log (format["Vehicle Spawn: Attempting to spawn %1 vehicles",_vehLimit]);
	}
	else {
		if (_debugMessages) then {
			diag_log (format["Total number of vehicles in AllowedVehicles is %1",_allowedVehicleCount]);
		};
	};
	
	for "_x" from 1 to _vehLimit do {
		private ["_vehicle","_spawnHandle","_useHandle","_locationConfig","_usageConfig","_inUse","_index"];
		_vehicle = call _fnc_GetAllowedVehicle;		
		if (!(_vehicle == "")) then  {
			_locationConfig = [_vehicle] call _fnc_GetStaticVehicleLocationConfig;
			_usageConfig = [_locationConfig] call _fnc_GetStaticVehicleUsageConfig;
			_useHandle = _usageConfig select 1;
			_inUse = _usageConfig select 2;
			_index = _usageConfig select 3;
			if (_debugMessages) then {
				diag_log (format["Vehicle spawn %1 started for %2", _x, _vehicle]);
			};
			if (_useHandle) then {
				// Check if locationArray is in Use. 
				// If it is wait.
				if (_inUse) then {
					waitUntil { (!((StaticVehicleUsageConfig select (_index)) select 2)) };
				};
				// Update StaticVehicleUsageConfig's InUse and _usageConfig depending on last run for the specific locationConfig.
				if (!((StaticVehicleUsageConfig select _index) select 1)) then {
					StaticVehicleUsageConfig set [(_index), [_locationConfig, ((StaticVehicleUsageConfig select _index) select 1), false]];
					_usageConfig = [_locationConfig, ((StaticVehicleUsageConfig select _index) select 1), false, _index];
				}
				else {
					StaticVehicleUsageConfig set [(_index), [_locationConfig, ((StaticVehicleUsageConfig select _index) select 1), true]];
					_usageConfig = [_locationConfig, ((StaticVehicleUsageConfig select _index) select 1), true, _index];
				};
			};
			// run the vehicle spawn script
			[_vehicle,_usageConfig,_debugMessages] spawn _fnc_spawn_vehicle;
		};		
	};
};