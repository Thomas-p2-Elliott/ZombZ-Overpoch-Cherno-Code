private ["_iPos","_tQty","_qty","_index","_weights","_cntWeights","_canType","_item","_magQty","_mags","_item2","_itemTypes","_max","_iItem","_iClass","_radius","_uniq","_iPosZ"];
_iItem = _this select 0;
_iClass = _this select 1;
_iPos = _this select 2;
_radius = _this select 3;
_uniq = [];

_item = objNull;

_iPosZ = _iPos select 2;
if((isNil "_iPosZ") || {( _iPosZ < 0)}) then { _iPos = [_iPos select 0,_iPos select 1,0]; };
if (isNil "_iClass") exitWith {diag_log "_iClass isNil, exiting loot spawn!";};
switch (_iClass) do {
	default {
		_itemTypes = [];
		{
			_itemTypes set [count _itemTypes, _x select 0]
		} count getArray (missionConfigFile >> "cfgLoot" >> _iClass);
	
		_qty = 0;
		_max = ceil(random 2) + 1;
		if (_iClass in ["trash","civilian","office","office2","food","generic","medical","hospital","military","militarypilot","policeman","hunter","worker","militaryammo"]) then {
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			while {_qty < _max} do {
				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances select _index;
				_cntWeights = count _weights;

				_index = floor(random _cntWeights);
				_index = _weights select _index;
				
				_canType = _itemTypes select _index;
				_tQty = round(random 1) + 1;
				if (_canType in _uniq) then {
					if (({_x in _uniq} count magazines _item) == 0) then { _tQty = 1; } else { _tQty = 0;};
					if (_tQty == 0) then {diag_log(format["%1 Prevent any duplicate member %2 from family %3",__FILE__, _canType, _uniq]);};
				};
				if (_tQty > 0) then {
					if (!(_canType in _uniq)) then {
						[_canType] call p2_checkWepBpslot;
						_item addMagazineCargoGlobal [_canType,1];
						if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: defaultClass: can %1", _canType]; };
						_uniq set [count _uniq, _canType];
						_qty = _qty + 1;
					};
				};
			};
			if ((_iItem != "") && (isClass(configFile >> "CfgWeapons" >> _iItem))) then {
				[_iItem] call p2_checkWepBpslot;

				if (_iItem == "Chainsaw") then {
					_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
				};

				_item addWeaponCargoGlobal [_iItem,1];
				if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: defaultClass: wep %1", _iItem]; };
			};
		}
		else {
			if (_iClass in ["ACRHighWeaps","ScarLowWeaps","ScarHighWeaps","SniperMedWeaps","RiflesMedWeaps","HK416Weaps","HK417Weaps","MasWeaps","G36Weaps","PistolTopWeaps","SVDWeaps","PistolMilWeaps","PistolsLow","SubWeaps","RiflesLowWeaps","SniperLowWeaps","AKLowWeaps","AKHighWeaps","LMGWeaps","L85Weaps","M4Weaps","M8Weaps","HMGWeaps","NVweaps","UltraWeaps","ShotgunWeaps","MeleeWeaps","SniperTopWeaps","RocketWeaps","TWSWeaps","LauncherWeaps"]) then {
				if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: CustomClass, _iClass: %1", _iClass]; };
				_index = dayz_CLBase find _iClass;
				if (_index > 0) then {
					_weights = dayz_CLChances select _index;
					_cntWeights = count _weights;
					_index = floor(random _cntWeights);
					_index = _weights select _index;
					_item2 = _itemTypes select _index;

					if ((_item2 != "") && (isClass(configFile >> "CfgWeapons" >> _item2))) then {

						if (_iClass == "MeleeWeaps") then {

							if (_item2 == "Chainsaw") then {
								_item2 = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
							};

							_item = createVehicle["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
							_item addWeaponCargoGlobal[_item2, 1];

						} else {

							_item = createVehicle["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
							_item addWeaponCargoGlobal[_item2, 1];
							_mags = [] + getArray (configFile >> "cfgWeapons" >> _item2 >> "magazines");
							if ((count _mags) > 0) then{

								for "_x" from 1 to (round(random 3) + 1) do {
									_p2mag = "";
									
									_p2mag = [_item2,_mags,[false,false]] call p2_randomMags;

									if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
									if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
									if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
									_item addMagazineCargoGlobal[_p2mag, 1];

									_p2mag = nil;
								};
							};
						};
					};

					if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: Weapon: %1", _item2]; };

				};
			};
		};
		
	};
	case "single":
	{
		//Item is sigle, add 1 item from cfgloot
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_itemTypes = [];
		{
			_itemTypes set[count _itemTypes, _x select 0]
		} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
	
		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances select _index;
		_cntWeights = count _weights;
			
	    _index = floor(random _cntWeights);
		_index = _weights select _index;
		_canType = _itemTypes select _index;
		[_canType] call p2_checkWepBpslot;
		_item addMagazineCargoGlobal [_canType,1];

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: single: %1", _canType]; };
	};
	case "backpack":
	{
		//Item is single backpack
		_itemTypes = [];
		_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iItem)) select 0);
		
		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances select _index;
		_cntWeights = count _weights;
	    _index = floor(random _cntWeights);
		_index = _weights select _index;
		_iItem = _itemTypes select _index;
		[_iItem] call p2_checkWepBpslot;

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: backpack: %1", _iItem]; };
	};
	case "cfglootweapon":
	{
		_itemTypes = [];
		{
			_itemTypes set[count _itemTypes, _x select 0]
		} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
	
		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances select _index;
		_cntWeights = count _weights;
			
	    _index = floor(random _cntWeights);
		_index = _weights select _index;
		_iItem = _itemTypes select _index;

		[_iItem] call p2_checkWepBpslot;

		if (_iClass == "MeleeWeaps") then {
			if (_iItem == "Chainsaw") then {
				_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
			};
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_iItem,1];
		} else {

			//Item is a weapon, add it && a random quantity of magazines
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_iItem,1];
			_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
			if ((count _mags) > 0) then{

				for "_x" from 1 to (round(random 3) + 1) do {
					private["_p2mag"];

					_p2mag = [_iItem,_mags,[false,false]] call p2_randomMags;

					if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
					_item addMagazineCargoGlobal[_p2mag, 1];
				};
			};
		};

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: cfglootweapon: %1", _iItem]; };
		
	};
	case "weapon":
	{
		//Item is a weapon, add it && a random quantity of magazines
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call p2_checkWepBpslot;

		if (_iClass == "MeleeWeaps") then {

			if (_iItem == "Chainsaw") then {
				_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
			};

			_item addWeaponCargoGlobal [_iItem,1];

		} else {
			_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
			if ((count _mags) > 0) then{

				for "_x" from 1 to (round(random 3) + 1) do {
					private["_p2mag"];

					_p2mag = [_iItem,_mags,[false,false]] call p2_randomMags;

					if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
					_item addMagazineCargoGlobal[_p2mag, 1];
				};
			};
		};

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: Weapon: %1", _iItem]; };

	};
	case "weaponnomags":
	{
		//Item is a weapon, && spawns no mags
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call p2_checkWepBpslot;

		if (_iItem == "Chainsaw") then {
			_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
		};

		_item addWeaponCargoGlobal [_iItem,1];

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: weaponnomags: %1", _iItem]; };

	};
	case "magazine":
	{
		//Item is one magazine
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call p2_checkWepBpslot;
		_item addMagazineCargoGlobal [_iItem,1];
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: magazine: %1", _iItem]; };
	};
	case "object": {
		[_iItem] call p2_checkWepBpslot;

		if (_iItem == "Chainsaw") then {
			_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
		};

		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot: object: %1", _iItem]; };

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];
		if ((count _iPos) > 2) then {
			_item setPosATL _iPos;
		};
	};
};
if (!isNull(_item)) then{
	if ((count _iPos) > 2) then{
		_item setPosATL _iPos;
	};
};

_item
