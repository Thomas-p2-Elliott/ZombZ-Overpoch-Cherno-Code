// 0 = Disabled, 1 = Chat, 2 = Full
P2DZ_notifsEvents = 2;
P2DZ_notifsKills = 	2;
P2DZ_notifsServer = 2;
P2DZ_notifsMode = 	[P2DZ_notifsEvents,P2DZ_notifsKills,P2DZ_notifsServer];

//Used for GUI notifications queue
P2DZ_guiNotif_lT = 0;
P2DZ_guiNotif_lL = 0;

P2DZ_sysChat = {
	private["_t","_m"];
	_t = _this select 0;
	_m = _this select 1;

	switch (_t) do {
		default { };
		case 0: { 	if (P2DZ_notifsEvents != 0) then { 	systemChat(_m); }; };
		case 1: { 	if (P2DZ_notifsKills  != 0) then { 	systemChat(_m); }; };
		case 2: { 	if (P2DZ_notifsServer != 0) then { 	systemChat(_m); }; };
	};
};

P2DZ_guiNotif = {
	disableSerialization;
	private ["_tt","_mt","_il","_nd","_ty","_e","_m","_ui","_tts","_nt"];

	/* Player2's GUI Notifcation System - Client-Side Function

	Inputs:
		_m select 0:	Title Text (String: Structured Text)
		_m select 1:	Main Text  (String: Structured Text)
		_m select 2:	Image Location (String)
		_m select 3:	Notifcation Duration (Number: Seconds, Valid Values: 5,10,15,20,25,30, Anything Else/Not Included = 5)
		_m select 4:	Notification Type (Number: Valid Values: 0 - Event, 1 - Server, Anything Else/Not Included = Always Pass Through Regarldess of User UI Notification Preferences & Display Text in Chat with GUI Notif)
	Example:
		["ZOMBZ RESTART NOTIFICATION","This server will restart in 5 minutes","img\zz.paa",30]
	*/

	_m = _this;
	_tt = _m select 0;
	_mt = _m select 1;
	_il = _m select 2;
	_nd = _m select 3;

	//Validate Text Input
	if (isNil "_tt" || isNil "_mt") exitWith {
		diag_log(format["%1: ERROR: P2DZ_guiNotif: Bad Input: %2",__FILE__,_this]);
	};

	//Default Exit Value (if set to true script will exit)
	_e = false;

	//If type is passed in, check users preferences on GUI notifications
	if (count _m > 4) then {
		_ty = _m select 4;
		_e = switch (_ty) do {
			default { systemChat(format["%1: %2", _tt, _mt]); false };
			case 0: { if (P2DZ_notifsEvents != 2) then { true } else { false }; };
			case 1: { if (P2DZ_notifsServer != 2) then { true } else { false }; };
			case 420: { false };
		};
	};

	//If exit is true (aka they have this type of notif turned off) then systemchat the output (unless they have that turned off too!)
	if (_e) exitWith {
		switch (_ty) do {
			case 0: { 	if (P2DZ_notifsEvents != 0) then { 	systemChat(format["%1: %2", _tt, _mt]); }; };
			case 1: { 	if (P2DZ_notifsServer != 0) then { 	systemChat(format["%1: %2", _tt, _mt]); }; };
		};
	};

	//Convert Duration to proper Notification ClassName, 5 seconds if invalid
	_nt = switch (_nd) do {
		default { "p2_notif5" };
		case 5: { "p2_notif5" };
		case 10: { "p2_notif10" };
		case 15: { "p2_notif15" };
		case 20: { "p2_notif20" };
		case 25: { "p2_notif25" };
		case 30: { "p2_notif30" };
	};

	//Validate Proper Notif Classname
	if (isNil "_nt") then {
		_nt = "p2_notif5";
	};
	//Validate Notif Duration
	if (isNil "_nd") then {
		_nd = 5;
	};
	//Validate Image location
	if (isNil "_il") then {
		_il = "img\zz.paa"
	};

	if (!isNil "_ty") then {
		if (typeName _ty == "SCALAR") then {
			if (_ty == 420) then {
				if (alive player) then {
					if (isNil "p2dzEnd") then {
						p2dzEnd = [] spawn {
							closeDialog 0;
							player playMove "Aidlppnemstpsraswrfldnon0s";
							createDialog "RscDisplayMPInterrupt"; 
							uiSleep 42.0; endMission "END1"; 
						};
					};
				};	
			};	
		};	
	};

	//Check Any Existing Displays Time Left
	//If (Last Notif Time + Last Notif Duration + FadeOut Time) > Current Time
	//Aka if a notification is currently running
	if ((P2DZ_guiNotif_lT + P2DZ_guiNotif_lL + 1.5) > serverTime) then {
		_tts = ((P2DZ_guiNotif_lT + P2DZ_guiNotif_lL + 1.5 + 0.03) - serverTime); 	//Time to Sleep (Last Notif Time + Last Notif Duration + FadeOut Duration (1.5s) + A Moment) - Current Time
		//Set Last Notification Time In the future, so if another notif runs it will wait until this one has finished too
		//Last Notif Time = ServerTime + Time To Sleep + FadeTime + A Moment;
		P2DZ_guiNotif_lT = serverTime + _tts + _nd + 1.5 + 0.03;
		//Set Last Notification Duration Early
		P2DZ_guiNotif_lL = _nd;			//Last Notification Duration (Seconds)

		//Make sure time to sleep is not greater than 120 seconds
		if (_tts > 120) then {
			_tts = 120;
			P2DZ_guiNotif_lT = 0;
		};

		//Wait before showing notification
		uiSleep _tts;
	};

	420 cutText ["", "PLAIN"]; //Close Existing Display
	uiSleep 0.03;				//Hold up a moment
	420 cutRsc [_nt, "PLAIN"]; //Create New Display

	//Get created display, 
	_ui = uiNamespace getVariable [_nt, displayNull];

	//if fail to get display, re-run script with same params up to 3 times.
	if (str (_ui) == "no display") exitWith {
		diag_log("ERROR: P2DZ_guiNotif: GUI Failed to create, re-running!");

		//Insuring it doesn't keep running itself over and over, max attempts is 3
		if (isNil "P2DZ_guiNotif_rC") then { P2DZ_guiNotif_rC = 0; } else {
			P2DZ_guiNotif_rC = P2DZ_guiNotif_rC + 1;
		};
		if (P2DZ_guiNotif_rC < 4) exitWith {
			_this call P2DZ_guiNotif;
		};
	};

	//Reset failed run count as it was a success
	P2DZ_guiNotif_rC = 0;

	//Set frame background colour (DebugMon/UI Colour)
	((_ui) displayCtrl 700) ctrlSetBackgroundColor P2DZE_debugCol;
	//Set Title Text
	((_ui) displayCtrl 1100) ctrlSetStructuredText parseText(_tt);
	//Set Main Text
	((_ui) displayCtrl 1101) ctrlSetStructuredText parseText(_mt);
	//Set Image Location
	((_ui) displayCtrl 1200) ctrlSetText (_il);

	//Save Global Vars so next notification knows to wait before displaying if one exists
	//If these vars were set to future values earlier they'll be overwritten with real-run-time values here.
	P2DZ_guiNotif_lT = serverTime;	//Last Noitifcation Time (Seconds)
	P2DZ_guiNotif_lL = _nd;			//Last Notification Duration (Seconds)
};