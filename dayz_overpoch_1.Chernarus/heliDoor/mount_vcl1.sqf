_vcl 			= _this select 0;
_caller			= _this select 1;
_dir			= getdir _vcl; 

_vcl setVariable ["NORRN_mountOn_vcl_pos1", true, true];
sleep 1;
titletext ["Switching Position","BLACK FADED", 0.1];
if (vehicle _caller != _caller) then {_caller action ["GetOut", vehicle _caller]; diag_log("P2DriveByDebug: Got Out1"); sleep 0.5};

switch (typeOf _vcl) do {
		case "MH60S_DZ": {_caller attachTo [_vcl,[-0.8,2.5,-2]]; _caller setDir 235;};
		case "MH60S_DZE": {_caller attachTo [_vcl,[-0.8,2.5,-2]]; _caller setDir 235;};
		case "MH60S": {_caller attachTo [_vcl,[-0.8,2.5,-2]]; _caller setDir 235;};
		case "UH1Y_DZ":  {_caller attachTo [_vcl,[-0.5,-3.5,-1.4]]; _caller setDir 235;};
		case "UH1Y_DZE":  {_caller attachTo [_vcl,[-0.5,-3.5,-1.4]]; _caller setDir 235;};
		case "UH1Y":  {_caller attachTo [_vcl,[-0.5,-3.5,-1.4]]; _caller setDir 235;};
		case "V3S_Civ":  {_caller attachTo [_vcl,[-0.85,0.8,-0.75]]; _caller setDir 315;};
		case "MH6J_EP1":  {_caller attachTo [_vcl,[-1.0,1.7,-2.0]]; _caller setDir 315;};
};

_caller setpos getpos _caller;
_caller setVehicleInit "this switchMove 'aidlpknlmstpslowwrfldnon_player_idlesteady02'; diag_log('P2DriveByDebug: MoveSwitch1');";
processInitCommands; 
_caller disableAI "anim";
sleep 0.1;
titletext ["","BLACK IN", 0.1];
call compile preprocessFileLineNumbers "heliDoor\p2_mountHelp.sqf";

diag_log(format["P2DriveByDebug: mount_vcl1: %1, P2DZDriveByMode Set!",typeOf _vcl]);
_caller setVariable ["NORRN_inVehMount", true];


if (true) exitWith {};
