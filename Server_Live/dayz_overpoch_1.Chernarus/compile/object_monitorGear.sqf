private["_countMagazines","_countWeapons","_countBackpacks","_countFreeSlots","_getControlText","_setControlText","_object","_objectName","_controlText","_magazinesMax","_weaponsMax","_backpacksMax","_distance","_isVehicle","_isMan","_isStorage","_isOK","_magazines","_weapons","_backpacks","_freeSlots","_timeout"];

_countWeapons = {
	private["_weapons","_return"];	
	_weapons = [];
	_return = 0;
	
	_weapons = (getWeaponCargo _object) select 1;
	{ _return = _return + _x } count _weapons;
	_return;
};

_countMagazines = {
	private["_magazines","_return"];
	_magazines = [];
	_return = 0;
	
	_magazines = (getMagazineCargo _object) select 1;
	{ _return = _return + _x } count _magazines;
	_return;
};

_countBackpacks = {
	private["_backpacks","_return"];
	_backpacks = [];
	_return = 0;
	
	_backpacks = (getBackpackCargo _object) select 1;
	{ _return = _return + _x } count _backpacks;
	_return;
};

_countFreeSlots = {
	private["_return"];
	_return = [(_weaponsMax - _weapons), (_magazinesMax - _magazines), (_backpacksMax - _backpacks)];
	_return;
};

_getControlText = {
	private["_control","_return"];
	disableSerialization;
	_control = (findDisplay 106) displayCtrl 156;
	_return = ctrlText _control;
	_return;
};

_setControlText = {
	private["_control"];
	disableSerialization;
	_control = (findDisplay 106) displayCtrl 156;
	_control ctrlSetText format["%1 (%2/%3/%4)", _objectName, _freeSlots select 0, _freeSlots select 1, _freeSlots select 2];
};

if (vehicle player != player) then {
	_object = vehicle player;
} else {
	_object = cursorTarget;
	if (_object isKindOf "WeaponHolder" && {(str(getMagazineCargo cursorTarget select 0) == "[""ItemGoldBar10oz""]")}) then {
		P2DZE_gearOnWeaponHolder = true;
	} else {
		P2DZE_gearOnWeaponHolder = false;
	};
};

_isVehicle = _object isKindOf "AllVehicles";
_isMan = (_object isKindOf "Man" && !(alive _object));
_isStorage = _object isKindOf "Land_A_tent";
_isnewstorage = (typeOf _object) in DZE_isNewStorage;
_objDist = _object distance player;
_isTrader = (typeOf _object) in ["RU_Functionary1","RU_Citizen3","Rocker4","Profiteer4","Rita_Ensler_EP1","CIV_EuroMan01_EP1","CIV_EuroMan02_EP1","TK_GUE_Soldier_5_EP1","GUE_Soldier_MG","Worker2","Worker3","Woodlander1","UN_CDF_Soldier_Pilot_EP1","RU_WorkWoman1","Dr_Annie_Baker_EP1","RU_Citizen4","RU_WorkWoman5","RU_Citizen1","RU_Villager3","TK_CIV_Takistani04_EP1","Pilot_EP1","RU_Profiteer4","Woodlander3","Dr_Hladik_EP1","Doctor","HouseWife1","GUE_Woodlander2"];
_isZed = _object isKindOf "zZombie_base";
_alive = alive _object;

_timeout = time + 2;
waitUntil { !(isNull (findDisplay 106)) || (_timeout < time) };
_objDist = _object distance player;

//diag_log format["object_monitorGear.sqf: _object: %1 _isStorage: %4 _isVehicle: %2 _isMan: %3 _display: %5", _object, _isVehicle, _isMan, _isStorage, findDisplay 106];

[] spawn {
	private["_result","_return","_result2"];
	if ((!(isNull (findDisplay 106)))) then {
		while {!(isNull (findDisplay 106))} do {
			_return = [];
			_return = [] call player_checkGoldItems;
			waitUntil{!isNil '_return'};
			waitUntil{
				_result2 = 0;
				sleep 0.1;
				_result = _return;
				_result2 = _return select 1;
				_result2 > 1 && !P2DZE_goldRunning
			};
			uiSleep 0.01;
		};
	};
};

