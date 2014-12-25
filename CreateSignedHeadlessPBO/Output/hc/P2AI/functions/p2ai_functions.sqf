private["_f","_d"]; _f = "Functions"; _d = P2AI_debug;
if (_d) then { diag_log(format["[P2AI]:%1: Loading Functions from: %2", _f, P2AI_FileLocation]); };

call compile preprocessFileLineNumbers format["%1\functions\p2ai_addMarker.sqf",P2AI_FileLocation];

P2AI_aiDeath = format["%1\functions\p2ai_aiDeath.sqf",P2AI_FileLocation];
P2AIBoxSetup = format["%1\functions\p2ai_spawnBox.sqf",P2AI_FileLocation];

if (_d) then { diag_log(format["[P2AI]:%1: Set-Up: P2AI_aiDeath & P2AIBoxSetup", _f]); };

P2AI_aiThread =		compile preProcessFileLineNumbers format["%1\functions\p2ai_aiThread.sqf",P2AI_FileLocation];
P2AI_spawnAI = 		compile preprocessFileLineNumbers format["%1\functions\p2ai_spawnAI.sqf",P2AI_FileLocation];
P2AI_shootRocket = 		compile preprocessFileLineNumbers format["%1\functions\p2ai_shootRocket.sqf",P2AI_FileLocation];

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AI_aiThread & P2AI_spawnAI", _f]); };
if (_d) then { diag_log(format["[P2AI]:%1: Compiling Other Functions...", _f]); };


