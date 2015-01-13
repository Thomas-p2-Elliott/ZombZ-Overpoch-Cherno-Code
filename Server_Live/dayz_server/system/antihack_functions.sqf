/*---------------------------------------------------------------------------
    Hash Id Functions
----------------------
Description:
    Generates
---------------------------------------------------------------------------*/
/* This generates the server hash - should be run ONCE on server startup */


  
/*---------------------------------------------------------------------------
Server Anti-Hack Loops on Players & Vehicles
---------------------------------------------------------------------------*/
P2DZE_alreadyChecked = [];

server_checkHashIds = {
private["_missionVehicles"];
 if (PDZE_Hash_2AS > 3) then { PDZE_Hash_Check = nil; PDZE_Hash_2AS = 0; };         //these 
    if(!isNil "PDZE_Hash_Check") exitWith {  PDZE_Hash_2AS = PDZE_Hash_2AS + 1; };   //two lines just make SURE it is running and doesn't get stuck.
        PDZE_Hash_Check = true;

        _missionVehicles = [];
        _missionVehicles = _missionVehicles + allMissionObjects "car"; 
        _missionVehicles = _missionVehicles + allMissionObjects "air";
        _missionVehicles = _missionVehicles + allMissionObjects "sea";
        
        { 
            if (!(_x in P2DZE_alreadyChecked) && {(!((typeOf _x) in ["ParachuteWest","ParachuteC"]))} && {(!((typeOf _x) in AllPlayers))} && {(!((typeOf _x) in dayz_allowedObjects))}) then {
                _x call KK_fnc_checkHash;
                P2DZE_alreadyChecked = P2DZE_alreadyChecked + [_x];
                //"debug_console" callExtension format["Obj: %1 Added to Safe List #1111", typeOf _x];

            } else {
                //"debug_console" callExtension format["Obj: %1 Has already been Checked #0101", typeOf _x];
            };
            uiSleep 0.01;
        } forEach _missionVehicles;
        
    PDZE_Hash_Check = nil;
};



/* TO ADD A HASH TO AN OBJECT ADD THIS CODE - DO NOT MAKE A FUNCTION JUST COPY PASTE WHERE OBJECTS ARE CREATED */
/*

_obj call {
    _this setVariable [
        uiNamespace getVariable "hashId_var",
        "hash_id" callExtension format [
            "%1:%2",
            netId _this,
            typeOf _this
        ]
    ];
};


*/

KK_fnc_makeRandomId = {
     "hash_id" callExtension "rID"
};

KK_fnc_checkHash = {
   // "debug_console" callExtension format["Obj: %1 hash check", typeOf _this];

    if (_this isKindOf "Man") exitWith {
        true;
    };

    if ("hash_id" callExtension format [
        "%1:%2#%3", 
        netId _this, 
        typeOf _this, 
        _this getVariable [
            (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])), "NULL"
        ]
    ] == "PASS") exitWith {true};
    0 = _this spawn kk_fnc_logFailed;
    //"debug_console" callExtension format["Obj: %1 FAILED #1001", typeOf _this];
    false
};

KK_fnc_checkHashGold = {
   // "debug_console" callExtension format["Gold: %1 hash check", typeOf _this];

    if ("hash_id" callExtension format [
        "%1:%2#%3", 
        netId _this, 
        typeOf _this, 
        _this getVariable [
            (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])), "NULL"
        ]
    ] == "PASS") exitWith {true};
    0 = _this spawn KK_fnc_logFailedGold;
    //"debug_console" callExtension format["Gold: %1 FAILED #1001", typeOf _this];
    diag_log("Deleting: " + str(_this));
    deleteVehicle _this;
    diag_log(format["Deleted: %1", _this]);
    false
};

KK_fnc_logFailedGold = {
    _this setDamage 1; //destroy it
    deleteVehicle _this; //delete it
};


/*---------------------------------------------------------------------------
Security Numbers - Publish / Delete / Trade / Gold -
---------------------------------------------------------------------------*/
SillyNoobs = []; //uids stored in here get raped constantly by setDamage

//Thread that keeps bad uids dead after doing this
/*_hackerKilla = [] spawn {
    while {true} do {
        {
            if ((getplayerUID _x) in SillyNoobs) then {
                _x setDamage 1;
            } else {
                uiSleep 10;
            };
        } forEach playableUnits;
    };

};*/

//Example with player object:   [<player object>,"Delete Vehicle"] call kk_fnc_logBadNum
//Example with player uid:      ["2131209","Delete Vehicle"] call kk_fnc_logBadNum

