private ["_rExec"];

_rExec = compile ("
	if (isNil ""PV_news"") then
	{
 	 	PV_news = [""Error: News not found""]; 
	};
	diag_log (format [""[P2_RE] PV_news: %1"", PV_news]);
");

["ZombZ menu retrieveNews.sqf",_rExec] call fnc_p2_RemoteExecute;