if (isNil "_objDist") then { _objDist = 20 };

if ((_isVehicle || _isStorage || _isnewstorage) && (!_isMan) && (!_isZed) && (!_isTrader) && (_objDist < 10) && (!(isNull (findDisplay 106)))) then {
	_objectName = getText (configFile >> "CfgVehicles" >> (typeof _object) >> "displayName");
	_controlText = [] call _getControlText;
	if (_objectName == _controlText) then {
		_weaponsMax = getNumber (configFile >> "CfgVehicles" >> (typeof _object) >> "transportMaxWeapons");
		_magazinesMax = getNumber (configFile >> "CfgVehicles" >> (typeof _object) >> "transportMaxMagazines");
		_backpacksMax = getNumber (configFile >> "CfgVehicles" >> (typeof _object) >> "transportMaxBackpacks");
		while {!(isNull (findDisplay 106))} do {
			if (_objDist < 10) then {
				P2DZE_gearOnContainer = true;
				_weapons = 	[] call _countWeapons;
				_magazines = [] call _countMagazines;
				_backpacks = [] call _countBackpacks;
				_freeSlots = [] call _countFreeSlots;

				[] call _setControlText;
				sleep 0.01;
			} else {
				P2DZE_gearOnContainer = false;
			};
		};
	} else {
		P2DZE_gearOnContainer = false;
	};
} else {
	if ((!(isNull (findDisplay 106)))) then {
		if (_objDist < 10) then {
			_result1 = ctrlText ((findDisplay 106) displayCtrl 156);
			if (!isNil "_result1") then {
				_result2 = [format["%1",_result1]] call KRON_strLen;
				if (!isNil "_result2") then {
					_result3 = _result2 > 3;
					if (!isNil "_result3") then {
						_result4 = false;
						if (_result3) then {
							{
							  	_result3 = [_result1, (getText (ConfigFile >> "CfgVehicles" >> _x >> "displayname"))] call KRON_strInStr;
							  	if (!isNil "_result3") then {
								  	if (_result3) then {
								  		_result4 = true;
								  	};
								};
							} forEach ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_GunBag_EP1","DZ_CompactPack_EP1","DZ_TerminalPack_EP1"];	
						};
					};
				};
			};
			if (!isNil "_result4" && !isNil "_result2") then {
				if (!_result4 && (_result2 > 3)) then {
					if (_isMan) then {
						if (!_alive && !_isZed && !_isTrader) then {
							P2DZE_gearOnContainer = true;
						} else {
							P2DZE_gearOnContainer = false;
						};
					} else {
						if (!_alive && !_isZed && !_isTrader) then {
							P2DZE_gearOnContainer = true;
						} else {
							P2DZE_gearOnContainer = false;
						};
					};
				} else {
					P2DZE_gearOnContainer = false;
				}; 
			} else {  
				if (_isMan) then {
					if (!_alive && !_isZed && !_isTrader) then {
						P2DZE_gearOnContainer = true;
					} else {
						P2DZE_gearOnContainer = false;
					};
				} else {
					if (!_alive && !_isZed && !_isTrader) then {
						P2DZE_gearOnContainer = true;
					} else {
						P2DZE_gearOnContainer = false;
					};
				};
			};
		} else {
			P2DZE_gearOnContainer = false;
		};
	} else {
		P2DZE_gearOnContainer = false;
	};      
};

if (P2DZE_gearOnContainer && {(({_x == "ItemGoldBar10oz"} count (magazines cursorTarget)) < 1)} && {(([false,cursorTarget] call p2_gv) > 0)}) then {
	diag_log("P2DEBUG: object_monitorGear.sqf: Gold: " + (typeOf cursorTarget) + " had no gold item, not gonna go adding it.");
	P2DZE_plr_gGold = cursorTarget;
	publicVariableServer "P2DZE_plr_gGold";
	closeDialog 0;
	[] call ui_displayGold;
};