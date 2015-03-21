/*===========================================================================
AntiHack Disabled for headless client
---------------------------------------------------------------------------*/
if (!hasInterface && !isDedicated && !isServer) exitWith { 
	diag_log("HeadlessClient: Client AntiHack Disabled.")
};
/*-------------------------------------------------------------------------*/

/*===========================================================================
AntiHack for player client
---------------------------------------------------------------------------*/

if (hasInterface && !isDedicated) exitWith {
	private ["_pi","_pn","_mP"];

	//	Wait until the player is fully loaded in before retrieving variables from them
	waitUntil {vehicle player 		== 	player};
	waitUntil {getPlayerUID player 	!= 	''};
	waitUntil {name player 			!= 	''};

	//As early as we can, retrieve player UID and player name from client
	_pi = getPlayerUID player;	
	_pn = name player;
	_mP = getMarkerPos 'respawn_west';

	/*---------------------------------------------------------------------------
	Whitelisted players - This code still gets run
	---------------------------------------------------------------------------*/
	if (P2DZ_clientAHWhitelistEnabled && {(_pi in P2DZ_clientAHWhiteListUIDs)}) exitWith {

		/*---------------------------------------------------------------------------
		Player Fired Event: _this = [unit, weapon, muzzle, mode, ammo, magazine, projectile]
		---------------------------------------------------------------------------*/
		p2_fired = {
			//if local
			if (_this select 0 == player || _this select 0 == (vehicle player)) then {
				[_this select 0, _this select 1,_this select 5, _this select 6,_this select 2] call p2_bulletCheck;
				[_this select 1, _this select 4, _this select 0] call p2_infAmmoCheck;
			};
		};

		/*---------------------------------------------------------------------------
			Damage Handler / Fired Handler / Killed Handler
		---------------------------------------------------------------------------*/

		fnc_usec_damageHandle = {
			private ["_p2"];
			_p2 = _this select 0;
			
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";
			player_fired =			 compile preprocessFileLineNumbers "compile\player_fired.sqf";
			player_death =			 compile preprocessFileLineNumbers "compile\player_death.sqf";

			if (!isNil 'zzEhDmg') then {
				_p2 removeEventHandler ["HandleDamage",zzEhDmg];
			};
			if (!isNil 'zzEhFi') then {
				_p2 removeEventHandler ["Fired",zzEhFi];
			};
			if (!isNil 'zzEhKi') then {
				_p2 removeEventHandler ["Killed",zzEhKi];
			};

			zzEhDmg = 	_p2 addeventhandler 	["HandleDamage",{ _this call fnc_usec_damageHandler; } ];
			zzEhFi = 	_p2 addEventHandler 	["Fired", {_this call player_fired; _this call p2_fired}];
			zzEhKi = 	_p2 addEventHandler 	["Killed", {_id = [] spawn player_death;}];
		};
	};


	/*===========================================================================
	Global Functions / Event Handlers / Variables
	---------------------------------------------------------------------------*/

		//Set this to something other than nil so it doesnt kick us!
		P2DZ_fire = "";

		//Set this to the time early or get kicked
		P2DZ_AH_loopTimeLast = diag_tickTime;

		//Weapon Checker Variables
		P2DZ_blackMarkCount = 			0;
		P2DZ_LastShotInfo = 			["","",0,0];
		P2DZ_lastReload = 				diag_tickTime;


		/*---------------------------------------------------------------------------
		Player Fired Event: _this = [unit, weapon, muzzle, mode, ammo, magazine, projectile]
		---------------------------------------------------------------------------*/
		p2_fired = {
			//if local
			if (_this select 0 == player || _this select 0 == (vehicle player)) then {
				[_this select 0, _this select 1,_this select 5, _this select 6,_this select 2] call p2_bulletCheck;
				[_this select 1, _this select 4, _this select 0] call p2_infAmmoCheck;
			};
		};

		/*---------------------------------------------------------------------------
			Damage Handler / Fired Handler / Killed Handler
		---------------------------------------------------------------------------*/

		fnc_usec_damageHandle = {
			private ["_p2"];
			_p2 = _this select 0;

			fnc_usec_damageHandler = compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";
			player_fired =			 compile preprocessFileLineNumbers "compile\player_fired.sqf";
			player_death =			 compile preprocessFileLineNumbers "compile\player_death.sqf";

			if (!isNil 'zzEhDmg') then {
				_p2 removeEventHandler ["HandleDamage",zzEhDmg];
			};
			if (!isNil 'zzEhFi') then {
				_p2 removeEventHandler ["Fired",zzEhFi];
			};
			if (!isNil 'zzEhKi') then {
				_p2 removeEventHandler ["Killed",zzEhKi];
			};

			zzEhDmg = 	_p2 addeventhandler 	["HandleDamage",{ _this call fnc_usec_damageHandler; } ];
			zzEhFi = 	_p2 addEventHandler 	["Fired", {_this call player_fired; _this call p2_fired}];
			zzEhKi = 	_p2 addEventHandler 	["Killed", {_id = [] spawn player_death;}];
		};


		/*---------------------------------------------------------------------------
		Weapon Reload Handler
		---------------------------------------------------------------------------*/
		[] spawn {
			while {11250 == 11250} do {
				waitUntil {inputAction "ReloadMagazine" > 0};  
				P2DZ_lastReload = diag_tickTime;
			};
		};

		/*---------------------------------------------------------------------------
		Ensure Trader Dialogs are Setup Right
		---------------------------------------------------------------------------*/
		
		_TdB = {
			private ['_ind', '_it', '_dt'];
			_ind = _this select 0;
			if (_ind < 0) exitWith {
				cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
			};
			_it = TraderItemList select _ind;
			_dt = [_it select 0, _it select 3, 1, _it select 2, 'buy', _it select 4, _it select 1, _it select 8];
			[0, player, '', _dt] execVM (_it select 9);
			TraderItemList = -1;
		};
		TraderDialogBuy = _TdB;

		_TdS = {
			private ['_ind', '_it', '_dt'];
			_ind = _this select 0;
			if (_ind < 0) exitWith {
				cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
			};
			_it = TraderItemList select _ind;
			_dt = [_it select 6, _it select 0, _it select 5, 1, 'sell', _it select 1, _it select 7, _it select 8];
			[0, player, '', _dt] execVM (_it select 9);
			TraderItemList = -1;
		};
		TraderDialogSell = _TdS;

		/*---------------------------------------------------------------------------
			AntiHack Boot player Function
		---------------------------------------------------------------------------*/

		P2DZ_AHKick = {
			systemChat("AntiHack: Something went wrong! You will be Kicked to lobby. Please reconnect!");
			diag_log("AntiHack: Something went wrong! You will be Kicked to lobby. Please reconnect!");
			uiSleep 2; endMission "END1";
		};

		/*---------------------------------------------------------------------------
			Disable Bad Commands Function
		---------------------------------------------------------------------------*/
		
		disableBadFunctions = {
			BattleFieldClearance = 'STR';publicVariable 'BattleFieldClearance';
			loadFile = 'STR';publicVariable 'loadFile';
			rcallVarcode = 'STR';publicVariable 'rcallVarcode';
			addTeamMember = 'STR';publicVariable 'addTeamMember';
			removeTeamMember = 'STR';publicVariable 'removeTeamMember';
			saveStatus = 'STR';publicVariable 'saveStatus';
			loadStatus = 'STR';publicVariable 'loadStatus';
			saveVar = 'STR';publicVariable 'saveVar';
			createTeam = 'STR';publicVariable 'createTeam';
			BIS_MPF_logic = 'STR';publicVariable 'BIS_MPF_logic';
			BIS_MPF_dummygroup = 'STR';publicVariable 'BIS_MPF_dummygroup';
		};


	/*-------------------------------------------------------------------------*/

	/*===========================================================================
	Executions / Calls / Spawns
	---------------------------------------------------------------------------*/

		/* -AntiHack Function: 	disableBadFunctions	*/
		call disableBadFunctions;

		/* -AntiHack Function: 	Anti-MemoryHack/CheatEngine	*/
		[_pi,_pn] execVM "system\antihack\antiCheatEngine.sqf";

		/*	Wait until BIS has initialised...
		*/  waitUntil {!isNil "bis_fnc_init"};

		/*---------------------------------------------------------------------------
		Load the rest of the functions
		---------------------------------------------------------------------------*/
		call compile preprocessFileLineNumbers "system\antihack\bannedCommands.sqf";
		//call compile preprocessFileLineNumbers "system\antihack\functionChecks.sqf";	## Encrypted
		call compile preprocessFileLineNumbers "system\antihack\disableSideChat.sqf";
		call compile preprocessFileLineNumbers "system\antihack\playerChecks.sqf";
		call compile preprocessFileLineNumbers "system\antihack\chatCommands.sqf";
		call compile preprocessFileLineNumbers "system\antihack\menuChecks.sqf";

		/*---------------------------------------------------------------------------
		AntiHack Looped Execution Functions
		---------------------------------------------------------------------------*/
		//call compile preprocessFileLineNumbers "system\antihack\antihack_loopedExecution.sqf";

		/*---------------------------------------------------------------------------
		Spawn Anti-Teleport Loop
		---------------------------------------------------------------------------*/
		[_pn,_pi,_mP] execVM "system\antihack\antiTele.sqf";

		/*---------------------------------------------------------------------------
		Spawn Misc Checks
		---------------------------------------------------------------------------*/
		[_pn,_pi] execVM "system\antihack\miscChecks.sqf";

		/*---------------------------------------------------------------------------
		 Weapon / Magazine / Projectile Security Functions
		---------------------------------------------------------------------------*/
		[] execVM "system\antihack\antihack_wepCheck.sqf";

		/*---------------------------------------------------------------------------
		Spawn Main AntiHack Loop
		---------------------------------------------------------------------------*/
		[_pn,_pi,_mP] spawn P2DZ_AHLoop;

	/*-------------------------------------------------------------------------*/
};

