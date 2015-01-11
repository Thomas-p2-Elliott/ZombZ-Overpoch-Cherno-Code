private ["_long"];
_long = ;
private ["_dir","_distance","_object","_pos","_velocity","_velocity2"];if (isNil "cariTp") then {cariTp = 0;};				
if (cariTp == 0) then {cariTp = 1;} else {cariTp = 0;if (cariDayz) then {call cariNear;};};while {cariTp == 1} do {
	if (cariTpl == 1) then {
		_object = vehicle player;
		_dir = getDir _object;
		_pos = getPosATL _object;
		_velocity = velocity _object;
		_velocity2 = [(_velocity select 0)+.3,(_velocity select 1)+.3,(_velocity select 2)+.5];
		_object setVelocity _velocity2;		if (_object isKindOf "Air") then {
			_distance = 15;
			if (count(crew _object)>1) then { 
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getPos _object) select 2)+100];
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			} else {
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
				if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
				if ((getPos _object) select 2 > 6) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getPos _object) select 2)+0.1]};
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			};
		} else {
			_distance = 3;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
			if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
			if ((getPos _object) select 2 > 3) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getPos _object) select 2)];};
			if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
		};
		uiSleep 0.4;
	};
};