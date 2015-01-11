private ["_long"];
_long = ;
private ["_hisMoney","_wealth"];_wealth = player getVariable["wealth",0];
_hisMoney = _wealth + 100000;
player setVariable ["wealth",_hisMoney,true];systemChat "Added 100k gold coins";