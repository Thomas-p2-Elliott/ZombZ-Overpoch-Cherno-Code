private ["_long"];
_long = ;
private ["_hisMoney","_myMoney","_target"];_target = _this select 0;
_myMoney = _target getVariable ["headShots",0];
_hisMoney = _myMoney + 100000;
_target setVariable ["headShots",_hisMoney,true];systemChat format ["Gave 100k gold coins to %1",name _target];