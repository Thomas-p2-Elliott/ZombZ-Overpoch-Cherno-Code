/*---------------------------------------------------------------------------
Drop Gold

Inputs:
	Player
	Object
	Amount to Drop
---------------------------------------------------------------------------*/
"P2DZE_plr_dropGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_dropGold};

P2DZE_dropGold = {
	private ["_amount","_objGoldVar","_newPlyrGold","_newObjGold","_plyrGoldVar","_iPos","_radius","_item","_input","_unit","_object"];

	_unit = objNull;
	_object = objNull;
	_item = objNull;
	_ipos = [];
	_input = [];
	_amount = -1;
	_radius = 0;
	_newObjGold = 0;
	_newPlyrGold = 0;

	_input = _this;
	_unit = _input select 0;
	_object = _input select 1;
	_amount = _input select 2;


	if (!isNil '_input') then {

		if (P2DZE_goldItemHandlingDebug) then {
			diag_log(format[" DropGold: Input:		 Unit: %1, Object: %2, Amount: %3", _unit, _object, _amount]);
		};

		if (isNil '_amount') then {
			_amount = -1;
		};

		if !(isNull _unit) then {
			_plyrGoldVar = _unit getVariable ["ZombZGold", 0];

			if !(isNull _object) then {

				//gold going to object
				_objGoldVar = _object getVariable ["ZombZGold", 0];

				//make sure there is only one gold item in the object
				[_object,true] call fnc_removeExtraBars;

				waitUntil{!isNil '_plyrGoldVar'};
				waitUntil{!isNil '_objGoldVar'};

				//new player gold = player gold - gold dropped
				_newPlyrGold = _plyrGoldVar - _amount;

				//new object gold = objects gold + ammount of gold dropped
				_newObjGold = _objGoldVar + _amount;

				//set objects gold
				_object setVariable ["ZombZGold", _newObjGold, true];
				//set players gold
				_unit setVariable ["ZombZGold", _newPlyrGold, true];

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" DropGold: onContainer: (true) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, _object, _unit, _plyrGoldVar]);
				};

			} else {

				[_unit] spawn {
					private ["_unit","_near"];
					_unit = _this select 0;
					_near = (position _unit) nearObjects ["WeaponHolder",5];
					{
						if ((((getMagazineCargo _x) select 0)select 0) == "ItemGoldBar10oz") then {
							_x call KK_fnc_checkHashGold;
						};
					} forEach _near;
				};

				//gold going to ground
				waitUntil{!isNil '_plyrGoldVar'};

				if (_amount > 0) then {
					//create gold pile
					_iPos = getPos _unit;
					_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
					_item setpos _iPos;
					_item addMagazineCargoGlobal ["ItemGoldBar10oz",1];

					//obj gold = amount dropped
					_newObjGold = _amount;

					//new player gold = player gold - gold dropped
					_newPlyrGold = _plyrGoldVar - _amount;

					//set amount of gold in pile
					_item setVariable ["ZombZGold", _newObjGold, true];


					_item call {
					    _this setVariable [
					        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
					        "hash_id" callExtension format [
					            "%1:%2",
					            netId _this,
					            typeOf _this
					        ]
					    ];
					};

					//set player gold
					_unit setVariable ["ZombZGold", _newPlyrGold, true];

					//reveal object to unit
					_unit reveal _item;
				};

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" DropGold: onContainer: (false) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, objNull, _unit, _plyrGoldVar]);
				};
			};
		};
	};
};

/*---------------------------------------------------------------------------
Pickup Gold

Inputs:

Player
Object
---------------------------------------------------------------------------*/
"P2DZE_plr_pickupGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_pickupGold};

P2DZE_pickupGold = {
	private ["_unit","_object","_newPlyrGold","_input","_plyrGoldVar","_objGoldVar"];

	_unit = objNull;
	_object = objNull;
	_newPlyrGold = 0;
	_input = _this;
	_unit = _input select 0;
	_object = _input select 1;


	if (!isNil '_input') then {
		if !(isNull _unit) then {
			_plyrGoldVar = _unit getVariable ["ZombZGold", 0];

			//ensure object isnt null
			if !(isNull _object) then {

				//make sure object isnt hacked in
				_object call KK_fnc_checkHash;

				//make sure there is no gold left
				[_object,false] call fnc_removeExtraBars;

				//get object gold
				_objGoldVar = _object getVariable ["ZombZGold", 0];

				waitUntil{!isNil '_plyrGoldVar'};
				waitUntil{!isNil '_objGoldVar'};

				//new gold = objects gold + players gold
				_newPlyrGold = _objGoldVar + _plyrGoldVar;

				//remove gold from object
				_object setVariable ["ZombZGold", 0, true];

				//if weapon holder / ground item then delete after this
				if (_object isKindOf "WeaponHolder") then {
					deleteVehicle _object;
				};

				//set players gold
				_unit setVariable ["ZombZGold", _newPlyrGold, true];

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" pickupGold: _object / _unit: (%3/%4) _plyrGoldVar: (%1) _newPlyrGold: (%2)", _plyrGoldVar, _newPlyrGold,_object,_unit]);
				};
			};
		};
	};
};


/*---------------------------------------------------------------------------
Give Trader Change

Inputs:

Player
Change
---------------------------------------------------------------------------*/
"P2DZE_plr_giveChange"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_giveChange};

P2DZE_giveChange = {
	private ["_unit","_object","_newPlyrGold","_input","_plyrGoldVar","_objGoldVar"];

	_unit = objNull;
	_input = _this;
	_unit = _input select 0;
	_change = _input select 1;

	if (!isNil '_input') then {
		if !(isNull _unit) then {
			if (!isNil '_change') then {

				//set players gold
				_unit setVariable ["ZombZGold", _change, true];

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" P2DZE_giveChange: _unit / _change: (%1 / %2)", _unit, _change]);
				};
			};
		};
	};
};