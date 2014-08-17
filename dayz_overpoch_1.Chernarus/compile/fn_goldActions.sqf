/* Take Gold self Actions - Checks for Piles of Gold */
private["_weaponHolderContents","_item","_iItem"];
_item = [];
_weaponHolderContents = [];
_iItem = "";

while {true} do {

	if (cursorTarget isKindOf "WeaponHolder") then {
		_weaponHolderContents = getMagazineCargo cursorTarget;
		_item = _weaponHolderContents select 0;
		_iItem = _item select 0;
		if (!isNil '_iItem') then {
			if ((_iItem) == "ItemGoldBar10oz") then {
				if (s_player_takeGold < 0) then {					
					s_player_takeGold = player addaction[("Take Gold"),"actions\takeGold.sqf",cursorTarget, -1, true, true, "", ""]; 
				}; 
			} else {
				player removeAction s_player_takeGold; 
				s_player_takeGold = -1; 
			};
		} else {
			player removeAction s_player_takeGold; 
			s_player_takeGold = -1; 
		};
	}  else {
		player removeAction s_player_takeGold; 
		s_player_takeGold = -1; 
	};

	sleep 0.5;
};