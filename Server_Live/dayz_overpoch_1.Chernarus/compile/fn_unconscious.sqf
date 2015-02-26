private ["_ttSet", "_totalTimeout", "_screenDisp", "_txtCtrl"];
disableSerialization;

//Make sure KO thread isn't already running
if ((!r_player_handler1) && (r_handlerCount == 0)) then {
	//Maximise Penalty for Severe Wounds
	if (r_player_cardiac) then { r_player_timeout = r_player_timeout max 90; };
	//Make sure penalty is minimum of 5 seconds
	r_player_timeout = r_player_timeout max 5;
	//Make sure penalty never exceeds 90 seconds
	r_player_timeout = r_player_timeout min 90;
	//Used later for total time left
	_ttSet = false;

	//Global Use (Prevents KO thread running twice)
	r_handlerCount = r_handlerCount + 1;
	r_player_handler1 = true;

	//Client-Side Effects
	player playAction "CanNotMove";
	"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [2]; "dynamicBlur" ppEffectCommit 0;
	"colorCorrections" ppEffectEnable true;"colorCorrections" ppEffectEnable true;"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.1],  [1, 1, 1, 0.0]];"colorCorrections" ppEffectCommit 0;
	0 fadeSound 0.05;

	//Dont Continue if player is Dead
	if (r_player_dead) exitWith { };

	//KO/Loading Screen Start
	if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] == "No display") then {
		startLoadingScreen ["","RscDisplayLoadCustom"];
		diag_log(format["P2DEBUG: %1","fn_unconscious:	KO Screen Started"]);	
	};

	//Set Screen Text
   	_screenDisp = uiNameSpace getVariable "BIS_loadingScreen";
   	if (format["%1",(_screenDisp)] != "No display") then {
   		_txtCtrl = _screenDisp displayctrl 102;
   		if (format["%1",(_txtCtrl)] != "No control") then {
   			_txtCtrl ctrlSetText format["You are unconscious...You will wake up in: %1", r_player_timeout];
   		};
   	};

   	//Start KO Loop
	while {r_player_unconscious} do {

		//Sound Effect
		playSound "heartbeat_1";

		//Loop Sleep Timer
		uiSleep 1;

		//Setup total KO Time for Screen Message
		if (!_ttSet) then {
			_totalTimeout = r_player_timeout;
			_ttSet = true;
		};

		//Debugging
		diag_log(format["P2DEBUG: KO Timer:		Remaining: (%1),	Total:	(%2),	Progress: (%3)",r_player_timeout,_totalTimeout,(0 max (1 min (1 - (r_player_timeout / _totalTimeout))))]);

		//Set Screen Text
	   	_screenDisp = uiNameSpace getVariable "BIS_loadingScreen";
	   	if (format["%1",(_screenDisp)] != "No display") then {
	   		_txtCtrl = _screenDisp displayctrl 102;
	   		if (format["%1",(_txtCtrl)] != "No control") then {
	   			_txtCtrl ctrlSetText format["You are unconscious...You will wake up in: %1", r_player_timeout];

			   	//Progress Loading Bar
		    	progressLoadingScreen (0 max (1 min (1 - (r_player_timeout / _totalTimeout))));
	   		};
	   	};

		//Check timer status
		if (r_player_timeout > 0) then {
			r_player_timeout = r_player_timeout - 1;
		} else {
			//Timer Ran out

			//If player not dead, recover
			if (!r_player_dead) then {
				r_player_unconscious = false;
				player setVariable["NORRN_unconscious", false];
				_nul = [] spawn fnc_usec_recoverUncons;
			};

			//Regardless of dead/alive, close loading/ko screen
			if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
				endLoadingScreen;
				r_player_unconscious = false;
				player setVariable["NORRN_unconscious", false];
				_nul = [] spawn fnc_usec_recoverUncons;

				diag_log(format["P2DEBUG: %1","fn_unconscious:	Close Screen (Timer Ran out)"]);
			};	
		};

		//Check KO Status
		if (!(player getVariable ["NORRN_unconscious", true])) then {
			r_player_unconscious = false;
			player setVariable["NORRN_unconscious", false];
			_nul = [] spawn fnc_usec_recoverUncons;

			if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
				endLoadingScreen;
				diag_log(format["P2DEBUG: %1","fn_unconscious:	Close Screen (Player EPI'd/Woke Up)"]);	
			};
		};

		//Check Anim Status
		if(animationState player == "AmovPpneMstpSnonWnonDnon_healed") then {
			r_player_unconscious = false;
			player setVariable["NORRN_unconscious", false];
			_nul = [] spawn fnc_usec_recoverUncons;

			if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
				endLoadingScreen;
				diag_log(format["P2DEBUG: %1","fn_unconscious:	Close Screen (Woke up Anim)"]);	
			};
		};
	};

	diag_log(format["P2DEBUG: %1","KO Thread Finished (r_player_unconscious Loop Ended)"]);

	//Player no longer KO'd...
	//Save Vars
	r_player_unconscious = false;
	player setVariable["NORRN_unconscious", false];

	//Fade Sound & Colour back in
	if (!r_player_injured && ((r_player_blood/r_player_bloodTotal) >= 0.5)) then {
		10 fadeSound 1;
		"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
	};

	//Close Screen
	if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
		endLoadingScreen;
		diag_log(format["P2DEBUG: %1","fn_unconscious:	Close Screen (r_player_unconscious Loop Ended)"]);	
	};

	//Enable new KO thread to be created
	r_handlerCount = r_handlerCount - 1;
};
