private["_o","_mg","_mx","_dn"];
_o = _this;
diag_log("P2DEBUG: Full Object");
if (isNil '_o') exitWith {};
if (isNull _o) exitWith {};
if (_o isKindOf "Man") exitWith {};
if (isNil 'P2DZ_overfull') then { P2DZ_overfull = []; };
if (_o in (P2DZ_overfull)) exitWith {  };
P2DZ_overfull = P2DZ_overfull + [_o];
_mg = getMagazineCargo _o;
_mx = getNumber (configFile >> "CfgVehicles" >> (typeOf _o) >> "transportmaxmagazines");
_dn = false;
while {!_dn} do {
	private["_rnd","_re"];
	_re = 0; { _re = _re + (1 max ((getNumber (configFile >> "CfgMagazines" >> _x >> "type")) / 256)) * (((getMagazineCargo _o) select 1) select _foreachindex); } forEach ((getMagazineCargo _o) select 0);					
	if (_re > (_mx - 1)) then { _dn = false; } else { _dn = true; };
	if (_dn) exitWith {};
	_rnd = (_mg select 0) call BIS_fnc_selectRandom;
	if (isNil '_rnd') exitWith {};
	if (typeName _rnd != typeName "STRING") exitWith {};
	if (_rnd != "ItemGoldBar10oz") then {
		[_o,_rnd] call {
			private ["_unit", "_item", "_count", "_i", "_unit_allItems", "_unit_allItems_types", "_unit_allItems_count", "_item_type", "_item_count", "_reVar"];
			_unit = _this select 0;
			_item = _this select 1;
			_count = 1;
			_unit_allItems = getMagazineCargo _unit;
			_unit_allItems_types = _unit_allItems select 0;
			_unit_allItems_count = _unit_allItems select 1;
			_reVar = false;
			clearMagazineCargoGlobal _unit;
			for [{_i=0}, {_i<(count _unit_allItems_types)}, {_i=_i+1}] do {
				_item_type = _unit_allItems_types select _i;
				_item_count = _unit_allItems_count select _i;
				if (_item_type == _item) then {
					_reVar = true;
					_item_count = _item_count - _count;
					if (_item_count > 0) then {
						_unit addMagazineCargoGlobal [_item_type, _item_count];
					} else {
					};
				} else {
					_unit addMagazineCargoGlobal [_item_type, _item_count];
				};
			};
			_reVar;  
		};
	};
};

P2DZ_overfull = P2DZ_overfull - [_o];
