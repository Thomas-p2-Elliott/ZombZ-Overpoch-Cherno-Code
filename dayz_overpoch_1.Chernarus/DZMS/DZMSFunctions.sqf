/*
	DayZ Mission System Functions
	by Vampire
*/

diag_log text "[DZMS]: loading execVM sqf scripts.";
DZMSMajTimer = "DZMS\Scripts\DZMSMajTimer.sqf";
DZMSMinTimer = "DZMS\Scripts\DZMSMinTimer.sqf";
DZMSMarkerLoop = "DZMS\Scripts\DZMSMarkerLoop.sqf";

DZMSAddMajMarker = "DZMS\Scripts\DZMSAddMajMarker.sqf";
DZMSAddMinMarker = "DZMS\Scripts\DZMSAddMinMarker.sqf";

DZMSAIKilled = "DZMS\Scripts\DZMSAIKilled.sqf";

DZMSBoxSetup = "DZMS\Scripts\DZMSBox.sqf";

diag_log text "[DZMS]: loading compiled functions.";
// compiled functions
DZMSAISpawn = compile preprocessFileLineNumbers "DZMS\Scripts\DZMSAISpawn.sqf";

diag_log text "[DZMS]: loading all other functions.";
//Attempts to find a mission location
//If findSafePos fails it searches again until a position is found
//This fixes the issue with missions spawning in Novy Sobor on Chernarus
DZMSFindPos = {
    private["_mapHardCenter","_mapRadii","_isTavi","_centerPos","_pos","_disCorner","_hardX","_hardY","_findRun","_posX","_posY","_feel1","_feel2","_feel3","_feel4","_noWater","_tavTest","_tavHeight","_disMaj","_disMin","_okDis","_isBlack"];
  
    //Lets try to use map specific "Novy Sobor Fixes".
    //If the map is unrecognised this function will still work.
	//Better code thanks to Halv
	_mapHardCenter = true;
	_mapRadii = 5500;
	_isTavi = false;
	_tavHeight = 0;
	switch (DZMSWorldName) do {
		case "chernarus":{_centerPos = [7100, 7750, 0];_mapRadii = 5500;};
		case "panthera2":{_centerPos = [4400, 4400, 0];_mapRadii = 4400;};
		//We don't have a supported map. Let's use the norm.
		default{_pos = [getMarkerPos "center",0,5500,60,0,20,0] call BIS_fnc_findSafePos;_mapHardCenter = false;};
	};

    //If we have a hardcoded center, then we need to loop for a location
    //Else we can ignore this block of code and just return the position
    if (_mapHardCenter AND (!(DZMSStaticPlc))) then {
   
        _hardX = _centerPos select 0;
        _hardY = _centerPos select 1;
   
        //We need to loop findSafePos until it doesn't return the map center
        _findRun = true;
        while {_findRun} do
        {
            _pos = [_centerPos,0,_mapRadii,60,0,20,0] call BIS_fnc_findSafePos;
           
            //Apparently you can't compare two arrays and must compare values
            _posX = _pos select 0;
            _posY = _pos select 1;
           
            //Water Feelers. Checks for nearby water within 50meters.
            _feel1 = [_posX, _posY+50, 0];
            _feel2 = [_posX+50, _posY, 0];
            _feel3 = [_posX, _posY-50, 0];
            _feel4 = [_posX-50, _posY, 0];
           
            //Water Check
            _noWater = (!surfaceIsWater _pos && !surfaceIsWater _feel1 && !surfaceIsWater _feel2 && !surfaceIsWater _feel3 && !surfaceIsWater _feel4);
			
			//Lets test the height on Taviana
			if (_isTavi) then {
				_tavTest = createVehicle ["Can_Small",[_posX,_posY,0],[], 0, "CAN_COLLIDE"];
				_tavHeight = (getPosASL _tavTest) select 2;
				deleteVehicle _tavTest;
			};
			
			//Lets check for minimum mission separation distance
			_disMaj = (_pos distance DZMSMajCoords);
			_disMin = (_pos distance DZMSMinCoords);
			_okDis = ((_disMaj > 1000) AND (_disMin > 1000));
		   
            //make sure the point is not blacklisted
            _isBlack = false;
            {
                if ((_pos distance (_x select 0)) <= (_x select 1)) then {_isBlack = true;};
            } forEach DZMSBlacklistZones;
            
			//Lets combine all our checks to possibly end the loop
            if ((_posX != _hardX) AND (_posY != _hardY) AND _noWater AND _okDis AND !_isBlack) then {
				if (!(_isTavi)) then {
					_findRun = false;
				};
				if (_isTavi AND (_tavHeight <= 185)) then {
					_findRun = false;
				};
            };
			// If the missions never spawn after running, use this to debug the loop. noWater=true / Dis > 1000 / TaviHeight <= 185
			//diag_log text format ["[DZMS]: DEBUG: Pos:[%1,%2] / noWater?:%3 / okDistance?:%4 / TaviHeight:%5 / BlackListed?:%6", _posX, _posY, _noWater, _okDis, _tavHeight, _isBlack];
            sleep 2;
        };
       
    };
	
	if (DZMSStaticPlc) then {
		_pos = DZMSStatLocs call BIS_fnc_selectRandom;
	};
   
    _fin = [(_pos select 0), (_pos select 1), 0];
    _fin
};

