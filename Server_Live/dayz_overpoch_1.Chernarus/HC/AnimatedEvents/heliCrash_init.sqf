/*---------------------------------------------------------------------------
Headless Client Animated Heli CrashSites
    
Description: 
    A re-write to utilize headless client for the AI flying machines!

Author: 
    Player2 (www.ZombZ.net)
Previous Version Authors:
    BushWookie / Grafzahl / Finest
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Configuration
---------------------------------------------------------------------------*/
P2DZ_heliCrashSites_guaranteedLoot =           6;       //Garantueed loot pile amount
P2DZ_heliCrashSites_randomizedLoot =           3;       //Randomized loot pile amount
P2DZ_heliCrashSites_spawnFire =             true;       //HeliCrash Smoke?
P2DZ_heliCrashSites_fadeFire =             false;       //Fade smoke over time?
dayz_MapArea =                             11000;       //Size of map
HeliCrashArea =                 dayz_MapArea / 2;       //Size of heli crashsite area (5km for Chernarus)
P2DZ_heliCrashSites_frequency =         (30 * 60);      //How often they should be given a chance to spawn in secs, eg 60sec for 1 every 1min
P2DZ_heliCrashSites_variance =          (10 * 60);      //How much randomized time to +/- the frequency time by for each spawn chance in secs
P2DZ_heliCrashSites_spawnChance =       1;              //Chance between 0-1 of crashsite spawning when it gets a chance to
P2DZ_heliCrashSites_spawnMarker =       'center';       //Center point of spawn radius
P2DZ_heliCrashSites_spawnRadius =       HeliCrashArea;  //Size of radius where they can spawn
P2DZ_HC_heliCrash_preWaypoints =        1;              //Amount of waypoints the heli flys to before crashing
P2DZ_HC_crashDamage    =                0.2;            //Amount of dammage the heli can take before crashing (between 0.1 and 1) Lower the number and the heli can take less damage before crashing 1 dammage is fully destroyed and 0.1 something like a DMR could one shot the heli
P2DZ_HC_exploRange    =                 250;            //How far away from the predefined crash point should the heli start crashing
P2DZ_HC_heliModel     =                 "UH1Y_DZE";     //flying model used
P2DZ_HC_crashModel    =                 "UH1Y_DZE";     //The type of Crash model used after the heli crashes

//Locations the Helis will Spawn before flying into map
P2DZ_HC_SpawnLocs = [
    [6986,-630,1000],
    [10450,-630,1000],
    [12172.1,-542.353,1000],
    [15945.8,3796.43,1000],
    [16788.4,6620.02,1000],
    [17333.4,8790.39,1000],
    [17803.7,11465.5,1000]
];

//Enable debugging outputs?
P2DZ_HC_debugCrashes =                  true;

P2DZ_HC_debugCrashOutput = {
    if (P2DZ_HC_debugCrashes) then { diag_log(format["P2HC:HeliCrash: %1",_this]); };
};


/* Is Server */
if (isDedicated && !hasInterface || isServer) exitWith {

    /* Run Heli Crash at this Pos with these Loot Settings */
    "P2HC_rqCrash" addPublicVariableEventHandler {
        _dir = (_this select 1) select 1;
        if (isNil '_dir') exitWith { ("P2HC_rqCrash Error 0-0") call P2DZ_HC_debugCrashOutput; };
        _pos = (_this select 1) select 0;
        if (isNil '_pos') exitWith { ("P2HC_rqCrash Error 1-0") call P2DZ_HC_debugCrashOutput; };
        if (typeName _pos != typeName []) exitWith { ("P2HC_rqCrash Error 1-1") call P2DZ_HC_debugCrashOutput; };
        if ((count _pos) < 3) exitWith { ("P2HC_rqCrash Error 1-2") call P2DZ_HC_debugCrashOutput; };
        if (((_pos select 0) == 0) && ((_pos select 1) == 0)) exitWith { ("P2HC_rqCrash Error 1-3") call P2DZ_HC_debugCrashOutput; };
        ("P2HC_rqCrash: Valid Input: " + str (_this select 1)) call P2DZ_HC_debugCrashOutput;
        _nul =  [P2DZ_heliCrashSites_guaranteedLoot,
                P2DZ_heliCrashSites_randomizedLoot,
                _this select 1,
                P2DZ_heliCrashSites_spawnFire,
                P2DZ_heliCrashSites_fadeFire] spawn server_spawnCrashSite;
    };

};

