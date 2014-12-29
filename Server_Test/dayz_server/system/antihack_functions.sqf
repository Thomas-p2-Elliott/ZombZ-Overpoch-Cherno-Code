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
    if(!isNil "PDZE_Hash_Check") exitWith {  PDZE_Hash_2AS = PDZE_Hash_2AS + 1;};   //two lines just make SURE it is running and doesn't get stuck.
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
    0 = _this spawn KK_fnc_logFailed;
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

KK_fnc_logFailed = {
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


    _this setDamage 1; //destroy it
    deleteVehicle _this; //delete it
    //"debug_console" callExtension "A"; //alert beep
    //use url_fetch to alert admin anywhere?
};

