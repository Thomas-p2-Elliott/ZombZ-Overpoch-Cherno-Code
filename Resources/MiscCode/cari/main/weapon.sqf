private ["_long"];
_long = ;
private ["_object","_qty","_cariM","_cariMs","_wep"];_wep = _this select 0;_object = createVehicle ["WeaponHolder",position player,[],0,"CAN_COLLIDE"];
_object setVariable ["permaLoot",true];
_qty=1;_object addWeaponCargoGlobal [_wep,1];_cariMs = [];
_cariMs = getArray (configFile >> "cfgWeapons" >> _wep >> "magazines");
if (count _cariMs > 0) then {
	_cariM = _cariMs select 0;
	_qty=1;_object addMagazineCargoGlobal [_cariM,1];
	_qty=1;_object addMagazineCargoGlobal [_cariM,1];
};systemChat format ["%1 created at your feet",_wep];
systemChat "Warning: Picking up bad weapons may result in AH ban!";