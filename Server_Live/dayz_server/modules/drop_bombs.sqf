// Sample Drop Bomb
private ["_position"];
_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
bomb = createVehicle ["Bo_GBU12_LGB", [(_position select 0),(_position select 1), 1000], [], 0, "CAN_COLLIDE"];

bomb call {
    _this setVariable [
        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
        "hash_id" callExtension format [
            "%1:%2",
            netId _this,
            typeOf _this
        ]
    ];
};