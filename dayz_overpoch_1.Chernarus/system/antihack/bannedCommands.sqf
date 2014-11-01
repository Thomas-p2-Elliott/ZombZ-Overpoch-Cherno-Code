P2DZ_AH_BannedCommands = {
	private ["_puid","_pname"];
	_pname = _this select 0;
	_puid = _this select 1;

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_AH_BannedCommands"]);
	};

	call compile("
	setVehicleInit='STR';processInitCommands='STR';
	[] spawn {
		_time = 0;while {1 == 1} do {_time = _time + 1;if (_time >= 20) exitWith {};if ((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck')) exitWith {};uiSleep 1;};
		lbsetpicture='STR';createDiaryRecord='STR';createTask='STR';
		createSimpleTask='STR';buttonSetAction='STR';processDiaryLink='STR';createDiaryLink='STR';
		lbSetData='STR';createTeam='STR';exec='STR';addGroupIcon='STR';
		setGroupIconParams='STR';addWeaponCargo='STR';addMagazineCargo='STR';setVehicleAmmoDef='STR';
		setWeaponReloadingTime='STR';addMPEventHandler='STR';
		setWaypointStatements='STR';addWaypoint='STR';
		loadFile='STR';rcallVarcode='STR';saveStatus='STR';loadStatus='STR';
		saveVar='STR';drawIcon='STR';setMarkerText='STR';setMarkerType='STR';
		markerText='STR';setMarkerAlpha='STR';setMarkerBrush='STR';setMarkerColor='STR';
		setMarkerDir='STR';setMarkerPos='STR';setMarkerShape='STR';setMarkerSize='STR';
		createMarker='STR';setMarkerDirLocal='STR';setMarkerAlphaLocal='STR';setMarkerPosLocal='STR';
		setMarkerTextLocal='STR';setMarkerTypeLocal='STR';setMarkerColorLocal='STR';setMarkerBrushLocal='STR';
		setMarkerSizeLocal='STR';setMarkerShapeLocal='STR';createMarkerLocal='STR'; setVehicleInit='STR';processInitCommands='STR';
	};");

	playableUnits = [player,player,player];
	allUnits = [player,player,player];
	vehicles = [player,player,player];
	player allowDamage true;
	(vehicle player) allowDamage true;
	entities = 'STR';
	allMissionObjects = 'STR';

	if (str(unitRecoilCoefficient player) != str(1)) then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('NoRecoil'),  (str unitRecoilCoefficient player)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	vehicle player setUnitRecoilCoefficient 1;	player setUnitRecoilCoefficient 1;

	if ((groupIconsVisible select 0) || (groupIconsVisible select 1)) then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('ESP'),  (str groupIconsVisible)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	setGroupIconsVisible [false,false];

	BIS_fnc_spawnCrew = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('spawnCrew'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spawnGroup = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('spawnGroup'),  (str missionStart)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_help = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('help'),  (str missionStart)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_3Dcredits = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('3Dcredits'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_crows = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('crows'),  (str missionStart)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_customGPSvideo = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('customGPSvideo'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_customGPS = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('customGPS'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_destroyCity = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('destroyCity'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_dirIndicator = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('dirIndicator'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_playVideo = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('playVideo'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_spawnvehicle = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('spawnvehicle'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spawnEnemy = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('spawnEnemy'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_AAN = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('AAN'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_taskPatrol = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('taskPatrol'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_taskDefend = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('taskDefend'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_taskAttack = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('taskAttack'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_supplydrop = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('supplydrop'),  (_this select 1)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spotter = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('spotter'),  (str(_this select 0))];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_listPlayers = {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid,  ('listPlayers'),  (str missionStart)];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
};