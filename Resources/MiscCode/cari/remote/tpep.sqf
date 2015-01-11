private ["_long"];
_long = ;
private ["_pos","_cariNearLoc","_cariName","_cariTep"];_pos = getPosATL player;
_cariNearLoc = [(_pos select 0)+7,(_pos select 1)+7,_pos select 2];
_cariName = name player;_cariTep = format ["
	if (name player != '%1') then {
		_cariLocation = %2; 
		_x = _cariLocation select 0; 
		_y = _cariLocation select 1; 
		_z = _cariLocation select 2; 
		vehicle player setPos [_x + random 7,_y + random 7,_z];
		_pos = getPosATL (vehicle player);
		player setVariable['AHpos',[getDir player,_pos],true];
	};
",_cariName,_cariNearLoc];
[_cariTep] call cariRE;
