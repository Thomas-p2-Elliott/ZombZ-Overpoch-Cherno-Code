player2_putGoldItemsAtTop = {
	private ["_PMagCnt", "_PMagCnt2", "_wepHolder", "_ogMags", "_newMags", "_clutter"];
	_PMagCnt = 0;
	{
		if !(getNumber(configFile >> "CfgMagazines" >> _x >> "type") == 16) then {
			_PMagCnt = _PMagCnt + 1;
		};
	} count (magazines player);

	if (_PMagCnt >= 12) then {
		_PMagCnt2 = 0;
		_wepHolder = objNull;
		{
			if (!(getNumber(configFile >> "CfgMagazines" >> _x >> "type") == 16) && (((_PMagCnt) - _PMagCnt2) > 12) && (_x != "ItemGoldBar10oz")) then {
				_PMagCnt2 = _PMagCnt2 + 1;
				if (isNull _wepHolder) then {
					_wepHolder = "WeaponHolder" createVehicle (getPosATL player);
					_wepHolder setPosATL (getPosATL player);
					_clutter = "ClutterCutter_small_EP1" createVehicleLocal (getPosATL player);
					_clutter setPosATL (getPosATL player);
					systemChat(format["Warning: Inventory Full! %1 dropped to ground.",_x]);
					player action ["dropMagazine", _wepHolder, _x];
				} else {
					systemChat(format["Warning: Inventory Full! %1 dropped to ground.",_x]);
					player action ["dropMagazine", _wepHolder, _x];
				};
			};
		} count (magazines player);
	};

	_ogMags = magazines player;	

	if !(_ogMags select 0 == "ItemGoldBar10oz") then {
		_newMags = _ogMags - ["ItemGoldBar10oz"];
		_newMags =  ["ItemGoldBar10oz"] + _newMags;
		{
			if (_x != currentMagazine player || ((getNumber(configFile >> "CfgMagazines" >> _x >> "type")) == 16)) then {
				player removeMagazine _x;
			};
		} forEach _ogMags;
		{
			if (_x != currentMagazine player || ((getNumber(configFile >> "CfgMagazines" >> _x >> "type")) == 16)) then {
		  		player addMagazine _x;
		  	};
		} forEach _newMags;	
	};

	{
		if ("ItemGoldBar10oz" in ((getMagazineCargo _x) select 0)) then {
			if (([false,_x] call p2_gv) < 0) then {
				deleteVehicle _x;
			};
		};
	} count ((getPosATL player) nearObjects ["WeaponHolder",2]);
 
};