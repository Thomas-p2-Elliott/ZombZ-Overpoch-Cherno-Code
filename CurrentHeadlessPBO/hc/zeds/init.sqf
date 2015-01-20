/*---------------------------------------------------------------------------
Extra Zeds (Headless Client) by Player2

	Initialization / StartUp File
---------------------------------------------------------------------------*/

//Code to make sure this is running on a headless client
if ((isDedicated && !hasInterface || isServer)) 	exitWith {	diag_log("P2HC:ZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the server!"); };
if ((hasInterface && !isDedicated)) 				exitWith {	diag_log("P2HC:ZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the client!"); };
if (!(!hasInterface && !isDedicated && !isServer)) 	exitWith {	diag_log("P2HC:ZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client!"); };

diag_log(format["P2HC:ZedSpawns: Initializing: %1",__FILE__]); //log output (can be deleted)

//	Load in Configuration
P2DZ_HC_extraZedsconfigDone = false;
[] execVM ("" + (P2HC_Path) + "zeds\player2_extraZeds_config.sqf");

//	Make sure config doesn't time out loading in due to bad syntax in settings file
private["_s","_e"]; _s = 0; _e = false;
waitUntil{	uiSleep 1; _s = _s + 1;	if (_s > 120) then {		_e = true;		P2DZ_HC_extraZedsconfigDone = true;	}; 	P2DZ_HC_extraZedsconfigDone};
if (_e) exitWith {	diag_log("2HC:ZedSpawns: FATAL ERROR: Config file could not be loaded!"); diag_log(format["File: %1, Line: %2",__FILE__,__LINE__]);  };
P2DZ_HC_extraZeds_Done = true;	//used by horde system
diag_log(format["P2HC:ZedSpawns: player2_extraZeds_config.sqf Finished"]); //log output (can be deleted)

//	Variable Initialization
private ["_zc", "_mn", "_cgzA", "_rd", "_mz", "_slp", "_ms", "_mgz", "_cgz", "_d"];
P2DZ_HC_currentGlobalZeds = 0;
_zc = 	0;
_mn = 	[];
_cgzA = [];
_pos = 	[];
_rd = 	P2DZ_HC_playerZedRadius;
_mz = 	P2DZ_HC_maxZedsPerPlayer;
_slp = 	P2DZ_HC_zedRespawnTime;
_ms = 	P2DZ_HC_playerSpeedCap;
_mgz =	P2DZ_HC_globalMaxZeds;
_cgz =	0;
_d = 	P2DZ_HC_ExtraZedsDebug;

//	Debugging output
if (_d) then {
	diag_log(format["P2HC:ZedSpawns: Initializing..."]);
	diag_log(format["P2HC:ZedSpawns: "]);
	diag_log(format["P2HC:ZedSpawns: Configuration: "]);
	diag_log(format["P2HC:ZedSpawns: "]);
	diag_log(format["P2HC:ZedSpawns: ZedCheckRadius:	%1",P2DZ_HC_playerZedRadius]);
	diag_log(format["P2HC:ZedSpawns: MaxPerPlayer:		%1",P2DZ_HC_maxZedsPerPlayer]);
	diag_log(format["P2HC:ZedSpawns: RespawnTimer:		%1",P2DZ_HC_zedRespawnTime]);
	diag_log(format["P2HC:ZedSpawns: MaxSpeed:  		%1",P2DZ_HC_playerSpeedCap]);
	diag_log(format["P2HC:ZedSpawns: "]);
};

if (_d) then { diag_log(format["P2HC:ZedSpawns: Waiting for BIS Functions..."]); };

waitUntil {!isNil "BIS_fnc_init"}; //Wait for BIS Functions to load (script uses bis_fnc_findSafePos && bis_fnc_selectRandom)

if (_d) then { diag_log(format["P2HC:ZedSpawns: Finished Waiting for BIS Functions..."]); };

if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop Starting..."]); };

/* Main Loop */
while {true} do {
	if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop has Awoken from its sleep..."]); };
	
	_cgz = 	 0; //reset global zed count
	_cgzA = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 								//Count All Men in radius
	{ if (_x isKindof "zZombie_Base" && alive _x) then { _cgz = _cgz + 1;	}; } foreach _cgzA; 	//Add 1 to zed count for each zed found in array
	P2DZ_HC_currentGlobalZeds = _cgz; //update global zed count

	//for each Player on Server
	{
		_zc =	 0; //reset zed count
		_mn = 	[];	//reset nearby array
		_pos = 	[];	//reset player pos

		if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop: PlayerObj: %1, Alive: %2, Speed: %3, InDebug?: %4", (typeOf _x), (alive _x), (speed _x), !((getMarkerPos 'respawn_west') distance (position _x) > 3000)]); };
		
		//Check player not the headless client, is alive and not survivor1 player model
		if ((_x != player) && (_x != (vehicle player)) && (alive _x) && ((typeOf _x) != "Survivor1_DZ")) then {
			//Check players speed
			if (_ms > speed _x) then {
				//Check player is not in debug
				if ((getMarkerPos 'respawn_west') distance (position _x) > 3000) then {
					_mn = (position _x) nearEntities ["CAManBase",_rd]; 									//Count All Men in radius
					{ if (_x isKindof "zZombie_Base" && alive _x) then { _zc = _zc + 1;	}; } foreach _mn; 	//Add 1 to zed count for each zed found in array
					if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop: PlayerPos: %1, ZedsNear: %2, CurrentZeds/Max: (%4/%5) SpawnMoreZed?: %3", (position _x), (_zc), ((_mz > _zc && P2DZ_HC_globalMaxZeds > _cgz)),_cgz,P2DZ_HC_globalMaxZeds]); };
					//Check zed count is less than max zed count && current global zeds less than max global zeds
					if (_mz > _zc && P2DZ_HC_globalMaxZeds > _cgz) then {
						if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop: Spawning Zeds..."]); };
						[_x,_zc,_mz] call player2_spawnZedsHC; //Spawn Zeds
					};
				};
			};
		};
	} count playableUnits;

	if (_d) then { diag_log(format["P2HC:ZedSpawns: Loop Sleeping for %1 seconds",_slp]); };

	uiSleep _slp; //Sleep for zed respawn time
};

diag_log(format["P2HC:ZedSpawns: FATAL ERROR: While {true} Loop Ended!"]);

/*---------------------------------------------------------------------------
www.ZombZ.net - Player2
---------------------------------------------------------------------------*/