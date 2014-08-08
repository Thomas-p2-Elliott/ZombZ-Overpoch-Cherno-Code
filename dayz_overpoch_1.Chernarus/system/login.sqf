private ["_debugMonSettings","_parsedLogin1","_isNew","_model","_isHiveOk","_newPlayer","_isInfected","_mags","_wpns","_bcpk","_bcpkItems","_isOK","_config","_backpackMagTypes","_backpackMagQty","_backpackWpnTypes","_backpackWpnQtys","_countr","_backpackType","_backpackWpn","_backpackWater","_first","_worldspace","_state","_setDir","_setPos","_backpack","_world","_nearestCity","_survivalTimeText","_charID","_inventory","_survival","_version","_totalMins","_days","_hours","_mins","_p2_didYouKnow","_randomSelection","_p2_selectedMsg"];
diag_log("P2DEBUG: " + __FILE__);

waitUntil{!isNil "dayzPlayerLogin"};
waitUntil{count (dayzPlayerLogin) > 1};
_parsedLogin1 = dayzPlayerLogin;
_charID		= _parsedLogin1 select 0;
_inventory	= _parsedLogin1 select 1;
_backpack	= _parsedLogin1 select 2;
_survival 	= _parsedLogin1 select 3;
_isNew 		= _parsedLogin1 select 4;
_version	= _parsedLogin1 select 5;
_model		= _parsedLogin1 select 6;
_debugMonSettings = _parsedLogin1 select 7;

if (count _parsedLogin1 > 8) then {
	_isHiveOk = _parsedLogin1 select 7;
	_newPlayer = _parsedLogin1 select 8;
	_isInfected = _parsedLogin1 select 9;
	_debugMonSettings = _parsedLogin1 select 10;

	diag_log ("P2DEBUG: PLAYER EXISTS! HiveOK: " + str(_isHiveOk));
	diag_log format ["P2DEBUG: dayzPlayerLogin:	_charID (%1)	_inventory (%2)	_backpack (%3)	_survival (%4)	_isNew (%5)	_version (%6)	_model (%7)	_isHiveOk (%8)	_newPlayer (%9)	_isInfected (%10) _debugMonSettings: (%11)",
												_charID,	_inventory,		_backpack,		_survival,		_isNew,			_version,		_model,		_isHiveOk,		_newPlayer,		_isInfected, _debugMonSettings];
} else {
	diag_log ("P2DEBUG: NEW PLAYER! HiveOK: " + str(_isHiveOk));
	diag_log format ["P2DEBUG: dayzPlayerLogin:	_charID (%1)	_inventory (%2)	_backpack (%3)	_survival (%4)	_isNew (%5)	_version (%6)	_model (%7) _debugMonSettings (%8)",
												_charID,	_inventory,		_backpack,		_survival,		_isNew,			_version,		_model, _debugMonSettings];
};

//Work out survival time
_totalMins = _survival select 0;
_days = floor (_totalMins / 1440);
_totalMins = (_totalMins - (_days * 1440));
_hours = floor (_totalMins / 60);
_mins =  (_totalMins - (_hours * 60));
dayz_Survived = [_days,_hours,_mins];

//	Removed for now
//_model		= _parsedLogin1 select 6;
//[_model,_humanity] call p2_fnc_skinLvlCheck;

if (_isNew) then {

	//Give player random loadout (Leave backpack slots empty for bandit/hero additions)

	DZE_haloSpawn = true; //enable halo spawn
	haloSelect = -1;

	//Player is a freshspawn
	diag_log("P2DEBUG: Freshspawn!");
	waitUntil{!isNil "dayzPlayerLogin2"};
	waitUntil{count (dayzPlayerLogin2) > 0};
	_worldspace = 	dayzPlayerLogin2 select 0;
	_state =		dayzPlayerLogin2 select 1;
	_setDir = 		_worldspace select 0;
	_setPos = 		_worldspace select 1;
	P2DZ_humanity = dayzPlayerLogin2 select 2;
	diag_log format ["P2DEBUG: dayzPlayerLogin2:_worldspace (%1)	_state (%2)	P2DZ_humanity (%3)	_setDir (%4)	_setPos (%5)",
												_worldspace,		_state,		P2DZ_humanity,		_setDir,		_setPos];

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

	//load newspawn loadout
	if(!isNil "DefaultMagazines") then {
		diag_log("P2DEBUG: Login: DefaultMagazines" + str DefaultMagazines);
	};
	if(!isNil "DefaultWeapons") then {
		diag_log("P2DEBUG: Login: DefaultWeapons" + str DefaultWeapons);
	};
	if(!isNil "DefaultBackpack") then {
		diag_log("P2DEBUG: Login: DefaultBackpack" + str DefaultBackpack);
	};
	if(!isNil "DefaultBackpackItems") then {
		diag_log("P2DEBUG: Login: DefaultBackpackItems" + str DefaultBackpackWeapons);
	};

	//Wait until they're fully loaded in
	waitUntil{!isNil 'dayz_gui'};

	_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds" >> (worldName) >> "description"));
	_nearestCity = nearestLocations [([player] call FNC_GetPos), ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000];
	Dayz_logonTown = "Wilderness";
	_survivalTimeText = "Hour: " + str(_hours);

	if (count _nearestCity > 0) then {Dayz_logonTown = text (_nearestCity select 0)};

	if (!isNil "P2DZ_humanityLevelText") then {
		_first = [
			Dayz_logonTown,
			_survivalTimeText,
			P2DZ_humanityLevelText
		] spawn BIS_fnc_infoText;
	} else {
		_first = [_world,Dayz_logonTown,_survivalTimeText] spawn BIS_fnc_infoText;
	};

	//Check if player has base
	
	//check if halo spawn
	if (haloSelect == 1) then {
		playsound "introSong";						//Start Intro Music
		[] execVM "actions\player2_haloSpawn.sqf"; 	//paradrop them
	} else {
		P2DZE_paraOpened = true;
		P2DZE_hasLanded = true;
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
//double check this one m8
waitUntil{!isNil 'dayz_gui'};
//Wait until player has chute open!
waitUntil{(P2DZE_paraOpened)};

//show debug monitor
P2DZ_dbCurMode = _debugMonSettings select 4;
P2DZE_debugCol = [(_debugMonSettings select 0), (_debugMonSettings select 1), (_debugMonSettings select 2), (_debugMonSettings select 3)];
P2DZ_debugMonitor = true;

diag_log(format["P2DEBUG: login.sqf: P2DZ_dbCurMode (%1) P2DZE_debugCol (%2)", P2DZ_dbCurMode, P2DZE_debugCol]);

player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
player setVariable ["P2_DebugMonColours", P2DZE_debugCol, true];

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
