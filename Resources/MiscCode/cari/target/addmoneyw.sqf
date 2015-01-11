private ["_long"];
_long = ;
private ["_money","_target"];_target = _this select 0;
_money = _target getVariable["cmoney",0];
if (isNil "_money") then {_money = 0;};
_money = _money + 5000;
_target setVariable["cmoney",_money,true];systemChat format["Gave %1 $5000",name _target];