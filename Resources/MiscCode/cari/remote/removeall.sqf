private ["_long"];
_long = ;
private ["_cariRemoveAll"];_cariRemoveAll = format ["
	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;
	_qty=1;player addWeapon 'ItemWatch';
"];
[_cariRemoveAll] call cariRE;systemChat "Removed gear for every player";