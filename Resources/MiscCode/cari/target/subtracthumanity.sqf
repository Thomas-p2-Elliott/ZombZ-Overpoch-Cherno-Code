private ["_long"];
_long = ;
private ["_humanity","_target"];_target = _this select 0;
_humanity = _target getVariable["humanity",0];
_humanity = _humanity - 2500;
_target setVariable["humanity",_humanity,true];systemChat format["Subtracted 2500 humanity from %1",name _target];