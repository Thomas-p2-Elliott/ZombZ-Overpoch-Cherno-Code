private ["_long"];
_long = ;
private ["_hisMoney","_target","_wealth"];_target = _this select 0;
_wealth = _target getVariable["ccgwealth",0];
_hisMoney = _wealth + 100000;
_target setVariable ["ccgwealth",_hisMoney,true];systemChat format ["Gave 100k gold coins to %1",name _target];