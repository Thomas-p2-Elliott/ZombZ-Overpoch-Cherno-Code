/*---------------------------------
Original Authors: frodster / Judge Bread
/*---------------------------------
Re-Write Master:  Player2
Version:		  2.0
Written For:	  www.ZombZ.net
Changes from Original (1.0):

	- Attempts to spawn all vehicles at all spawn points configured each restart
	- No more dynamic vehicles being spawned randomly or even used at all
	- No loot inside the vehicles
	- PHP Config generator from world_vehicle/instance_vehicle table setup
	- Optimisation: now uses call instead of spawn (who creates a new thread to spawn each vehicle?! frodster/judgebread im lookin at u 2)
	- Debugging: More detailed debug messages, configured through variables_modified currently.
	- Configuration:
		- Roughly 400 overpoch vehicle spawns
		- Mostly overwatch, only a VERY small amount of epoch vehicles
		- Two new variables: P2DZ_StaticVehSpawns_DupeDistanceCheck & P2DZ_Debug_StaticVehSpawns (variables_modified.sqf)

	New Anti-Duplicate-Spawn System:
			Counts how many of vehicle type already exists on map (purchased or not)
			If there is less than there are spawn points configured, then it loops through
			the spawn points until it finds one with no vehicles within P2DZ_StaticVehSpawns_DupeDistanceCheck (distance in meters)

www.ZombZ.net
---------------------------------*/
call compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnLocations.sqf";
server_staticVehicleSpawnInit = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnInit.sqf";
server_fnc_staticVehiclePosition = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\fnc_FS_StaticVehicleSpawnPosition.sqf";
fs_spawnVehicles = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_SpawnVehicles.sqf";

/*---------------------------------------------------------------------------
Player2's count existing static spawned vehicles currently on map
Input: Vehicle classname as string

Example use: 
_count = "Ka52Black" call fnc_p2CountStaticVehicles;
if (_count < _maxKa52Count) then { ... };
---------------------------------------------------------------------------*/
fnc_p2CountStaticVehicles = {
	private["_vehCount","_list","_charId"];
	_vehCount = 0; 

	_list = ([0,0,0]) nearEntities [["Car","Air","Ship"], 25000]; 
	{
		_vehAdded = false;
		If ((_this == "350z") || (_this == "SUV_TK_CIV_EP1_DZE1")) then {
			if (_this == "350z") then {
				if (([str _x, "350z"] call KRON_strInStr)) then {
					_vehCount = _vehCount + 1;
					_vehAdded = true;
				};
			};
			if (_this == "SUV_TK_CIV_EP1_DZE1") then {
				if (([str _x, "SUV"] call KRON_strInStr) && (!([str _x, "Armored"] call KRON_strInStr))) then {
					_vehCount = _vehCount + 1;
					_vehAdded = true;
				};
			};
		} else {
			if ((_this == typeOf _x) && (alive _x)) then {
				_vehCount = _vehCount + 1;
				_vehAdded = true;
			};
		};

		if (_vehAdded) then {
			_charId = (_x getVariable ["CharacterID", 0]);
			if (typeName _charId == typeName "") then {
				_charId = parseNumber _charId;	
			};
			if (_charId > 0) then {
				_vehCount = _vehCount - 1;	
			};
		};
		
	} forEach _list; 
	_vehCount 
};


// Set up the StaticVehicleUsageConfig WITHOUT spawning any vehicles. <-- DO NOT CHANGE TO MAKE IT SPAWN VEHICLES HERE.
[0] call fs_spawnVehicles;