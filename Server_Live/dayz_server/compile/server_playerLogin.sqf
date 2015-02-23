private ["_hLevel","_morality","_packageArr","_doLoop","_hiveVer","_isHiveOk","_playerID","_playerObj","_primary","_key","_charID","_playerName","_backpack","_isNew","_inventory","_survival","_model","_distanceFoot","_mags","_wpns","_bcpk","_config","_newPlayer","_debugMonSettings"];
diag_log("PLAYERLOGIN: " + str _this);

_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};


if (isNil "sm_done") exitWith { 
	diag_log ("Login cancelled, server is not ready. " + str(_playerObj)); 
};

if (count _this > 2) then {
	dayz_players = dayz_players - [_this select 2];
};

//Variables
_inventory =	[];
_backpack = 	[];
_p2loadout = 	[];
_survival =		[0,0,0];
_model =		"";
_debugMonSettings =	[0,0,0,0.2,2,1000];
_distanceFoot = 	0;
_morality = 		2500;
_packageArr = 		[];
_hLevel = 			0;

if (_playerID == "") then {
	_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") || (isNil "_playerID")) exitWith {
	diag_log ("LOGIN FAILED: Player [" + _playerName + "] has no login ID");
};

//Do Connection Attempt
_doLoop = 0;
while {_doLoop < 7} do {
	_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
	_primary = _key call server_hiveReadWrite;
	if (count _primary > 0) then {
		if ((_primary select 0) != "ERROR") then {
			_doLoop = 7;
		};
	};
	_doLoop = _doLoop + 1;
};

if (isNull _playerObj || !isPlayer _playerObj) exitWith {
	diag_log ("LOGIN RESULT: Exiting, player object null: " + str(_playerObj));
};

if ((_primary select 0) == "ERROR") exitWith {
    diag_log format ["LOGIN RESULT: Exiting, failed to load _primary: %1 for player: %2 ",_primary,_playerID];
};

//Process request
_newPlayer = 	_primary select 1;
_isNew = 		count _primary < 11; //_result select 1;
_charID = 		_primary select 2;


/* PROCESS */
_hiveVer = 0;

