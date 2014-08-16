/*
	Anti-Teleport - Created By Razor / Refactored By Alby & CopyPasted to Epoch by Skaronator
	Modified by [ZombZ.net] Player2 & xDeejayCrazyx
*/
private ["_log","_playerName","_playerUID","_al1veOnce","_debug","_lastpos","_lastheight","_lasttime","_lastVehicle","_v","_h","_topv","_toph","_curpos","_distance","_acceptableDistance","_curtime","_difftime","_plant","_curheight","_speed","_topSpeed","_terrainHeight","_differenceCheck","_lastPosVar","_safetyVehicle","_curPos"];
waitUntil {vehicle player == player};

//Because we don't have rules on the test server!
if ((getPlayerUID player) in ["76561198147422604","76561197994454413","76561198143011904"] && P2DZE_clientAHWhitelistEnabled) exitWith {};

/* typename check */

[] spawn {
	private ["_playerName","_playerUID"];
	_playerName = name player;
	_playerUID = getPlayerUID player;
	while {1 == 1} do {
		if (typeName player != "OBJECT") then {
			PVDZE_atp = format["WARNING typename error for player UID#%1", _playerUID];
			publicVariableServer "PVDZE_atp";
			//forceEnd;
			endMission "LOSER";
			sleep 10; //Bypass spam
		};
	};
	endMission "LOSER";
};

/* true value check */

[] spawn {
	_playerName = name player;
	_playerUID = getPlayerUID player;
	while {true} do {
		sleep 5;
	};
	PVDZE_atp = format["WARNING PLAYER WITH NAME (%1) && UID# (%2) HAS CHANGED THE TRUE VALUE TO FALSE", _playerName, _playerUID];
	publicVariableServer "PVDZE_atp";
	endMission "LOSER";
	for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
	sleep 10;
};

/* plant libs check */

[] spawn {
	_al1veOnce = false;
	if (!_al1veOnce) then {
		private [ "_loc", "_plant","_debug"];
		_debug = getMarkerpos "respawn_west";
		// check that plants libs are properly loaded
		// thanks to Tansien the great
		// run only once per character life
		{
			_plant = _x createVehicleLocal _debug;
			sleep 0.1;
			if (sizeOf _x == 0) exitWith { 
				PVDZE_atp = "Plants texture hack for type " + _x;
				publicVariableServer "PVDZE_atp";
				endMission "LOSER";
			};
			deleteVehicle _plant;
		} count ["grass", "prunus", "picea", "fallentree", "phragmites", "acer", "amygdalusn", "Brush", "fiberplant", "amygdalusc", "boulder"];
		diag_log format [ "%1: Plants libs tests done!", __FILE__];
	};
	_al1veOnce = true;
};

/* antihack boot player function */

P2DZ_AHKick = {
	_playerName = name player;
	_playerUID = getPlayerUID player;
	endMission "LOSER";
	disableSerialization;
	for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
	createCenter sideEnemy;
};



