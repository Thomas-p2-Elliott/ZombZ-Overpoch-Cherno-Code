#include "\ca\editor\Data\Scripts\dikCodes.h"
private ["_id","_rnd","_lowBlood"];
usec_bandage_recovery = 5;	//time to recover after bandaging
while {true} do {	
	if (r_player_blood <= 0) then {
		[player,900] call fnc_usec_damageUnconscious;
		_id = [dayz_sourceBleeding,"bled"] spawn player_death;
	};

	if ((r_player_blood <= 3000) && !r_player_unconscious) then {
		_rnd = random 100;
		if (_rnd > 99) then {
			[player,((random 0.1) + 0.2)] call fnc_usec_damageUnconscious;
		};
	};
	
	//Handle Unconscious player
	if ((r_player_unconscious) && (!r_player_handler1)) then {
		//localize "CLIENT: Start Unconscious Function";
		[] spawn fnc_usec_unconscious;
	};

	if (!r_player_unconscious) then {
		disableUserInput false;		endLoadingScreen;
		diag_log("med: close2");
	};
	
	//Handle player bleeding
	if ((r_player_injured) && (!r_player_handler)) then {
		r_player_handler = true;
		sleep 1;
		//localize "CLIENT: Start Player Bleeding";
		[] spawn fnc_usec_playerBleed;	//publicizes the blood value at regular intervals
		[] spawn fnc_med_publicBlood;
	};
	
	//Handle player infection
	if ((r_player_infected) && (!r_player_handler)) then {
		r_player_handler = true;
		sleep 1;
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
			sleep 0.5;
			if (r_player_lowblood) then {
				"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 0.5;
			};
			sleep 0.5;
			_lowBlood =	player getVariable ["USEC_lowBlood", false];
			if ((r_player_blood < r_player_bloodTotal) && !_lowBlood) then {
				player setVariable["USEC_lowBlood",true,true];
			};
		};
	};

	sleep 1;
};

endLoadingScreen;