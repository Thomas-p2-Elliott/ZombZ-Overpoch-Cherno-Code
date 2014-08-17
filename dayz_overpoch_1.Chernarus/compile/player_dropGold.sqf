private ["_objGoldVar","_plyrGoldVar","_newGold","_object","_objectName","_strResult","_control","_text","_nearObjects","_iPos","_radius","_item"];
_object = objNull;
_plyrGoldVar = 0;
_objGoldVar = 0;
_newGold = 0;
_objectName = "";
_strResult = false;
_text = "";
_nearObjects = [];
_iPos = [];
_radius = 0.0;
_item = "";

//get player gold
_plyrGoldVar = player getVariable ["ZombZGold", 0];

//If gear is going into vehicle/storage
if (P2DZE_gearOnContainer) then {

	//get object
	if (vehicle player != player) then {
		_object = vehicle player;
	} else {
		_object = cursorTarget;
	};

	//ensure object isnt null
	if !(isNull _object) then {

		//get object gold
		_objGoldVar = _object getVariable ["ZombZGold", 0];

		if ("ItemGoldBar10oz" in (getMagazineCargo _object)) then {
			_object removeMagazine "ItemGoldBar10oz";
			_object addMagazineCargoGlobal ["ItemGoldBar10oz", 1];
		};

		waitUntil{!isNil '_plyrGoldVar'};
		waitUntil{!isNil '_objGoldVar'};

		//new gold = objects gold + players gold
		_newGold = _objGoldVar + _plyrGoldVar;

		//set objects gold
		_object setVariable ["ZombZGold", _newGold, true];
		//set players gold
		player setVariable ["ZombZGold", 0, true];

	} else {

		disableSerialization;
		_control = (findDisplay 106) displayCtrl 156;
		_text = ctrlText _control;
		_nearObjects = nearestObjects [position player, ["Man","AllVehicles","Land_A_Tent","VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"], 15];
		{
			_objectName = getText (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
			_strResult = [_text,_objectName] call KRON_StrInStr;

			if (_strResult) then {
				_object = _x;
				//get object gold
				_objGoldVar = _object getVariable ["ZombZGold", 0];

				if ("ItemGoldBar10oz" in (getMagazineCargo _object)) then {
					_object removeMagazines "ItemGoldBar10oz";
					_object addMagazineCargoGlobal ["ItemGoldBar10oz", 1];
				};

				waitUntil{!isNil '_plyrGoldVar'};
				waitUntil{!isNil '_objGoldVar'};

				//new gold = objects gold + players gold
				_newGold = _objGoldVar + _plyrGoldVar;

				//set objects gold
				_object setVariable ["ZombZGold", _newGold, true];
				//set players gold
				player setVariable ["ZombZGold", 0, true];

			};

		} forEach _nearObjects;

		if (isNull _object) then {
			//output error info (they will get 1 free gold per reproduction of this bug)
			diag_log("P2DEBUG: player_dropGold: ERROR: _object is Null!");
			systemChat("Drop Gold Error: Cursor Target is Null!");
		};
	};

//If gear is going to ground
} else {
	
	_newGold = 0;
	waitUntil{!isNil '_plyrGoldVar'};

	//remove gold item
	player removeMagazine "ItemGoldBar10oz";
	//take one away as it will drop 2 items
	if (_plyrGoldVar > 1) then {
		_plyrGoldVar = _plyrGoldVar - 1;
		//create gold pile
		_iPos = getPosATL player;
		_radius = 0.0;
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_item setposATL _iPos;
		_item addMagazineCargoGlobal ["ItemGoldBar10oz",_plyrGoldVar];
	};

	if (P2DZE_goldItemHandlingDebug) then {
		diag_log(format[" DropGold: onContainer: (false) _plyrGoldVar: (%1) _newGold: (%2)", _plyrGoldVar, _newGold]);
	};
	//set player gold
	player setVariable ["ZombZGold", _newGold, true];
};

//set has gold var
P2DZE_hasGold = false;
//call display update
[] call ui_displayGold;
P2DZE_goldRunning = false;