private ["_parsedLogin1","_isNew","_model","_humanity","_humanityLevel","_humanityPrefix"];
diag_log("P2DEBUG: " + __FILE__);

waitUntil{!isNil "dayzPlayerLogin"};
waitUntil{count (dayzPlayerLogin) > 1};
_parsedLogin1 = dayzPlayerLogin;
diag_log("P2DEBUG: dayzPlayerLogin: " + str(_parsedLogin1));
_isNew 		= _parsedLogin1 select 4;


//	Removed for now
//_model		= _parsedLogin1 select 6;
//[_model,_humanity] call p2_fnc_skinLvlCheck;

if (_isNew) then {
	DZE_haloSpawn = true; //enable halo spawn
	haloSelect = -1;

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

	//Check if player has purchased loadout 

	//Wait until they're fully loaded in
	waitUntil{!isNil 'dayz_gui'};

	//Give player random loadout (Leave backpack slots empty for bandit/hero additions)
	[] execVM "loadouts.sqf";						//newspawn loadouts

	//hero items
	if (P2DZ_humanityLevel > 0) then {
			player addMagazine "ItemBloodbag";
			player addMagazine "ItemBloodbag";
			(unitBackpack player) addMagazineCargoGlobal "PartEngine";
			(unitBackpack player) addMagazineCargoGlobal "PartGeneric";
			(unitBackpack player) addWeaponCargoGlobal "ItemToolbox";
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
	};

	//Check if player has base
	
	//check if halo spawn
	if (haloSelect == 1) then {
		playsound "introSong";						//Start Intro Music
		[] execVM "actions\player2_haloSpawn.sqf"; 	//paradrop them
	};

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

	//Wait until they're fully loaded in
	waitUntil{!isNil 'dayz_gui'};

	//they're in, so set these to true since they didnt do either!
	P2DZE_paraOpened = true;
	P2DZE_hasLanded = true;

	//Show Intro Credits

	//Intro Credits Finished
};


//Wait until player has chute open!
waitUntil{(P2DZE_paraOpened)};

//show debug monitor
P2DZ_dbCurMode = 2;
[] call fnc_debugMon;
//wait until Player has Landed!
waitUntil{(P2DZE_hasLanded)};
setViewdistance 1500;

//Show Intro Credits

//Intro Credits Finished

_p2_didYouKnow = [
"Did you know: Higher value weapons spawn more often in-land away from the coast.",
"Did you know: Self bloodbags give more blood and less infection chance if you are a hero.",
"Did you know: Self bloodbags are more effective at hospitals, medical tents, churches, and UN vehicles.",
"Did you know: You can upgrade deployed vehicles with parts just by scrolling on them!",
"Did you know: Every single vehicle spawn point on this server was hand-made by a professional hide and seek player",
"Did you know: Thermal weapons are the rarest items on this server.",
"Did you know: We run dayz overwatch, dayz mod, epoch cherno, and epoch panthera servers! Just search ZombZ in your server browser!",
"Did you know: There are medical, military, and industrial care packages marked by smoke.",
"Did you know: Several Ultra-Rare weapons can be found at crashsites only! Including the Cheytec SD, MSR SD, XM2010 SD & Thermal Weapons!",
"Did you know: We have a huge community of players on our teamspeak, find friends, form rivalries, get involved! ts3.zombz.net:9172",
"Did you know: A.I. Missions can be found, kill the bandits, grab the loot, and get out before another group shows up!",
"Did you know: You can press F1 for a full run down of the features on this server!",
"Did you know: This server is always subject to improvement and optimisation by a dedicated team!",
"Did you know: Auto-Refuel is enabled, just get out of the vehicle first!",
"Did you know: Empty Jack Daniels bottles are actually Molotovs on this server!",
"Did you know: Nevermind, I forgot what I was going to say..."
];

_randomSelection = floor(random(count _p2_didYouKnow));
if (p2SpT) then { diag_log("_RandomSelection: " + str(_randomSelection)); };
//select a message to display post-halo/post-spawn
_p2_selectedMsg = (_p2_didYouKnow select (_randomSelection));
systemChat(_p2_selectedMsg);	
