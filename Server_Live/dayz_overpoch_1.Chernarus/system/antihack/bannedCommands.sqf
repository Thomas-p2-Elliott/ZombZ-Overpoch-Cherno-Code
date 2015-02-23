P2DZ_AH_BannedCommands = {
	private ["_puid","_pname"];
	_pname = _this select 0;
	_puid = _this select 1;

	if (P2DZ_AHDebug) then {
		diag_log(format["P2AntiHackDebug: P2DZ_AH_BannedCommands: Input: %1", _this]);
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
		P2DZ_fire = [_pname, _puid,  ('NoRecoil Hack'),  (str unitRecoilCoefficient player)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	vehicle player setUnitRecoilCoefficient 1;	player setUnitRecoilCoefficient 1;

	if ((groupIconsVisible select 0) || (groupIconsVisible select 1)) then
	{
		P2DZ_fire = [_pname, _puid,  ('ESP Hack'),  (str groupIconsVisible)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	setGroupIconsVisible [false,false];

	BIS_fnc_spawnCrew = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('spawnCrew Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spawnGroup = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('spawnGroup Hack'),  (str missionStart)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_help = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('help Hack'),  (str missionStart)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_3Dcredits = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('3Dcredits'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_crows = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('crows Hack'),  (str missionStart)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_customGPSvideo = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('customGPSvideo Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_customGPS = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('customGPS Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_destroyCity = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('destroyCity Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_dirIndicator = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('dirIndicator Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_playVideo = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('playVideo Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_spawnvehicle = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('spawnvehicle Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spawnEnemy = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('spawnEnemy Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_AAN = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('AAN Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_taskPatrol = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('taskPatrol Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	bis_fnc_taskDefend = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('taskDefend Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_taskAttack = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('taskAttack Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_supplydrop = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('supplydrop Hack'),  (_this select 1)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_spotter = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('spotter Hack'),  (str(_this select 0))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
	BIS_fnc_listPlayers = {
		P2DZ_fire = [(name player), (getPlayerUID player),  ('listPlayers Hack'),  (str missionStart)];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
};