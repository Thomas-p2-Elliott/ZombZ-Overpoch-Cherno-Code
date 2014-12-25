/*---------------------------------------------------------------------------
Headless Zed Hordes by Player2

	Major Waypoints
	Respawns all zombies at each major waypoint
	Delete all zombies not at major waypoint

	Minor Waypoints
	the path the zombies take between major waypoints
---------------------------------------------------------------------------*/
//Make sure this is running on a headless client (not required but wise)
if ((isDedicated && !hasInterface || isServer)) 	exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the server!"); };
if ((hasInterface && !isDedicated)) 				exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the client!"); };
if (!(!hasInterface && !isDedicated && !isServer)) 	exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client!"); };
diag_log(format["P2HC:HordeZedSpawns: Initializing: %1",__FILE__]); //log output (can be deleted)
//Load In Functions (Required)
P2DZ_HC_zedHordeFunctionsDone = false;
[] execVM "zombzHC\addonszeds\hordes\functions.sqf";
//	Make sure functions doesn't time out loading in due to bad syntax
private["_s","_e"]; _s = 0; _e = false;
waitUntil{	uiSleep 1; _s = _s + 1;	if (_s > 120) then {		_e = true;		P2DZ_HC_zedHordeFunctionsDone = true;	}; 	P2DZ_HC_zedHordeFunctionsDone};
if (_e) exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: Functions file could not be loaded!"); diag_log(format["File: %1, Line: %2",__FILE__,__LINE__]);  };
//	Make sure config doesn't time out loading in due to bad syntax in settings file
P2DZ_HC_zedHordeConfigDone = false;
[] execVM "zombzHC\addonszeds\hordes\_config.sqf";
private["_s2","_e2"]; _s2 = 0; _e2 = false;
waitUntil{	uiSleep 1; _s2 = _s2 + 1;	if (_s2 > 120) then {		_e2 = true;		P2DZ_HC_zedHordeConfigDone = true;	}; 	P2DZ_HC_zedHordeConfigDone};
if (_e2) exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: Config file could not be loaded!"); diag_log(format["File: %1, Line: %2",__FILE__,__LINE__]);  };