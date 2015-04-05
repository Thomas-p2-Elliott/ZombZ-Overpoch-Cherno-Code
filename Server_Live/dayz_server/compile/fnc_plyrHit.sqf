private ["_inp","_v", "_a","_wep","_dist","_dm","_r"];
_inp = _this;
_v = 	_inp select 0;
_a = 	_inp select 1;
_dm = 	_inp select 2;
_r = false;

if (!isPlayer _v) exitWith {};
if ((owner _v) == (owner _a)) exitWith {
	_v setVariable["AttackedBy", _v, true];
};

/*---------------------------------------------------------------------------
Fix for A.I. Death Messages/Logging (isPlayer _a removed from 1st exitWith)
---------------------------------------------------------------------------*/
_r = [_inp select 0, _inp select 1] call p2aiCheck;
if (_r) exitWith {	};

_wep = weaponState _a;
if (_wep select 0 == "Throw") then 
{
	_wep = _wep select 3;
}
else
{
	_wep = _wep select 0;
};

_veh = typeOf (vehicle _a); 
if ((getText (configFile >> "CfgVehicles" >> _veh >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
	_wep = getText (configFile >> "CfgVehicles" >> _veh >> "displayName");
};

_dist = _v distance _a;

//diag_log format["PHIT: %1 was hit by %2 with %3 from %4m with %5 dmg", _v, _a, _wep, _dist, _dm];

_v setVariable["AttackedBy", _a, true];
_v setVariable["AttackedByName", (name _a), true];
//_v setVariable["AttackedByWeapon", (currentWeapon _a), true];
_v setVariable["AttackedByWeapon", _wep, true];
_v setVariable["AttackedFromDistance", _dist, true];

/* TOM PLEASE CHECK
//gorsy debug kill punishment
_gridPosA = mapGridPosition getPos _a;
_convert = parseNumber _gridPosA;

if ( _convert > 400000) then {
	_splat = [655.216,74.605,10000];
	(getPlayerUID _a) setPos _splat;	
};
*/


/*---------------------------------------------------------------------------
Stats Logging
----------------------------------------------------------------------------*
Output:
	AttackerUID,VictimUID,Weapon,Distance,AttackerPosition,VictimPosition
*/

//build message
_statsMessage = format[
	"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
	(getPlayerUID _a),(getPlayerUID _v),_wep,(mapGridPosition _a),(mapGridPosition _v),_dist,GORSYSERVERNUMBER
];
//send to stats log
_statsMessage call stats_hits;