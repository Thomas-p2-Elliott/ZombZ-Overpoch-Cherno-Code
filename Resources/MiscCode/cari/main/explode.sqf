private ["_long"];
_long = ;
private ["_cariKill","_cariKills","_cariPart1","_cariPart2","_cariPart3","_cariWhole","_pos"];_cariKills = [7839,8414,0] nearEntities ["AllVehicles",11800];
for "_i" from 0 to (count _cariKills)-1 do {
	_cariKill = _cariKills select _i;
	if ((!isNull _cariKill) && (getPlayerUID _cariKill != "") && (name _cariKill != name player)) then {
		_pos = getPosATL _cariKill;
		_cariPart1 = "Heli";
		_cariPart2 = "copterEx";
		_cariPart3 = "plobig";
		_cariWhole = format ["%1%2%3",_cariPart1,_cariPart2,_cariPart3];
		_cariWhole createVehicleLocal _pos;
		uiSleep .5;
	};
};
_pos = getPosATL player;
_cariPart1 = "Heli";
_cariPart2 = "copterEx";
_cariPart3 = "plobig";
_cariWhole = format ["%1%2%3",_cariPart1,_cariPart2,_cariPart3];
_cariWhole createVehicleLocal _pos;