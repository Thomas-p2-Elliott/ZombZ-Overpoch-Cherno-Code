private ["_parsedLogin1","_isNew","_model","_humanity"];
if (count (dayzPlayerLogin) > 1) then {
	_parsedLogin1 = dayzPlayerLogin;
	diag_log("P2DEBUG: dayzPlayerLogin: " + str(_parsedLogin1));
	_isNew 		= _parsedLogin1 select 4;
	_model		= _parsedLogin1 select 6;

	//Start Intro Music

	if (_isNew) then {
		//Player is a freshspawn
		diag_log("P2DEBUG: Freshspawn!");

		waitUntil{count (dayzPlayerLogin2) > 0};
		diag_log("P2DEBUG: dayzPlayerLogin2: " + str(dayzPlayerLogin2));
		_humanity = dayzPlayerLogin2 select 2;
		[_model,_humanity] call p2_fnc_skinLvlCheck;

		//Check if player has purchased loadout (Remove backpack items if they do)

		//Give player random loadout (Leave backpack slots empty for bandit/hero additions)

		//Check if player has base

		//Para-Drop them!

		//Player has Landed!

		//Provide option for re-para-drop if they land in ocean?

		//Show Intro Credits

		//Intro Credits Finished

		//Display Full Stats Debug Monitor



	} else {
		//Player is not a freshspawn
		diag_log("P2DEBUG: Not Freshspawn!");

		waitUntil{count (dayzPlayerLogin2) > 0};
		diag_log("P2DEBUG: dayzPlayerLogin2: " + str(dayzPlayerLogin2));
		_humanity = dayzPlayerLogin2 select 2;
		[_model,_humanity] call p2_fnc_skinLvlCheck;
	};
};