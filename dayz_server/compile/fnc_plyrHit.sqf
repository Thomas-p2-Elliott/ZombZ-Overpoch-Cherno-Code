private ["_victim", "_attacker","_weapon","_distance","_damage"];
_victim = _this select 0;
_attacker = _this select 1;
_damage = _this select 2;

if (!isPlayer _victim || !isPlayer _attacker) exitWith {};
if ((owner _victim) == (owner _attacker)) exitWith {
	_victim setVariable["AttackedBy", _victim, true];
};

_weapon = weaponState _attacker;
if (_weapon select 0 == "Throw") then 
{
	_weapon = _weapon select 3;
}
else
{
	_weapon = _weapon select 0;
};

_vehicle = typeOf (vehicle _attacker); 
if ((getText (configFile >> "CfgVehicles" >> _vehicle >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
	_weapon = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
};

_distance = _victim distance _attacker;

//diag_log format["PHIT: %1 was hit by %2 with %3 from %4m with %5 dmg", _victim, _attacker, _weapon, _distance, _damage];

_victim setVariable["AttackedBy", _attacker, true];
_victim setVariable["AttackedByName", (name _attacker), true];
//_victim setVariable["AttackedByWeapon", (currentWeapon _attacker), true];
_victim setVariable["AttackedByWeapon", _weapon, true];
_victim setVariable["AttackedFromDistance", _distance, true];


/*---------------------------------------------------------------------------
Stats Logging
----------------------------------------------------------------------------*
Output:
	Day,Hour,Minute,Second,AttackerName,AttackerUID,VictimName,VictimUID,Weapon,Distance,Damage,AttackerPosition,VictimPosition
*/

//		Get current real time
//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
_currentTime = "real_date" callExtension "+";
_currentTime = call compile _currentTime;
_day = 			_currentTime select 2;
_hour = 		_currentTime select 3;
_mins = 		_currentTime select 4;
_secs = 		_currentTime select 5;

//build message
_statsMessage = format[
	"%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11,%12,%13",
	_day,_hour,_mins,_secs,(name _attacker),(getPlayerUID _attacker),(name _victim),(getPlayerUID _victim),_weapon,_distance,_damage,(getPosATL _attacker),(getPosATL _victim)
];

//send to stats log
_statsMessage call stats_hits;