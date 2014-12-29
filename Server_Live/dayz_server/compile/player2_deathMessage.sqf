private ["_killer","_killerName","_victim","_victimName","_weapon","_distance","_nearestLocation","_isCar","_isHeli","_isBoat","_killedByVehicle","_weaponClassname","_picture","_killerDistance","_killerVehicle","_adjective","_currentTime","_day","_hour","_mins","_secs","_killerPos","_victimPos","_statsMessage","_killerUID","_victimUID"];
_killer =			_this select 0;
_killerName	=		_this select 1;
_victim = 			_this select 2;
_victimName = 		_this select 3;
_weapon = 			_this select 4;
_distance =			_this select 5;
_nearestLocation =  _this select 6;
_killerPos = 		[];
_victimPos =		[];
_currentTime = 		[];
_isCar =			false;
_isHeli =			false;
_isBoat = 			false;
_killedByVehicle = 	false;
_weaponClassname =  "";
_picture = 			"";
_statsMessage = 	"";
_killerDistance = 	100;
_day = 				0;
_hour = 			0;
_mins = 			0;
_secs = 			0;

P2DZ_DeathMessage_Debug = false;

if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: Input: %1", (str _this)]); };


//		Get current real time
//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
_currentTime = "real_date" callExtension "+";
_currentTime = call compile _currentTime;
_day = 			_currentTime select 2;
_hour = 		_currentTime select 3;
_mins = 		_currentTime select 4;
_secs = 		_currentTime select 5;

//get position of killer and victim
_killerPos = ([_killer] call FNC_GetPos);
_victimPos = ([_victim] call FNC_GetPos);

/* Check if the killer used a vehicle */

_killerVehicle = 	vehicle _killer;
_isCar = 			_killerVehicle isKindOf "Car";
_isHeli = 			_killerVehicle isKindOf "Air";
_isBoat = 			_killerVehicle isKindOf "Sea";

if ((getText (configFile >> "CfgVehicles" >> (typeOf _killerVehicle) >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
	_killedByVehicle = true;
};

if (_isCar || _isHeli || _isBoat) then {
	_killedByVehicle = true;
};

/* Double check we habve a weapon name */

if (isNil "_weapon") then {

	if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _weapon, setting to: %1", weaponState _killer]); };

	_weaponClassname = weaponState _killer;

	if (isNil "_weaponClassname") then {
		if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _weapon, setting to: Unknown"]); };
		_weaponClassname = ["Unknown"];
	};
} else {
	_weaponClassname = [_weapon];
};

/* Create the picture text and if killer vehicle update the weapon name */

if (_killedByVehicle) then {
	_weaponClassname = typeOf _killerVehicle;
	_picture = (gettext (configFile >> "cfgVehicles" >> (_weaponClassname) >> "picture"));
} else {
	if (_weaponClassname select 0 == "Throw") then 
	{
		_weaponClassname = _weaponClassname select 3;
	}
	else
	{
		_weaponClassname = _weaponClassname select 0;
	};

	_picture = (gettext (configFile >> "cfgWeapons" >> (_weaponClassname) >> "picture"));
};

/* Double check we have a victim name */

if (isNil "_victimName") then {

	if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _victimName, setting to: %1", name _victim]);};

	_victimName = name _victim;

	if (isNil "_victimName") then {
		if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _victimName, setting to: Unknown"]); };
	};
};

/* Double check we have a killer name */

if (isNil "_killerName") then {

	if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerName, setting to: %1", name _killer]);};

	_killerName = name _killer;

	if (isNil "_killerName") then {
		if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerName, setting to: Unknown"]); };
		_killerName = "Unknown";
	};
};

/* Triple check that we have a distance */

if (isNil "_distance") then {

	if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _distance, setting to: KK_fnc_distanceASL Result"]);};

	_killerDistance = [getPosASL _victim, getPosASL _killer] call KK_fnc_distanceASL;

	if (isNil "_killerDistance") then {
		if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerDistance, setting to: %1", _victim distance _killer]);};
		
		_killerDistance = _killer distance _victim;

		if (isNil "_killerDistance") then {
			if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerDistance, setting to: 100"]); };
			_killerDistance = 100;
		};
	};
} else {
	_killerDistance = _distance;	
};

_killerDistance = floor(_killerDistance);

/*---------------------------------------------------------------------------
Send Messages
---------------------------------------------------------------------------*/

if (!isNil "_victimName" && !isNil "_killerName" && !isNil "_killerDistance" && !isNil "_picture") then {

	if (P2DZ_DeathMessage_Debug) then { 
		diag_log(format["P2DZ_DeathMessage_Debug: Firing P2DZE_DeathMessage_GUI with: %1",
		 str[_victimName,_killerName,_killerDistance,_picture,_weaponClassname,_nearestLocation]]); 
	};

	P2DZE_DeathMessage_GUI = [_victimName,_killerName,_killerDistance,_picture];
	publicVariable "P2DZE_DeathMessage_GUI";

	switch (ceil(random 10)) do {
		case (1): 	{ _adjective = 'murdered'; 		};
		case (2): 	{ _adjective = 'taken out'; 	};
		case (3): 	{ _adjective = 'killed'; 		};
		case (4): 	{ _adjective = 'defeated'; 		};
		case (5): 	{ _adjective = 'wasted'; 		};
		case (6): 	{ _adjective = 'assasinated'; 	};
		case (7): 	{ _adjective = 'finished off';	};
		case (8): 	{ _adjective = 'dispatched'; 	};
		case (9): 	{ _adjective = 'slaughtered';	};
		case (10): 	{ _adjective = 'executed'; 		};
		default 	{ _adjective = 'killed'; 		};
	};

	if (P2DZ_DeathMessage_Debug) then { 
		diag_log("P2DZ_DeathMessage_Debug: Firing P2DZE_DeathMessage_GUI with: ");
		diag_log format["%1 was %2 with a %3 from %4m by %5 near %6",(_victimName),(_adjective),(_weaponClassname),(_killerDistance),(_killerName),(_nearestLocation)];
	 };

	P2DZE_systemChat = [1,format["%1 was %2 with a %3 from %4m by %5 near %6",(_victimName),(_adjective),(_weaponClassname),(_killerDistance),(_killerName),(_nearestLocation)]];
	publicVariable "P2DZE_systemChat";
};

/*---------------------------------------------------------------------------
Stats Logging
----------------------------------------------------------------------------*
Output:
	Day,Hour,Minute,Second,KillerName,KillerUID,VictimName,VictimUID,KillerPos,VictimPos,KillerDistance,KillerWeapon,VictimVehicle,KillerVehicle,NearestLocation
*/

_killerUID = [_killer] call FNC_GetPlayerUID;
_victimUID = [_victim] call FNC_GetPlayerUID;


_statsMessage = format[
	"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
	_killerUID,_victimUID,_weaponClassname,_killerPos,_victimPos,_killerdistance,GORSYSERVERNUMBER
];
//send to stats log
_statsMessage call stats_kills;