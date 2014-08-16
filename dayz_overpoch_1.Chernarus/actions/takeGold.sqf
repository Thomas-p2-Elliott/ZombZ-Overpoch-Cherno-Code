private["_obj","_weaponHolderContents","_goldAmount","_goldVar"];
_goldVar = 0;
_goldAmount = 0;
_goldVar = player getVariable ["ZombZGold", 0];
_obj = _this select 3;
_weaponHolderContents = getMagazineCargo _obj;
_goldAmount = _weaponHolderContents select 1;
_goldAmount = _goldAmount select 0;
deleteVehicle _obj;
if (isNil '_goldAmount') then {
	_goldAmount = 0;
} else {
	if ((typeName _goldAmount) == 'SCALAR') then {
		if (_goldAmount < 1 || _goldAmount > P2DZE_Gold_MaxPickup) then {
			_goldAmount = 0;
		};
	} else {
		diag_log("P2DEBUG: takeGold.sqf: ERROR: Amount was not a number!");
		systemChat("Error: TakeGold - Gold amount was not a number! Reset to 1!");
		_goldAmount = 1;
	};


};
_goldVar = _goldVar + _goldAmount;
player setVariable ["ZombZGold", _goldVar, true];