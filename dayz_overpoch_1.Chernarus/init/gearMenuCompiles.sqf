	fn_gearMenuChecks =			compile preprocessFileLineNumbers "compile\fn_gearMenuChecks.sqf";
	object_monitorGear =		compile preprocessFileLineNumbers "compile\object_monitorGear.sqf";

	player_gearSync	=			compile preprocessFileLineNumbers "compile\player_gearSync.sqf";
	player_gearSet	=			compile preprocessFileLineNumbers "compile\player_gearSet.sqf";
	ui_gear_sound =             compile preprocessFileLineNumbers "compile\ui_gear_sound.sqf";

	player_countmagazines =		compile preprocessFileLineNumbers "actions\player_countmagazines.sqf";
	player_addToolbelt =		compile preprocessFileLineNumbers "actions\player_addToolbelt.sqf";


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
	};

	ui_displayGold = {
		disableSerialization;
		private["_gearControl","_itemName","_itemPic","_itemDesc","_imageText","_itemDesc","_gold"];

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