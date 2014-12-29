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
				P2DZ_fire = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  'BIS_MENU_GroupCommunication',  (format["%1",(((_selected select 4) select 0) select 1)])];
				publicVariableServer 'P2DZ_fire';
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
				P2DZ_fire = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  'BadCommandingMenu',  (format["%1",_commandingMenu])];
				publicVariableServer 'P2DZ_fire';
				[] spawn P2DZ_AHKick;
			};
		};
	};
};