//Clears the cargo and sets fuel, direction, and orientation
//Direction stops the awkwardness of every vehicle bearing 0
DZMSSetupVehicle = {
	private ["_object","_objectID","_ranFuel"];
	_object = _this select 0;
	diag_log("[DZMS]: Vehicle Created: " + str (typeOf _object) + " at Pos: " + str(getPos _object));
	_objectID = str(round(random 999999));
	_object setVariable ["ObjectID", _objectID, true];
	_object setVariable ["ObjectUID", _objectID, true];
	
	if (DZMSEpoch) then {
		//PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];
	} else {
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
	};
	
	waitUntil {(!isNull _object)};
	
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	
	_ranFuel = random 1;
	if (_ranFuel < .1) then {_ranFuel = .1;};
	_object setFuel _ranFuel;
	_object setvelocity [0,0,1];
	_object setDir (round(random 360));

	true
};

//Prevents an object being cleaned up by the server anti-hack
DZMSProtectObj = {
	private ["_object","_objectID"];
	_object = _this select 0;
	
	_objectID = str(round(random 999999));
	_object setVariable ["ObjectID", _objectID, true];
	_object setVariable ["ObjectUID", _objectID, true];
	
	if (_object isKindOf "ReammoBox") then {
		// PermaLoot on top of ObjID because that "arma logic"
		_object setVariable ["permaLoot",true];
	};

	if (DZMSEpoch) then {
		//PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];
	} else {
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
	};
    if (!((typeOf _object) in ["USVehicleBox","USLaunchersBox","AmmoBoxSmall_556","AmmoBoxSmall_762","MedBox0","USBasicWeaponsBox","USBasicAmmunitionBox","RULaunchersBox"]) || DZMSSceneryDespawnLoot) then {
        _object setVariable["DZMSCleanup",true];
    };
	true
};

//Gets the weapon and magazine based on skill level
DZMSGetWeapon = {
	private ["_skill","_aiweapon","_weapon","_magazine","_fin"];
	
	_skill = _this select 0;
	
	//diag_log text format ["[DZMS]: AI Skill Func:%1",_skill];
	
	switch (_skill) do {
		case 0: {_aiweapon = DZMSWeps1;};
		case 1: {_aiweapon = DZMSWeps2;};
		case 2: {_aiweapon = DZMSWeps3;};
	};
	_weapon = _aiweapon call BIS_fnc_selectRandom;
	_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
	
	_fin = [_weapon,_magazine];
	
	_fin
};

//function to wait for mission completion
DZMSWaitMissionComp = {
    private["_objective","_unitArrayName","_numSpawned","_numKillReq"];
    _objective = _this select 0;
    _unitArrayName = _this select 1;
    call compile format["_numSpawned = count %1;",_unitArrayName];
    _numKillReq = ceil(DZMSRequiredKillPercent * _numSpawned);
    diag_log text format["[DZMS]: (%3) waiting for %1/%2 units or less to be alive and a player to be near objective.",(_numSpawned - _numKillReq),_numSpawned,_unitArrayName];
    call compile format["waitUntil{sleep 1; ({isPlayer _x && _x distance _objective <= 30} count playableUnits > 0);};"];
    if (DZMSSceneryDespawnTimer > 0) then {_objective spawn DZMSCleanupThread;};
};

//sleep function that uses diag_tickTime for accuracy
DZMSSleep = {
    private["_sleepTime","_checkInterval","_startTime"];
    _sleepTime = _this select 0;
    _checkInterval = _this select 1;
    _startTime = diag_tickTime;
    waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};

//function to purge objects
DZMSPurgeObject = {
    _this enableSimulation false;
    _this removeAllMPEventHandlers "mpkilled";
    _this removeAllMPEventHandlers "mphit";
    _this removeAllMPEventHandlers "mprespawn";
    _this removeAllEventHandlers "FiredNear";
    _this removeAllEventHandlers "HandleDamage";
    _this removeAllEventHandlers "Killed";
    _this removeAllEventHandlers "Fired";
    _this removeAllEventHandlers "GetOut";
    _this removeAllEventHandlers "GetIn";
    _this removeAllEventHandlers "Local";
    clearVehicleInit _this;
    deleteVehicle _this;
    deleteGroup (group _this);
    _this = nil;
};

//function to clean up mission objects
DZMSCleanupThread = {
    //sleep for the despawn timer length
    [DZMSSceneryDespawnTimer,20] call DZMSSleep;
    //delete flagged nearby objects
    {
        if (_x getVariable ["DZMSCleanup",false]) then {
            _x call DZMSPurgeObject;
        };
    } forEach (_this nearObjects 50);
};

//------------------------------------------------------------------//
diag_log text format ["[DZMS]: Mission Functions Script Loaded!"];
