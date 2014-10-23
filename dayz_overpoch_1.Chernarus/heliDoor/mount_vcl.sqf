_vcl 			= _this select 0;
_caller			= _this select 1;
_dir			= getdir _vcl; 

_vcl setVariable ["NORRN_mountOn_vcl_pos0", true, true];
sleep 1;
titletext ["Moving to door","BLACK FADED", 0.1];
if (vehicle _caller != _caller) then {_caller action ["GetOut", vehicle _caller]; sleep 0.5};

switch (typeOf _vcl) do {
		case "MH60S_DZ": {_caller attachTo [_vcl,[-0.5,0.8,-2]]; _caller setDir 305;};
		case "MH60S_DZE": {_caller attachTo [_vcl,[-0.5,0.8,-2]]; _caller setDir 305;};
		case "MH60S": {_caller attachTo [_vcl,[-0.5,0.8,-2]]; _caller setDir 305;};
		case "UH1Y_DZ":  {_caller attachTo [_vcl,[0.5,-3.5,-1.4]]; _caller setDir 105;};
		case "UH1Y_DZE":  {_caller attachTo [_vcl,[0.5,-3.5,-1.4]]; _caller setDir 105;};
		case "UH1Y":  {_caller attachTo [_vcl,[0.5,-3.5,-1.4]]; _caller setDir 105;};
}; 

_caller setpos getpos _caller;
_caller setVehicleInit "this switchMove 'aidlpknlmstpslowwrfldnon_player_idlesteady02'";
processInitCommands; 
_caller disableAI "anim";
sleep 0.1;
titletext ["","BLACK IN", 0.1];

processInitCommands;

if (true) exitWith {};