[] spawn {
	while {1 == 1} do {
	/* banned commands */

		addGroupIcon = 	{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: addGroupIcon', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setGroupIconParams = 	{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setGroupIconParams', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createDiaryRecord = 	{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createDiaryRecord', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createTask = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createTask', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createSimpleTask = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createSimpleTask', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	buttonSetAction = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: buttonSetAction', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	processDiaryLink = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: processDiaryLink', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createDiaryLink = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createDiaryLink', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	lbSetData = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: lbSetData', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	profileNamespace = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: profileNamespace', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	exec = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: exec', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createTeam = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createTeam', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	saveStatus = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: saveStatus', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	loadStatus = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: loadStatus', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	saveVar = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: saveVar', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	loadFile = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: loadFile', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	markerText = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: markerText', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	rcallVarcode = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: rcallVarcode', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerAlpha = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerAlpha', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerBrush = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerBrush', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerColor = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerColor', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerDir = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerDir', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerPos = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerPos', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerShape = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerShape', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerSize = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerSize', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerText = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerText', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerType = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerType', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	addWeaponCargo = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: addWeaponCargo', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	addMagazineCargo = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: addMagazineCargo', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setVehicleAmmo = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setVehicleAmmo', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setVehicleAmmoDef = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setVehicleAmmoDef', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setWeaponReloadingTime = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setWeaponReloadingTime', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setVehicleInit = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setVehicleInit', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	processInitCommands = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: processInitCommands', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	addMPEventHandler = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: BattleFieldClearance', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	BattleFieldClearance = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createVehicleLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	createVehicleLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setWaypointStatements', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setWaypointStatements = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: addWaypoint', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	addWaypoint = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: toLower', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	openMap = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: onMapSingleClick', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	onMapSingleClick = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerDirLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerDirLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerAlphaLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerAlphaLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerAlphaLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerPosLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerPosLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerTextLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerTextLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerTypeLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerTypeLocal', toArray (_this select 0)];
			 	publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerColorLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerColorLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerBrushLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerBrushLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerSizeLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerSizeLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 

		};	setMarkerShapeLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: setMarkerShapeLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};	createMarkerLocal = 	{		    PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'BlackListedCommand: createMarkerLocal', toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick; 
		};

		playableUnits = [player,player,player];
		allUnits = [player,player,player];
		vehicles = [player,player,player];
		entities = [player,player,player];
		allMissionObjects = [player,player,player];
		player allowDamage true;
		(vehicle player) allowDamage true;


		/* ensure functions arent set to null or changed */

		if (!isNil 'fnc_usec_damageHandler') then 
		{
			if (str (fnc_usec_damageHandler) == '{}') then 
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'fnc_usec_damageHandler', toArray ('{}')];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
		if (!isNil 'fnc_usec_unconscious') then 
		{
			if (str (fnc_usec_unconscious) == '{}') then 
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'fnc_usec_unconscious', toArray ('{}')];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
		if (!isNil 'player_zombieCheck') then 
		{
			if (isNil 'orig_player_zombieCheck') then 
			{
				orig_player_zombieCheck = str(player_zombieCheck);
			};
		};
		if (!isNil 'orig_player_zombieCheck') then 
		{
			if (str(player_zombieCheck) != orig_player_zombieCheck) exitWith 
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'player_zombieCheck', toArray ('NotOriginal')];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
		if (!isNil 'player_checkStealth') then 
		{
			if (isNil 'orig_player_checkStealth') then 
			{
				orig_player_checkStealth = str(player_checkStealth);
			};
		};
		if (!isNil 'orig_player_checkStealth') then 
		{
			if (str(player_checkStealth) != orig_player_checkStealth) exitWith 
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'player_checkStealth', toArray ('NotOriginal')];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
		if (!isNil 'player_zombieAttack') then 
		{
			if (isNil 'orig_player_zombieAttack') then 
			{
				orig_player_zombieAttack = str(player_zombieAttack);
			};
		};
		if (!isNil 'orig_player_zombieAttack') then 
		{
			if (str(player_zombieAttack) != orig_player_zombieAttack) exitWith 
			{
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'player_zombieAttack', toArray ('NotOriginal')];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};

		/* banned BIS functions */

		BIS_fnc_spawnCrew = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('spawnCrew'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_spawnGroup = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('spawnGroup'), toArray (str missionStart)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_help = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('help'), toArray (str missionStart)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_3Dcredits = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('3Dcredits'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_crows = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('crows'), toArray (str missionStart)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_customGPSvideo = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('customGPSvideo'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_customGPS = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('customGPS'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_destroyCity = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('destroyCity'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_dirIndicator = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('dirIndicator'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_playVideo = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('playVideo'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_spawnvehicle = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('spawnvehicle'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_spawnEnemy = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('spawnEnemy'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_AAN = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('AAN'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_taskPatrol = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('taskPatrol'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		bis_fnc_taskDefend = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('taskDefend'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_taskAttack = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('taskAttack'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_supplydrop = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('supplydrop'), toArray (_this select 1)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_spotter = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('spotter'), toArray (_this select 0)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
		BIS_fnc_listPlayers = {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray ('listPlayers'), toArray (str missionStart)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};

		sleep 15;

	};


	PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'FunctionChecks', toArray 'Loop Exited'];
 	publicVariableServer 'PVDZE_atp';
	[] spawn P2DZ_AHKick;
};


[] spawn {

	while {1 == 1} do
	{

		/* check near players  - anti-dupe measure */

		if (!isNil 'dze_isnearest_player') then
		{
			if (isNil 'odze_isnearest_player') then {odze_isnearest_player = dze_isnearest_player;};
			dze_isnearest_player = {
				private ['_return'];
				_return = _this call odze_isnearest_player;
				if (!DZE_CanPickup && _return) then {DZE_CanPickup = true;};
				_return
			};
		};

		/* check lock vault - anti-duping measure */

		if (!isNil 'player_lockVault') then
		{
			if (isNil 'oplayer_lockVault') then {oplayer_lockVault = player_lockVault;};
			player_lockVault =
			{
				_y = _this spawn oplayer_lockVault;
				[] spawn {
					_time = time + 10;
					while {_time > time} do
					{
						if (!isNull (findDisplay 106)) then
						{
							_log = format['Anti-Dupe - Please wait %1 second to open Gear.',round (_time - time)];
							cutText [_log,'PLAIN'];
							hint _log;
							(findDisplay 106) closeDisplay 0;
							closeDialog 0;
						};
						uiSleep 0.1;
					};
				};
				_y
			};
		};

		/* check lock door - anti exploit measure */


		if (!isNil 'player_unlockDoor') then
		{
			if (isNil 'oplayer_unlockDoor') then {oplayer_unlockDoor = player_unlockDoor};
			player_unlockDoor = {
				disableSerialization;
				if (!isNil 'dayz_selectedDoor') then
				{
					if (!isNull dayz_selectedDoor) then
					{
						if (isNil 'DZE_Lock_Door') then {DZE_Lock_Door = 'NOTHING ENTERED';};
						_CharacterID = dayz_selectedDoor getVariable ['CharacterID','0'];
						PVDZE_log_lockUnlock = [player, dayz_selectedDoor, false,DZE_Lock_Door,_CharacterID];
						publicVariableServer 'PVDZE_log_lockUnlock';
						if (DZE_Lock_Door == _CharacterID) then
						{
							UnlockDoorTryCount = nil;
						}
						else
						{
							if (isNil 'UnlockDoorTryCount') then
							{
								UnlockDoorTryCount = 0;
								[] spawn {
									_time = time;
									waitUntil {time > time + 30};
									UnlockDoorTryCount = nil;
								};
							};
							if (!isNil 'UnlockDoorTryCount') then
							{
								UnlockDoorTryCount = UnlockDoorTryCount + 1;
								if (UnlockDoorTryCount > 3) then
								{
									UnlockDoorTryCount = nil;
									fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
									r_player_timeout = 30;
									r_player_unconscious = true;
									player setVariable ['medForceUpdate',true,true];
									player setVariable ['unconsciousTime', r_player_timeout, true];
									player setVariable ['NORRN_unconscious', true, true];
									player playActionNow 'Die';
									[] spawn {
										disableUserInput true;disableUserInput true;disableUserInput true;
										waitUntil {!r_player_unconscious};
										disableUserInput false;disableUserInput false;disableUserInput false;
									};
								};
							};
						};
					};
				};
				_y = _this call oplayer_unlockDoor;
				_y
			};
		};

		/* humanitymorph functioin security layer */

		if (!isNil 'player_humanityMorph') then
		{
			if (isNil 'oplayer_humanityMorph') then {oplayer_humanityMorph = player_humanityMorph};
			player_humanityMorph = {
				if (typeOf player == (_this select 2)) exitWith {cutText ['You already wear this Skin!', 'PLAIN'];};
				closeDialog 0;closeDialog 0;closeDialog 0;
				_result = _this spawn oplayer_humanityMorph;
				_result
			};
		};


		uiSleep 2;
	};
};

/* anti-teleport */
[] spawn {
	while {1 == 1} do {
		_debug = getMarkerpos "respawn_west";
		_lastpos = getPosATL (vehicle player);
		_lastheight = (ATLtoASL _lastpos) select 2;
		_lasttime = diag_ticktime;
		_lastVehicle = vehicle player;

		// freefall detection:
		_v = 0;
		_h = 0;
		_topv = 0;
		_toph = 0;
		_isHalo = false;

		while {((typeName player == "OBJECT") && {((player in playableUnits) || {(alive player)})})} do {
			_curpos = getPosATL (vehicle player);
			_distance = _lastpos distance _curpos;
			_curtime = diag_ticktime;
			_difftime = _curtime - _lasttime;
			_acceptableDistance = if (_lastVehicle isKindOf "Plane") then { 15; } else { 10; };

			if ((_distance > _acceptableDistance) || {(_difftime > 1)}) then {
				_curheight = (ATLtoASL _curpos) select 2;
				_speed = _distance / _difftime;
				_topSpeed = if (_acceptableDistance == 15) then { 20; } else { 10; };
				if (vehicle player != player) then {
					if (_acceptableDistance == 15) then {
						_topSpeed = (getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed")) max 500;
					} else {
						_topSpeed = (getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed")) min 500;
					};
				};
				_terrainHeight = getTerrainHeightASL [_curpos select 0, _curpos select 1];
				_safetyVehicle = vehicle player;
				if (_lastVehicle == vehicle player) then {
					if ((_speed > _topSpeed) && (alive player) && !(_lastVehicle in ["ParachuteWest","ParachuteC"]) && ((driver (vehicle player) == player) || (isNull (driver (vehicle player)))) && ((_debug distance _lastpos > 3000)) && !((vehicle player == player) && (_curheight < _lastheight) && ((_curheight - _terrainHeight) > 1))) then {
						(vehicle player) setposATL  _lastpos;
						_PUID = [player] call FNC_GetPlayerUID;
						PVDZE_atp = format["TELEPORT REVERT for player UID#%1 from %2 to %3, %4 meters, now at %5", _PUID, _lastpos, _curPos, round(_lastpos distance _curpos), getPosATL player];
						publicVariableServer "PVDZE_atp";
					} else {
						_lastpos = _curpos;
						_lastheight = _curheight;
					};
					_lasttime = _curtime;
				};
				if (_safetyVehicle == vehicle player) then {
					_lastVehicle = vehicle player;
				};

			};
			sleep 0.25;
		};
		sleep 0.1;
	};
	PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'AntiTeleport', toArray 'Loop Exited'];
	publicVariableServer 'PVDZE_atp';
	[] spawn P2DZ_AHKick;
};

