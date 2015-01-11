private ["_long"];
_long = ;
private ["_target","_cariBattlEyet","_cariName"];_target = _this select 0;
_cariName = name _target;_cariBattlEyet = format ["
	if (name player == '%1') then {createVehicle ['SeaGull',getPosATL player,[],10,'NONE'];};
",_cariName];
[_cariBattlEyet] call cariRE;systemChat format ["BattlEye kicked %1",_cariName];