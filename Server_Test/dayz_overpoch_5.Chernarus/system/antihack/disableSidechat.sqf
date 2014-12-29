P2DZ_disableSideChat = {
	disableSerialization;

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_disableSideChat"]);
	};

	if (((!isNull findDisplay 63) && (!isNull findDisplay 55))) then {
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\ca\ui\textures\mikrak.paa") then {
			if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_SIDE_CHANNEL") || (ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_GLOBAL_CHANNEL") || (ctrlText ((findDisplay 63) displayCtrl 101) == "Group Channel")) then {
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 120;
						disconnect_me = nil;
						warn_one = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};

				if (isNil "disconnect_me") then {
					disconnect_me = 0;
				} else {
					disconnect_me = disconnect_me + 1;
				};

				if (disconnect_me == 0) then {
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

				if (disconnect_me >= 3) then {
					if (isNil "warn_last") then {
						warn_last = true;
						playMusic ["PitchWhine",0];
						["beat04"] spawn P2DZ_really_loud_sounds;
						["We warned you about abusing voice chat..."] spawn P2DZ_double_cut;
						sleep 0.5;
						1 fademusic 10;
						1 fadesound 10;
						endMission "END1";
					};
				};
			};
		};
	};
};
