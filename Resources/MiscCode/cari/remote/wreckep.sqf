private ["_long"];
_long = ;
private ["_cariName","_cariWreckEp"];_cariName = name player;
_cariWreckEp = format ["
	if (!isDedicated && (name player != '%1')) then {player setDamage 1;};
",_cariName];
[_cariWreckEp] call cariRE;systemChat "Every player was killed";