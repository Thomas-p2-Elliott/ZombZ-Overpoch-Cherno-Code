private ["_object","_objectName","_strResult","_text","_nearObjects","_control","_amount","_goldCount"];
_object = objNull;
_pGold = [false,player] call p2_gv;
_amount = -1;
_objectName = "";
_strResult = false;
_text = "";
_goldCount = 0;
_nearObjects = [];
_amount = _this select 0; //amount to drop
if (isNil "_amount") then {
	_amount = -1;
};
if (_amount < 0) then {
	_amount = _pGold;
};

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

		P2DZE_plr_dropGold = [player,_object,_amount];
		publicVariableServer "P2DZE_plr_dropGold";
		if (_amount < 0 || _amount >= _pGold) then {
			//set has gold var
			P2DZE_hasGold = false;
			if (P2DZ_enableGoldSystemChat) then {
				systemChat(format["Gold: %1 dropped to %2.",_pGold,(typeOf _object)]);
			};
		} else {
			//set has gold var
			P2DZE_hasGold = true;
			if (P2DZ_enableGoldSystemChat) then {
				systemChat(format["Gold: %1 dropped to %2.",_amount,(typeOf _object)]);
			};
		};


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
				
				P2DZE_plr_dropGold = [player,_object,_amount];
				publicVariableServer "P2DZE_plr_dropGold";
				if (_amount < 0 || _amount >= _pGold) then {
					//set has gold var
					P2DZE_hasGold = false;
					if (P2DZ_enableGoldSystemChat) then {
						systemChat(format["Gold: %1 dropped to %2.",_pGold,(typeOf _x)]);
					};
				} else {
					//set has gold var
					P2DZE_hasGold = true;
					if (P2DZ_enableGoldSystemChat) then {
						systemChat(format["Gold: %1 dropped to %2.",_amount,(typeOf _x)]);
					};
				};

			};

		} forEach _nearObjects;

		if (isNull _object) then {
			//output error info (they will get 1 fake? gold per reproduction of this bug)
			if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: player_dropGold: ERROR: _object is Null!"); };
			systemChat("Drop Gold Error: Cursor Target is Null!");
		};
	};

//If gear is going to ground
} else {
	if (P2DZE_goldItemHandlingDebug) then { diag_log("dropGold: player_dropGold: (" + str _amount + ") of players gold (" + str _pGold + ") going to ground"); };

	
	if (_amount < 0 || _amount >= _pGold) then {
		
		//Count primary magazines, if = slot count then it was forced out of inv and dont drop gold
		_PMagCnt = 0;
		{
			if !(getNumber(configFile >> "CfgMagazines" >> _x >> "type") == 16) then {
				_PMagCnt = _PMagCnt + 1;
			};
		} count (magazines player);

		if (_PMagCnt >= 12) then {
			_PMagCnt2 = 0;
			_wepHolder = objNull;
			{
				if (!(getNumber(configFile >> "CfgMagazines" >> _x >> "type") == 16) && (((_PMagCnt) - _PMagCnt2) > 12) && (_x != "ItemGoldBar10oz")) then {
					_PMagCnt2 = _PMagCnt2 + 1;
					if (isNull _wepHolder) then {
						_wepHolder = "WeaponHolder" createVehicle (getPosATL player);
						_wepHolder setPosATL (getPosATL player);
						_clutter = "ClutterCutter_small_EP1" createVehicleLocal (getPosATL player);
						_clutter setPosATL (getPosATL player);
					};
		 			systemChat(format["Warning: Inventory Full! %1 dropped to ground.",_x]);
					player action ["dropMagazine", _wepHolder, _x];
				};
			} count (magazines player);
		} else {
			//All of players gold going to ground
			P2DZE_plr_dropGold = [player,objNull,_pGold];
			publicVariableServer "P2DZE_plr_dropGold";

			//set has gold var
			P2DZE_hasGold = false;

			if (P2DZ_enableGoldSystemChat) then {
				systemChat(format["Gold: %1 dropped to ground.",_pGold]);
			};

			//cut grass
			[] spawn { 
				private["_pos","_clutter"];
				_pos = getPosATL player;
				sleep 3; 	//give time for serv to create object
				_clutter = "ClutterCutter_small_EP1" createVehicleLocal _pos;
				_clutter setPosATL _pos;
			};

		};
		 
	} else {
		//Partial amount going to ground
		P2DZE_plr_dropGold = [player,objNull,_amount];
		publicVariableServer "P2DZE_plr_dropGold";


		//set has gold var
		P2DZE_hasGold = true;

		if (P2DZ_enableGoldSystemChat) then {
			systemChat(format["Gold: %1 dropped to ground.",_amount]);
		};

		//cut grass
		[] spawn { 
			private["_pos","_clutter"];
			_pos = getPosATL player;
			sleep 3; 	//give time for serv to create object
			_clutter = "ClutterCutter_small_EP1" createVehicleLocal _pos;
			_clutter setPosATL _pos;
		};
	};
};


if (P2DZE_goldItemHandlingDebug) then {
	diag_log("P2DEBUG: dropGold: hasGold: " + str P2DZE_hasGold);
};
//close gear menu
closeDialog 0;

//call display update
[] call ui_displayGold;
P2DZE_goldRunning = false;