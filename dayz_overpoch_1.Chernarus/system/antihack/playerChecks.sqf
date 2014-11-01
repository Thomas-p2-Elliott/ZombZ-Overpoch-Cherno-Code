P2DZ_AH_PlayerChecks = {

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_AH_PlayerChecks"]);
	};

	private ["_puid","_dayz_characterID","_mPos","_idcount","_characterID","_randvar2","_log","_bodyName","_con","_veh","_pname"];
	_pname = _this select 0; _puid = _this select 1; _dayz_characterID = _this select 2; _mPos = _this select 3;
	_idcount = 0;
	disableSerialization;

	if (str(player) == '<NULL-object>') then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('Player is <NULL-object>'), ""];
		publicVariableServer 'PVDZE_atp';
		endMission "END1";
	};

	if (!isNil 'player') then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('Player is Nil'), ""];
		publicVariableServer 'PVDZE_atp';
		endMission "END1";
	};

	if (typeName player != 'OBJECT') then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('Player is not an object'), ""];
		publicVariableServer 'PVDZE_atp';
		endMission "END1";
	};

	if (isNull player) then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('Player is Null'), ""];
		publicVariableServer 'PVDZE_atp';
		endMission "END1";
	};

	_characterID = player getVariable['CharacterID','-1'];
	if !(_characterID in ['-1',_dayz_characterID]) then
	{
		_idcount = _idcount + 1;
		_characterID = player getVariable['CharacterID','-1'];
		if (!(_characterID in ['-1',_dayz_characterID]) && (_idcount >= 20)) then
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid,  ('Remote Control'),  (str [_characterID,_dayz_characterID,typeOf player])];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
	};

	if ((isNil 'dayz_playerName') || (dayz_playerName != _pname) || ((name player != 'Error: No unit') && (_pname != name player) && (getPlayerUID player != ''))) then
	{
		_log = format['dayz_playerName   is not equal to   name player (%1/%2) | %2 controlled %1 ?',dayz_playerName,name player];
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid,  ('dayz_playerName   is not equal to   name player, remote control?'),  (str [dayz_playerName,_pname])];
		publicVariableServer 'PVDZE_atp';
		player setDamage 5;
		endMission "END1";
	};

	_bodyName = player getVariable ['bodyName','unknown'];
	if (_bodyName == 'unknown') then {player setVariable ['bodyName',dayz_playerName,true];};

	if (isNil 'deathHandled') then { 
		deathHandled = true; 
	} else { 
		if (typeName deathHandled != 'BOOL') then { 
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid,  ('GodMode: deathHandled not a boolean'),  (str deathHandled)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;		
		}; 
	};

	if (isNil 'r_fracture_legs') then {
		r_fracture_legs = false; 
	} else {
		if (typeName r_fracture_legs != 'BOOL') then {
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid,  ('GodMode: r_fracture_legs not a boolean'),  (str deathHandled)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;		
		}; 
	};

	if (deathHandled) then
	{
		[] spawn {
			uiSleep 25;
			(findDisplay 46) closeDisplay 0;
		};
	};

	if ((deathHandled) && (r_player_blood > 0)) then
	{
		r_player_blood = -500;
		uiSleep 0.2;
		if (r_player_blood > 0) then
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid,  ('GodMode: r_player_blood hack'),  (str r_player_blood)];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
			[] spawn (compile preprocessFileLineNumbers 'compile\player_death.sqf');
			player setHit['Body',1];
		};
	};

	if ((!deathHandled) && (r_player_blood < 0)) then
	{
		[] spawn (compile preprocessFileLineNumbers 'compile\player_death.sqf');
		player setHit['Body',1];
	};

	_con = cameraOn;
	_veh = vehicle player;
	if (str _con != str _veh) then
	{
		if ((_veh distance (_mPos) > 250) && (_con distance (_mPos) > 250) && (_con distance _veh > 150)) then
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid,  ('CameraHack'),  (str [_con,_veh])];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
	};
};