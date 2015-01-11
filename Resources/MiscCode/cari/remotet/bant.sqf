private ["_long"];
_long = ;
private ["_target","_cariBant","_cariName"];_target = _this select 0;
_cariName = name _target;_cariBant = format ["
	if (name player == '%1') then {bp = true;pic = true;};
",_cariName];
[_cariBant] call cariRE;systemChat format ["%1 was banned",_cariName];
