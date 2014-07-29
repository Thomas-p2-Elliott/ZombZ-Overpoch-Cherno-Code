diag_log ( "[ZombZ] Starting Trader City Safezone Commander!" );
 
if (isDedicated || isServer) exitWith {diag_log ( "Error: Attempting to start SafeZone products on a server where it should not be!" );}; 

Private ["_EH_Fired", "_ehID", "_fix","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle","_inVehicleDamage","_antiBackpackThread","_antiBackpackThread2","_msgLock","_slimit","_maxspeed","_vehicle","_curspeed","_vel","_dir","_speed"];
		
private ["_ZombZ_safeZoneGodmode","_ZombZ_safeZoneMessages","_ZombZ_safeZone_Players_DisableClothing","_ZombZ_safeZone_Zombie_Zapper","_ZombZ_safeZone_Backpack_AllowGearFromLootPiles","_ZombZ_safeZone_LessZ_Build_Spawn",
"_ZombZ_safeZone_Vehicle_Speed_Limit","_ZombZ_safeZone_Backpack_AllowGearFromVehicles","_ZombZ_safeZone_Backpack_AllowGearFromDeadPlayers","_ZombZ_safeZone_Vehicles_DisableMountedGuns","_ZombZ_safeZone_Players_DisableWeaponFiring",
"_ZombZ_safeZone_Backpack_EnableAntiBackpack","_ZombZ_safeZone_Vehicles_AllowGearFromWithinVehicles"];

//SCRIPT SETTINGS
_ZombZ_safeZoneDebug = false; 									//Debug notes on screen.
_ZombZ_safeZoneGodmode = true; 								//Should safezone Godmode be enabled?
_ZombZ_safeZoneMessages = true;								//Should players get messages when entering and exiting the safe zone?
_ZombZ_safeZone_Players_DisableClothing = true;				//Should players not be able to change clothes in safe zone?
_ZombZ_safeZone_LessZ_Build_Spawn = true;						//Should zombies not be able to spawn in safezones?
_ZombZ_safeZone_Vehicle_Speed_Limit = true;					//Should players vehicles be limited to 25km/h in safezones?
_ZombZ_safeZone_Backpack_AllowGearFromLootPiles = true;		//Should players be able to loot from loot piles?
_ZombZ_safeZone_Backpack_AllowGearFromVehicles = false;		//Should players be able to loot from a vehicles gear?
_ZombZ_safeZone_Backpack_AllowGearFromDeadPlayers = true;		//Should players be able to loot from a dead players corpse?
_ZombZ_safeZone_Backpack_AllowFriendlyTaggedAccess = true;		//Should players who are tagged friendly be able to access eachothers bags?
_ZombZ_safeZone_Vehicles_DisableMountedGuns = true;			//Should players not be able to shoot bullets/projectiles from mounted guns?
_ZombZ_safeZone_Vehicles_AllowGearFromWithinVehicles = true;	//Should players be able to open the gear screen while they are inside a vehicle?
_ZombZ_safeZone_Players_DisableWeaponFiring = true;			//Should players not be able to shoot bullets/projectiles from their weapon(s)?

//Probs not needed, but meh :)
disableSerialization;

waitUntil {!isNil "dayz_animalCheck"};
if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] Safezone Commander Loaded!");};

_inVehicle = objNull;
_inVehicleLast = objNull;

while {true} do {
	
	waitUntil {!canBuild};

	_inSafezoneFinished = false;
	if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] Entering Safezone Trader - God Mode Enabled"); };
	_thePlayer = player;

	if (_ZombZ_safeZoneGodmode ) then
	{
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		fnc_usec_unconscious  = {};
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer addEventHandler ["handleDamage", {false}];
		_thePlayer allowDamage false;
	};

	if (_ZombZ_safeZone_Players_DisableClothing) then
	{
		player_wearClothes = {systemChat ("[ZombZ] Changing clothes is disabled in Safezone Trader Area"); };
	};

	if (_ZombZ_safeZone_LessZ_Build_Spawn ) then
	{
		building_spawnZombies =	{};
	};
	
	if (_ZombZ_safeZone_Vehicle_Speed_Limit ) then
	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air') ) then
		{
			if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] Safezone 25-KMPH Speed Limit Enabled");};
		}; 
		
		_slimit = [] spawn 
		{
			_maxspeed = 25;
			while {!canbuild} do 
			{
				waitUntil {vehicle player != player and !((vehicle player) isKindOf 'Air')};
				_vehicle = vehicle player;
				_curspeed = speed _vehicle;
				if (_curspeed > _maxspeed) then
				{
					_vel = velocity _vehicle;
					_dir = direction _vehicle;
					_speed = _curspeed - _maxspeed;
					_vehicle setVelocity [(_vel select 0)-((sin _dir)*_speed),(_vel select 1)- ((cos _dir)*_speed),(_vel select 2)];
				};
				sleep 0.1;
			};
		};
	};
	
	if (_ZombZ_safeZone_Players_DisableWeaponFiring) then
	{
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			systemChat ("[ZombZ] You can not fire your weapon in a Safezone Trader Area");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};

	if (_ZombZ_safeZone_Vehicles_DisableMountedGuns) then
	{
		while {!canBuild} do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player)) then
			{
				_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast = _inVehicle;
				_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle) then
			{
				if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] No Firing Vehicle Guns Enabled");};
				_inVehicle = vehicle player;
				_inVehicleDamage = getDammage _inVehicle;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					systemChat ("[ZombZ] You can not fire your vehicles weapon in a Trader City Area");
					NearestObject [_this select 0,_this select 4] setPos[0,0,0];
				}];
			};
		};
	} else {
		waitUntil {canBuild};
	};

	_ZombZ_LastPlayerLookedAt = objNull;
	_ZombZ_LastPlayerLookedAtCountDown = 5;
	terminate _antiBackpackThread;
	terminate _antiBackpackThread2;
	if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] Exiting Safezone Trader Area - God Mode Disabled"); };
	
	if (_ZombZ_safeZone_Vehicles_DisableMountedGuns) then
	{
		if ( !(isNull _inVehicle) ) then
		{
			if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] No Firing Vehicle Guns Disabled");};
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if (!(isNull _inVehicleLast)) then
		{
			if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] No Firing Vehicle Guns Disabled");};
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};

	if (_ZombZ_safeZone_Players_DisableWeaponFiring) then
	{
		_thePlayer removeEventHandler ["Fired", _EH_Fired];
	};
	
	if (_ZombZ_safeZone_Vehicle_Speed_Limit) then
	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air')) then
		{
			if (_ZombZ_safeZoneMessages) then {systemChat ("[ZombZ] Safezone Speed Limit Disabled");};
		}; 
		terminate _slimit;
	};
	
	if (_ZombZ_safeZone_LessZ_Build_Spawn) then
	{
		building_spawnZombies =	compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	};
	
	if (_ZombZ_safeZone_Players_DisableClothing) then
	{
		player_wearClothes = compile preprocessFileLineNumbers "actions\player_wearClothes.sqf";
	};
	
	if (_ZombZ_safeZoneGodmode) then
	{
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
		_thePlayer addEventHandler ["handleDamage", {true}];
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer allowDamage true;
	};
	_inSafezoneFinished = true;
};