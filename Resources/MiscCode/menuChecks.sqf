P2DZ_AH_MenuChecks = {
	private ["_pname","_puid","_cMenu","_dayzActions","_tmp","_selected","_commandingMenu","_A","_short"];	_pname = _this select 0;
	_puid = _this select 1;
	disableSerialization;

	/*  ALLOWED CMDMenus      */ 
	_cMenu =
	[
		"","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0",
		"RscWatchDir","RscDisplayClassSelecter","RscDisplayGenderSelect",
		"RscDisplaySpawnSelecter","RscWatchMoreDir","#GETIN","RscStatus",
		"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply",
		"RscCallSupport","#ACTION","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu"
	];

	/*  ALLOWED Scroll Actions     */ _dayzActions =
	[
		"s_player_maintain_area","s_player_maintain_area_preview","dayz_myLiftVehicle","s_player_heli_detach",
		"dayz_myCursorTarget","s_player_smeltRecipes","null","s_player_fillfuel210","ActionMenu",
		"nul","s_player_showname","s_player_showname1","s_player_downgrade_build",
		"s_player_calldog","s_player_speeddog","s_player_movedog","s_player_followdog","s_player_warndog","s_player_barkdog","s_player_trackdog",
		"s_player_staydog","s_player_waterdog","s_player_feeddog","s_player_tamedog","s_player_repair_crtl",
		"s_player_fillgen","s_player_maint_build","s_player_fuelauto2","s_player_fuelauto","s_player_information",
		"s_player_upgrade_build","s_player_packvault","s_player_unlockvault","s_player_checkGear",
		"s_player_lockUnlock_crtl","s_player_deleteBuild","s_player_pzombiesfeed","s_player_pzombiesattack",
		"s_player_pzombiesvision","s_player_callzombies","s_player_removeflare","s_player_fishing_veh",
		"s_player_forceSave","s_player_fillfuel20","s_player_fillfuel5","s_player_lockvault","s_player_dragbody",
		"bis_fnc_halo_action","s_player_rest","s_halo_action","s_player_grabflare","s_player_fishing",
		"s_player_flipveh","s_player_fillfuel","s_player_dropflare","s_player_butcher","s_player_cook",
		"s_player_boil","s_player_fireout","s_player_packtent","s_player_sleep","s_player_studybody",
		"NORRN_dropAction","s_player_holderPickup","unpackRavenAct","disassembleRavenAct","launchRavenAct","strobeRavenResetAct","strobeRavenTestAct",
		"batteryLevelCheckRavenAct","batteryRechargeRavenAct","mavBaseStationActionName_00","mavBaseStationActionName_001",
		"mavBaseStationActionName_01","mavBaseStationActionName_02","mavBaseStationActionName_03","mavBaseStationActionName_04",
		"s_player_igniteTent","s_player_clothes","s_player_scrollBandage",
		"s_player_removeActions","s_player_repairActions","r_player_actions","r_player_actions2","s_player_parts","s_player_combi","s_player_parts",
		"s_player_lockunlock","s_vehicle_lockunlock","s_player_toggleSnap","s_player_toggleSnapSelect","s_player_toggleSnapSelectPoint","snapActions",
		"s_player_plot_boundary_on","s_player_plot_boundary_off","s_player_plot_take_ownership","s_player_plotManagement","s_player_manageDoor",
		"s_player_SurrenderedGear","s_player_takeGold",
		"s_player_packOBJ","s_player_upgradehumvee","s_player_upgradebtr","s_player_upgrade350z","s_player_upgradeatv","s_player_upgrademoto","s_player_upgradebtr2",
		"s_player_upgradelittlebird2","s_player_upgradelittlebird","s_player_upgradegyro","s_player_upgrademerlin","s_player_upgradehumvee2"
	];

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_AH_MenuChecks"]);
	};

	if ((!isNil 'BIS_MENU_GroupCommunication') && (commandingMenu in ['#User:BIS_MENU_GroupCommunication'])) then
	{
		_tmp = BIS_MENU_GroupCommunication;
		showCommandingMenu '';
		for '_i' from 0 to (count _tmp)-1 do
		{
			_selected = _tmp select _i;
			if (count _selected > 4) then
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, toArray 'BIS_MENU_GroupCommunication', toArray (format["%1",(((_selected select 4) select 0) select 1)])];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
		BIS_MENU_GroupCommunication = nil;
	};


	_commandingMenu = commandingMenu;
	if (_commandingMenu != '') then
	{
		_A = toArray _commandingMenu;
		_A resize 6;
		_A;
		_short = toString _A;
		if (!(_commandingMenu in _cMenu)) then
		{
			showCommandingMenu '';
			if (_short in ['#USER:']) then
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, toArray 'BadCommandingMenu', toArray (format["%1",_commandingMenu])];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
	};

	call compile ("
	private [""_tempRemoveAction"",""_startRemove"",""_endRemove"",""_dayzActionsStr"",""_dayzActions"",""_var""];
	if (isNil 's_player_removeActions') then {s_player_removeActions = [];};
	if (isNil 's_player_repairActions') then {s_player_repairActions = [];};
	if (isNil 'r_player_actions') then {r_player_actions = [];};
	if (isNil 'r_player_actions2') then {r_player_actions2 = [];};
	if (isNil 's_player_parts') then {s_player_parts = [];};
	if (isNil 's_player_combi') then {s_player_combi = [];};
	if (isNil 's_player_lockunlock') then {s_player_lockunlock = [];};
	if (isNil 's_vehicle_lockunlock') then {s_vehicle_lockunlock = [];};
	if (isNil 's_player_toggleSnapSelectPoint') then {s_player_toggleSnapSelectPoint = [];};

	_tempRemoveAction = vehicle player addAction ['', '', [], 1, false, true, '', 'false'];
	_startRemove = _tempRemoveAction - 10;
	_endRemove = _tempRemoveAction + 99;
	
	_dayzActionsStr = "+str _dayzActions+";
	_dayzActions = [];
	{
		private ['_var'];
		if (!isNil _x) then
		{
			_var = compile _x;
			_y = call _var;
			if (typeName _y == 'SCALAR') then
			{
				if !(_y in _dayzActions) then
				{
					_dayzActions set [count _dayzActions,_y];
				};
			};
			if (typeName _y == 'ARRAY') then
			{
				{
					if !(_x in _dayzActions) then
					{
						_dayzActions set [count _dayzActions,_x];
					};
				} forEach _y;
			};
		}; 
		true
	} count _dayzActionsStr;
	
	for '_i' from _startRemove to _endRemove do
	{
		if !(_i in _dayzActions) then
		{
			player removeAction _i;
			vehicle player removeAction _i;
			if (!isNull cursorTarget) then {
				cursorTarget removeAction _i;
			};
		};
	};");


};