kk_fnc_logBadNum = {
    private["_pObj","_pUid","_log","_inp","_pName"];
    _pUid = "Unknown";
    _pName = "Unknown";
    _type = "Bad Publish Security Number";
    _log = "badNumber";
    _pObj = objNull;
    _inp = _this;
    if (isNil '_inp' || ({(typeName _inp != typeName [])})) exitWith { diag_log("HackerLogError: Uknown Input."); };
    _type = _this select 1;
    if (isNil '_type' || ({(typeName _type != typeName "")})) exitWith { diag_log("HackerLogError: Uknown Type Input."); };
    _inp = _this select 0;
    if ((isNull _inp) || (typeName _inp != typeName "Player2")) exitWith { diag_log("HackerLogError: Uknown (Object or UID) Input."); };
    diag_Log("P2DEBUG: kk_fnc_logBadNum called:");
    diag_log(format["P2DEBUG:   %1",_this]);
    if (typeName _inp == typeName "Player2") then {
        _pUid = _inp;
        if (!isNil _pUid && ({(typeName _pUid == typeName "Player2")})) then {
            SillyNoobs = SillyNoobs + [_pUid];
        };

        _log = format["NAME:   (%1)    UID: (%2)   COMMAND USED:   (%3)    PARAMS USED:    (%4)", "Unknown", _pUid,  _type,  "Params Unavailable"];
        if (!isNil "_log") then {
            _log call stats_hackers;
        };
    };

    if (!(isNull _inp)) then {
        _pObj = _inp;
        _pUid = (getPlayeruid _pObj);
        _pName = (name _pObj);

        if (!isNil _pUid && ({(typeName _pUid == typeName "Player2")})) then {
            SillyNoobs = SillyNoobs + [_pUid];
        };

        _log = format["NAME:   (%1)    UID: (%2)   COMMAND USED:   (%3)    PARAMS USED:    (%4)", _pName, _pUid,  _type,  "Params Unavailable"];
        if (!isNil "_log") then {
            _log call stats_hackers;
        };
    };
};

KK_fnc_logFailed = {
    private["_dcout","_id","_uid","_key"];
    _dcout = {
       // "debug_console" callExtension (format _this);
        //log it
        (format _this) call stats_hashFails;
    };
    [
        "Vehicle => OBJ:%1, TYPE:%2, WEPS:%5 MAGS:%5",
        _this, typeOf _this, netId _this, getWeaponCargo _this, getMagazineCargo _this
    ] call _dcout; //log vehicle and netId

    [
        "Position => POS:%1, MAP:%2", 
        position _this, mapGridPosition _this
    ] call _dcout; //log veh position and map grid

    {
        if (owner _x == owner _this) then {

            [
                "Owner => ID:%1, NETID:%2, UID:%3, NAME:%4, OBJ:%5",
                owner _x, netId _x, getPlayerUID _x, name _x, _x 
            ] call _dcout; //log current owner

        };
    } count playableUnits;
    {

        [
            "Crew => OBJ:%1, NAME:%2, UID:%3, SEAT:%4", 
            _x, name _x, getPlayerUID _x, assignedVehicleRole _x
        ] call _dcout; //log current vehicle crew and vehicle seat

    } count crew _this;
    {

        if (
            isPlayer _x && 
            {_x distance _this <= 100} && 
            {!(_x in _this)}
        ) then {

            [
                "Near => OBJ:%1, NAME:%2, UID:%3, DISTANCE:%4",
                _x, name _x, getPlayerUID _x, _x distance _this
            ] call _dcout; //log near players and distance

        };
    } count playableUnits;

    _id = "0";
    _uid = "0";
    _key = "";
    _id   = _this getVariable ["ObjectID","0"];
    _uid  = _this getVariable ["ObjectUID","0"];

    if (parseNumber _id > 0) then {
        _key = format["CHILD:304:%1:",_id];
        _key call server_hiveWrite;
        diag_log format["DELETE: %1 Deleted by ID: Server Hash Fail Check",_id];
    } else  {
         if (parseNumber _uid > 0) then {
            _key = format["CHILD:310:%1:",_uid];
            _key call server_hiveWrite;
            diag_log format["DELETE: %1 Deleted by Server Hash Fail Check",_uid];
        };
    };

    deleteVehicle _this; //delete it
    _this = nil;  //nil it

    //"debug_console" callExtension "A"; //alert beep
    //use url_fetch to alert admin anywhere?
};

