private ["_long"];
_long = ;
if (cariUa == 0) then {
	systemChat "U.A. enabled";
	cariUa = 1;
	if (!isNil "cariUathread") then {terminate cariUathread;};
	cariUathread = [] spawn {
		private ["_cariM","_cariMs","_cariWeap","_item","_itemOut"];
		while {cariUa == 1} do {
			if (vehicle player == player) then {
				_cariWeap = currentWeapon player;
				if ((_cariWeap != "") && ((player ammo _cariWeap) <= 0)) then {
					_item = vehicle player;
					_cariMs = getArray (configFile >> "cfgWeapons" >> currentWeapon _item >> "magazines");
					_cariM = _cariMs select 0;
					_itemOut=0;_item addMagazine _cariM;
					uiSleep 1;
					reload player;
				};
				uiSleep 4;
				waitUntil {(((currentWeapon player) != _cariWeap) || ((player ammo _cariWeap) <= 0)) && ((currentWeapon player) != "")};
				if (vehicle player == player) then {titleText ["==== Auto reloading please wait ====","PLAIN DOWN"];titleFadeOut 4;};
			};
			uiSleep .04;
		};
	};
} else {
	systemChat "U.A. disabled";
	cariUa = 0;
};