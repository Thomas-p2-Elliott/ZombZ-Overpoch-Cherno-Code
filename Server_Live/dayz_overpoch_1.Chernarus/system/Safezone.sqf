diag_log ( "[ZombZ] Starting Trader City Safezone Commander!" );
 
if ( isDedicated || isServer ) exitWith {diag_log ( "Error: Attempting to start ZombZ products on a server where it should not be!" );}; 

private ["_inVehicle", "_inVehicleLast", "_thePlayer", "_noSalvage", "_slimit", "_EH_Fired", "_antiBackpackThread", "_antiBackpackThread2", "_avhsh", "_p2thread"];

		
//SCRIPT SETTINGS
ZombZ_safeZoneDebug = false; 							//AlienX Debug notes on screen instead of diag log for some reason...get 2 monitors bruh.
ZombZ_safeZoneGodmode = true; 							//Should safezone Godmode be enabled?
ZombZ_SZ_Messages = true;								//Should players get messages when entering and exiting the safe zone?
ZombZ_SZ_Vehicles_DisableMountedGuns = true;			//Should players not be able to shoot bullets/projectiles from mounted guns?
ZombZ_SZ_Vehicles_AllowGearFromWithinVehicles = true;	//Should players be able to open the gear screen while they are inside a vehicle?
ZombZ_SZ_Players_DisableWeaponFiring = true;			//Should players not be able to shoot bullets/projectiles from their weapon(s)?
ZombZ_SZ_SpeedLimit = true;								//enable speed limit
ZombZ_SZ_Clothing = true; 								//true = disable wearing clothes in traders
ZombZ_SZ_NoZeds = true; 								//true = disable building spawning zeds
ZombZ_SZ_NoSalvage = true; 								//true = disable vehicle salvage in trader zones


//Probs not needed, but meh :)
disableSerialization;

waitUntil {!isNil "dayz_animalCheck"};

_inVehicle = objNull;
_inVehicleLast = objNull;
if (isNil "zombzsafezoneFin") then { zombzsafezoneFin = true; };

