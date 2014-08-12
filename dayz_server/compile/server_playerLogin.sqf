private ["_doLoop","_hiveVer","_isHiveOk","_playerID","_playerObj","_primary","_key","_charID","_playerName","_backpack","_isNew","_inventory","_survival","_model","_mags","_wpns","_bcpk","_config","_newPlayer","_debugMonSettings"];
diag_log("P2DEBUG: server_playerLogin.sqf: " + str _this);

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
_survival =		[0,0,0];
_model =		"";
_debugMonSettings =	[0,0,1,0.2,2];

if (_playerID == "") then {
	_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") || (isNil "_playerID")) exitWith {
	diag_log ("LOGIN FAILED: Player [" + _playerName + "] has no login ID");
};

diag_log ("P2DEBUG: LOGIN ATTEMPT: " + str(_playerID) + " " + _playerName);

//Do Connection Attempt
_doLoop = 0;
while {_doLoop < 6} do {
	_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
	_primary = _key call server_hiveReadWrite;
	if (count _primary > 0) then {
		if ((_primary select 0) != "ERROR") then {
			_doLoop = 10;
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
_isNew = 		count _primary < 8; //_result select 1;
_charID = 		_primary select 2;


/* PROCESS */
_hiveVer = 0;

if (!_isNew) then {
	diag_log ("P2DEBUG: LOGIN RESULT: !isNew: " + str(_primary));


	//RETURNING CHARACTER		
	_inventory = 			_primary select 4;
	_backpack = 			_primary select 5;
	_survival =				_primary select 6;
	_model =				_primary select 7;
	_hiveVer =				_primary select 8;
	_debugMonSettings = 	_primary select 9;
	if (!(_model in AllPlayers)) then {
		_model = "Survivor2_DZ";
	};

} else {
	diag_log ("P2DEBUG: LOGIN RESULT: isNew: " + str(_primary));

	_model =				_primary select 4;
	_hiveVer =				_primary select 5;
	_debugMonSettings = 	_primary select 6;
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

	//Record initial inventory only if not player zombie 
	_config = (missionConfigFile >> "CfgNewSpawn" >> "Inventory" >> "Default");
	_mags = getArray (_config >> "magazines");
	_wpns = getArray (_config >> "weapons");
	_bcpk = getText (_config >> "backpack");
	DefaultBackpackItems = "ItemToolbox";

	if(!isNil "DefaultMagazines") then {
		diag_log("P2DEBUG: Login: DefaultMagazines" + str DefaultMagazines);
		_mags = DefaultMagazines;
	};
	if(!isNil "DefaultWeapons") then {
		diag_log("P2DEBUG: Login: DefaultWeapons" + str DefaultWeapons);
		_wpns = DefaultWeapons;
	};
	if(!isNil "DefaultBackpack") then {
		diag_log("P2DEBUG: Login: DefaultBackpack" + str DefaultBackpack);
		_bcpk = DefaultBackpack;
	};
	if(!isNil "DefaultBackpackWeapons") then {
		diag_log("P2DEBUG: Login: DefaultBackpackItems" + str DefaultBackpackWeapons);
		_bcpkItems = DefaultBackpackItems;
	};
	//_randomSpot = true;

	//Wait for HIVE to be free
	_key = format["CHILD:203:%1:%2:%3:",_charID,[_wpns,_mags],[_bcpk,[],[]]];
	diag_log("P2DEBUG: " + _key);
	_key call server_hiveWrite;
};

_isHiveOk = true;

if (worldName == "chernarus") then {
	([4654,9595,0] nearestObject 145259) setDamage 1;
	([4654,9595,0] nearestObject 145260) setDamage 1;
};

dayzPlayerLogin = [_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer,0,_debugMonSettings];
(owner _playerObj) publicVariableClient "dayzPlayerLogin";
diag_log ("P2DEBUG: FINAL LOGIN RESULT: " + str([_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer,0,_debugMonSettings]));
