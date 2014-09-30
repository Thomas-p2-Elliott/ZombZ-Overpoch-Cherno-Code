diag_log ("[P2_RE] Inside InitExecute...");
//news refresh loop
//[] execvm "\z\addons\dayz_server\p2re\menu\getNews.sqf";

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

//for server too according to alienx
stream_locationCheck = {};

//These will be executed client-side via P2_REXEC
//scripts
[] execvm "\z\addons\dayz_server\p2re\scripts\e.sqf";			//water mark
//[] execvm "\z\addons\dayz_server\p2re\scripts\anti_side.sqf"; 	//anti-side/group chat
//[] execvm "\z\addons\dayz_server\p2re\scripts\bi.sqf";			//box inventory
[] execvm "\z\addons\dayz_server\p2re\scripts\mk.sqf";			//map markers
//[] execvm "\z\addons\dayz_server\p2re\scripts\nf.sqf";			//no fog
//[] execvm "\z\addons\dayz_server\p2re\scripts\nt.sqf";			//nametags
//[] execvm "\z\addons\dayz_server\p2re\scripts\eventHandlers.sqf"; 	//event handlers (death messages and mission hint messages)

//remote / web execution for client/server 
[] execvm "\z\addons\dayz_server\p2re\scripts\rcode.sqf";
[] execvm "\z\addons\dayz_server\p2re\scripts\rcode_s.sqf";
//[] execvm "\z\addons\dayz_server\p2re\scripts\rcode_hc.sqf";

/*
//donator
[] execvm "\z\addons\dayz_server\p2re\scripts\ra.sqf";			//repair station
[] execvm "\z\addons\dayz_server\p2re\loadouts\setup.sqf";		//loadouts
*/
//menu system
[] execvm "\z\addons\dayz_server\p2re\menu\retrieveNews.sqf";
[] execvm "\z\addons\dayz_server\p2re\menu\execute_re.sqf";
[] execvm "\z\addons\dayz_server\p2re\menu\showText_re.sqf";

[] execvm "\z\addons\dayz_server\p2re\scripts\gorsylobby.sqf";	


/*---------------------------------------------------------------------------
Encryption Key
---------------------------------------------------------------------------*/
CRYPT_KEY = "eN8g8Dzu4977w5w";
private [ "_rExec" ];
_rExec = compile ("
CRYPT_KEY = ""eN8g8Dzu4977w5w"";
");

["ZombZKey",_rExec] call fnc_p2_RemoteExecute;