while {true} do {
	waitUntil { !zombzsafezone };

	diag_log("P2DEBUG: Entered the safezone, waiting for zombzsafezoneFin");

	if ( ZombZ_SZ_Messages ) then { systemChat ("[ZombZ] Trader Protection Started - God Mode Enabled - Weapons Disabled"); };

	_thePlayer = player;

	if ( ZombZ_safeZoneGodmode ) then	{
		player setVariable ['ZombZInSafeZone', true];
		player_zombieCheck = { ZombZinSafeZone = 1; false };
		fnc_usec_damageHandler = { ZombZinSafeZone = 1; false };
		fnc_usec_unconscious  = { ZombZinSafeZone = 1; false };
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer addEventHandler ["handleDamage", { ZombZinSafeZone = 1; false}];
		_thePlayer allowDamage false;
	};

	if (ZombZ_SZ_NoSalvage) then {
		_noSalvage = [] spawn {
			while {!zombzsafezone} do 
			{
				s_player_repair_crtl = 1;
				sleep 0.1;
			};
			s_player_repair_crtl = -1;
		};
	};

	if (ZombZ_SZ_Clothing) then	{
		player_wearClothes = { "ZombZinSafeZone"; systemChat ("[ZombZ] Changing clothes is disabled in Safezone Trader Area"); false };
	};

	if (ZombZ_SZ_NoZeds ) then	{
		building_spawnZombies =	{ "ZombZinSafeZone"; false };
	};
	
	if (ZombZ_SZ_SpeedLimit) then	{
		if ( vehicle player != player and !((vehicle player) isKindOf 'Air') ) then
		{
			if (ZombZ_SZ_Messages) then {systemChat ("[ZombZ] Safezone 26-KMPH Speed Limit Enabled");};
		}; 
		
		_slimit = [] spawn 	{
			private ["_vehicle", "_curspeed", "_maxspeed", "_vel", "_dir", "_speed"];
			_maxspeed = 26.5999;
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


	if ( ZombZ_SZ_Players_DisableWeaponFiring ) then {
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			systemChat ("[ZombZ] You can not fire your weapon in a Trader City Area");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};
	
	if (isNil "_inVehicle") then {
		_inVehicle = (vehicle player);
	};
	if (isNull _inVehicle) then {
		if (_inVehicle == player) then {
			_inVehicle = objNull;
		};
	};

	if (isNil "_inVehicleLast") then {
		_inVehicleLast = (objNull);
	};

	_avhsh = [] spawn {
		private["_404VehNotFound"];

		if (isNil "ZombZFucktVehicles") then {
			ZombZFucktVehicles = [];
		};
		if (isNil "_404VehNotFound") then {
			_404VehNotFound = true;
		};

		if (ZombZ_SZ_Vehicles_DisableMountedGuns) then {
			
			diag_log("P2DEBUG: Player in trader zone");

			while {!zombzsafezone || !zombzsafezoneFin} do {
				sleep 0.1;

				/*---------------------------------------------------------------------------
				Player is inside a vehicle
				---------------------------------------------------------------------------*/
				if (vehicle player != player) then {
					/*---------------------------------------------------------------------------
					Check if vehicle already had event handler added
					---------------------------------------------------------------------------*/
					_404VehNotFound = true;

					{
						if ((vehicle player) == (_x select 0)) then {
							_404VehNotFound = false;
						};
					} forEach ZombZFucktVehicles;

					/*---------------------------------------------------------------------------
					Event handler not found on vehicle - ading it to disable weapons
					---------------------------------------------------------------------------*/
					if (_404VehNotFound) then {
						_EH_Fired_Vehicle = (vehicle player) addEventHandler ["Fired", {
							systemChat ("[ZombZ] You can not fire your vehicles weapon in a Trader City Area");
							NearestObject [_this select 0,_this select 4] setPos [0,0,0];
						}];

						ZombZFucktVehicles = ZombZFucktVehicles + [[(vehicle player),_EH_Fired_Vehicle]];
						diag_log("P2DEBUG: -- Firing Disabled for: " + str(typeOf (vehicle player)));
						diag_log("P2DEBUG: -- Handler Added: " + str(_EH_Fired_Vehicle));
					};
				} else {
					/*---------------------------------------------------------------------------
					If Player Not In a Vehicle while Trader God Enabled
					---------------------------------------------------------------------------*/
					if (count ZombZFucktVehicles > 0) then {

						/*---------------------------------------------------------------------------
						If player was in a vehicle that had it's weapons disabled - re-enable them
						---------------------------------------------------------------------------*/

						{
							diag_log("P2DEBUG: -- Firing Enabled for: " + str(typeOf (_x select 0)));
							diag_log("P2DEBUG: -- Handler Removed: " + str((_x select 1)));

							(_x select 0) removeEventHandler ["Fired", (_x select 1)];

						} forEach ZombZFucktVehicles;

						ZombZFucktVehicles = [];
					};
				};
			};
		};
	};

	diag_log("P2DEBUG: Waiting for player to leave the safezone");
	waitUntil { zombzsafezone };
	diag_log("P2DEBUG: Player Left the safezone");

	if (!isNil '_slimit') then { terminate _slimit; };
	if (!isNil '_noSalvage') then { terminate _noSalvage; };

	if (ZombZ_SZ_NoZeds) then	{
		building_spawnZombies =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	};
	
	if (ZombZ_SZ_Clothing) then	{
		player_wearClothes =			compile preprocessFileLineNumbers "actions\player_wearClothes.sqf";
	};

	if (isNil '_EH_Fired') then { _EH_Fired = false; };

	private["_p2thread"];
	_p2thread = [_thePlayer, _EH_Fired] spawn {
		if (!zombzsafezoneFin) exitWith {
			diag_log("P2DEBUG: SafeZone Timer Already Running, Exiting Thread");
		};
		zombzsafezoneFin = false;

		diag_log("P2DEBUG: SafeZone Timer Starting Thread");
		private ["_thePlayer", "_p2ts", "_p2tts", "_p2r"];
		_thePlayer = objNull;
		_thePlayer = _this select 0;
		_EH_Fired = _this select 1;

		if (isNil "_thePlayer") then {
			_thePlayer = player;
		};
		if (isNull _thePlayer) then {
			_thePlayer = player;
		};
		if (!alive _thePlayer) then {
			_thePlayer = player;
		};

		if (str _EH_Fired == "false") then {
			_EH_Fired = nil;
		};
		
		_p2r = 0;
		_p2ts = 0;
		_p2tts = 0;
		_p2r = ceil(random 16);
		uiSleep 0.1;
		_p2r = _p2r + 14;
		
		if (ZombZ_SZ_Messages && zombzsafezone) then { SystemChat(format["[ZombZ] You will lose GodMode and have your weapons enabled in %1 seconds!",(_p2r)]); };

		while {(_p2r > _p2ts) && zombzsafezone} do {
			_p2tts = _p2r - _p2ts;
			if ((_p2tts) >= 1) then {
				uiSleep 1;
				_p2ts = _p2ts + 1;
			};
		};
		
		if (ZombZ_SZ_Vehicles_DisableMountedGuns) then {
			{
				diag_log("P2DEBUG: -- Firing Enabled for: " + str(typeOf (_x select 0)));
				diag_log("P2DEBUG: -- Handler Removed: " + str((_x select 1)));

				(_x select 0) removeEventHandler ["Fired", (_x select 1)];

			} forEach ZombZFucktVehicles;

			ZombZFucktVehicles = [];
		};

		if (ZombZ_SZ_Players_DisableWeaponFiring) then {
			if (!isNil "_EH_Fired") then { _thePlayer removeEventHandler ["Fired", _EH_Fired]; };
			diag_log("P2DEBUG: Weapon Fire Pins being Added...");

		};

		if (ZombZ_safeZoneGodmode) then {
			if (ZombZ_SZ_Messages) then { systemChat ( "[ZombZ] Trader Protection Ended - GodMode Disabled - Weapons Enabled" ); };
			_thePlayer setVariable ['ZombZInSafeZone', false];
			player_zombieCheck = 		compile preprocessFileLineNumbers "compile\player_zombieCheck.sqf";
			fnc_usec_damageHandler = 	compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = 		compile preprocessFileLineNumbers "compile\fn_unconscious.sqf";
			_thePlayer addeventhandler ["HandleDamage",{_this call fnc_usec_damageHandler; _this call DDOPP_taser_handleHit; } ];
			_thePlayer removeAllEventHandlers "handleDamage";
			_thePlayer allowDamage true;
		};

		zombzsafezoneFin = true;
		diag_log("P2DEBUG: zombzsafezoneFin Thread/Safezone leave timer Finished");
		
	};
};