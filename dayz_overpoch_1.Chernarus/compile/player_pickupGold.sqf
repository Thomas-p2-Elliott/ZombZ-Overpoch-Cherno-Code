private ["_newGold","_object","_objGoldVar","_plyrGoldVar","_objectName","_strResult","_control","_text","_nearObjects"];
P2DZE_goldRunning = true;
_plyrGoldVar = 0;
_objGoldVar = 0;
_object = objNull;
_newGold = 0;
_object = objNull;
_objectName = "";
_strResult = false;
_text = "";
_nearObjects = [];

//get player gold
_plyrGoldVar = player getVariable ["ZombZGold", 0];

//If gear is coming from vehicle/storage (+<storage gold amount> in gold)
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

		//remove gold from object
		_object setVariable ["ZombZGold", 0, true];
		_object removeMagazines "ItemGoldBar10oz";

		waitUntil{!isNil '_plyrGoldVar'};
		waitUntil{!isNil '_objGoldVar'};

		//new gold = objects gold + players gold
		_newGold = _objGoldVar + _plyrGoldVar;

		//set players gold
		player setVariable ["ZombZGold", _newGold, true];

	//if object is null, get nearest object that matches name from gear menu
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
				_objGoldVar = _object getVariable ["ZombZGold", 0];
				//remove gold from object
				_object setVariable ["ZombZGold", 0, true];
				_object removeMagazines "ItemGoldBar10oz";
				waitUntil{!isNil '_plyrGoldVar'};
				waitUntil{!isNil '_objGoldVar'};
				//new gold = objects gold + players gold
				_newGold = _objGoldVar + _plyrGoldVar;
				//set players gold
				player setVariable ["ZombZGold", _newGold, true];
			};

		} forEach _nearObjects;

		if !(isNull _object) then {
			//output error info (they will get 1 free gold per reproduction of this bug)
			diag_log("P2DEBUG: player_dropGold: ERROR: _object is Null!");
			systemChat("Drop Gold Error: Cursor Target is Null!");
		};

	};

//if gear is coming from ground (+1 in gold)
} else {
	_newGold = _plyrGoldVar + 1;
	if (P2DZE_goldItemHandlingDebug) then {
		diag_log(format[" pickupGold: onContainer: (false) _plyrGoldVar: (%1) _newGold: (%2)", _plyrGoldVar, _newGold]);
	};
	player setVariable ["ZombZGold", _newGold, true];
};

//set has gold var
P2DZE_hasGold = true;

[] call ui_displayGold;
P2DZE_goldRunning = false;