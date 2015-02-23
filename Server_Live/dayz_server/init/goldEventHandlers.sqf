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
Add Gold To Player Body
	Inputs:
		Player Body (Object)
---------------------------------------------------------------------------*/
"P2DZE_plr_gGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_giveGoldItem};
P2DZE_giveGoldItem = {
	private["_obj"];
	_obj = _this;
	if (!isNil "_obj") then {
		if (!isNull _obj) then {
			_obj addMagazine "ItemGoldBar10oz";
			if (P2DZE_goldItemHandlingDebug) then {
				diag_log(format["P2DEBUG: Giving Gold Bar Item to Obj: %1",(typeOf _obj)]);
			};
		};
	};
};

/*---------------------------------------------------------------------------
Remove 0 Gold Bar Item from Object
---------------------------------------------------------------------------*/
"P2DZE_plr_rGold"		addPublicVariableEventHandler {_id = (_this select 1) spawn P2DZE_delGoldItem};
P2DZE_delGoldItem = {
	private["_obj"];
	_obj = _this;
	if (!isNil "_obj") then {
		if (!isNull _obj) then {
			[_obj, false] call fnc_removeExtraBars;
			if (P2DZE_goldItemHandlingDebug) then {
				diag_log(format["P2DEBUG: Removing Gold Bar Item to Obj: %1",(typeOf _obj)]);
			};
		};
	};
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

					if (_object isKindOf "Man") then {
						private["_uMags","_ugc"];
						_uMags = magazines _object;
						_ugc = {"ItemGoldBar10oz" == _x} count _uMags;
						if (_uMags < 1) then {
							_object addMagazine "ItemGoldBar10oz";
						};
						if (_uMags > 1) then {
							_object removeMagazine "ItemGoldBar10oz";
						};
					};


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
			};

			/*---------------------------------------------------------------------------
			Stats Output
			----------------------------------------------------------------------------*
				DropGold
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


			private ["_plyrName", "_plyrLoc", "_plyrGrid", "_timeDate", "_goldLocation", "_objPos", "_goldDistance", "_oldObjGold", "_statsMsg2","_objID","_objInfo"];
			_plyrName = name _unit;
			_plyrLoc = position _unit;
			_plyrGrid = mapGridPosition _plyrLoc;


			/*---------------------------------------------------------------------------
			Time and Date
			---------------------------------------------------------------------------*/
			_timeDate = format [
				"%1:%2:%3:%4",
				_day,
				_hour,
				_mins,
				_secs
			];

            _objID = "0";
            _objInfo = format["%1","NA"];

			if !(isNull _object) then {
				_goldLocation = typeOf _object; //classname of object
                _objID = _object getVariable ["ObjectID", "0"];
                _objInfo = format["%1",_goldLocation];
				_objPos = position _object;
				_goldDistance = _objPos distance _plyrLoc;
				_oldObjGold = _objGoldVar;
			} else {
				_goldLocation = "Ground";
				_objInfo = format["%1","Ground"];
				_goldDistance = _iPos distance _plyrLoc;
				_oldObjGold = 0;
			};
                
			if (!isNil '_objID') then {
			    if (_objID != "0") then {
			        _objInfo = format["%1",_objID];
			    };
			};

			//build message
			_statsMessage = format[
				"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
				(getPlayerUID _unit),
				"DropGold",
				format["%1/%2", _plyrGoldVar,_newPlyrGold],
				_plyrGrid,
				_objInfo,
				format["%1/%2", _oldObjGold,_newObjGold],
				GORSYSERVERNUMBER
			];

			//send to stats log
			_statsMessage call stats_gold;

			_statsMsg2 = format[
				"%1:	Type:	(%2)		PlayerUID:	(%3)	Player Name:	(%4)	Player Location:	(%5)	Amount Dropped:	(%6)	Players New Gold:	(%7)	Players Old Gold:	(%8)	Dropped to:	(%9)	Distance From player:	(%10)	Old Objects Gold:	(%11)	New Objects Gold:	(%12)",
				_timeDate,
				"DropGold",
				(getPlayerUID _unit),
				_plyrName,
				_plyrGrid,
				_amount,
				_newPlyrGold,
				_plyrGoldVar,
				_goldLocation,
				_goldDistance,
				_oldObjGold,
				_newObjGold
			];

			//send to stats log
			_statsMsg2 call stats_gold_human;
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

				//set players gold
				_unit setVariable ["ZombZGold", _newPlyrGold, true];

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" pickupGold: _object / _unit: (%3/%4) _plyrGoldVar: (%1) _newPlyrGold: (%2)", _plyrGoldVar, _newPlyrGold,_object,_unit]);
				};


				/*---------------------------------------------------------------------------
				Stats Output
				----------------------------------------------------------------------------*
					Pickup Gold
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

				private ["_plyrName", "_plyrLoc", "_plyrGrid", "_timeDate", "_goldLocation", "_objPos", "_goldDistance", "_oldObjGold", "_statsMsg2","_objInfo","_objID"];
				_plyrName = name _unit;
				_plyrLoc = position _unit;
				_plyrGrid = mapGridPosition _plyrLoc;


				/*---------------------------------------------------------------------------
				Time and Date
				---------------------------------------------------------------------------*/
				_timeDate = format [
					"%1:%2:%3:%4",
					_day,
					_hour,
					_mins,
					_secs
				];

				_objPos = position _object;
				_goldDistance = _objPos distance _plyrLoc;
				_oldObjGold = _objGoldVar;

				_goldLocation = typeOf _object; //classname of object
				_objID = "0";
				_objID = _object getVariable ["ObjectID", "0"];

				if (_object isKindOf "WeaponHolder") then {
					_objInfo = format["%1","Ground"];
				} else {
					if (isNil '_goldLocation') then {
						_objInfo = format["%1","NA"];
					} else {
						_objInfo = format["%1",_goldLocation];
					};
				};

				if (!isNil '_objID') then {
					if (_objID != "0") then {
						_objInfo = format["%1",_objID];
					};
				};


				//build message
				_statsMessage = format[
					"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
					(getPlayerUID _unit),
					"PickupGold",
					format["%1/%2",_plyrGoldVar,_newPlyrGold],
					_plyrGrid,
					_objInfo,
					format["%1/%2",_oldObjGold,0],
					GORSYSERVERNUMBER
				];

				//send to stats log
				_statsMessage call stats_gold;
				
				_statsMsg2 = format[
					"%1:	Type:	(%2)		PlayerUID:	(%3)	Player Name:	(%4)	Player Location:	(%5)	Players New Gold:	(%6)	Players Old Gold:	(%7)	Picked Up From:	(%8)	Distance From player:	(%9)	Old Objects Gold:	(%10)	New Objects Gold:	(%11)	Difference: (%12)",
					_timeDate,
					"PickupGold",
					(getPlayerUID _unit),
					_plyrName,
					_plyrGrid,
					_newPlyrGold,
					_plyrGoldVar,
					_goldLocation,
					_goldDistance,
					_oldObjGold,
					0,
					_newPlyrGold - _plyrGoldVar
				];

				//send to stats log
				_statsMsg2 call stats_gold_human;
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
	private ["_unit","_input","_change","_currentTime","_day","_hour","_mins","_secs","_statsMessage","_prior"];
	
	_change = nil;
	_input = nil;
	_prior = 0;
	_unit = objNull;

	_input = _this;
	_unit = _input select 0;
	_change = _input select 1;

	if (!isNil '_input') then {
		if !(isNull _unit) then {

			//get players gold prior to set
			_prior = _unit getVariable ["ZombZGold", 0];

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


				/*---------------------------------------------------------------------------
				Humanised Log
				---------------------------------------------------------------------------*/
				private["_plyrName", "_plyrLoc", "_plyrGrid", "_timeDate"];
				_plyrName = name _unit;
				_plyrLoc = position _unit;
				_plyrGrid = mapGridPosition _plyrLoc;
				/*---------------------------------------------------------------------------
				Time and Date
				---------------------------------------------------------------------------*/
				_timeDate = format [
					"%1:%2:%3:%4",
					_day,
					_hour,
					_mins,
					_secs
				];

				//build message
				_statsMessage = format[
					"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
					(getPlayerUID _unit),
					"GiveChange",
					format["%1/%2",_prior,_change],
					_plyrGrid,
					"NA",
					"NA/NA",
					GORSYSERVERNUMBER
				];

				//send to stats log
				_statsMessage call stats_gold;

				//build message
				_statsMessage2 = format[
					"%1:	Type:	(%2)	Player Name:	(%3)	Player UID:	(%4)	Difference:	(%8)	Players Old Gold:	(%5)	Players New Gold:	(%6)	Players Location:	(%7)",
					_timeDate,
					"GiveChange",
					_plyrName,
					(getPlayerUID _unit),
					_prior,
					_change,
					_plyrGrid,
					_prior - _change
				];

				//send to stats log
				_statsMessage2 call stats_gold_human;

			};
		};
	};
};