private ["_long"];
_long = ;
if (cariEa == 0) then {
	cariEa = 1;
	vehicle player removeAllEventHandlers "Fired";
	vehicle player addEventHandler ["Fired",{_this call player_fired;}];
	player_fired = {	
		_cariPc = screenToWorld [0.5,0.5];
		_cariPart1 = "Heli";
		_cariPart2 = "copterEx";
		_cariPart3 = "plobig";
		_cariWhole = format ["%1%2%3",_cariPart1,_cariPart2,_cariPart3];
		_cariWhole createVehicleLocal _cariPc;
	};
	systemChat "E. ammo enabled";
} else {
	cariEa = 0;
	vehicle player removeAllEventHandlers "Fired";
	player_fired = {};
	systemChat "E. ammo disabled";
};