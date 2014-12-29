diag_log ( "[ZombZ] Starting Safezone Commander!" );
 
if (isDedicated || isServer) exitWith {diag_log ( "Error: Attempting to start SafeZone products on a server where it should not be!" );}; 

Private ["_EH_Fired", "_ehID", "_fix","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle","_inVehicleDamage","_antiBackpackThread","_antiBackpackThread2","_msgLock","_slimit","_maxspeed","_vehicle","_curspeed","_vel","_dir","_speed"];
		
private ["_ZombZ_SZ_Godmode","_ZombZ_SZ_Messages","_ZombZ_SZ_Clothing","_ZombZ_SZ_Zombie_Zapper","_ZombZ_SZ_LootPiles","_ZombZ_SZ_NoZeds",
"_ZombZ_SZ_SpeedLimit","_ZombZ_SZ_GearFromVehicles","_ZombZ_SZ_DeadPlayers","_ZombZ_SZ_DisableMountedGuns","_ZombZ_SZ_DisableWeaponFiring",
"_ZombZ_SZ_Backpack_EnableAntiBackpack","_ZombZ_SZ_GearFromWithinVehicles"];

//Main Settings
_ZombZ_SZ_Debug 				 = false;//Debug notes on screen.
_ZombZ_SZ_Godmode				 = true; //Should safezone Godmode be enabled?
_ZombZ_SZ_Messages				 = true; //Should players get messages when entering and exiting the safe zone?

//Script Settings
_ZombZ_SZ_AntiGear				 = true; //Should players be able open their gear near other players?
_ZombZ_SZ_Clothing				 = true; //Should players not be able to change clothes in safe zone?
_ZombZ_SZ_DeadPlayers 			 = true; //Should players be able to loot from a dead players corpse?
_ZombZ_SZ_DisableMountedGuns 	 = true; //Should players not be able to shoot bullets/projectiles from mounted guns?
_ZombZ_SZ_DisableWeaponFiring 	 = true; //Should players not be able to shoot bullets/projectiles from their weapon(s)?
_ZombZ_SZ_GearFromVehicles 		 = false;//Should players be able to loot from a vehicles gear?
_ZombZ_SZ_GearFromWithinVehicles = true; //Should players be able to open the gear screen while they are inside a vehicle?
_ZombZ_SZ_LootPiles 			 = true; //Should players be able to loot from loot piles?
_ZombZ_SZ_NoZeds				 = true; //Should zombies not be able to spawn in safezones?
_ZombZ_SZ_SpeedLimit 			 = true; //Should players vehicles be limited to 25km/h in safezones?
_ZombZ_SZ_VehicleSalvage 		 = true; //Should we allow salavage options in the trader cities?

//Main Script Coding
disableSerialization;

waitUntil {!isNil "dayz_animalCheck"};

_inVehicle = objNull;
_inVehicleLast = objNull;

while {true} do {
	
	waitUntil {!canBuild};

	_inSafezoneFinished = false;
	if (_ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Entering Safezone Trader - God Mode Enabled"); };
	_thePlayer = player;

	if (_ZombZ_SZ_Godmode ) then
	{
		player setVariable ['ZombZInSafeZone', true];
		player_zombieCheck = { "ZombZinSafeZone"; false };
		fnc_usec_damageHandler = { "ZombZinSafeZone"; false };
		fnc_usec_unconscious  = { "ZombZinSafeZone"; false };
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer addEventHandler ["handleDamage", { "ZombZinSafeZone"; false}];
		_thePlayer allowDamage false;
	};

	if (_ZombZ_SZ_Clothing) then
	{
		player_wearClothes = { "ZombZinSafeZone"; systemChat ("[ZombZ] Changing clothes is disabled in Safezone Trader Area"); false };
	};

	if (_ZombZ_SZ_NoZeds ) then
	{
		building_spawnZombies =	{ "ZombZinSafeZone"; false };
	};
	
	if (_ZombZ_SZ_SpeedLimit ) then
	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air') ) then
		{
			if (_ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Safezone 25-KMPH Speed Limit Enabled");};
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
	
	if (_ZombZ_SZ_DisableWeaponFiring) then
	{
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			"ZombZinSafeZone";
			systemChat ("[ZombZ] You can not fire your weapon in a Safezone Trader Area");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};

	if (_ZombZ_SZ_DisableMountedGuns) then
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
				if (_ZombZ_SZ_Messages) then {systemChat ("[ZombZ] No Firing Vehicle Guns Enabled");};
				_inVehicle = vehicle player;
				_inVehicleDamage = getDammage _inVehicle;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					"ZombZinSafeZone";
					systemChat ("[ZombZ] You can not fire your vehicles weapon in a Trader City Area");
					NearestObject [_this select 0,_this select 4] setPos[0,0,0];
				}];
			};
		};
	} else {
		waitUntil {canBuild};
	};

	if (_ZombZ_SZ_AntiGear) then
	{
		while {!canbuild} do
		{
			_cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'], 3]);
			if ((_cnt > 0) && (!isNull (findDisplay 106))) then
			{
				(findDisplay 106) closedisplay 0;
				closeDialog 0;
				_log = format ["%1 You are not allowed to open Gear while near another player!",name player];
				cutText [_log,"PLAIN"];
			};
		};
	} else {
		waitUntil {canbuild};
	};
	
	if (_ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Exiting Safezone Trader Area - God Mode Disabled"); };
	
	if (_ZombZ_SZ_DisableMountedGuns) then
	{
		if (!(isNull _inVehicle)) then
		{
			if (_ZombZ_SZ_Messages) then {
			systemChat ("[ZombZ] No Firing Vehicle Guns Disabled");};
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if (!(isNull _inVehicleLast)) then
		{
			if (_ZombZ_SZ_Messages) then {
			systemChat ("[ZombZ] No Firing Vehicle Guns Disabled");};
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};

	if (_ZombZ_SZ_DisableWeaponFiring) then
	{
		_thePlayer removeEventHandler ["Fired", _EH_Fired];
	};
	
	if (_ZombZ_SZ_SpeedLimit) then
	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air')) then
		{
			if (_ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Safezone Speed Limit Disabled");};
		}; 
		terminate _slimit;
	};
	
	if (_ZombZ_SZ_NoZeds) then
	{
		building_spawnZombies =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	};
	
	if (_ZombZ_SZ_Clothing) then
	{
		player_wearClothes =			compile preprocessFileLineNumbers "actions\player_wearClothes.sqf";
	};
	
	if (_ZombZ_SZ_Godmode) then
	{
		player setVariable ['ZombZInSafeZone', false];
		player_zombieCheck = 		compile preprocessFileLineNumbers "compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = 	compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";
		fnc_usec_unconscious = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
		_thePlayer addeventhandler ["HandleDamage",{_this call fnc_usec_damageHandler; _this call DDOPP_taser_handleHit; } ];
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer allowDamage true;
	};
	_inSafezoneFinished = true;
};