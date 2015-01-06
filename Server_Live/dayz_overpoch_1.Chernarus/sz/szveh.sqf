if (isNil "zombzsafezone") then {
    zombzsafezone = true;
};
while {true} do {
    // Vehicle Godmode on.
    waitUntil { !zombzsafezone };
    waitUntil { player != vehicle player };
    theVehicle = vehicle player;
    theVehicle removeAllEventHandlers "handleDamage";
    theVehicle addEventHandler ["handleDamage", { ZombZInSafeZone = 1; false}];
    theVehicle allowDamage false;
    fnc_usec_damageVehicle ={};
    vehicle_handleDamage ={};
    vehicle_handleKilled ={};
    diag_log( "Vehicle godmode ON"); // Uncomment this to help see when it turns on
    waitUntil { zombzsafezone };
    // Vehicle Godmode off.
    theVehicle removeAllEventHandlers "handleDamage";
    theVehicle addEventHandler ["handleDamage", {_this select 2}];
    theVehicle allowDamage true;
    // Call global scripts.
    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
    diag_log( "Vehicle godmode OFF"); // Uncomment this to help see when it turns off
};