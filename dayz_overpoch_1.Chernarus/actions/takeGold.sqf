private["_obj","_weaponHolderContents","_goldAmount","_goldVar"];
_obj = _this select 3;
_weaponHolderContents = getMagazineCargo _obj;
_goldAmount = _weaponHolderContents select 1;
_goldAmount = _goldAmount select 0;
_goldVar = player getVariable ["ZombZGold", 0];
_goldVar = _goldVar + _goldAmount;
deleteVehicle _obj;
player setVariable ["ZombZGold", _goldVar, true];