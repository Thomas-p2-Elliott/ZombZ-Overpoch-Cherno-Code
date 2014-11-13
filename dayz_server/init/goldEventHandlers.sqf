/*---------------------------------------------------------------------------
Remove Gold from players backpack

Inputs:
	Player Backpack (Object)
---------------------------------------------------------------------------*/
"P2DZE_plr_bpGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_removeGoldFromBackpack};

P2DZE_removeGoldFromBackpack = {
		private["_backpack"];
		_backpack = _this;
		if (P2DZE_goldItemHandlingDebug) then {
			diag_log(format["P2DZE_removeGoldFromBackpack:	PlayerBackpack Object: %1",_backpack]);
		};
		[_this,false] call fnc_removeExtraBars;
};

/*---------------------------------------------------------------------------
Drop Gold

Inputs:
	Player
	Object
	Amount to Drop
---------------------------------------------------------------------------*/
"P2DZE_plr_dropGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_dropGold};

P2DZE_dropGold = {
	private ["_unit","_object","_item","_iPos","_input","_amount","_radius","_newObjGold","_newPlyrGold","_plyrGoldVar","_objGoldVar","_near","_currentTime","_day","_hour","_mins","_secs","_statsMessage"];

	_unit = objNull;
	_object = objNull;
	_item = objNull;
	_iPos = [];
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

				waitUntil{!isNil '_plyrGoldVar'};
				waitUntil{!isNil '_objGoldVar'};

				//new player gold = player gold - gold dropped
				_newPlyrGold = _plyrGoldVar - _amount;

				//new object gold = objects gold + ammount of gold dropped
				_newObjGold = _objGoldVar + _amount;

				if (_newPlyrGold < 0) then {
					if (P2DZE_goldItemHandlingDebug) then {
						diag_log(format[" DropGold(Failed:Anti-Dupe): onContainer: (true) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, _object, _unit, _plyrGoldVar]);
					};
				} else {

					//set players gold
					_unit setVariable ["ZombZGold", _newPlyrGold, true];

					//set objects gold
					_object setVariable ["ZombZGold", _newObjGold, true];


					if (P2DZE_goldItemHandlingDebug) then {
						diag_log(format[" DropGold: onContainer: (true) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, _object, _unit, _plyrGoldVar]);
					};
				};

				//make sure there is only one gold item in the object
				[_object,true] call fnc_removeExtraBars;

			} else {

				_unit spawn {
					private ["_unit","_near"];
					_unit = _this;
					_near = (getPosATL _unit) nearObjects ["WeaponHolder",15];
					{
						if ((((getMagazineCargo _x) select 0)select 0) == "ItemGoldBar10oz") then {
							diag_log("Found:" + str _x);
							_x call KK_fnc_checkHashGold;
						};
					} forEach _near;
				};

				//gold going to ground
				waitUntil{!isNil '_plyrGoldVar'};

				if (_amount > 0) then {
					//obj gold = amount dropped
					_newObjGold = _amount;

					//new player gold = player gold - gold dropped
					_newPlyrGold = _plyrGoldVar - _amount;

					if (_newPlyrGold < 0) then {
						diag_log(format[" DropGold(Failed:Anti-Dupe): onContainer: (false) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, objNull, _unit, _plyrGoldVar]);

					} else {

						//get player pos
						_iPos = [(getPosATL _unit) select 0, (getPosATL _unit) select 1, -50];

						//create weaponholder to hold the gold item
						_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
						
						//set player gold
						_unit setVariable ["ZombZGold", _newPlyrGold, true];

						//set amount of gold in pile
						_item setVariable ["ZombZGold", _newObjGold, true];

						//hashid security for gold object
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

						//get player pos
						_iPos = getPosATL _unit;

						//move weaponholder to player pos
						_item setPosATL _iPos;

						//add gold bar to weaponholder
						_item addMagazineCargoGlobal ["ItemGoldBar10oz",1];
					};
				};

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" DropGold: onContainer: (false) _newPlyrGold: (%1) _newObjGold: (%2) _object / _unit: (%3/%4) _plyrGoldVar: (%5)", _newPlyrGold, _newObjGold, objNull, _unit, _plyrGoldVar]);
				};

				/*---------------------------------------------------------------------------
				Stats Output
				----------------------------------------------------------------------------*

				Output:
					Day,Hour,Minutes,Seconds,Transaction Type,Player Name, Player UID, Dropped Amount, Old Player Gold, New Player Gold
				---------------------------------------------------------------------------*/

				//		Get current real time
				//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
				//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
				_currentTime = "real_date" callExtension "+";
				_currentTime = call compile _currentTime;

				_day = 			_currentTime select 2;
				_hour = 		_currentTime select 3;
				_mins = 		_currentTime select 4;
				_secs = 		_currentTime select 5;

				//build message
				_statsMessage = format[
					"%1,%2,%3,%4,%5,%6,%7,%8,%9,%10",
					_day,_hour,_mins,_secs,"DropGold",(name _unit),(getPlayerUID _unit),_newObjGold,_plyrGoldVar,_newPlyrGold
				];

				//send to stats log
				_statsMessage call stats_gold;

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
	private ["_unit","_object","_newPlyrGold","_input","_plyrGoldVar","_objGoldVar","_currentTime","_day","_hour","_mins","_secs","_statsMessage"];

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

				//get object gold
				_objGoldVar = _object getVariable ["ZombZGold", 0];

				//new gold = objects gold + players gold
				_newPlyrGold = _objGoldVar + _plyrGoldVar;

				//make sure there is no gold left
				[_object,false] call fnc_removeExtraBars;

				//remove gold from object
				_object setVariable ["ZombZGold", 0, true];

				//if weapon holder / ground item then delete after this
				if (!isNull _object && {(_object isKindOf "WeaponHolder")}) then {
					deleteVehicle _object;
				};

				//set players gold
				_unit setVariable ["ZombZGold", _newPlyrGold, true];

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" pickupGold: _object / _unit: (%3/%4) _plyrGoldVar: (%1) _newPlyrGold: (%2)", _plyrGoldVar, _newPlyrGold,_object,_unit]);
				};

				/*---------------------------------------------------------------------------
				Stats Output
				----------------------------------------------------------------------------*

				Output:
					Day,Hour,Minutes,Seconds,Transaction Type,Player Name, Player UID, Change Amount, New Gold Amount
				---------------------------------------------------------------------------*/

				//		Get current real time
				//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
				//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
				_currentTime = "real_date" callExtension "+";
				_currentTime = call compile _currentTime;

				_day = 			_currentTime select 2;
				_hour = 		_currentTime select 3;
				_mins = 		_currentTime select 4;
				_secs = 		_currentTime select 5;

				//build message
				_statsMessage = format[
					"%1,%2,%3,%4,%5,%6,%7,%8,%9",
					_day,_hour,_mins,_secs,"PickupGold",(name _unit),(getPlayerUID _unit),_objGoldVar,_newPlyrGold
				];

				//send to stats log
				_statsMessage call stats_gold;

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
	private ["_unit","_input","_change","_currentTime","_day","_hour","_mins","_secs","_statsMessage"];

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

				/*---------------------------------------------------------------------------
				Stats Output
				----------------------------------------------------------------------------*

				Output:
					Day,Hour,Minutes,Seconds,Transaction Type,Player Name, Player UID, New Player Gold
				---------------------------------------------------------------------------*/

				//		Get current real time
				//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
				//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
				_currentTime = "real_date" callExtension "+";
				_currentTime = call compile _currentTime;

				_day = 			_currentTime select 2;
				_hour = 		_currentTime select 3;
				_mins = 		_currentTime select 4;
				_secs = 		_currentTime select 5;

				//build message
				_statsMessage = format[
					"%1,%2,%3,%4,%5,%6,%7,%8",
					_day,_hour,_mins,_secs,"GiveChange",(name _unit),(getPlayerUID _unit),_change
				];

				//send to stats log
				_statsMessage call stats_gold;

			};
		};
	};
};