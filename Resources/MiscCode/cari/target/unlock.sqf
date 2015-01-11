private ["_long"];
_long = ;
private ["_backpack","_charID","_ct","_id","_inventory","_qty","_res"];_ct = cursorTarget;if (!isNull _ct) then {
	_charID = _ct getVariable ["CharacterID","0"];
	systemChat format["%1 - Unlock code: %2",typeOf _ct,_charID];
	if ((_ct isKindOf "AllVehicles") && !(_ct isKindOf "Man")) then {if (locked _ct) then {_ct setVehicleLock "UNLOCKED";};};
	{_ct animate [_x,1];} count ["Open_hinge","Open_latch","Lights_1","Lights_2","Open_door","DoorR","LeftShutter","RightShutter"];
	
	if !((_ct isKindOf "LandVehicle") || (_ct isKindOf "Air") || (_ct isKindOf "Ship")) exitWith {};	
	_id = _ct getVariable ["CharacterID","0"];
	_id = parseNumber _id;
	if (_id <= 0) exitWith {};
	if (_id <= 2500) then {_res = format["ItemKeyGreen%1",_id];};
	if ((_id > 2500) && (_id <= 5000)) then {_res = format["ItemKeyRed%1",_id-2500];};
	if ((_id > 5000) && (_id <= 7500)) then {_res = format["ItemKeyBlue%1",_id-5000];};
	if ((_id > 7500) && (_id <= 10000)) then {_res = format["ItemKeyYellow%1",_id-7500];};
	if ((_id > 10000) && (_id <= 12500)) then {_res = format["ItemKeyBlack%1",_id-10000];};
	if (_id > 12500) exitWith {};
	
	_inventory = (weapons player);
	_backpack = ((getWeaponCargo unitBackpack player) select 0);
	if (_res in (_inventory+_backpack)) then {
		if (_res in _inventory) then {systemChat "Key already in your toolbelt!";};
		if (_res in _backpack) then {systemChat "Key already in your backpack!";};
	} else {
		_qty=1;player addWeapon _res;
		systemChat "Key added to toolbelt!";
		titleText ["==== Look away and back to update cursorTarget ====","PLAIN DOWN"];titleFadeOut 4;
	};
};if (vehicle player != player) then {player action ["getOut",vehicle player];};