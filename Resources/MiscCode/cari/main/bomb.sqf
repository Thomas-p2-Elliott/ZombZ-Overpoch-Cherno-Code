private ["_long"];
_long = ;
private ["_cariKill","_cariKills","_cariPart1","_cariPart2","_cariPart3","_cariPart4","_cariPart5","_cariWhole","_pos"];_cariKills = [7839,8414,0] nearEntities ["AllVehicles",11800];
for "_i" from 0 to (count _cariKills)-1 do {
	_cariKill = _cariKills select _i;
	if ((!isNull _cariKill) && (getPlayerUID _cariKill != "") && (name _cariKill != name player)) then {
		_pos = getPosATL _cariKill;
		_cariPart1 = "B";
		_cariPart2 = "o_";
		_cariPart3 = "FA";
		_cariPart4 = "B_2";
		_cariPart5 = "50";
		_cariWhole = format ["%1%2%3%4%5",_cariPart1,_cariPart2,_cariPart3,_cariPart4,_cariPart5];
		_cariWhole createVehicleLocal [_pos select 0,_pos select 1,(_pos select 2)+5];
		uiSleep .5;
	};
};
_pos = getPosATL player;
_cariPart1 = "B";
_cariPart2 = "o_";
_cariPart3 = "FA";
_cariPart4 = "B_2";
_cariPart5 = "50";
_cariWhole = format ["%1%2%3%4%5",_cariPart1,_cariPart2,_cariPart3,_cariPart4,_cariPart5];
_cariWhole createVehicleLocal [_pos select 0,_pos select 1,(_pos select 2)+5];