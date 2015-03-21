diag_log ("[P2_RE] Inside InitExecute...");

//news refresh loop
//[] execvm "\z\addons\dayz_server\p2re\menu\getNews.sqf";

//for server too according to alienx
stream_locationCheck = {};

diag_log ("[P2_RE] Adding Rcode Stuff...");

fnc_p2_RemoteExecute = {
	private ["_rCode","_agent","_rCodeDesc"];
	_rCodeDesc = _this select 0;
	_rCode = _this select 1;
	if ( isNil "p2_rexec_xpos" ) then { p2_rexec_xpos = 430; };
	p2_rexec_xpos = p2_rexec_xpos + 5;
	_pos = [p2_rexec_xpos,392,0];
	diag_log ( format [ "[P2_RE] Executing '%1' code upon player spawn with Gary the sheep at %2", _rCodeDesc, _pos ] );
	_agent = createVehicle ["GraveCross2_EP1", _pos, [], 0, "FORM"];
	_agent setPos _pos;
	_agent allowdamage false;
	_agent disableAI "MOVE";
	_agent disableAI "ANIM";
	_agent disableAI "FSM";
	_agent disableAI "TARGET";
	_agent disableAI "AUTOTARGET";
	//modified with hasinterface so this code wont run on headless client
	_agent setVehicleInit ("if (!isServer && hasInterface) then {[] spawn "+(str _rCode)+"; diag_log format [""[P2RE "+(_rCodeDesc)+", Time: %1"",diag_tickTime];};");
	[_agent, _rCode, _rCodeDesc] spawn {
		private ["_agent", "_rCode", "_rCodeDesc"];
		_agent = _this select 0;
		_rCode = _this select 1;
		_rCodeDesc = _this select 2;
		diag_log ( format [ "[P2_REXEC] Monitoring Agent '%1' (%2) - Time: %3", _agent, _rCodeDesc, diag_tickTime ] );
		waitUntil {isNull _agent;};
		_agent call {
		    _this setVariable [
		        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
		        "hash_id" callExtension format [
		            "%1:%2",
		            netId _this,
		            typeOf _this
		        ]
		    ];
		};	
		diag_log ( format [ "[P2_REXEC] Monitor: Agent %1 has become null - Time: %2", _rCodeDesc, diag_ticktime ] );
		systemChat ( format [ "[P2_REXEC] Monitor: Agent %1 has become null - Time: %2", _rCodeDesc, diag_ticktime ] );
	};
	processInitCommands;
};


fnc_p2_RemoteExecute2 = {
	private ["_rCode","_agent","_rCodeDesc"];
	_rCodeDesc = _this select 0;
	_rCode = _this select 1;
	if ( isNil "p2_rexec_xpos" ) then { p2_rexec_xpos = 430; };
	p2_rexec_xpos = p2_rexec_xpos + 5;
	_pos = [p2_rexec_xpos,392,0];
	diag_log ( format [ "[P2_RE] Executing '%1' code upon player spawn with Gary the sheep at %2", _rCodeDesc, _pos ] );
	_agent = createVehicle ["GraveCross2_EP1", _pos, [], 0, "FORM"];
	_agent setPos _pos;
	_agent allowdamage false;
	_agent disableAI "MOVE";
	_agent disableAI "ANIM";
	_agent disableAI "FSM";
	_agent disableAI "TARGET";
	_agent disableAI "AUTOTARGET";
	//modified with hasinterface so this code will ONLY run on headless client
	_agent setVehicleInit ("if (!isServer && !hasInterface) then {[] spawn "+(str _rCode)+"; diag_log format [""[P2RE "+(_rCodeDesc)+", Time: %1"",diag_tickTime];};");
	[_agent, _rCode, _rCodeDesc] spawn {
		private ["_agent", "_rCode", "_rCodeDesc"];
		_agent = _this select 0;
		_rCode = _this select 1;
		_rCodeDesc = _this select 2;
		diag_log ( format [ "[P2_REXEC] Monitoring Agent '%1' (%2) - Time: %3", _agent, _rCodeDesc, diag_tickTime ] );
		waitUntil {isNull _agent;};
		_agent call {
		    _this setVariable [
		        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
		        "hash_id" callExtension format [
		            "%1:%2",
		            netId _this,
		            typeOf _this
		        ]
		    ];
		};	
		diag_log ( format [ "[P2_REXEC] Monitor: Agent %1 has become null - Time: %2", _rCodeDesc, diag_ticktime ] );
		systemChat ( format [ "[P2_REXEC] Monitor: Agent %1 has become null - Time: %2", _rCodeDesc, diag_ticktime ] );
	};
	processInitCommands;
};


