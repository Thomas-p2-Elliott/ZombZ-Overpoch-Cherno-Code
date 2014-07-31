"Arma2Net.Unmanaged" callExtension "Load";
p2Code_s = "";

[] spawn {
	while {true} do 
	{
		_start = 'none';
		_end = 'none';
		_oldVal = p2Code_s;

		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','rcode_opoch_s','%1','%2']", _start, _end]);
		p2Code_s = _result;

		if (!(str(p2Code_s) == str(_oldVal))) then {

			_logOutput = format ["[p2Re] p2Code_s: %1", p2Code_s];
			diag_log(_logOutput); //["p2debug",_logOutput] call p2net_log1; 

			[] spawn { call compile p2Code_s; };
		};

		sleep 3; //rcode update timer

	};
};