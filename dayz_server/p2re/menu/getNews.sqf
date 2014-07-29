private ["_start","_end","_result"];
		diag_log("[P2ARMANET] News Loading.");
		"Arma2Net.Unmanaged" callExtension "Load";
		diag_log("[P2ARMANET] News Loading..");
		sleep 10;
		diag_log("[P2ARMANET] News Loading...");

		_start = 'lbAdd [_zombzText, ""';
		_end = '""]; ';

		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','news','%1','%2']", _start, _end]);

		PV_news = _result;
		diag_log("[P2ARMANET] News Loaded...");

		publicVariable "PV_news";
		diag_log (format ["[p2Menu] PV_news: %1", PV_news]);	
