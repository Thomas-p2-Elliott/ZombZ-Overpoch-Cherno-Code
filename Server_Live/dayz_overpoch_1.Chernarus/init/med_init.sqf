#include "\ca\editor\Data\Scripts\dikCodes.h"
private ["_id","_rnd","_lowBlood"];
disableSerialization;
usec_bandage_recovery = 5;	//time to recover after bandaging
while {true} do {	

	//0 Blood Death
	if (r_player_blood <= 0) then {
		_id = [dayz_sourceBleeding,"bled"] spawn player_death;
		diag_log(format["P2DEBUG: %1","med_init: 0 Blood: Player Death"]);
	};

	//Player KO Chance from low blood
	if ((r_player_blood <= 3000) && !r_player_unconscious) then {
		_rnd = random 100;
		if (_rnd > 99) then {
			[player,((random 0.1) + 0.2)] call fnc_usec_damageUnconscious;
			diag_log(format["P2DEBUG: %1","med_init: KO Player (LowBlood)"]);
		};
	};
	
	//Handle Unconscious player
	if ((r_player_unconscious) && (!r_player_handler1)) then {
		[] spawn fnc_usec_unconscious;
		diag_log(format["P2DEBUG: %1","med_init: KO Player"]);
	};

	if (!r_player_unconscious) then {
		if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
			endLoadingScreen;
			diag_log(format["P2DEBUG: %1","med_init: Close KO Screen - Player Not KO'd (!r_player_unconscious)"]);
		};		
	};
	
	//Handle player bleeding
	if ((r_player_injured) && (!r_player_handler)) then {
		r_player_handler = true;
		uiSleep 1;
		//localize "CLIENT: Start Player Bleeding";
		[] spawn fnc_usec_playerBleed;	//publicizes the blood value at regular intervals
		[] spawn fnc_med_publicBlood;
	};
	
	//Handle player infection
	if ((r_player_infected) && (!r_player_handler)) then {
		r_player_handler = true;
		uiSleep 1;
		[] spawn fnc_med_publicBlood;
	};
	
	//Low Blood Effects
	if (!r_player_unconscious) then {
		if (((r_player_blood/r_player_bloodTotal) < 0.35)) then {
			r_player_lowblood = true;
			playSound "heartbeat_1";
			addCamShake [2, 0.5, 25];
			if (r_player_lowblood) then {
				0 fadeSound ((r_player_blood/r_player_bloodTotal) + 0.5);
				"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;
			};
			uiSleep 0.5;
			if (r_player_lowblood) then {
				"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 0.5;
			};
			uiSleep 0.5;
			_lowBlood =	player getVariable ["USEC_lowBlood", false];
			if ((r_player_blood < r_player_bloodTotal) && !_lowBlood) then {
				player setVariable["USEC_lowBlood",true,true];
			};
		};
	};

	uiSleep 1;
};

//Restart script if true loop fails
dayz_medicalH = [] execVM "init\med_init.sqf";