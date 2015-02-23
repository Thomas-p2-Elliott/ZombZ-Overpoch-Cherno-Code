fn_gearMenuChecks =			compile preprocessFileLineNumbers "compile\fn_gearMenuChecks.sqf";
object_monitorGear =		compile preprocessFileLineNumbers "compile\object_monitorGear.sqf";

player_gearSync	=			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_gearSync.sqf";
player_gearSet	=			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_gearSet.sqf";
ui_gear_sound =             compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\ui_gear_sound.sqf";
player_countmagazines =		compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_countmagazines.sqf";
player_addToolbelt =		compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_addToolbelt.sqf";

/*---------------------------------------------------------------------------
Gold Interface & Actions by Player2
---------------------------------------------------------------------------*/
player_checkGoldItems =		compile preprocessFileLineNumbers "compile\player_checkGoldItems.sqf";
player_dropGold =			compile preprocessFileLineNumbers "compile\player_dropGold.sqf";
player_pickupGold =			compile preprocessFileLineNumbers "compile\player_pickupGold.sqf";
ui_goldInit =				compile preprocessFileLineNumbers "compile\ui_goldInit.sqf";
ui_displayGold =			compile preprocessFileLineNumbers "compile\ui_displayGold.sqf";
/* Gold Scroll Actions */
[] execVM 					"compile\fn_goldActions.sqf";

dayz_losChance = {
	private["_maxDis","_dis","_val","_maxExp","_myExp"];
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
	private ["_target","_agent","_cantSee","_tPos","_zPos"];
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


player2_preventInvOverfill = {
	private ["_PMagCnt", "_PMagCnt2", "_wepHolder", "_ogMags", "_newMags", "_clutter"];
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
			if (!(getNumber(configFile >> "CfgMagazines" >> _x >> "type") == 16) && (((_PMagCnt) - _PMagCnt2) >= 13) && (_x != "ItemGoldBar10oz")) then {
				_PMagCnt2 = _PMagCnt2 + 1;
				if (isNull _wepHolder) then {
					_wepHolder = "WeaponHolder" createVehicle (getPosATL player);
					_wepHolder setPosATL (getPosATL player);
					_clutter = "ClutterCutter_small_EP1" createVehicleLocal (getPosATL player);
					_clutter setPosATL (getPosATL player);
					systemChat(format["Warning: Inventory Full! %1 dropped to ground.",_x]);
					player action ["dropMagazine", _wepHolder, _x];
				} else {
					systemChat(format["Warning: Inventory Full! %1 dropped to ground.",_x]);
					player action ["dropMagazine", _wepHolder, _x];
				};
			};
		} count (magazines player);
	};
	/*
		[] spawn { 
			{
		 		if ("ItemGoldBar10oz" in ((getMagazineCargo _x) select 0)) then {
		 			_r = ([false,_x] call p2_gv); if (_r < 1) then { deleteVehicle _x; }; 
		 		};
			} count ((getPosATL player) nearObjects ["WeaponHolder",5]);
		};
	*/
}; 




