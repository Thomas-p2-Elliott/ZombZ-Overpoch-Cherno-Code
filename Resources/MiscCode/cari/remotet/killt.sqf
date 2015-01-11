private ["_long"];
_long = ;
private ["_target","_cariKillt","_cariName"];_target = _this select 0;
_cariName = name _target;_cariKillt = format ["
	if (name player == '%1') then {player setDamage 1;};
",_cariName];
[_cariKillt] call cariRE;systemChat format ["%1 was killed",_cariName];