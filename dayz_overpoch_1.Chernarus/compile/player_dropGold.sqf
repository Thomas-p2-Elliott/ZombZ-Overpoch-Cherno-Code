private ["_object","_objectName","_strResult","_text","_nearObjects","_control"];
_object = objNull;
_objectName = "";
_strResult = false;
_text = "";
_nearObjects = [];


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

		P2DZE_plr_dropGold = [player,_object,-1];
		publicVariableServer "P2DZE_plr_dropGold";

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
				
				P2DZE_plr_dropGold = [player,_object,-1];
				publicVariableServer "P2DZE_plr_dropGold";

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
	
		P2DZE_plr_dropGold = [player,objNull,-1];
		publicVariableServer "P2DZE_plr_dropGold";
};

//set has gold var
P2DZE_hasGold = false;
//call display update
[] call ui_displayGold;
P2DZE_goldRunning = false;