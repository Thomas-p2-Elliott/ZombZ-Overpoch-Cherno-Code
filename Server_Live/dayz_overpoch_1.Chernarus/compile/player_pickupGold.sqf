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

diag_log("P2DEBUG: player_pickupGold");

//If gear is coming from vehicle/storage/weaponholder (+<storage gold amount> in gold)
if (P2DZE_gearOnContainer || P2DZE_gearOnWeaponHolder) then {
	if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG player_pickupGold: Gold coming from storage; P2DZE_gearOnContainer: " + str P2DZE_gearOnContainer + " || GearOnWeaponHolder: " + str(P2DZE_gearOnWeaponHolder)); };

	//get object
	if (vehicle player != player) then {
		_object = vehicle player;
	} else {
		_object = cursorTarget;
	};

	//ensure object isnt null
	if !(isNull _object) then {
		
		P2DZE_plr_pickupGold = [player,_object];
		publicVariableServer "P2DZE_plr_pickupGold";

	//if object is null, get nearest object that matches name from gear menu
	} else {
		disableSerialization;
		_control = (findDisplay 106) displayCtrl 156;
		_text = ctrlText _control;
		_nearObjects = nearestObjects [position player, ["Man","RUBasicWeaponsBox","LockboxStorage","TentStorageDomed","TentStorageDomed2","USBasicWeaponsBox","WorkBench_DZ","USBasicAmmunitionBox","RUVehicleBox","AllVehicles","Land_A_Tent","VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"], 15];
		{
			_objectName = getText (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
			_strResult = [_text,_objectName] call KRON_StrInStr;

			if (_strResult) then {
				_object = _x;
				P2DZE_plr_pickupGold = [player,_object];
				publicVariableServer "P2DZE_plr_pickupGold";
			};

		} forEach _nearObjects;

		if !(isNull _object) then {
			//output error info (they will get 1 free gold per reproduction of this bug)
			if (P2DZE_goldItemHandlingDebug) then {diag_log("P2DEBUG: player_pickupGold: ERROR: _object is Null!"); };
			systemChat("PickUp Gold Error: Cursor Target is Null!");
		};

	};

	if (P2DZE_goldItemHandlingDebug) then {
		diag_log(format[" pickupGold: onContainer: (true) Container/Type: %1 / %2", _object, typeOf _object]);
	};

//if gear is coming from ground
} else {
	if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG player_pickupGold: Gold coming from ground; P2DZE_gearOnContainer: " + str P2DZE_gearOnContainer + " || GearOnWeaponHolder: " + str(P2DZE_gearOnWeaponHolder)); };

	_object = cursorTarget;

	//ensure object isnt null
	if (!(isNull _object) && {(((player distance _object) < 10))} && {((((getMagazineCargo _object) select 0)select 0) == "ItemGoldBar10oz")}) then {
		P2DZE_plr_pickupGold = [player,_object];
		publicVariableServer "P2DZE_plr_pickupGold";
		if (P2DZE_goldItemHandlingDebug) then {
			diag_log(format[" pickupGold: onContainer: (false) Container/Type: %1 / %2", _object, typeOf _object]);
		};
	};

	if (isNull _object) then {
		//if object is null, get nearest weaponHolder
		_nearObjects = (getPosATL player) nearObjects ["WeaponHolder",15];
		{
			if ((((getMagazineCargo _x) select 0)select 0) == "ItemGoldBar10oz") then {
				_object = _x;
				P2DZE_plr_pickupGold = [player,_object];
				publicVariableServer "P2DZE_plr_pickupGold";
				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" pickupGold: onContainer: (false) Container/Type: %1 / %2", _object, typeOf _object]);
				};
			};
		} forEach _nearObjects;
	};
};
//close gear menu
closeDialog 0;
//set has gold var
P2DZE_hasGold = true;
if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG player_pickupGold: P2DZE_hasGold: " + str P2DZE_hasGold); };
[] call ui_displayGold;
P2DZE_goldRunning = false;
