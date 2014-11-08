"Arma2Net.Unmanaged" callExtension "Load";
p2Code_hc = "";
[] spawn {
	private ["_rExec","_start","_end","_oldVal","_result","_logOutput"];
	while {true} do 
	{
		_start = 'none';
		_end = 'none';
		_oldVal = p2Code_hc;
		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','rcode_opoch_hc','%1','%2']", _start, _end]);
		p2Code_hc = _result;

		if (!(str(p2Code_hc) == str(_oldVal))) then {

			_logOutput = format ["[p2Re] p2Code_hc: %1", p2Code_hc];
			["rcode_hc_log",_logOutput] call p2net_log1; 
			publicVariable "p2Code_hc";
			_rExec = compile ("
				call compile p2Code_hc;
			");

			["ZombZ menu p2Code_hc.sqf",_rExec] call fnc_p2_RemoteExecute2;
		};
		uiSleep 3; 
	};
};