P2DZ_disableTalkButton = false;
P2DZ_disableTalkTimeLeft = 0;
comment "byPlayer2";
P2DZ_disableSideChat = {
	disableSerialization;

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_disableSideChat"]);
	};

	if ((!isNull findDisplay 63)) then {
		if (P2DZ_disableTalkButton) then { ((findDisplay 63) displayCtrl 101) ctrlSetTextColor [1, 0, 0, 1]; comment "byPlayer2"; ((findDisplay 63) displayCtrl 101) ctrlSetText format["Disabled for %1",P2DZ_disableTalkTimeLeft]; };
		if ((!isNull findDisplay 55)) then {
			if ((ctrlText ((findDisplay 55) displayCtrl 101) == "\ca\ui\textures\mikrak.paa") || (ctrlText ((findDisplay 55) displayCtrl 101) == "img\no.paa")) then {
				if (((ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_SIDE_CHANNEL") || (ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_GLOBAL_CHANNEL") || (ctrlText ((findDisplay 63) displayCtrl 101) == "Group Channel")) || P2DZ_disableTalkButton) then {
					((findDisplay 55) displayCtrl 101) ctrlSetTextColor [1, 1, 1, 1]; ((findDisplay 55) displayCtrl 101) ctrlSetText "img\no.paa";
					[] spawn {
						if (isNil "reset_timer") then {
							reset_timer = true;
							uiSleep 1.5;
							P2DZ_disableTalkButton = true;
							P2DZ_disableTalkTimeLeft = 60;
							for "_i" from 0 to 60 do {
								if (P2DZ_disableTalkTimeLeft < 1) exitWith { P2DZ_disableTalkTimeLeft = 0; };
								P2DZ_disableTalkTimeLeft = P2DZ_disableTalkTimeLeft - 1;
								uiSleep 1;
							};
							P2DZ_disableTalkTimeLeft = 0;

							disconnect_me = nil;
							warn_one = nil;
							warn_last = nil;
							reset_timer = nil;
							P2DZ_disableTalkButton = false;
						};
					};

					if (isNil "disconnect_me") then {
						disconnect_me = 0;
					} else {
						disconnect_me = disconnect_me + 1;
						for "_i" from 1 to 7 do {
							comment "byPlayer2";
							if (((!isNull findDisplay 63) && (!isNull findDisplay 55))) then {
								((findDisplay 63) displayCtrl 101) ctrlSetTextColor [1, 1, 1, 1];	uiSleep 0.1;
								((findDisplay 63) displayCtrl 101) ctrlSetTextColor [1, 0, 0, 1];		
							};
						};
					};

					if (disconnect_me == 0 || disconnect_me  > 0) then {
						if (isNil "warn_one") then {
							warn_one = true;
							systemChat ("WARNING:");
							systemChat ("  ");
							systemChat ("  Please do not use voice on Global, Side, or Group Chat; this is your first and last warning.");
							systemChat ("  ");
							["beat04"] spawn P2DZ_really_loud_sounds;
							["Please do not use voice on Global, Side, or Group Chat; this is your first and last warning."] spawn P2DZ_double_cut;
						};
					};

					if (disconnect_me >= 4) then {
						if (isNil "warn_last") then {
							warn_last = true;
							playMusic ["PitchWhine",0];
							["beat04"] spawn P2DZ_really_loud_sounds;
							["We warned you about abusing voice chat..."] spawn P2DZ_double_cut;
							systemChat ("WARNING: You are about to be kicked for voice chat abuse.");
							uiSleep 2;
							1 fademusic 10;
							1 fadesound 10;
							endMission "END1";
						};
					};
				};
			};
		};
	};
};
