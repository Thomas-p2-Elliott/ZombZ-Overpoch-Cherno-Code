/*---------------------------------
Author: frodster / Judge Bread
Version: 1.0
Description: 
Compiles the files required for static vehicle spawning and sets DZE_FS_UseStaticVehicleSpawn to false (default) if not set.
---------------------------------*/
call compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnLocations.sqf";
server_staticVehicleSpawnInit = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnInit.sqf";
server_fnc_staticVehiclePosition = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\fnc_FS_StaticVehicleSpawnPosition.sqf";
fs_spawnVehicles = compile preprocessFileLineNumbers "\z\addons\dayz_server\FS_SpawnVehicles\FS_SpawnVehicles.sqf";

if (isNil ("DZE_FS_UseStaticVehicleSpawn")) then {
	//diag_log ("DZE_FS_UseStaticVehicleSpawn not set. Static Vehicle Spawning switched off");
	DZE_FS_UseStaticVehicleSpawn = false;
};

// Set up the StaticVehicleUsageConfig WITHOUT spawning any vehicles. <-- DO NOT CHANGE TO MAKE IT SPAWN VEHICLES HERE.
[0] spawn fs_spawnVehicles;