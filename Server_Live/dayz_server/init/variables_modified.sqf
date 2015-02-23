disableSerialization;


/*---------------------------------------------------------------------------
Executions
---------------------------------------------------------------------------*/
//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";

//init vehicle painting vars
call compile preprocessFileLineNumbers "init\variables_painting.sqf";

/*---------------------------------------------------------------------------
							Functions
---------------------------------------------------------------------------*/

/* KillzoneKid's More Accurate Distance Function 
Source: http://killzonekid.com/arma-scripting-tutorials-distance/	*/

KK_fnc_distanceASL = {
    private ["_v0","_v1"];
    _v0 = _this select 0;
    _v1 = _this select 1;
    sqrt (
        ((_v0 select 0) - (_v1 select 0)) ^ 2 + 
        ((_v0 select 1) - (_v1 select 1)) ^ 2 + 
        ((_v0 select 2) - (_v1 select 2)) ^ 2
    )
};
