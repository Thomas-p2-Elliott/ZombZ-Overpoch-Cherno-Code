Private ["_EH_Fired", "_ehID", "_fix","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle","_inVehicleDamage","_antiBackpackThread","_antiBackpackThread2"];

//ANTI SPAM GODMODE
p2sz_as = true;								// puts a time limit on God mode when trying to leave and enter a safe zone rapidly

//SCRIPT SETTINGS
p2sz_d = false; 								//Debug notes on screen.
p2sz_p_godOk = true; 							//Should safezone God mode be enabled?
p2sz_msg = true;								//Should players get messages when entering and exiting the safe zone?
p2sz_bp_EnableAntiBackpack = false;				//Should players not be able to take from peoples bags?
p2sz_bp_LootPiles = true;						//Should players be able to loot from loot piles?
p2sz_bp_Vehicles = true;						//Should players be able to loot from a vehicles gear?
p2sz_bp_DeadPlayers = true;						//Should players be able to loot from a dead players corpse?
p2sz_bp_AllowFriendlyTaggedAccess = true;		//Should players who are tagged friendly be able to access each others bags?
p2sz_v_DisableMountedGuns = true;				//Should players not be able to shoot bullets/projectiles from mounted guns?
p2sz_v_WithinVehicles = true;					//Should players be able to open the gear screen while they are inside a vehicle?
p2sz_p_DisableWeaponFiring = true;				//Should players not be able to shoot bullets/projectiles from their weapon(s)?
p2sz_Clothing = true;
p2sz_NoZeds = true;
p2sz_SpeedLimit = true;

//Probs not needed, but meh :)
disableSerialization;

waitUntil {!isNil "dayz_animalCheck"};
p2sz = false; //default value

_inVehicle = objNull;
_inVehicleLast = objNull;
_thePlayer = player;


