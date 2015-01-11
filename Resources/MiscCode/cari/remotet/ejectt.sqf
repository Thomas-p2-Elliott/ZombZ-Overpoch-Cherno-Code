private ["_long"];
_long = ;
private ["_target","_cariEject","_cariName"];_target = _this select 0;
_cariName = name _target;_cariEject = format ["
	if (name player == '%1') then {
		player action ['eject',vehicle player];
	};
",_cariName];
[_cariEject] call cariRE;systemChat format ["%1 was kicked from their vehicle",_cariName];
