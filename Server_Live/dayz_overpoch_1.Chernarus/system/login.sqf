private ["_debugMonSettings","_parsedLogin1","_isNew","_model","_isHiveOk","_newPlayer","_isInfected","_mags","_wpns","_bcpk","_bcpkItems","_isOK","_config","_backpackMagTypes","_backpackMagQty","_backpackWpnTypes","_backpackWpnQtys","_countr","_backpackType","_backpackWpn","_backpackWater","_first","_worldspace","_state","_setDir","_setPos","_backpack","_world","_nearestCity","_survivalTimeText","_charID","_inventory","_survival","_version","_totalMins","_days","_hours","_mins","_pic","_p2_didYouKnow","_randomSelection","_p2_selectedMsg"];
if (P2DZE_debugLogin) then { diag_log("P2DEBUG: " + __FILE__); };

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

if (count _parsedLogin1 > 9) then {
	_isHiveOk = _parsedLogin1 select 7;
	_newPlayer = _parsedLogin1 select 8;
	_isInfected = _parsedLogin1 select 9;
	_debugMonSettings = _parsedLogin1 select 10;

	if (P2DZE_debugLogin) then { diag_log ("P2DEBUG: PLAYER EXISTS! HiveOK: " + str(_isHiveOk)); };
	if (P2DZE_debugLogin) then { diag_log format ["P2DEBUG: dayzPlayerLogin:	_charID (%1)	_inventory (%2)	_backpack (%3)	_survival (%4)	_isNew (%5)	_version (%6)	_model (%7)	_isHiveOk (%8)	_newPlayer (%9)	_isInfected (%10) _debugMonSettings: (%11)",
												_charID,	_inventory,		_backpack,		_survival,		_isNew,			_version,		_model,		_isHiveOk,		_newPlayer,		_isInfected, _debugMonSettings]; };
} else {
if (P2DZE_debugLogin) then { 	diag_log ("P2DEBUG: NEW PLAYER! HiveOK: " + str(_isHiveOk));
	diag_log format ["P2DEBUG: dayzPlayerLogin:	_charID (%1)	_inventory (%2)	_backpack (%3)	_survival (%4)	_isNew (%5)	_version (%6)	_model (%7) _debugMonSettings (%8)",
												_charID,	_inventory,		_backpack,		_survival,		_isNew,			_version,		_model, _debugMonSettings]; };
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
	if (P2DZE_debugLogin) then { diag_log("P2DEBUG: Freshspawn!"); };
	waitUntil{!isNil "dayzPlayerLogin2"};
	waitUntil{count (dayzPlayerLogin2) > 0};
	_worldspace = 	dayzPlayerLogin2 select 0;
	_state =		dayzPlayerLogin2 select 1;
	_setDir = 		_worldspace select 0;
	_setPos = 		_worldspace select 1;
	P2DZ_humanity = dayzPlayerLogin2 select 2;
	if (P2DZE_debugLogin) then { diag_log format ["P2DEBUG: dayzPlayerLogin2:_worldspace (%1)	_state (%2)	P2DZ_humanity (%3)	_setDir (%4)	_setPos (%5)",
												_worldspace,		_state,		P2DZ_humanity,		_setDir,		_setPos]; };

	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, (abs P2DZ_humanityLevel)];
	};

	if (P2DZ_humanityLevel > 0) then {
		P2DZ_humanityPrefix = "Hero Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel == 0) then {
		P2DZ_humanityPrefix = "Survivor";
		P2DZ_humanityLevelText = "Survivor";
	};

	if (P2DZE_debugHumanity) then {
		diag_log(format["HumanityDebug: dayzPlayerLogin2 select 2: %1", (dayzPlayerLogin2 select 2)]);
		diag_log(format["HumanityDebug: P2DZ_humanityLevel: %1", P2DZ_humanityLevel]);
		diag_log(format["HumanityDebug: P2DZ_humanityLevelText: %1", P2DZ_humanityLevelText]);
	};

	//Check if player has purchased loadout 

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

	//check if halo spawn
	if (haloSelect == 1) then {
		//Get view dist setting early
		P2DZ_dbViewDist = (_debugMonSettings select 5);		
		playsound "introSong";						//Start Intro Music
		[] execVM "actions\player2_haloSpawn.sqf"; 	//paradrop them
	} else {
		P2DZE_paraOpened = true;
		P2DZE_hasLanded = true;
	};

} else {
	//Player is not a freshspawn
	if (P2DZE_debugLogin) then { diag_log("P2DEBUG: Not Freshspawn!"); };

	waitUntil{!isNil "dayzPlayerLogin2"};
	waitUntil{count (dayzPlayerLogin2) > 0};
	if (P2DZE_debugLogin) then { diag_log("P2DEBUG: dayzPlayerLogin2: " + str(dayzPlayerLogin2)); };

	P2DZ_humanity = dayzPlayerLogin2 select 2;

	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, (abs P2DZ_humanityLevel)];
	};

	if (P2DZ_humanityLevel > 0) then {
		P2DZ_humanityPrefix = "Hero Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel == 0) then {
		P2DZ_humanityPrefix = "Survivor";
		P2DZ_humanityLevelText = "Survivor";
	};

	if (P2DZE_debugHumanity) then {
		diag_log(format["HumanityDebug: dayzPlayerLogin2 select 2: %1", (dayzPlayerLogin2 select 2)]);
		diag_log(format["HumanityDebug: P2DZ_humanityLevel: %1", P2DZ_humanityLevel]);
		diag_log(format["HumanityDebug: P2DZ_humanityLevelText: %1", P2DZ_humanityLevelText]);
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


	//they're in, so set these to true since they didnt do either!
	P2DZE_paraOpened = true;
	P2DZE_hasLanded = true;

	//Show Intro Credits

	//Intro Credits Finished
};
//double check this one m8
waitUntil{!isNil 'dayz_gui'};

