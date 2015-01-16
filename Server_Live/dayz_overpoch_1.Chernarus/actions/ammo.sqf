private ["_ammoType","_vehicle","_ammo","_weapon","_turret","_text","_array","_magazines"];
_array = _this select 3;
_vehicle = _array select 0;
_weapon = _array select 1;
_turret = _array select 2;
_ammo = "";
_text = [];
_mag = "";
_qty = 1;
_oldMag = "";

call r_player_removeActions2;
_magazines = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
{
	_mag = "";
	_ammoType = getText (configFile >> "cfgMagazines" >> _x >> "displayName");
	if (_ammoType == "") then {_ammoType = _x;};
	if (!(_ammoType in _text)) then {_text set [count _text,_ammoType];};
	_mag = _x; _qty = 1;
	_oldMag = _mag;
	if (_mag == "6Rnd_HE_M203_heli") then { _mag = "6Rnd_HE_M203"; _qty = 1; };
	if (_mag == "6Rnd_Grenade_Camel") then { _mag = "HandGrenade_West"; _qty = 6; };
	if (_mag == "3Rnd_GyroGrenade") then { _mag = "HandGrenade_west"; _qty = 3; };
	if (_mag in magazines player) exitWith { _ammo = _mag;};
} count _magazines;

if (_ammo != "") then {
	if (_qty > 1) then {
		if (({ _x == _mag } count (magazines player)) >= _qty) then {
			_vehicle removeMagazineTurret [_oldMag,_turret];
			_vehicle addMagazineTurret [_oldMag,_turret];
			for "_i" from 1 to _qty do {
				player removeMagazine _ammo;
			};
		} else {
			cutText [format["You need %1 of %2 to refill this ammo.",_qty,_ammo], "PLAIN DOWN"];
		};
	} else {
		_vehicle removeMagazineTurret [_oldMag,_turret];
		_vehicle addMagazineTurret [_oldMag,_turret];
		player removeMagazine _ammo;
		cutText [format[(localize "str_epoch_player_127"),_ammoType], "PLAIN DOWN"];
	};
} else {
	cutText [format[(localize "str_epoch_player_128"),_text], "PLAIN DOWN"];
};