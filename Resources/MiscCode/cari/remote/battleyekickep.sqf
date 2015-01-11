private ["_long"];
_long = ;
private ["_cariBattlEye","_cariName"];_cariName = name player; 
_cariBattlEye = format ["
	if (name player != '%1') then {createVehicle ['SeaGull',getPosATL player,[],10,'NONE'];};
",_cariName];
[_cariBattlEye] call cariRE;systemChat "BattlEye kicked every player";