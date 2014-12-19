/*---------------------------------------------------------------------------
		Player2's AI System
---------------------------------------------------------------------------*/

//Code to add the eventHandler to the server
if ((isDedicated && !hasInterface || isServer)) 	exitWith {
	diag_log(format["[P2AI]: Compiling: %1","P2HC_spawnMission"]); //log output (can be deleted)
	P2HC_spawnMission = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\p2hc_spawnMission.sqf";

	diag_log(format["[P2AI]: Adding PublicVariableEventHandler: %1","P2HC_mRq"]); //log output (can be deleted)

  	"P2HC_mRq" addPublicVariableEventHandler {
  		diag_log("P2HC_mRq Fired");
		(_this select 1) spawn P2HC_spawnMission;
	};
};

//Code to make sure the rest of this is running on a headless client
if ((isDedicated && !hasInterface || isServer)) 	exitWith {	diag_log("[P2AI]: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the server!"); };
if ((hasInterface && !isDedicated)) 				exitWith {	diag_log("[P2AI]: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client! Not the client!"); };
if (!(!hasInterface && !isDedicated && !isServer)) 	exitWith {	diag_log("[P2AI]: FATAL ERROR: " + __FILE__ + " needs to be run from a headless client!"); };

diag_log(format["[P2AI]: Initializing: %1",__FILE__]); //log output (can be deleted)

//wait for bis functions to load
waitUntil {!isNil "BIS_fnc_init"};
waitUntil {!isNil "BIS_fnc_findSafePos"};

/*---------------------------------------------------------------------------
File & Debugging Configuration
---------------------------------------------------------------------------*/

P2AI_FileLocation = "HC\P2AI";	//disclude last slash

P2AI_debugEvents = 	true;
P2AI_debugStatic = 	false;
P2AI_debugAI = 		false;
P2AI_debug = 		true;

/*---------------------------------------------------------------------------
Debugging Log Output
---------------------------------------------------------------------------*/
private["_f","_d"]; 
_f = "init"; 
_d = (P2AI_debug or P2AI_debugEvents or P2AI_debugStatic or P2AI_debugAI);
if (_d) then {
	diag_log(format["[P2AI]:%1: Debugging Enabled:", _f]); 
	diag_log(format["[P2AI]:%1: P2AI_debug: %2", _f, 		P2AI_debug]); 
	diag_log(format["[P2AI]:%1: P2AI_debugEvents: %2", _f, 	P2AI_debugEvents]); 
	diag_log(format["[P2AI]:%1: P2AI_debugStatic: %2", _f, 	P2AI_debugStatic]); 
	diag_log(format["[P2AI]:%1: P2AI_debugAI: %2", _f, 		P2AI_debugAI]); 
};

/*---------------------------------------------------------------------------
Load Config Files
---------------------------------------------------------------------------*/

P2AI_configLoaded = false;
[] spawn {
	if (_d) then { diag_log(format["[P2AI]:%1: Loading Configs From: %2\_config\", _f, P2AI_FileLocation]); };
	call compile preprocessFileLineNumbers format["%1\_config\Events_Config.sqf",P2AI_FileLocation];
	call compile preprocessFileLineNumbers format["%1\_config\Loot_Config.sqf",P2AI_FileLocation];
	call compile preprocessFileLineNumbers format["%1\_config\AI_Config.sqf",P2AI_FileLocation];
	call compile preprocessFileLineNumbers format["%1\_config\Castle_Config.sqf",P2AI_FileLocation];
	P2AI_configLoaded = true;
};

P2AI_configError = false;
[] spawn {
	sleep 45;
	if (!P2AI_configLoaded) then {
		P2AI_configError = true;
		P2AI_configLoaded = true;
	};
};

waitUntil {P2AI_configLoaded};
if (P2AI_configError) exitWith {diag_log(format["[P2AI]: FATAL ERROR: Configuration Failed to Load"]); };
if (_d) then { diag_log(format["[P2AI]:%1: Configs Loaded: %2 Error?: %3", _f, P2AI_configLoaded, P2AI_configError]); };

/*---------------------------------------------------------------------------
Delay Startup
---------------------------------------------------------------------------*/

// Lets let the players login run first
if (!isnil("P2AI_startWait")) then {
	if (_d) then { diag_log(format["[P2AI]:%1: Delayed-Startup Enabled - Starting P2AI In: %2", _f, P2AI_startWait]); };
	uiSleep P2AI_startWait;
} else {
if (_d) then { diag_log(format["[P2AI]:%1: Delayed Startup Not Configured - Starting P2AI In: %2", _f, 120]); };
	uiSleep 120;
};

// Global for other scripts to check if P2AI is installed.
P2AIInstalled = true;

/*---------------------------------------------------------------------------
Load Functions
---------------------------------------------------------------------------*/
if (_d) then { diag_log(format["[P2AI]:%1: Loading P2AI Functions", _f]); };

//custom functions
call compile preprocessFileLineNumbers format["%1\functions\p2ai_functions.sqf",P2AI_FileLocation];

//standard dayz functions
if (isNil 'fnc_inAngleSector') then {
	fnc_inAngleSector =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inAngleSector.sqf";
};

if (isNil 'dayz_losCheck') then {
	dayz_losCheck = {
		private ["_target","_agent","_cantSee","_tPos","_zPos"];
		_cantSee = true;
		_target = _this select 0;
		_agent = _this select 1;

		if (isNil '_target' || isNil '_agent') exitWith {
			diag_log("dayz_losCheck:HC:Warning: agent or target was nil");
			_cantSee
		};

		if (isNull _target || isNull _agent) exitWith {
			diag_log("dayz_losCheck:HC:Warning: agent or target was null");
			_cantSee
		};

		if (!(alive _target) || !(alive _agent)) exitWith {
			diag_log("dayz_losCheck:HC:Warning: agent or target was dead");
			_cantSee
		};

		_tPos = visiblePositionASL _target;		_zPos = visiblePositionASL _agent;
		_tPos set [2,(_tPos select 2)+1];		_zPos set [2,(_zPos select 2)+1];
		if ((count _tPos > 0) && (count _zPos > 0)) then { _cantSee = terrainIntersectASL [_tPos, _zPos];	if (!_cantSee) then {	_cantSee = lineIntersects [_tPos, _zPos, _agent, vehicle _target]; };};
		if (isNil '_cantSee') then { _cantSee = true; diag_log("dayz_losCheck:HC:Warning: cantSee was nil"); };
		_cantSee
	};
};


if (_d) then { diag_log(format["[P2AI]:%1: Functions Loaded", _f]); };

/*---------------------------------------------------------------------------
Launch Loops
---------------------------------------------------------------------------*/

if (_d) then { diag_log(format["[P2AI]:%1: Spawning Loops", _f]); };
[] spawn compile preprocessFileLineNumbers format["%1\functions\p2ai_eventLoops.sqf",P2AI_FileLocation];
if (_d) then { diag_log(format["[P2AI]:%1: Loops Started", _f]); };

/*---------------------------------------------------------------------------
DevilsCastle Mission
---------------------------------------------------------------------------*/
if (P2AI_Devils_Enabled) then {
	if (_d) then { diag_log(format["[P2AI]:%1: Starting Devils Castle Mission, P2AI_debugStatic?: %2", _f, P2AI_debugStatic]); };
	[] spawn compile preprocessFileLineNumbers format["%1\events\castle\p2ai_devilsCastle.sqf",P2AI_FileLocation];
	if (_d) then { diag_log(format["[P2AI]:%1: Devils Castle Mission Started", _f]); };
};

if (_d) then { diag_log(format["[P2AI]:%1: Finished", _f]); };