	fn_gearMenuChecks =			compile preprocessFileLineNumbers "compile\fn_gearMenuChecks.sqf";
	object_monitorGear =		compile preprocessFileLineNumbers "compile\object_monitorGear.sqf";

	player_gearSync	=			compile preprocessFileLineNumbers "compile\player_gearSync.sqf";
	player_gearSet	=			compile preprocessFileLineNumbers "compile\player_gearSet.sqf";
	ui_gear_sound =             compile preprocessFileLineNumbers "compile\ui_gear_sound.sqf";

	player_countmagazines =		compile preprocessFileLineNumbers "actions\player_countmagazines.sqf";
	player_addToolbelt =		compile preprocessFileLineNumbers "actions\player_addToolbelt.sqf";



	/*---------------------------------------------------------------------------
	player_checkGold
	Description:
	This gets run whenever a player scrolls to pickup an object or every 0.1s
	when the player has their gear menu open.
	
	It performs the following checks / functions
	
	Check Current Items:

		If player has Gold:
			if player had gold previously
				if player did have gold previously
					if player picked up 2nd gold bar item
						[] call player_pickupGold;
				if player did not have gold previously
					[] call player_pickupGold;
		If Player does not Have Gold:

			If player had gold previously
				if player had gold
					[] call player_dropGold;
				if player did not have gold
					If player should have gold (zombzVar)
						_unit addMagazineGlobal "ItemGoldBar10oz";

	---------------------------------------------------------------------------*/
	P2DZE_goldItemHandlingDebug = true; //enable debug messages
	P2DZE_hasGold = false;			// - gets modified by checkGoldItems & pickupgold & dropgold
	P2DZE_gearOnContainer = false; // - gets modified in object_monitorGear.sqf
	s_player_takeGold = -1;


	/* Take Gold self Actions - Checks for Piles of Gold */
	[] spawn {
		private["_cT","_weaponHolderContents","_item","_itemCount"];
		_cT = cursorTarget;

		while {true} do {
			_cT = cursorTarget;

			if (_cT isKindOf "WeaponHolder") then {
				_weaponHolderContents = getMagazineCargo _cT;
				_item = _weaponHolderContents select 0;
				_item = _item select 0;
				if ((_item) == "ItemGoldBar10oz") then {
					if (s_player_takeGold < 0) then {					
						s_player_takeGold = player addaction[("Take Gold"),"actions\takeGold.sqf",_cT, -1, true, true, "", ""]; 
					}; 
				} else {
					player removeAction s_player_takeGold; 
					s_player_takeGold = -1; 
				};
			}  else {
				player removeAction s_player_takeGold; 
				s_player_takeGold = -1; 
			};

			sleep 0.5;
		};
	}; 


	player_checkGoldItems = {
		private["_unit","_mags","_bp","_bpMags","_goldCountInv","_goldCountBackpack","_goldCount","_goldVar","_result2"];
		_unit = player;
		_bp = unitBackpack _unit;

		_mags = magazines _unit;
		_bpMags = magazines _bp;

		_goldVar = 0;
		_result2 = "null";

		_goldCountInv = 0;
		_goldCountBackpack = 0;

		_goldCountInv = {"ItemGoldBar10oz" == _x} count _mags;
		_goldCountBackpack = {"ItemGoldBar10oz" == _x} count _bpMags;

		_goldCount = _goldCountInv + _goldCountBackpack;

		//If player has gold bar item
		if (_goldCount > 0) then {
			
			//if player did not have gold bar item prior
			if (!P2DZE_hasGold) then {
				P2DZE_hasGold = true;
				[] call player_pickupGold;
				_result2 = "HasGoldItem: Player did NOT have gold bar item prior, running player_pickupGold...";

			//if player did have gold bar item prior
			} else {

				//get players gold
				_goldVar = _unit getVariable ["ZombZGold", 0];
				//if player should not have gold bar item
				_result2 = "nochange";

				//if player picked up another gold bar item
				if (_goldCount > 1) then {
					_unit removeMagazine "ItemGoldBar10oz";
					[] call player_pickupGold;
					_result2 = "HasGoldItem: player had 2 gold bar items, running player_pickupGold...";
				};
			};
		//if player does not have gold bar item
		} else {

			//if player had gold bar item prior
			if (P2DZE_hasGold) then {
				[] call player_dropGold;
				_result2 = "HasNoGold: Player DID have gold bar item prior, running player_dropGold...";

			//if player did not have gold bar item prior
			} else {
				//get players gold
				_goldVar = _unit getVariable ["ZombZGold", 0];
				//if player should have gold bar item
				if (_goldVar > 0) then {
					_unit addMagazine "ItemGoldBar10oz";
					P2DZE_hasGold = true;
					_result2 = "HasNoGold: player should have gold bar, giving item...";
				//if player has no gold
				} else {
					P2DZE_hasGold = false;
					_result2 = "nochange";
				};
			};
		};
		
		if (P2DZE_goldItemHandlingDebug) then {
			if !(_result2 == "nochange") then {
				diag_log("	  " + str _result2);
			};
		};

		true
	};


	player_dropGold = {
		private ["_objGoldVar","_plyrGoldVar","_newGold","_object","_objectName","_strResult","_control","_text","_nearObjects","_iPos","_radius","_item"];
		_object = objNull;

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

				if ("ItemGoldBar10oz" in (getMagazineCargo _object)) then {
					diag_log("in");
					_object removeMagazines "ItemGoldBar10oz";
					_object addMagazineCargoGlobal ["ItemGoldBar10oz", 1];
				} else {
					diag_log("notinyet");
				};

				//get object gold
				_objGoldVar = _object getVariable ["ZombZGold", 0];

				//new gold = objects gold + players gold
				_newGold = _objGoldVar + _plyrGoldVar;
				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" DropGold: onContainer: (true) _obj: (%1) _objGoldVar: (%2) _plyrGoldVar: (%3) _newGold: (%4)", str(typeOf _object), _objGoldVar, _plyrGoldVar, _newGold]);
				};

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

						if ("ItemGoldBar10oz" in (getMagazineCargo _object)) then {
							_object removeMagazines "ItemGoldBar10oz";
							_object addMagazineCargoGlobal ["ItemGoldBar10oz", 1];
						};

						//get object gold
						_objGoldVar = _object getVariable ["ZombZGold", 0];

						//new gold = objects gold + players gold
						_newGold = _objGoldVar + _plyrGoldVar;
						if (P2DZE_goldItemHandlingDebug) then {
							diag_log(format[" DropGold: onContainer: (true) _obj: (%1) _objGoldVar: (%2) _plyrGoldVar: (%3) _newGold: (%4)", str(typeOf _object), _objGoldVar, _plyrGoldVar, _newGold]);
						};
						//set objects gold
						_object setVariable ["ZombZGold", _newGold, true];
						//set players gold
						player setVariable ["ZombZGold", 0, true];

					};

				} forEach _nearObjects;

				if !(isNull _object) then {
					//output error info (they will get 1 free gold per reproduction of this bug)
					diag_log("P2DEBUG: player_dropGold: ERROR: _object is Null!");
					systemChat("Drop Gold Error: Cursor Target is Null!");
				};
			};

		//If gear is going to ground
		} else {
			
			_newGold = 0;

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
	};


	player_pickupGold = {
		private ["_newGold","_object","_objGoldVar","_plyrGoldVar","_objectName","_strResult","_control","_text","_nearObjects"];
		_plyrGoldVar = player getVariable ["ZombZGold", 0];
		_object = objNull;
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

				//new gold = objects gold + players gold
				_newGold = _objGoldVar + _plyrGoldVar;

				if (P2DZE_goldItemHandlingDebug) then {
					diag_log(format[" PickupGold: onContainer: (true) _obj: (%1) _objGoldVar: (%2) _plyrGoldVar: (%3) _newGold: (%4)", str(typeOf _object), _objGoldVar, _plyrGoldVar, _newGold]);
				};

				//set players gold
				player setVariable ["ZombZGold", _newGold, true];

				//remove gold from object
				_object setVariable ["ZombZGold", 0, true];
				_object removeMagazines "ItemGoldBar10oz";

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

						//new gold = objects gold + players gold
						_newGold = _objGoldVar + _plyrGoldVar;

						if (P2DZE_goldItemHandlingDebug) then {
							diag_log(format[" PickupGold: onContainer: (true) _obj: (%1) _objGoldVar: (%2) _plyrGoldVar: (%3) _newGold: (%4)", str(typeOf _object), _objGoldVar, _plyrGoldVar, _newGold]);
						};

						//set players gold
						player setVariable ["ZombZGold", _newGold, true];

						//remove gold from object
						_object setVariable ["ZombZGold", 0, true];
						_object removeMagazines "ItemGoldBar10oz";

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
	};


	ui_goldInit = {
		private ["_ctrlText","_len"];
		disableSerialization;
		waitUntil {ctrlShown ((findDisplay 106) displayCtrl 105)};
		((findDisplay 106) displayCtrl 105) ctrlSetEventHandler ["LBSelChanged","private [""_dummy""]; _dummy = [_this,""onLBSelChanged""] execVM ""system\handleGear.sqf""; [] call ui_displayGold; _dummy;"];
		waitUntil {
			_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1101);
			_len=[_ctrlText] call {
				private["_in","_arr","_len"];
				_in=_this select 0;
				_arr=[_in] call {
					private["_in","_i","_arr","_out"];
					call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
					_out
				};
				_len=count (_arr);
				_len
			};
			_len > 3
		};
		waitUntil {
			_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1106);
			_len=[_ctrlText] call {
				private["_in","_arr","_len"];
				_in=_this select 0;
				_arr=[_in] call {
					private["_in","_i","_arr","_out"];
					call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
					_out
				};
				_len=count (_arr);
				_len
			};
			_len > 3
		};
		waitUntil {
			_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1104);
			_len=[_ctrlText] call {
				private["_in","_arr","_len"];
				_in=_this select 0;
				_arr=[_in] call {
					private["_in","_i","_arr","_out"];
					call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
					_out
				};
				_len=count (_arr);
				_len
			};
			_len > 3
		};
		[] call ui_displayGold;
		uiSleep 0.1;
		[] call ui_displayGold;
	};

	ui_displayGold = {
		private ["_gearControl","_itemName","_itemPic","_itemDesc","_imageText","_gold","_plyrGoldVar","_object","_objGoldVar","_objectName","_strResult","_control","_text","_nearObjects","_onPlayer","_itemText","_lbIDC","_lbcontrol","_lbsize","_lbRows","_inCargo"];
		disableSerialization;

		_gold = (player getVariable ["ZombZGold", 0]);

		_gearControl = (findDisplay 106); 
		_itemName = ((_gearControl) displayCtrl 1101);
		_itemPic = ((_gearControl) displayCtrl 1104);
		_itemDesc = ((_gearControl) displayCtrl 1106);

		_itemName ctrlSetText "	Gold Bars";
		_itemPic ctrlSetText "\z\addons\dayz_epoch\pictures\equip_gold_bar_10oz_CA.paa";
		_imageText = parseText format["
		<img size='1.5' image='\z\addons\dayz_epoch\pictures\equip_gold_bar_CA.paa' />x	%1
		<br/><t size='0.74'>Gold bars, the only currency in Chernarus. They use one slot no matter how many you carry.", _gold];
		_itemDesc ctrlSetStructuredText _imageText;

		_lbIDC = 105;
		_inCargo = "";
		_onPlayer = "";
		_itemText = "";
		_object = objNull;

		_lbcontrol = _gearControl displayctrl _lbIDC;
		_lbsize = lnbSize _lbControl;
		_lbRows = _lbSize select 0;


		for "_i" from 0 to _lbRows do {
			_inCargo = "";
			_onPlayer = "";
			_itemText = "";

			_itemText = _lbcontrol lnbText [_i,1];

			if ((_itemText) == "10oz Gold") then {
				_onPlayer = _lbcontrol lnbText [_i,2];
			 	_inCargo = _lbcontrol lnbText [_i,0];

			 	if (!((_onPlayer) == "") && ((_inCargo) == "")) then {
		 			_plyrGoldVar = player getVariable ["ZombZGold", 1];
		 			_lbcontrol lnbSetText [[_i,1], (str _plyrGoldVar + " Gold Bars")]; 
			 	} else {

					if (vehicle player != player) then {
						_object = vehicle player;
					} else {
						_object = cursorTarget;
					};
		 
					if !(isNull _object) then {
						_objGoldVar = _object getVariable ["ZombZGold", 1];
			 			_lbcontrol lnbSetText [[_i,1], (str _objGoldVar + " Gold Bars")]; 
					} else {
						disableSerialization;
						_control = (findDisplay 106) displayCtrl 156;
						_text = ctrlText _control;
						_nearObjects = nearestObjects [position player, ["Man","AllVehicles","Land_A_Tent","VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"], 30];
						{
							_objectName = getText (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
							_strResult = [_text,_objectName] call KRON_StrInStr;

							if (_strResult) then {
								_object = _x;
								_objGoldVar = _object getVariable ["ZombZGold", 1];
			 					_lbcontrol lnbSetText [[_i,1], (str _objGoldVar + " Gold Bars")]; 
							};

						} forEach _nearObjects;
					};
			 	};
			};
		};
		 
		true
	};

	dayz_losChance = {
		private["_agent","_maxDis","_dis","_val","_maxExp","_myExp"];
		_agent = 	_this select 0;
		_dis =		_this select 1;
		_maxDis = 	_this select 2;
		_val = 		(_maxDis - _dis) max 0;
		_maxExp = 	((exp 2) * _maxDis);
		_myExp = 	((exp 2) * (_val)) / _maxExp;
		_myExp = _myExp * 0.7;
		_myExp
	};

	ui_initDisplay = {
		private["_control","_ctrlBleed","_display","_ctrlFracture","_ctrlDogFood","_ctrlDogWater","_ctrlDogWaterBorder", "_ctrlDogFoodBorder"];
		disableSerialization;
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		_control = 	_display displayCtrl 1204;
		_control ctrlShow false;
		if (!r_player_injured) then {
			_ctrlBleed = 	_display displayCtrl 1303;
			_ctrlBleed ctrlShow false;
		};
		if (!r_fracture_legs && !r_fracture_arms) then {
			_ctrlFracture = 	_display displayCtrl 1203;
			_ctrlFracture ctrlShow false;
		};
		_ctrlDogFoodBorder = _display displayCtrl 1501;
		_ctrlDogFoodBorder ctrlShow false;
		_ctrlDogFood = _display displayCtrl 1701;
		_ctrlDogFood ctrlShow false;

		_ctrlDogWaterBorder = _display displayCtrl 1502;
		_ctrlDogWaterBorder ctrlShow false;
		_ctrlDogWater = _display displayCtrl 1702;
		_ctrlDogWater ctrlShow false
	};

	dayz_losCheck = {
		private["_target","_agent","_cantSee"];
		_target = _this select 0; // PUT THE PLAYER IN FIRST ARGUMENT!!!!
		_agent = _this select 1;
		_cantSee = true;
		if (!isNull _target) then {

			_tPos = visiblePositionASL _target;
			_zPos = visiblePositionASL _agent;

			_tPos set [2,(_tPos select 2)+1];
			_zPos set [2,(_zPos select 2)+1];

			if ((count _tPos > 0) && (count _zPos > 0)) then {
				_cantSee = terrainIntersectASL [_tPos, _zPos];
				if (!_cantSee) then {
					_cantSee = lineIntersects [_tPos, _zPos, _agent, vehicle _target];
				};
			};
		};
		_cantSee
	};

	dayz_equipCheck = {
		private ["_empty", "_needed","_diff","_success"];
		_config = _this;
		_empty = [player] call BIS_fnc_invSlotsEmpty;
		_needed = [_config] call BIS_fnc_invSlotType;
		_diff = [_empty,_needed] call BIS_fnc_vectorDiff;

		_success = true;
		{
			if (_x > 0) then {_success = false};
		} count _diff;
		hint format["Config: %5\nEmpty: %1\nNeeded: %2\nDiff: %3\nSuccess: %4",_empty,_needed,_diff,_success,_config];
		_success
	};

	vehicle_gear_count = {
		private["_counter"];
		_counter = 0;
		{
			_counter = _counter + _x;
		} count _this;
		_counter
	};

	player_tagFriendlyMsg = {
		if(player == (_this select 0)) then {
			cutText[(localize "str_epoch_player_2"),"PLAIN DOWN"];
		};
	};

	player_serverModelChange = {
		private["_object","_model"];
		_object = _this select 0;
		_model = _this select 1;
		if (_object == player) then {
			_model call player_switchModel;
		};
	};

	player_guiControlFlash = 	{
		private["_control"];
		_control = _this;
		if (ctrlShown _control) then {
			_control ctrlShow false;
		} else {
			_control ctrlShow true;
		};
	};
	
	gearDialog_create = {
		private ["_i","_dialog"];
		if (!isNull (findDisplay 106)) then {
			(findDisplay 106) closeDisplay 0;
		};
		openMap false;
		closeDialog 0;
		if (gear_done) then {sleep 0.001;};
		player action ["Gear", player];
		if (gear_done) then {sleep 0.001;};
		_dialog = findDisplay 106;
		_i = 0;
		while {isNull _dialog} do {//DO NOT CHANGE TO A FOR LOOP!
			_i = _i + 1;
			_dialog = findDisplay 106;
			if (gear_done) then {sleep 0.001;};
			if (_i in [100,200,299]) then {
				closeDialog 0;
				player action ["Gear", player];
			};
			if (_i > 300) exitWith {};
		};
		if (gear_done) then {sleep 0.001;};
		_dialog = findDisplay 106;
		if ((parseNumber(_this select 0)) != 0) then {
			ctrlActivate (_dialog displayCtrl 157);
			if (gear_done) then {
				waitUntil {ctrlShown (_dialog displayCtrl 159)};
				sleep 0.001;
			};
		};
		_dialog
	};

	gear_ui_offMenu = {
		private["_control","_parent","_menu"];
		disableSerialization;
		_control = 	_this select 0;
		_parent = 	findDisplay 106;
		if (!(_this select 3)) then {
			for "_i" from 0 to 9 do {
				_menu = _parent displayCtrl (1600 + _i);
				_menu ctrlShow false;
			};
			_grpPos = ctrlPosition _control;
			_grpPos set [3,0];
			_control ctrlSetPosition _grpPos;
			_control ctrlShow false;
			_control ctrlCommit 0;
		};
	};

	dze_surrender_off = {
		player setVariable ["DZE_Surrendered", false, true];
		DZE_Surrender = false;
	};

	gear_ui_init = {
		private["_control","_parent","_menu","_dspl","_grpPos"];
		disableSerialization;
		_parent = findDisplay 106;
		_control = 	_parent displayCtrl 6902;
		for "_i" from 0 to 9 do {
			_menu = _parent displayCtrl (1600 + _i);
			_menu ctrlShow false;
		};
		_grpPos = ctrlPosition _control;
		_grpPos set [3,0];
		_control ctrlSetPosition _grpPos;
		_control ctrlShow false;
		_control ctrlCommit 0;
	};

	dayz_eyeDir = {
		private["_vval","_vdir"];
		_vval = (eyeDirection _this);
		_vdir = (_vval select 0) atan2 (_vval select 1);
		if (_vdir < 0) then {_vdir = 360 + _vdir};
		_vdir
	};

	DZE_getModelName = {
		_objInfo = toArray(str(_this));
		_lenInfo = count _objInfo - 1;
		_objName = [];
		_i = 0;
		// determine where the object name starts
		{
			if (58 == _objInfo select _i) exitWith {};
			_i = _i + 1;
		} count _objInfo;
		_i = _i + 2; // skip the ": " part
		for "_k" from _i to _lenInfo do {
			_objName set [(count _objName), (_objInfo select _k)];
		};
		_objName = toLower(toString(_objName));
		_objName
	};

	dze_isnearest_player = {
		private ["_notClosest","_playerDistance","_nearPlayers","_obj","_playerNear"];
		if(!isNull _this) then {
			_nearPlayers = _this nearEntities ["CAManBase", 12];
			_playerNear = ({isPlayer _x} count _nearPlayers) > 1;
			_notClosest = false;
			if (_playerNear) then {
				// check if another player is closer
				_playerDistance = player distance _this;
				{
					if (_playerDistance > (_x distance _this)) exitWith { _notClosest = true; };
				} count _nearPlayers;
			};
		} else {
			_notClosest = false;
		};
		_notClosest
	};


		//This is still needed but the fsm should terminate if any errors pop up.
	[] spawn {
        private["_timeOut","_timeOutMax","_display","_control1","_control2"];
        disableSerialization;
        _timeOut = 0;
        dayz_loadScreenMsg = "";
        diag_log "DEBUG: loadscreen guard started.";
        _display = uiNameSpace getVariable "BIS_loadingScreen";
        if (!isNil "_display") then {
                _control1 = _display displayctrl 8400;
                _control2 = _display displayctrl 102;
        };
		if (!isNil "dayz_DisplayGenderSelect") then {
			waitUntil {!dayz_DisplayGenderSelect};
		};

        // 90 secc timeout (9000 * 0.01)
        //time out gloal var
        _timeOutmax = P2DZ_LoadingTimeOut * 100;

        while { _timeOut < _timeOutmax } do {
            if (dayz_clientPreload && dayz_authed) exitWith { diag_log "PLOGIN: Login loop completed!"; };
            if (!isNil "_display") then {
                if ( isNull _display ) then {
                        waitUntil { !dialog; };
                        startLoadingScreen ["","RscDisplayLoadCustom"];
                        _display = uiNameSpace getVariable "BIS_loadingScreen";
                        _control1 = _display displayctrl 8400;
                        _control2 = _display displayctrl 102;
                };

                if ( dayz_loadScreenMsg != "" ) then {
                        _control1 ctrlSetText dayz_loadScreenMsg;
                        dayz_loadScreenMsg = "";
                };

                _control2 ctrlSetText format["%1",round(_timeOut*0.01)];
            };

            _timeOut = _timeOut + 1;

            if (_timeOut >= _timeOutmax) then {
                1 cutText [("ZombZ: " + localize "str_player_login_timeout" + " Please Try Again!"), "PLAIN DOWN"];
                sleep 5;
                endLoadingScreen;
                endMission "END1";
            };

            sleep 0.01;
        };
	};