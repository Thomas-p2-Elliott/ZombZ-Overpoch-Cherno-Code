private ["_rExec"];

_rExec = compile ("
p2menu_execute = {
	createdialog ""RscDisplayMultiplayerSetup"";
	_p2nil = [] execVM ""menu\screen.sqf"";
};");

["ZombZ menu execute_re.sqf",_rExec] call fnc_p2_RemoteExecute;