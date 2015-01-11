private ["_long"];
_long = ;
private ["_hitpoints","_selection"];_hitpoints = _this call cariHitpoints;
{
	_selection = getText (configFile >> "CfgVehicles" >> (typeOf _this) >> "HitPoints" >> _x >> "name");
	_this setVariable [("hit_"+_selection),-2,true];
	_this setHit ["_selection",0];
} count _hitpoints;
_this setDamage 0;
if (((fuel _this) < 1) && ((speed _this) <= 0)) then {_this setFuel 1;};