//Spawn watermark
_pic = "img\watermark.paa";
["<img align='left' size='1.0' shadow='1' image="+(str(_pic))+" />",safeZoneX+0.027,safeZoneY+safeZoneH-0.1,99999,0,0,3390] spawn bis_fnc_dynamicText;

//Wait until player has chute open!
waitUntil{(P2DZE_paraOpened)};

//show debug monitor
P2DZ_dbCurMode = (_debugMonSettings select 4);
P2DZ_dbViewDist = (_debugMonSettings select 5);

P2DZE_debugCol = [(_debugMonSettings select 0), (_debugMonSettings select 1), (_debugMonSettings select 2), (_debugMonSettings select 3)];
P2DZ_debugMonitor = true;

if (P2DZE_debugLogin) then { diag_log(format["P2DEBUG: login.sqf: P2DZ_dbCurMode (%1) P2DZE_debugCol (%2), ViewDist: (%3)", P2DZ_dbCurMode, P2DZE_debugCol, P2DZ_dbViewDist]); };

player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
player setVariable ["P2_DebugMonColours", P2DZE_debugCol, true];
player setVariable ["P2_viewDist", P2DZ_dbViewDist, true];

[] call fnc_debugMon;
//wait until Player has Landed!
waitUntil{(P2DZE_hasLanded)};

setViewdistance P2DZ_dbViewDist;

_p2_didYouKnow = [
	"Did you know: Higher value weapons spawn more often in-land away from the coast.",
	"Did you know: Self bloodbags give more blood and less infection chance if you are a hero.",
	"Did you know: Self bloodbags are more effective at hospitals, medical tents, churches, UN vehicles & more hidden areas!",
	"Did you know: You can upgrade deployed vehicles with parts just by scrolling on them!",
	"Did you know: You can build vehicles by right clicking your toolbox!",
	"Did you know: You can change your view distance by right clicking your binoculars/rangefinders!",
	"Did you know: Every single vehicle spawn point on this server was hand-made by a professional hide and seek player",
	"Did you know: Thermal weapons are the rarest items on this server. Some variants have a 1/100,000 spawn chance.",
	"Did you know: We run dayz other dayz overpoch & dayz overwatch servers! Just search ZombZ in your server browser!",
	"Did you know: There are medical, military, and industrial care packages marked by smoke.",
	"Did you know: Several Ultra-Rare & Powerful weapons can be found at crashsites only!",
	"Did you know: A.I. Missions can be found, kill the bandits, grab the loot, and get out before another group shows up!",
	"Did you know: You can press F1 for a full run down of the features on this server!",
	"Did you know: This server is always subject to improvement and optimisation by a dedicated team!",
	"Did you know: Heli Crash sites are animated and fly just like other choppers! They can even be shot down for loot!",
	"Did you know: Most of the Zombies are spawned by headless client to give you a performance boost!",
	"Did you know: You can type \killme into the chatbox and leave it open to respawn anytime! Type \help for more commands!",
	"Did you know: You can type \help into the chatbox and leave it open for a list of useful and fun chat commands!",
	"Did you know: You can type \clubbing into the chatbox and leave it open to dance! Type \help for more commands!",
	"Did you know: You can type \boxing into the chatbox and leave it open to box! Type \help for more commands!",
	"Did you know: AI Missions, Zombies, and Animated Crash sites all run on headless client for higher performance!",
	"Did you know: You can find, buy, and sell over 700 different weapon variations on this server!",
	"Did you know: You can find, buy, and sell over 300 different vehicle variations on this server!",
	"Did you know: Huge Zombie Hordes roam the map, being run by headless client instead of the server for performance!",
	"Did you know: The loot spawn system is very intricate and full of hidden patterns and niches!",
	"Did you know: Auto-Refuel is enabled, just get out of the vehicle and scroll on the fuel source!",
	"Did you know: Nevermind, I forgot what I was going to say...",
	"Did you know: Towing and lifting are enabled for certain vehicles only & You can only tow 1 vehicle at a time!",
	"Did you know: Most fast vehicles cannot tow and most small or attack helicopters cannot lift!",
	"Did you know: If you dont get a tow or lift option, the vehicle cannot tow or lift!",
	"Did you know: Heroes can bandage other players without needing or using a bandage!",
	"Did you know: Heroes can fix other players without needing or using morphine!",
	"Did you know: Heroes get better deals and better weapons at the traders!",
	"Did you know: Humanity can now be donated for via our website - Become a Hero, support this server!",
	"Did you know: Humanity can now be donated for via our website - Become a Hero, support this server!",
	"Did you know: We have a huge community of players on our teamspeak, find friends, form rivalries, get involved! ts3.zombz.net:9172",
	"Did you know: We have a huge community of players on our teamspeak, find friends, form rivalries, get involved! ts3.zombz.net:9172",
	"Did you know: We have a huge community of players on our teamspeak, find friends, form rivalries, get involved! ts3.zombz.net:9172",
	"Did you know: We have a huge community of players on our teamspeak, find friends, form rivalries, get involved! ts3.zombz.net:9172"
];

_randomSelection = floor(random(count _p2_didYouKnow));
//select a message to display post-halo/post-spawn
_p2_selectedMsg = (_p2_didYouKnow select (_randomSelection));
systemChat(_p2_selectedMsg);	

//wait 10 seconds
uiSleep 10;

//tell player about debug mon colour / mode
if (random 1 > 0.49) then {
	systemChat("Did you know: You can change your debug/stats panel mode by pressing the F5 key!");
} else {
	systemChat("Did you know: You can change your debug/stats panel color by pressing the F6 key!");
};
