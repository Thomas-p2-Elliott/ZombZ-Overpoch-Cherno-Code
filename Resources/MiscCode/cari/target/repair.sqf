private ["_long"];
_long = ;
private ["_target"];_target = _this select 0;
_target call cariRepair;systemChat format ["%1's vehicle was repaired",name _target];