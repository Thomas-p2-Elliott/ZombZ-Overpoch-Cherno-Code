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
	private ["_puid","_pname","_mPos"];

	//	Wait until the player is fully loaded in before retrieving variables from them
	waitUntil {vehicle player 		== 	player};
	waitUntil {getPlayerUID player 	!= 	''};
	waitUntil {name player 			!= 	''};

	//As early as we can, retrieve player UID and player name from client
	_puid = getPlayerUID player;	
	_pname = name player;
	_mPos = getMarkerPos 'respawn_west';

	//	Exit if whitelist enabled and players uid is whitelisted
	if (P2DZ_clientAHWhitelistEnabled && {(_puid in P2DZ_clientAHWhiteListUIDs)}) exitWith {};


	/*===========================================================================
	Global Functions / Event Handlers / Variables
	---------------------------------------------------------------------------*/

		//Set this to something other than nil so it doesnt kick us!
		PVDZE_atp = "";

		//Set this to the time early or get kicked
		P2DZ_AH_loopTimeLast = diag_tickTime;

		//Weapon Checker Variables
		P2DZ_blackMarkCount = 			0;
		P2DZ_LastShotInfo = 			["","",0,0];
		P2DZ_lastReload = 				diag_tickTime;

		/*---------------------------------------------------------------------------
			Damage Handler / Fired Handler / Killed Handler
		---------------------------------------------------------------------------*/

		fnc_usec_damageHandle = {
			/*
			ASSIGN DAMAGE HANDLER TO A UNIT
			- Function
			- [unit] call fnc_usec_damageHandle;
			*/
			private ["_unit"];
			_unit = _this select 0;
			
			// Remove handle damage override
			// _unit removeEventHandler ["HandleDamage",temp_handler];

			mydamage_eh1 = _unit addeventhandler ["HandleDamage",{_this call fnc_usec_damageHandler; _this call DDOPP_taser_handleHit; } ];
			mydamage_eh2 = _unit addEventHandler ["Fired", {_this call player_fired; _this call p2_fired}];
			mydamage_eh3 = _unit addEventHandler ["Killed", {_id = [] spawn player_death;}];
		};

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
		
		_TraderDialogBuy = {
			private ['_index', '_item', '_data'];
			_index = _this select 0;
			if (_index < 0) exitWith {
				cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
			};
			_item = TraderItemList select _index;
			_data = [_item select 0, _item select 3, 1, _item select 2, 'buy', _item select 4, _item select 1, _item select 8];
			[0, player, '', _data] execVM (_item select 9);
			TraderItemList = -1;
		};
		TraderDialogBuy = _TraderDialogBuy;

		_TraderDialogSell = {
			private ['_index', '_item', '_data'];
			_index = _this select 0;
			if (_index < 0) exitWith {
				cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
			};
			_item = TraderItemList select _index;
			_data = [_item select 6, _item select 0, _item select 5, 1, 'sell', _item select 1, _item select 7, _item select 8];
			[0, player, '', _data] execVM (_item select 9);
			TraderItemList = -1;
		};
		TraderDialogSell = _TraderDialogSell;

		/*---------------------------------------------------------------------------
			AntiHack Boot player Function
		---------------------------------------------------------------------------*/

		P2DZ_AHKick = {
			endMission "END1";
			disableSerialization;
			for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
			//createCenter sideEnemy; // will crash their game if enabled!
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
		[_puid,_pname] execVM "system\antihack\antiCheatEngine.sqf";

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
		[_pname,_puid,_mPos] execVM "system\antihack\antiTele.sqf";

		/*---------------------------------------------------------------------------
		Spawn Misc Checks
		---------------------------------------------------------------------------*/
		[_pname,_puid] execVM "system\antihack\miscChecks.sqf";

		/*---------------------------------------------------------------------------
		 Weapon / Magazine / Projectile Security Functions
		---------------------------------------------------------------------------*/
		[] execVM "system\antihack\antihack_wepCheck.sqf";

		/*---------------------------------------------------------------------------
		Spawn Main AntiHack Loop
		---------------------------------------------------------------------------*/
		[_pname,_puid,_mPos] spawn P2DZ_AHLoop;

	/*-------------------------------------------------------------------------*/
};

