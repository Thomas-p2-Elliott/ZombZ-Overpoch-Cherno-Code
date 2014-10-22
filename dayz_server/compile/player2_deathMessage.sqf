private ["_killer","_killerName","_victim","_victimName","_weapon","_distance","_isCar","_isHeli","_isBoat","_killedByVehicle","_weaponClassname","_picture","_killerDistance","_nearestLocation","_killerVehicle","_adjective","_rExec","_message"];
_killer =			_this select 0;
_killerName	=		_this select 1;
_victim = 			_this select 2;
_victimName = 		_this select 3;
_weapon = 			_this select 4;
_distance =			_this select 5;
_nearestLocation =  _this select 6;

_isCar =			false;
_isHeli =			false;
_isBoat = 			false;
_killedByVehicle = 	false;
_weaponClassname =  "";
_picture = 			"";
_killerDistance = 	100;

if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: Input: %1", (str _this)]); };

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
		
		_killerDistance = _victim distance _killer;

		if (isNil "_killerDistance") then {
			if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerDistance, setting to: 100"]); };
			_killerDistance = 100;
		};
	};
} else {
	_killerDistance = _distance;
};
_killerDistance = floor(_killerDistance);

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

	P2DZE_systemChat = format["%1 was %2 with a %3 from %4m by %5 near %6",(_victimName),(_adjective),(_weaponClassname),(_killerDistance),(_killerName),(_nearestLocation)];
	publicVariable "P2DZE_systemChat";
};