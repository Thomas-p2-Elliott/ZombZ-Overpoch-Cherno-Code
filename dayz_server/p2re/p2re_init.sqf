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

//remote / web execution for client/server 
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\rcode.sqf";
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\rcode_s.sqf";
//[] execvm "\z\addons\dayz_server\p2re\scripts\rcode_hc.sqf";

/*---------------------------------------------------------------------------
Remotely Executed Scripts:
---------------------------------------------------------------------------*/
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\mk.sqf";				//map markers
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\menu\retrieveNews.sqf";
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\menu\execute_re.sqf";
[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2re\scripts\gorsylobby.sqf";	
//[] execvm "\z\addons\dayz_server\p2re\scripts\eventHandlers.sqf"; 

/*---------------------------------------------------------------------------
Encrypted Script Execution
---------------------------------------------------------------------------*/
call compile preprocessFileLineNumbers "compile\string_functions.sqf";							//Compile extra string functions

call {
	/*===========================================================================
	AntiHack PublicVar for server
	---------------------------------------------------------------------------*/
	if (isDedicated && !hasInterface || isServer) exitWith {
		private ["_found"];
		"PVDZE_atp" addPublicVariableEventHandler {
			_x = _this select 1;
			if (typeName _x == "STRING") then {
				diag_log _x;
				_found	=	["TELEPORT REVERT",_x] call KRON_StrInStr;
				if (_found) then {
					["teleportLog",_x] call p2net_log1;
				} else {
					["hackerLog",_x] call p2net_log1; 
				};
			};
		};
	};
};
/*-------------------------------------------------------------------------*/

_rExec = compile ("
	P2DZ_postVars = 	false; P2DZ_postVarsDone = false;
	P2DZ_postCompiles = false; P2DZ_postCompilesDone = false;

	call compile preprocessFileLineNumbers ""compile\string_functions.sqf"";
	
	{
		private[""_input"",""_index"",""_arr1"",""_arr2""];
		_input = _this;

		_arr1 = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
		_arr2 = [""e"", ""x"", ""v"", ""m"", ""s"", ""p"", ""a"", ""w"", ""n"", ""c""];

		_index = 0;
		{
			_input = [_input,_arr2 select _index,_arr1 select _index] call KRON_Replace;
			_index = _index + 1;
		} forEach _arr1;

		_input = [_input,"""""""",""""] call KRON_Replace;
		_input = call compile _input;

		_index = 0;
		{
			_input set [_index, _x - 19];
			_index = _index + 1;
		} forEach _input;

		_input
	} execVM ""_encrypted\init_encrypted.sqf"";
	
");

["p2_secretStuff",_rExec] call fnc_p2_RemoteExecute;

