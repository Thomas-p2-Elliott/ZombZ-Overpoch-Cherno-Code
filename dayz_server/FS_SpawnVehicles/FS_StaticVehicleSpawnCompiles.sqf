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

// Set up the StaticVehicleUsageConfig WITHOUT spawning any vehicles. <-- DO NOT CHANGE TO MAKE IT SPAWN VEHICLES HERE.
[0] call fs_spawnVehicles;