/* Is Headless */
if (!hasInterface && !isDedicated && !isServer) then {

    P2HC_heliCrashSpawnLoop = {
        private["_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_position"];
        _frequency      = _this select 0;
        _variance       = _this select 1;
        _spawnChance    = _this select 2;
        _spawnMarker    = _this select 3;
        _spawnRadius    = _this select 4;
        ("CRASHSPAWNER: Starting headless Client spawn logic for Crash Spawner") call P2DZ_HC_debugCrashOutput;


        while {1 == 1} do {
            private["_timeAdjust","_timeToSpawn","_spawnRoll"];
            // Allows the variance to act as +/- from the spawn frequency timer
            _timeAdjust = round((random(_variance * 2)) - _variance);
            _timeToSpawn = time + _frequency + _timeAdjust;
            
            ((format["CRASHSPAWNER: %1%2 chance to spawn in %3 seconds", round(_spawnChance * 100), '%', _timeToSpawn])) call P2DZ_HC_debugCrashOutput;

            while {time < _timeToSpawn} do {
                uiSleep 5;
            };

            _spawnRoll = random 1;

            // Percentage roll
            if (_spawnRoll <= _spawnChance) then {
                (format["CRASHSPAWNER: Spawning Heli Crash"]) call P2DZ_HC_debugCrashOutput;
                _position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,1000,0] call BIS_fnc_findSafePos;
                [_position] spawn P2HC_spawnHeliCrash;
            };
        };
    };


    P2HC_requestCrashSpawn = {
        private["_pos","_dir"];
        _dir = _this select 1;
        if (isNil '_dir') exitWith { ("P2HC_requestCrashSpawn Error 0-0") call P2DZ_HC_debugCrashOutput; };
        _pos = _this select 0;
        if (isNil '_pos') exitWith { ("P2HC_requestCrashSpawn Error 1-0") call P2DZ_HC_debugCrashOutput; };
        if (typeName _pos != typeName []) exitWith { ("P2HC_requestCrashSpawn Error 1-1") call P2DZ_HC_debugCrashOutput; };
        if ((count _pos) < 3) exitWith { ("P2HC_requestCrashSpawn Error 1-2") call P2DZ_HC_debugCrashOutput; };
        ("P2HC_requestCrashSpawn: " + str [_pos,_dir]) call P2DZ_HC_debugCrashOutput;
        P2HC_rqCrash = [_pos,_dir];
        publicVariableServer "P2HC_rqCrash";
    };


    P2HC_spawnHeliCrash = {        
        private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos","_useStatic","_crashDamage","_lootRadius","_preWaypoints","_preWaypointPos","_endTime","_startTime","_safetyPoint","_heliStart","_deadBody","_exploRange","_heliModel","_lootPos","_list","_craters","_dummy","_wp2","_wp3","_landingzone","_aigroup","_wp","_helipilot","_crash","_crashwreck","_smokerand","_staticcoords","_pos","_dir","_position","_num","_config","_itemType","_itemChance","_weights","_index","_iArray","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire"];
        _preWaypoints    = P2DZ_HC_heliCrash_preWaypoints;  //Amount of waypoints the heli flys to before crashing
        _crashDamage    = P2DZ_HC_crashDamage;              //Amount of dammage the heli can take before crashing (between 0.1 and 1) Lower the number and the heli can take less damage before crashing 1 dammage is fully destroyed and 0.1 something like a DMR could one shot the heli
        _exploRange    = P2DZ_HC_exploRange;                //How far away from the predefined crash point should the heli start crashing
        _heliModel        = P2DZ_HC_heliModel;              //flying model used
        _crashModel    =    P2DZ_HC_crashModel;             //The type of Crash model used after the heli crashes
        _plane            = false;
        _spawnRadius = HeliCrashArea;
        _spawnMarker    = 'center';
        _safetyPoint = [0,16000,0];
        _heliStart = P2DZ_HC_SpawnLocs call BIS_fnc_selectRandom;
    
        _position = _this select 0;

        (format["CRASHSPAWNER: %1 started flying from %2 to %3 NOW!(TIME:%4)", _crashModel,  str(_heliStart), str(_position), round(time)]) call P2DZ_HC_debugCrashOutput;
        
        _startTime = time;
        _crashwreck = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];
        _crashwreck setCombatMode "BLUE";
        _crashwreck engineOn true;

        _crashwreck flyInHeight 200;
        _crashwreck forceSpeed 32; //115kmh
        _crashwreck setspeedmode "NORMAL";

        _landingzone = createVehicle ["HeliHEmpty", [_position select 0, _position select 1,0], [], 0, "CAN_COLLIDE"];
        _aigroup = creategroup civilian;
        _helipilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _crashwreck,[],0,"FORM"];
        _helipilot setCombatMode "BLUE";
        _helipilot moveindriver _crashwreck;
        _helipilot assignAsDriver _crashwreck;

        uiSleep 0.5;

        if(_preWaypoints > 0) then
        {
            for "_x" from 1 to _preWaypoints do
            {
                _preWaypointPos = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
                (format["%1: Waypoint Added: %2", _crashModel, str(_preWaypointPos)]) call P2DZ_HC_debugCrashOutput;
                _wp = _aigroup addWaypoint [_preWaypointPos, 0];
                _wp setWaypointType "MOVE";
                _wp setWaypointBehaviour "CARELESS";
            };
        };


        _wp2 = _aigroup addWaypoint [position _landingzone, 0];
        _wp2 setWaypointType "MOVE";
        _wp2 setWaypointBehaviour "CARELESS";
        _wp2 setWaypointStatements ["true", "_crashwreck setdamage 1;"];
        _wp3 = _aigroup addWaypoint [_safetyPoint, 0];
        _wp3 setWaypointType "CYCLE";
        _wp3 setWaypointBehaviour "CARELESS";
        
        waituntil {(_crashwreck distance _position) <= 1000 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};

        _crashwreck flyInHeight 100;
        _crashwreck forceSpeed 40; //145kmh
        _crashwreck setspeedmode "NORMAL";

        //Wait until Vehicle is In place or has been damaged enough to explode
        waituntil {(_crashwreck distance _position) <= _exploRange || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};

        _crashwreck setHit ["mala vrtule", 1];
        _ran15 = random 15;
        _crashwreck setVelocity [_ran15,_ran15,-25];
        _crashwreck setdamage .9;
        //Wait until Vehicle is 30m above ground 
        waitUntil{uiSleep 1; getpos _crashwreck select 2 <= 30};
        _helipilot setdamage 1;
        _crashwreck setVelocity [_ran15,_ran15,-20];
        //Wait until Vehicle has nearly hit the floor (10m)
        waitUntil{uiSleep 1; getpos _crashwreck select 2 <= 10};
        _crashwreck setdamage 1;
        //Wait until Vehicle has hit the floor (or near abouts)
        waitUntil{uiSleep 1; getpos _crashwreck select 2 <= 5};
        //diag_log(format["CRASHSPAWNER: %1 just exploded at %2!, ", _crashModel, str(getPosATL _crashwreck)]);
        _pos = [getpos _crashwreck select 0, getpos _crashwreck select 1,0];
        _dir = getdir _crashwreck;
        _endTime = time - _startTime;
        (format["CRASHSPAWNER: Crash completed! Wreck at: %2 - Runtime: %1 Seconds || Distance from calculated POC: %3 meters", round(_endTime), str(getPos _crashwreck), round(_position distance _crashwreck)]) call P2DZ_HC_debugCrashOutput;
        deletevehicle _crashwreck;
        deletevehicle _helipilot;
        deletevehicle _landingzone;
        [_pos,_dir] call P2HC_requestCrashSpawn;
    };

    (format["Starting HeliCrashLoop With These Settings: Frequency: %1, Variance: %2, SpawnChance: %3, CenterPoint: %4, Radius: %5", P2DZ_heliCrashSites_frequency,P2DZ_heliCrashSites_variance,P2DZ_heliCrashSites_spawnChance,P2DZ_heliCrashSites_spawnMarker,P2DZ_heliCrashSites_spawnRadius]) call P2DZ_HC_debugCrashOutput;
   
    [P2DZ_heliCrashSites_frequency,
    P2DZ_heliCrashSites_variance,
    P2DZ_heliCrashSites_spawnChance,
    P2DZ_heliCrashSites_spawnMarker,
    P2DZ_heliCrashSites_spawnRadius] spawn P2HC_heliCrashSpawnLoop;
};