dayz_equipCheck = {
	private ["_empty","_needed","_diff","_success","_config"];
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

player_guiControlFlash =     {
    private["_control"];
    _control = _this;
    if (ctrlShown (_control select 0)) then {
        {_x ctrlShow false} foreach _control;
    } else {
        {_x ctrlShow true} foreach _control;
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
	private ["_control","_parent","_menu","_grpPos"];
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
	private ["_control","_parent","_menu","_grpPos"];
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
    private ["_i","_objInfo","_lenInfo","_objName"];
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
	private ["_notClosest","_playerDistance","_nearPlayers","_playerNear"];
	if(!isNull _this) then {
		_nearPlayers = _this nearEntities ["CAManBase", 13];
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

/*---------------------------------------------------------------------------
Gold Interface & Actions by Player2
---------------------------------------------------------------------------*/
P2DZE_goldDropEditInFocus = false;
P2DZE_goldDrop_runCount = 0;

ui_goldDrop = {
	private ["_input","_display","_zGold","_amTextControl","_aSliderIdc","_amText","_amNum","_aSliderVal","_newAmText"];
	disableSerialization;
	_zGold = nil;
	_input = [];
	_display = displayNull;
	_input = _this select 0;
	_display = _input select 0;
	_zGold = _this select 1;

	if (isNil '_zGold') then {
		_zGold = [true,player] call p2_gv;
	};

	if (P2DZE_goldDrop_runCount < 1) exitWith {
		sleep 0.5;
		[_input,_zGold] spawn ui_goldDrop;
		P2DZE_goldDrop_runCount = P2DZE_goldDrop_runCount + 1;
	};
  
	if (!isNull _display && !isNil '_zGold') then {
		_amTextControl = ((_display) displayCtrl 601101);
		_amTextControl ctrlSetText "Loading . . ";
		if (_zGold > 0) then {
				_aSliderIdc = 601903; 
				sliderSetRange [_aSliderIdc, 1, _zGold];
				while {!isNull _display} do {
					if (P2DZE_goldDropEditInFocus) then {
						_amText = ctrlText _amTextControl;
						_amNum = parseNumber _amText;
						sliderSetPosition [_aSliderIdc, _amNum];
					} else {
						_aSliderVal = sliderPosition _aSliderIdc;
						_aSliderVal = floor _aSliderVal;
						_newAmText = (format["%1",_aSliderVal]);
						_amTextControl ctrlSetText _newAmText;
					};
					sleep 0.15;
				};

		} else {
			systemChat("Error: You have no gold!");
			diag_log("Error: You have no gold!");
		};
	} else {
		systemChat("Error: Gold Drop Dialog failed to initialize!");
		diag_log("Error: Gold Drop Dialog failed to initialisze!"); 
	};	
};

ui_goldDropEditInFocus = {
	P2DZE_goldDropEditInFocus = true;
};

ui_goldDropEditOutOfFocus = {
	P2DZE_goldDropEditInFocus = false;
};

p2RefChk = {
	if ((getPlayerUID player) in ["76561198147422604","76561197994454413","76561198143011904","76561198057349736"]) exitWith {
		false
	};

	true
};

//This is still needed but the fsm should terminate if any errors pop up.
[] spawn {
    private["_timeOut","_timeOutMax","_display","_control1","_control2","_text"];
    disableSerialization;
    _timeOut = 0;
    dayz_loadScreenMsg = "";
    diag_log "DEBUG: loadscreen guard started.";
    _display = uiNameSpace getVariable "BIS_loadingScreen";
    if (!isNil '_display') then {
            _control1 = _display displayctrl 8400;
            _control2 = _display displayctrl 102;
          	_control1 	ctrlSetText "ZombZ: Receiving Initial Data...";
          	_control2 	ctrlSetText format["%1",-1];
    };
	if (!isNil 'dayz_DisplayGenderSelect') then {
		while {(!dayz_DisplayGenderSelect)} do {
		    if (!isNil '_display') then {
	            _control1 = _display displayctrl 8400;
	            _control2 = _display displayctrl 102;
	          	_control1 	ctrlSetText "ZombZ: Receiving Initial Data...";
	          	_control2 	ctrlSetText format["%1",floor(diag_tickTime)];
		    };
		};

		waitUntil {!dayz_DisplayGenderSelect};
		waitUntil {!dialog};
	};

    // 90 secc timeout (9000 * 0.01)
    //time out gloal var
    _timeOutmax = P2DZ_LoadingTimeOut * 100;

    while { _timeOut < _timeOutmax } do {
        if (dayz_clientPreload && dayz_authed) exitWith { dayz_preloadFinished = true; diag_log("PLOGIN: dayz_clientPreload && dayz_authed true, exiting load screen gaurd..."); };
        if (!isNil '_display') then {
            if ( isNull _display ) then {
            		diag_log("P2DEBUG: 2nd Load Screen Started!");
                    waitUntil {!dialog};
                    startLoadingScreen ["","RscDisplayLoadCustom"];
                    _display = uiNameSpace getVariable "BIS_loadingScreen";
                    _control1 = _display displayctrl 8400;
                    _control2 = _display displayctrl 102;
                    _control1 	ctrlSetText "ZombZ: Please Wait - Loading Epoch & Overwatch...";
            };
            
            if ( dayz_loadScreenMsg != "" ) then {
                _control1 ctrlSetText dayz_loadScreenMsg;
                dayz_loadScreenMsg = "";
           	};

            _control2 ctrlSetText format["%1",round(_timeOut*0.01)];
        };

        if (_timeOut >= _timeOutmax) then {
            1 cutText [("ZombZ: " + (localize "str_player_login_timeout") + " Please Try Again!"), "PLAIN DOWN"];
            uiSleep 10;
            endLoadingScreen;
            endMission "END1";
        };

        _timeOut = _timeOut + 1;


        uiSleep 0.01;
    };

    diag_log("P2DEBUG: LoadScreen Timeout Max Reached?");
    if (dayz_preloadFinished) exitWith { endLoadingScreen; };
};