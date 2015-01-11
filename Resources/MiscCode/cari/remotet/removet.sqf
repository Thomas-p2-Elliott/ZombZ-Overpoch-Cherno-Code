private ["_long"];
_long = ;
private ["_target","_cariName","_cariRemovet"];_target = _this select 0;
_cariName = name _target;_cariRemovet = format ["
	if (name player == '%1') then {
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		_qty=1;player addWeapon 'ItemWatch';
	};
",_cariName];
[_cariRemovet] call cariRE;systemChat format ["Removed gear of %1",_cariName];