private ["_long"];
_long = ;
private ["_bag","_qty"];_bag = _this select 0;
_qty=1;player addBackpack _bag;
systemChat format ["%1 added",_bag];