/*---------------------------------------------------------------------------
Remotely Executed Scripts:
---------------------------------------------------------------------------*/
//[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\mk.sqf";
//[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\menu\retrieveNews.sqf";	old
//[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\menu\execute_re.sqf"; old
//[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\gorsylobby.sqf"; needs update from gorsy
if (P2DZ_serverName == "Test") then {
	//remote / web execution for client/server 
	[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\rcode.sqf";
	[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\rcode_s.sqf";
	[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\rcode_hc.sqf";
};


call compile preprocessFileLineNumbers "compile\string_functions.sqf";							//Compile extra string functions

call {
	/*===========================================================================
	AntiHack PublicVar for server
	---------------------------------------------------------------------------*/
	if (isDedicated && !hasInterface || isServer) exitWith {
		private ["_humanLog","_dbLog","_currentTime","_day","_hour","_mins","_secs"];
		"P2DZ_fire" addPublicVariableEventHandler {
			_x = _this select 1;
			if (typeName _x == typeName []) then {
					
					_currentTime = "real_date" callExtension "+";
					_currentTime = call compile _currentTime;
					_day = 			_currentTime select 2;
					_hour = 		_currentTime select 3;
					_mins = 		_currentTime select 4;
					_secs = 		_currentTime select 5;
					_humanLog = format["NAME:	(%1)	UID:	(%2)	DETECTION TYPE:	(%3)	DETECTION DETAIL:	(%4)",_x select 0, _x select 1, _x select 2, _x select 3];
					_humanLog = format["%1/%2:%3:%4:	%5", _day,_hour,_mins,_secs, _humanLog];

					_dbLog = 	format["%1(_GLS_)%2(_GLS_)%3(_GLS_)%4", _x select 1, _x select 2, _x select 3, GORSYSERVERNUMBER];

					_dbLog call stats_hackers;
					_humanLog call stats_hackers_human;
			};
		};
	};
};


//Trade security number
p2tn = 4243;
/* Files that use p2tn: 
Server:
	publishVehicle2
Client:
	trade_any_bicycle/boat/vehicle/vehicle_free
*/

//Delete security number
p2dn = 1303;
/* Files that use p2dn: 
Server:
	deleteObj
Client:
	trade_any_bicycle/boat/vehicle/vehicle_free
	remove
	plot_take_ownership
	player_packTent
	player_packVault
*/

//Pulish security number
p2pn  = 3213;
/* Files that use p2pn: 
Server:
	publishFullObject
	publishObject
	swapObject
	publishVehicle3
Client:
	player_build
	player_build_publish
	player_buildingDowngrade
	player_upgrade
	player_upgradeVehicle
	plot_take_ownership
	tent_pitch
	vault_pitch
*/

/*-------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Encrypted Script Execution

Uses publicVariable, gets broadcast to client prior to init.sqf is run
Use isNil to avoid over-writing. Client runs function from _clientConfig.sqf
---------------------------------------------------------------------------*/
//Send to players
private["_rExec"];
_rExec = compile ("
	diag_log(format['%1: %2: %3',diag_tickTime,'P2DEBUG','preInit']);
	if (isNil 'P2DZ_postVars') then { P2DZ_postVars = false; };
	if (isNil 'P2DZ_postVarsDone') then { P2DZ_postVarsDone = false; };
	if (isNil 'P2DZ_postCompiles') then { P2DZ_postCompiles = false; };
	if (isNil 'P2DZ_postCompilesDone') then { P2DZ_postCompilesDone = false; };
	call compile preprocessFileLineNumbers ""compile\string_functions.sqf"";
	
	[(str [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""]),
	(str [""e"", ""x"", ""v"", ""m"", ""s"", ""p"", ""a"", ""w"", ""n"", ""c""]),
	""- 19""] call compile preprocessFileLineNumbers ""_encrypted\init_encrypted.sqf"";

	p2pn = 3213; p2tn = 4243; p2dn = 1303;
");

["P2DZ_logBuilder",_rExec] call fnc_p2_RemoteExecute;


