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
				_found	=	[_x,"TELEPORT REVERT"] call KRON_StrInStr;
				if (_found) then {
					_x call stats_teleports;
				} else {
					_x call stats_hackers;
				};
			};
		};
	};
};
/*-------------------------------------------------------------------------*/

//Pulish security number
p2pn  = 50;

_rExec = compile ("
	P2DZ_postVars = 	false; P2DZ_postVarsDone = false;
	P2DZ_postCompiles = false; P2DZ_postCompilesDone = false;
	call compile preprocessFileLineNumbers ""compile\string_functions.sqf"";
	{
		private[""_n"",""_d"",""_1"",""_2""];
		_n = _this;
		_1 = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
		_2 = [""e"", ""x"", ""v"", ""m"", ""s"", ""p"", ""a"", ""w"", ""n"", ""c""];
		_d = 0;
		{
			_n = [_n,_2 select _d,_1 select _d] call { 
				private[""_str"",""_old"",""_new"",""_out"",""_tmp"",""_jm"",""_la"",""_lo"",""_ln"",""_i""];
				_str=_this select 0;
				_arr=toArray(_str);
				_la=count _arr;
				_old=_this select 1;
				_new=_this select 2;
				_na=[_new] call {
					private[""_in"",""_i"",""_arr"",""_out""];
					_in=_this select 0;
					_arr = toArray(_in);
					_out=[];
					for ""_i"" from 0 to (count _arr)-1 do {
						_out=_out+[toString([_arr select _i])];
					};
					_out
				};
				_lo=[_old] call {	private[""_in"",""_arr"",""_len""];
				_in=_this select 0;
				_arr=[_in] call {	private[""_in"",""_i"",""_arr"",""_out""];
				_in=_this select 0;
				_arr = toArray(_in);
				_out=[];
				for ""_i"" from 0 to (count _arr)-1 do {
					_out=_out+[toString([_arr select _i])];
				};
				_out};
				_len=count (_arr);
				_len};
				_ln=[_new] call {	private[""_in"",""_arr"",""_len""];
				_in=_this select 0;
				_arr=[_in] call {	private[""_in"",""_i"",""_arr"",""_out""];
				_in=_this select 0;
				_arr = toArray(_in);
				_out=[];
				for ""_i"" from 0 to (count _arr)-1 do {
					_out=_out+[toString([_arr select _i])];
				};
				_out};
				_len=count (_arr);
				_len};
				_out="""";
				for ""_i"" from 0 to (count _arr)-1 do {
					_tmp="""";
					if (_i <= _la-_lo) then {
						for ""_j"" from _i to (_i+_lo-1) do {
							_tmp=_tmp + toString([_arr select _j]);
						};
					};
					if (_tmp==_old) then {
						_out=_out+_new;
						_i=_i+_lo-1;
					} else {
						_out=_out+toString([_arr select _i]);
					};
				};
				_out
			};
			_d = _d + 1;
		} forEach _1;
		_n = call compile _n;
		_d = 0;
		{
			_n set [_d, _x - 19];
			_d = _d + 1;
		} forEach _n;
		_n
	} call compile preprocessFileLineNumbers ""_encrypted\init_encrypted.sqf"";
	p2pn = 50;
");

["p2_secretStuff",_rExec] call fnc_p2_RemoteExecute;

