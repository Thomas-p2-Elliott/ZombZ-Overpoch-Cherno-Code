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
[] execVM "HC\zeds\hordes\functions.sqf";
//	Make sure config doesn't time out loading in due to bad syntax in settings file
private["_s","_e"]; _s = 0; _e = false;
waitUntil{	uiSleep 1; _s = _s + 1;	if (_s > 10) then {		_e = true;		P2DZ_HC_zedHordeFunctionsDone = true;	}; 	P2DZ_HC_zedHordeFunctionsDone};
if (_e) exitWith {	diag_log("P2HC:HordeZedSpawns: FATAL ERROR: Functions file could not be loaded!"); };

/*---------------------------------------------------------------------------
	Configuration
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_HordeCount = 			2;						//Amount of hordes
P2DZ_HC_ZHorde_ZombiesPerHorde = 		20;						//Amount of zombies per horde
P2DZ_HC_ZHorde_TriggerWaypointNames = 	["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_TriggerWayp_%VarName%)
P2DZ_HC_ZHorde_PathWaypointNames = 		["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_PathWayp_%VarName%)
P2DZ_HC_hordeZedSpeed =					10;						//Speed of zeds in horde (ONLY USE 2 or 10, 2 = the walking dead, 10 = 28 days later)
P2DZ_HC_zHorde_waypointLoop_sleepTime = 1;						//Performance setting (seconds for each zed to check if it should update waypoint)
P2DZ_HC_HordeZedsDebug	= 				true;								//Debug Zombie Horde Script
P2DZ_HC_debugHordeZedFSM = 				false;								//Debug Zombie Horde FSM / AntiStuck Loop

/*
	Waypoint Configuration 
	Path Waypoints = Where zeds should walk
	Trigger waypoints = Where zeds will trigger a zombie respawn to rebuild the horde and delete any zeds that have wandered too farfrom the horde
*/

/* Horde 1 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde1 = 	[
											[4477.61,10549.7,0]
										];
P2DZ_HC_ZHorde_PathWayp_Horde1 = 		[
											[4276.66,10906.6,0],
											[4477.61,10549.7,0],
											[4711.19,10136.9,0]
										];
/* Horde 2 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde2 = 	[
											[4477.61,10549.7,0]
										];
P2DZ_HC_ZHorde_PathWayp_Horde2 = 		[
											[4276.66,10906.6,0],
											[4477.61,10549.7,0],
											[4711.19,10136.9,0]
										];
/* Release The hordes here */
[1,"z_priest"] 		call P2DZ_HC_ZHorde_spawnHorde;
[2,"z_doctor"] 	call P2DZ_HC_ZHorde_spawnHorde;

/*---------------------------------------------------------------------------
End of Typical-User Configuration
---------------------------------------------------------------------------*/