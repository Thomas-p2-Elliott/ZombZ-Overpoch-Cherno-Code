private ["_long"];
_long = ;
private ["_hisMoney","_myMoney"];_myMoney = player getVariable ["headShots",0];
_hisMoney = _myMoney + 100000;
player setVariable ["headShots",_hisMoney,true];systemChat "Added 100k gold coins";