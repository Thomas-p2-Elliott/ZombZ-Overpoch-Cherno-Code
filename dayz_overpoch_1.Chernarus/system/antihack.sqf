/*
	Anti-Teleport - Created By Razor / Refactored By Alby & CopyPasted to Epoch by Skaronator
	Modified by [ZombZ.net] Player2 & xDeejayCrazyx
*/
private ["_log","_playerName","_playerUID","_al1veOnce","_debug","_lastpos","_lastheight","_lasttime","_lastVehicle","_v","_h","_topv","_toph","_curpos","_distance","_acceptableDistance","_curtime","_difftime","_plant","_curheight","_speed","_topSpeed","_terrainHeight","_differenceCheck","_lastPosVar","_safetyVehicle","_curPos"];
waitUntil {vehicle player == player};

//Because we don't have rules!
if ((getPlayerUID player) in ["76561198147422604","76561197994454413","76561198143011904"]) exitWith {};

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

P2DZ_AHKick = {
	_playerName = name player;
	_playerUID = getPlayerUID player;
	endMission "LOSER";
	disableSerialization;
	for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
};

[] spawn {
	while {1 == 1} do {
		addGroupIcon = 'STRING';
		setGroupIconParams = 'STRING';
		createDiaryRecord = 'STRING';
		createTask = 'STRING';
		createSimpleTask = 'STRING';
		buttonSetAction = 'STRING';
		processDiaryLink = 'STRING';
		createDiaryLink = 'STRING';
		lbSetData = 'STRING';
		profileNamespace = 'STRING';
		exec = 'STRING';
		createTeam = 'STRING';
		saveStatus = 'STRING';
		loadStatus = 'STRING';
		saveVar = 'STRING';
		loadFile = 'STRING';
		markerText = 'STRING';
		rcallVarcode = 'STRING';
		setMarkerAlpha = 'STRING';
		setMarkerBrush = 'STRING';
		setMarkerColor = 'STRING';
		setMarkerDir = 'STRING';
		setMarkerPos = 'STRING';
		setMarkerShape = 'STRING';
		setMarkerSize = 'STRING';
		setMarkerText = 'STRING';
		setMarkerType = 'STRING';
		addWeaponCargo = 'STRING';
		addMagazineCargo = 'STRING';
		setVehicleAmmo = 'STRING';
		setVehicleAmmoDef = 'STRING';
		setWeaponReloadingTime = 'STRING';
		setVehicleInit = 'STRING';
		processInitCommands = 'STRING';
		addMPEventHandler = 'STRING';
		BattleFieldClearance = 'STRING';
		createVehicleLocal = 'STRING';
		setWaypointStatements = 'STRING';
		addWaypoint = 'STRING';
		toLower = 'STRING';
		toUpper = 'STRING';

		playableUnits = [player,player,player];
		allUnits = [player,player,player];
		vehicles = [player,player,player];
		entities = [player,player,player];
		allMissionObjects = [player,player,player];
		player allowDamage true;
		(vehicle player) allowDamage true;

		//these will break raven packs
		openMap = 'STRING';
		onMapSingleClick = 'STRING';
		setMarkerDirLocal = 'STRING';
		setMarkerAlphaLocal = 'STRING';
		setMarkerPosLocal = 'STRING';
		setMarkerTextLocal = 'STRING';
		setMarkerTypeLocal = 'STRING';
		setMarkerColorLocal = 'STRING';
		setMarkerBrushLocal = 'STRING';
		setMarkerSizeLocal = 'STRING';
		setMarkerShapeLocal = 'STRING';
		createMarkerLocal = 'STRING';
		//end of raven breakers

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
				if ((_speed > _topSpeed) && (alive player) && ((driver (vehicle player) == player) || (isNull (driver (vehicle player)))) && (_debug distance _lastpos > 3000) && !((vehicle player == player) && (_curheight < _lastheight) && ((_curheight - _terrainHeight) > 1))) then {
					(vehicle player) setposATL  _lastpos;
					PVDZE_atp = format["TELEPORT REVERT for player UID#%1 from %2 to %3, %4 meters, now at %5", getPlayerUID player, _lastpos, _curPos, round(_lastpos distance _curpos), getPosATL player];
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

PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, toArray 'FunctionChecks', toArray 'Loop Exited'];
publicVariableServer 'PVDZE_atp';
[] spawn P2DZ_AHKick;