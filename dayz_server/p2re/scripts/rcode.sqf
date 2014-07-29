"Arma2Net.Unmanaged" callExtension "Load";
p2Code_c = "";
[] spawn {
	private ["_rExec","_start","_end","_oldVal","_result","_logOutput"];
	while {true} do 
	{
		_start = 'none';
		_end = 'none';
		_oldVal = p2Code_c;
		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','rcode_opoch','%1','%2']", _start, _end]);
		p2Code_c = _result;

		if (!(str(p2Code_c) == str(_oldVal))) then {

			_logOutput = format ["[p2Re] p2Code_c: %1", p2Code_c];
			["p2debug",_logOutput] call p2net_log1; 
			publicVariable "p2Code_c";
			_rExec = compile ("
				call compile p2Code_c;
			");

			["ZombZ menu p2Code_c.sqf",_rExec] call fnc_p2_RemoteExecute;
		};
		sleep 3; 
	};
};