private ["_parsedLogin1","_isNew","_model","_humanity","_humanityLevel","_humanityPrefix"];
diag_log("P2DEBUG: " + __FILE__);

//Start Intro Music

waitUntil{!isNil "dayzPlayerLogin"};
waitUntil{count (dayzPlayerLogin) > 1};
_parsedLogin1 = dayzPlayerLogin;
diag_log("P2DEBUG: dayzPlayerLogin: " + str(_parsedLogin1));
_isNew 		= _parsedLogin1 select 4;

//	Removed for now
//_model		= _parsedLogin1 select 6;
//[_model,_humanity] call p2_fnc_skinLvlCheck;

if (_isNew) then {
	//Player is a freshspawn
	diag_log("P2DEBUG: Freshspawn!");
	waitUntil{!isNil "dayzPlayerLogin2"};
	waitUntil{count (dayzPlayerLogin2) > 0};
	diag_log("P2DEBUG: dayzPlayerLogin2: " + str(dayzPlayerLogin2));
	P2DZ_humanity = dayzPlayerLogin2 select 2;

	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel > 0) then {
		P2DZ_humanityPrefix = "Hero Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel == 0) then {
		P2DZ_humanityPrefix = "Survivor";
		P2DZ_humanityLevelText = "Survivor";
	};

	diag_log(P2DZ_humanityLevelText);

	//Check if player has purchased loadout (Remove backpack items if they do)

	//Give player random loadout (Leave backpack slots empty for bandit/hero additions)

	//Check if player has base

	//Para-Drop them!

	//Player has Landed!

	//Provide option for re-para-drop if they land in ocean?

	//Show Intro Credits

	//Intro Credits Finished

	//Display Full Debug Monitor
	waitUntil{!isNil 'dayz_gui'};
	[] execVM "compile\fnc_debugMon.sqf";			//Debug Monitor	

} else {
	//Player is not a freshspawn
	diag_log("P2DEBUG: Not Freshspawn!");

	waitUntil{!isNil "dayzPlayerLogin2"};
	waitUntil{count (dayzPlayerLogin2) > 0};
	diag_log("P2DEBUG: dayzPlayerLogin2: " + str(dayzPlayerLogin2));
	P2DZ_humanity = dayzPlayerLogin2 select 2;

	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel > 0) then {
		P2DZ_humanityPrefix = "Hero Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel == 0) then {
		P2DZ_humanityPrefix = "Survivor";
		P2DZ_humanityLevelText = "Survivor";
	};

	diag_log(P2DZ_humanityLevelText);
	
	//Provide option for re-para-drop if they land in ocean?

	//Show Intro Credits

	//Intro Credits Finished


	//Display Full Debug Monitor
	waitUntil{!isNil 'dayz_gui'};
	[] execVM "compile\fnc_debugMon.sqf";			//Debug Monitor	

};