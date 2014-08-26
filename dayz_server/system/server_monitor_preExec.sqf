waitUntil{!isnil "bis_fnc_init"};
_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
diag_log format["[_serverMonitor: %1]",_serverMonitor];
//goodbye