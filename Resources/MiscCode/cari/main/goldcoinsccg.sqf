private ["_long"];
_long = ;
private ["_hisMoney","_wealth"];_wealth = player getVariable["ccgwealth",0];
_hisMoney = _wealth + 100000;
player setVariable ["ccgwealth",_hisMoney,true];systemChat "Added 100k gold coins";