/*---------------------------------------------------------------------------
FindPos - Grabs a new mission location from P2AI_MinorLocs & P2AI_MajorLocs
---------------------------------------------------------------------------*/
P2AIFindPos = {
	private ["_missionType", "_dir", "_posArr", "_fin"];
  	_missionType = "Minor"; //init var as minor
	_dir = 0; //init var as 0

	_missionType = _this select 0;

	if (_missionType == "Minor") then {
		_posArr = P2AI_MinorLocs call BIS_fnc_selectRandom;
		_dir = _posArr select 1;
		if (_dir == 0) then {
			_dir = (random 360);
		};
		
	};

	if (_missionType == "Major") then {
		_posArr = P2AI_MajorLocs call BIS_fnc_selectRandom;
		_dir = _posArr select 1;
	};

	_pos = _posArr select 0;
    _fin = [[(_pos select 0), (_pos select 1), 0], _dir];

	private["_f","_d"]; _f = "P2AIFindPos"; _d = P2AI_debugEvents;
	if (_d) then { diag_log(format["[P2AI]:%1: FoundPos For Type %2: %3", _f, _missionType, _fin]); };

    _fin
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AIFindPos", _f]); };


/*---------------------------------------------------------------------------
P2AI - GetWeapon - Picks Random Weapon and gets Magazine Classname
---------------------------------------------------------------------------*/
P2AIGetWeapon = {
	private ["_skill","_aiweapon","_weapon","_magazine","_fin"];
	private["_f","_d"]; _f = "P2AIGetWeapon"; _d = P2AI_debugAI;

	_aiweapon = P2AIWeps1;
	if (_d) then { diag_log(format["[P2AI]:%1: WeaponList: %2", _f, P2AIWeps1]); };
	_weapon = _aiweapon call BIS_fnc_selectRandom;
	_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
	
	_fin = [_weapon,_magazine];
	if (_d) then { diag_log(format["[P2AI]:%1: Selection: %2", _f, _fin]); };
	
	_fin
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AIGetWeapon", _f]); };

/*---------------------------------------------------------------------------
P2AI - Wait Until Mission Compleition
	Waits for P2AIRequiredKillPercent quota to be met counting ai within 60m of the loot
---------------------------------------------------------------------------*/

P2AIWaitMissionComp = {
    private["_objective","_unitArrayName","_numSpawned","_numKillReq","_completed"];
    _objective = _this select 0;
    _unitArrayName = _this select 1;

	private["_f","_d"]; _f = "P2AIWaitMissionComp"; _d = (P2AI_debug or P2AI_debugEvents or P2AI_debugAI);
	//if (_d) then { diag_log(format["[P2AI]:%1: Input: %2", _f, _this]); };

    call compile format["_numSpawned = count %1;",_unitArrayName];

   	if (_d) then { diag_log(format["[P2AI]:%1: Objective: %2", _f, _objective]); };
   	if (_d) then { diag_log(format["[P2AI]:%1: AI Spawned: %2", _f, _numSpawned]); };

    _numKillReq = ceil(P2AIRequiredKillPercent * _numSpawned);

   	if (_d) then { diag_log(format["[P2AI]:%1: AI Kill Requirement: %2", _f, _numKillReq]); };
	if (_d) then { diag_log(format["[P2AI]:%1: Waiting for Mission to Complete, Units: %2", _f, _unitArrayName]); };

    call compile format["waitUntil{uiSleep 10; _completed = [_objective,_numSpawned,_unitArrayName] call P2AICheckRemainingAI; ({isPlayer _x && _completed && _x distance _objective <= 60} count playableUnits > 0);};"];
   
   	if (_d) then { diag_log(format["[P2AI]:%1: Mission Completed: %2", _f, _objective]); };
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AIWaitMissionComp", _f]); };

/*---------------------------------------------------------------------------
Counts remaining AI from a Mission
---------------------------------------------------------------------------*/

P2AICheckRemainingAI = {
private ["_position","_numSpawned","_result","_P2AI_AILeft"];
	//private
	_position = _this select 0;
	_numSpawned = _this select 1;
	_unitArrayName = _this select 2;
	_result = false;
	//foreach object around pos
    //reset the AI count for each check
    _P2AI_AILeft = 0;

	private["_f","_d"]; _f = "P2AICheckRemainingAI"; _d = (P2AI_debug or P2AI_debugEvents or P2AI_debugAI);;
	//if (_d) then { diag_log(format["[P2AI]:%1: Input: %2", _f, _this]); };
	//if (_d) then { diag_log(format["[P2AI]:%1: _position: %2, _numSpawned: %3, _unitArrayName: %4", _f, _position, _numSpawned, _unitArrayName]); };

    //for each object within 300 meters
    {
        //if the object is AI and alive add 1 to the ai counter
        if ((_x getVariable ["P2AIAI",false]) && alive _x) then {
           _P2AI_AILeft = _P2AI_AILeft + 1;
        };
    } forEach (_position nearObjects 300);

	//if (_d) then { diag_log(format["[P2AI]:%1: AI Left Alive within 300: %2", _f, _P2AI_AILeft]); };

    //if amount of AI left is less than 50% of the starting amount rounded up (P2AIRequiredKillPercent = 0.5)
    if (_P2AI_AILeft <= ceil(_numSpawned * P2AIRequiredKillPercent)) then {
    	//  5 < 5 then {}
    	_result = true;
    } else {
    	_result = false;
	};

	//if (_d) then { diag_log("[P2AI]:" + _f + ":" + str(_unitArrayName) +": AI Spawned: " + str(_numSpawned) + " AI Left: " + str(_P2AI_AILeft) + " Mission Completed = " + str(_result)); };
	
	_result
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AICheckRemainingAI", _f]); };

/*---------------------------------------------------------------------------
Sleep Function
---------------------------------------------------------------------------*/
P2AISleep = {
    private["_sleepTime","_checkInterval","_startTime"];
    _sleepTime = _this select 0;
    _checkInterval = _this select 1;
    private["_f","_d"]; _f = "P2AISleep"; _d = (P2AI_debug);
    //if (_d) then { diag_log(format["[P2AI]:%1: Input: %2", _f, _this]); };
    _startTime = diag_tickTime;
    waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AISleep", _f]); };

/*---------------------------------------------------------------------------
AI Deletion Function
---------------------------------------------------------------------------*/
P2AIPurgeObject = {
	private["_f","_d"]; _f = "P2AIPurgeObject"; _d = (P2AI_debug);
	if (_d) then { diag_log(format["[P2AI]:%1: Input: %2 / %3", _f, (typeOf _this), _this]); };
	private["_p2ai"];
	_p2ai = _this;
    _p2ai enableSimulation false;
    _p2ai removeAllMPEventHandlers "mpkilled";
    _p2ai removeAllMPEventHandlers "mphit";
    _p2ai removeAllMPEventHandlers "mprespawn";
    _p2ai removeAllEventHandlers "FiredNear";
    _p2ai removeAllEventHandlers "HandleDamage";
    _p2ai removeAllEventHandlers "Killed";
    _p2ai removeAllEventHandlers "Fired";
    _p2ai removeAllEventHandlers "GetOut";
    _p2ai removeAllEventHandlers "GetIn";
    _p2ai removeAllEventHandlers "Local";
    clearVehicleInit _p2ai;
    deleteVehicle _p2ai;
    deleteGroup (group _p2ai);
    _p2ai = nil;
    _this = nil;
};

if (_d) then { diag_log(format["[P2AI]:%1: Compiled: P2AIPurgeObject", _f]); };

//------------------------------------------------------------------//

if (_d) then { diag_log(format["[P2AI]:%1: Finished", _f]); };