if (!_isNew) then {
	//diag_log ("P2DEBUG: LOGIN RESULT: !isNew: " + str(_primary));

	/*---------------------------------------------------------------------------
			Existing/Alive Character
	---------------------------------------------------------------------------*/		
	_inventory = 			_primary select 4;
	_backpack = 			_primary select 5;
	_survival =				_primary select 6;
	_model =				_primary select 7;
	_hiveVer =				_primary select 8;
	_debugMonSettings = 	_primary select 9;
	_distanceFoot = 		_primary select 10;	
	_morality = 			_primary select 11;	
	//_packageArr	=			_primary select 12;

	if (isNil "_distanceFoot") then { _distanceFoot = 0; };
	_playerObj setVariable ["distanceFoot_CHK", _distanceFoot];

	if (isNil "_model") then {
		_model = "Survivor2_DZ";
	};

	if (!(_model in AllPlayers)) then {
		_model = "Survivor2_DZ";
	};

	/*---------------------------------------------------------------------------
	Set Skin Based on Humanity - New hive support by Player2
	---------------------------------------------------------------------------*/
	if (!isNil '_morality') then {
		if (_morality == -6666) then {	_morality = 2500; }; //default return value incase of none found

		if (_model == "Survivor2_DZ") then {
			//get humanity level
			_hLevel = floor(_morality / 5000);
			//Bandit
			if (_hLevel < 0) then {
				_model = "Bandit1_DZ";

			};
			//Hero
			if (_hLevel > 0) then {
				_model = "Survivor3_DZ";

			};
		};
	};

} else {
	//diag_log ("LOGIN RESULT: isNew: " + str(_primary));
	/*---------------------------------------------------------------------------
			Dead/New Character
	---------------------------------------------------------------------------*/	

	//_model =				_primary select 4;
	_hiveVer =				_primary select 5;
	_debugMonSettings = 	_primary select 6;
	_distanceFoot = 		_primary select 7;		
	_morality = 			_primary select 8;
	//_packageArr	=		_primary select 9;

	if (isNil "_distanceFoot") then { _distanceFoot = 0; };
	_playerObj setVariable ["distanceFoot_CHK", _distanceFoot];

	if (isNil "_model") then {
		_model = "Survivor2_DZ";
	} else {
		if (_model == "") then {
			_model = "Survivor2_DZ";
		};
		if (_model == "Survivor1_DZ") then {
			_model = "Survivor2_DZ";
		};
	};

	/*---------------------------------------------------------------------------
	Set Skin Based on Humanity - New hive support by Player2
	---------------------------------------------------------------------------*/
	if (!isNil '_morality') then {
		if (_morality == -6666) then {	_morality = 2500; }; //default return value incase of none found

		if (_model == "Survivor2_DZ") then {
			//get humanity level
			_hLevel = floor(_morality / 5000);
			//Bandit
			if (_hLevel < 0) then {
				_model = "Bandit1_DZ";

			};
			//Hero
			if (_hLevel > 0) then {
				_model = "Survivor3_DZ";

			};
		};
	};

	/*---------------------------------------------------------------------------
	Damn, Player2 Writes a new Loadout Script?!
	---------------------------------------------------------------------------*/
	_p2loadout = call {
		private ["_p2output","_p2gun","_p2backpack","_p2mag","_p2mags","_p2weapons","_p2randomWeaponList","_chance"];
		_p2output = 	[];
		_p2gun = 		"";
		_chance = 		1;
		_p2backpack = 	"";
		_p2mag = 		"";

		/*---------------------------------------------------------------------------
		Configuration
			Mags always given, weapons always given, backpack always given
			Primary weapon if given (30%) picks at random from list
		---------------------------------------------------------------------------*/
		_p2mags = 		["ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine"];
		_p2weapons = 	["ItemToolbox","Binocular","ItemMap","ItemCompass","ItemHatchet_DZE"];
		_p2backpack = 	"DZ_Czech_Vest_Puch";
		_p2randomWeaponList = [
			"Crossbow_DZ"
		];
		/*---------------------------------------------------------------------------
		---------------------------------------------------------------------------*/


		/* 70% Chance to Pick a Pistol, 30% Chance to Pick a Primary Weapon */
		if (random 10 > 6.99) then {
			/*---------------------------------------------------------------------------
			Pick Random Civillian Primary
			---------------------------------------------------------------------------*/
			_p2gun = (_p2randomWeaponList select (floor(random(count(_p2randomWeaponList)))));
			_p2weapons = _p2weapons + [_p2gun];

			if (_p2gun == "Crossbow_DZ") then {
				_p2mag = "Quiver";
			} else {
				_p2mag = 	((getArray (configFile >> "cfgWeapons" >> _p2gun >> "magazines")) select 0);
			};

			//add between 1 and 3 magazines
			_chance = (round((random 3)+0.5));

			//lower the chance of getting a 3 by 50%
			if (_chance  > 2 && {random 1 > 0.4999}) then {
				_chance = 2;
			};

			for "_i" from 0 to _chance do {
				_p2mags = _p2mags + [_p2mag];
			};

		} else {
			/*---------------------------------------------------------------------------
			Pick Random Civillian Secondary
			---------------------------------------------------------------------------*/
			_p2gun =  ((getArray (missionConfigFile >> "cfgLoot" >> "PistolsLow")) select floor(random(count(getArray (missionConfigFile >> "cfgLoot" >> "PistolsLow"))))select 0);
			_p2weapons = _p2weapons + [_p2gun];

			//Add 4 Pistol Magazines
			_p2mag = 	(getArray (configFile >> "cfgWeapons" >> _p2gun >> "magazines") select 0);
			_p2mags = _p2mags + [_p2mag,_p2mag,_p2mag,_p2mag];
		};


		/*---------------------------------------------------------------------------
		Return Values
		---------------------------------------------------------------------------*/
		[_p2weapons,_p2mags,_p2backpack]
	};

	//Record initial inventory only if not player zombie 
	_wpns = _p2loadout select 0;
	_mags = _p2loadout select 1;
	_bcpk = _p2loadout select 2;
	_inventory = [_wpns,_mags];
	_backpack = [_bcpk,[],[]];

	//Wait for HIVE to be free
	_key = format["CHILD:203:%1:%2:%3:",_charID,_inventory,_backpack];
	_key call server_hiveWrite;
};

if(!isNil "_debugMonSettings") then {
	if ((count _debugMonSettings) < 6) then {
		_debugMonSettings =	[0,0,0,0.2,2,1000];
	};
};


if(isNil "_debugMonSettings") then {
	_debugMonSettings =	[0,0,0,0.2,2,1000];
} else {
	_debugR = _debugMonSettings select 0;
	 if(isNil "_debugR") then { _debugR = 0; };
	_debugG = _debugMonSettings select 1;
	 if(isNil "_debugG") then { _debugG = 0; };
	_debugB = _debugMonSettings select 2;
	 if(isNil "_debugB") then { _debugB = 0; };
	_debugA = _debugMonSettings select 3;
	 if(isNil "_debugA") then { _debugA = 0.2; };
	_debugM = _debugMonSettings select 4;	
 	if(isNil "_debugM") then { _debugM = 2; };
	_viewDist = _debugMonSettings select 5;	
 	if(isNil "_viewDist") then { _viewDist = 1000; };
 	if (typeName _viewDist != typeName 1000) then { _viewDist = 1000; };
 
 	_debugMonSettings = [_debugR,_debugG,_debugB,_debugA,_debugM,_viewDist];
};

if ((count _debugMonSettings) < 6) then {
	_debugMonSettings =	[0,0,0,0.2,2,1000];
};

if(isNil "_distanceFoot") then {
	_distanceFoot = 0;
};
if(isNil "_survival") then {
	_survival =		[0,0,0];
};

_isHiveOk = true;

if (worldName == "chernarus") then {
	([4654,9595,0] nearestObject 145259) setDamage 1;
	([4654,9595,0] nearestObject 145260) setDamage 1;
};

dayzPlayerLogin = [_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer,0,_debugMonSettings,_distanceFoot];
(owner _playerObj) publicVariableClient "dayzPlayerLogin";
diag_log ("FINAL LOGIN RESULT: " + str([_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer,0,_debugMonSettings,_distanceFoot]));