while {true} do {
	
	waitUntil { !zombzsafezone };
	//when player enters safezone

	_inSafezoneFinished = false;
	//_thePlayer = player;

	if (p2sz_p_godOk) then {
		if (p2sz_as) then {
			if (p2sz) then{
				if ( p2sz_msg ) then { systemChat ("[ZombZ] Antispam - Please wait before re-entering!"); };
			} else {
				p2sz = true; //player has entered safezone
				if ( p2sz_msg ) then { systemChat ("[ZombZ] Entering Trader Area - God Mode Enabled"); };
				if ( p2sz_msg ) then { systemChat ("[ZombZ] Antispam - You must wait 30 seconds for god mode to become active again once you leave!");};
				player setVariable ['ZombZInSafeZone', true];
				player_zombieCheck = { ZombZinSafeZone = 1; false };
				fnc_usec_damageHandler = { ZombZinSafeZone = 1; false };
				_thePlayer removeAllEventHandlers "handleDamage";
				_thePlayer addEventHandler ["handleDamage", { ZombZinSafeZone = 1; false}];
				_thePlayer allowDamage false;
				
			};
		};		
	};

	if (p2sz_p_DisableWeaponFiring) then
	{
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			systemChat ("[ZombZ] You can not fire your weapon in a Trader City Area");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};
	
	if (p2sz_Clothing) then	{
		player_wearClothes = { "ZombZinSafeZone"; systemChat ("[ZombZ] Changing clothes is disabled in Safezone Trader Area"); false };
	};

	if (p2sz_NoZeds) then	{
		building_spawnZombies =	{ "ZombZinSafeZone"; false };
	};
	
	if (p2sz_SpeedLimit) then	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air') ) then
		{
			if (ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Safezone 26-KMPH Speed Limit Enabled");};
		}; 
		
		_slimit = [] spawn 	{
			private ["_vehicle", "_curspeed", "_maxspeed", "_vel", "_dir", "_speed"];
			_maxspeed = 23.5999;
			while {!zombzsafezone} do 
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

	if (p2sz_bp_EnableAntiBackpack) then
	{
		p2sz_lastLookedAt = objNull;
		p2sz_lastLookedAtCountDown = 5;
		_antiBackpackThread = [] spawn {
			private [ "_ct","_ip","_ia","_dis"] ;
			while {!zombzsafezone} do
			{
				if ( isNull p2sz_lastLookedAt ) then
				{
					waitUntil {!isNull cursorTarget};
					_ct = cursorTarget;
					_ip = isPlayer _ct;
					if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
					
					if ( (_ip && _ia) && (_dis < 6.5) ) then
					{
						p2sz_lastLookedAt = _ct;
					};
				} else {
					p2sz_lastLookedAtCountDown = p2sz_lastLookedAtCountDown - 1;
					if ( p2sz_lastLookedAtCountDown < 0 ) then { p2sz_lastLookedAtCountDown = 5; p2sz_lastLookedAt = objNull; };
					sleep 1;
				};
			};
		};
			
		_antiBackpackThread2 = [] spawn {
			private ["_to","_dis","_inchk","_ip","_ia","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
			_ctOwnerID = 0;
			while {!zombzsafezone} do
			{
				_ct = cursorTarget;
				_skip = false;
				_if = false;

				if ( !isNull (_ct) ) then
				{
					_to = typeOf _ct;
					_dis = _ct distance player;
					_inchk = ["WeaponHolder","ReammoBox"];
					
					_lp = false;
					{
						if ( (_to isKindOf _x) && (_dis < 10) && p2sz_bp_LootPiles ) then
						{
							_lp = true;
						};
					} forEach ( _inchk );

					_ip = isPlayer _ct;
					_ia = alive _ct;
					_iv = _ct isKindOf "AllVehicles";
					_inv = (vehicle player != player);
					
					if ( _ip ) then {
						_ctOwnerID = _ct getVariable["CharacterID","0"];
						_friendlies	= player getVariable ["friendlyTo",[]];
						if(_ctOwnerID in _friendlies) then {	
							if ( p2sz_bp_AllowFriendlyTaggedAccess ) then
							{
								_if = true;
							};
						};
					};

					if ( p2sz_d ) then {
						hintSilent ( format["ZombZ Safezone Commander\n\nCursorTarget\n%1\n\nDistance\n%2\n\nLootpile\n%3 [%9]\n\nisPlayer\n%4\n\nAlive\n%5\n\nisVehicle\n%6\n\ninVehicle\n%7\n\nisFriendly\n%8 (%12) [%10]\n\nSkip: %11\n",
                                                _ct, _dis, _lp, _ip, _ia, _iv, _inv, _if, p2sz_bp_LootPiles, p2sz_bp_AllowFriendlyTaggedAccess, _skip, _ctOwnerID] );
					};

					//Lootpile check
					if ( _lp ) then {_skip = true;};
					
					//Dead body check
					if ( !(_ia) && p2sz_bp_DeadPlayers ) then {_skip = true;};
					
					//Vehicle check
					if ( _iv && (_dis < 10) && !(_ip) && p2sz_bp_Vehicles ) then {_skip = true;};
					
					//In a vehicle check
					if ( _inv && p2sz_v_WithinVehicles ) then { _skip = true; };
					
					//Is player friendly?
					if ( _if ) then { _skip = true; };
				};
				
				if( !isNull (FindDisplay 106) && !_skip ) then
				{
					if ( isNull p2sz_lastLookedAt ) then
					{
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
						createGearDialog [(player), 'RscDisplayGear'];
						if ( p2sz_msg ) then { systemChat ("[ZombZ] Anti Backpack Stealing - Redirecting you to your own gear!"); };
						waitUntil { isNull (FindDisplay 106) };
					} else {
						if ( p2sz_msg ) then { systemChat (format["[ZombZ] You cannot open your gear at this time as you have looked at a player in the last 5 seconds."]); };
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
					};
				};
				if ( _skip && _if ) then {
					if ( p2sz_msg ) then { systemChat ("[ZombZ] This player is tagged friendly, you have access to this players bag") };
					uiSleep 30;
				};
			};
		};
	};
	
	if ( p2sz_v_DisableMountedGuns ) then
	{
		while { !zombzsafezone } do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player) ) then
			{
				_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast = _inVehicle;
				_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle ) then
			{
				if (p2sz_msg) then { systemChat ( "[ZombZ] No Firing Vehicle Guns Enabled" ); };
				_inVehicle = vehicle player;
				_inVehicleDamage = getDammage _inVehicle;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					systemChat ("[ZombZ] You can not fire your vehicles weapon in a Trader City Area");
					NearestObject [_this select 0,_this select 4] setPos[0,0,0];
				}];
			};
		};
	} else {
		waitUntil { zombzsafezone };
	};

	p2sz_lastLookedAt = objNull;
	p2sz_lastLookedAtCountDown = 5;

	if (!isNil '_antiBackpackThread') then { terminate _antiBackpackThread; };
	if (!isNil '_antiBackpackThread2') then { terminate _antiBackpackThread2; };
	if (!isNil '_slimit') then { terminate _slimit; };
	
	if (p2sz_msg) then { systemChat ("[ZombZ] Exiting Trader Area"); };
	
	if ( p2sz_v_DisableMountedGuns ) then
	{
		if (!(isNull _inVehicle)) then
		{
			if ( p2sz_msg ) then { systemChat ( "[ZombZ] No Firing Vehicle Guns Disabled" ); };
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if (!(isNull _inVehicleLast)) then
		{
			if ( p2sz_msg ) then { systemChat ( "[ZombZ] No Firing Vehicle Guns Disabled" ); };
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};

	if (p2sz_p_DisableWeaponFiring) then
	{
		_thePlayer removeEventHandler ["Fired", _EH_Fired];
	};

	if (p2sz_NoZeds) then	{
		building_spawnZombies =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	};
	
	if (p2sz_Clothing) then	{
		player_wearClothes =			compile preprocessFileLineNumbers "actions\player_wearClothes.sqf";
	};
	
	if (p2sz_p_godOk) then{
		//turn god mode off early just in case!
		player_zombieCheck = compile preprocessFileLineNumbers "compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";
		_thePlayer addEventHandler ["handleDamage", {true}];
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer allowDamage true;
			//check if anti spam is on
		if (p2sz_as )then{
			//check if player has entered safezone recently
			if (p2sz) then{
				[] execVM "sz\sz_timer.sqf";
			};
		};
	};


	_inSafezoneFinished = true;
};
