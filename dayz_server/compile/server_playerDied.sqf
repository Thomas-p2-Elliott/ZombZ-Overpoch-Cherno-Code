private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;
if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};
_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.
if ((typeName _killer) != "STRING") then
{
	_weapon = _victim getVariable["AttackedByWeapon", "nil"];
	_distance = _victim getVariable["AttackedFromDistance", "nil"];

	if ((owner _victim) == (owner _killer)) then 
	{
		_message = format["%1 killed himself",_victimName];
		_loc_message = format["PKILL: %1 killed himself", _victimName];
	}
	else
	{
		_message = format["%1 was killed by %2 with weapon %3 from %4m",_victimName, _killerName, _weapon, _distance];
		_loc_message = format["PKILL: %1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];


		/*---------------------------------------------------------------------------
		Death was caused by PvP
		---------------------------------------------------------------------------*/
		//Enable Debug Messages?
		P2DZ_DeathMessage_Debug = true;

		//Vars
		_isCar =			false;
		_isHeli =			false;
		_isBoat = 			false;
		_killedByVehicle = 	false;
		_killerVehicle = 	objNull;
		_weaponClassname =  "";
		_picture = 			"";
		_killerDistance = 	100;

		//Code
		_killerVehicle = 	vehicle _killer;
		_isCar = 			_killerVehicle isKindOf "Car";
		_isHeli = 			_killerVehicle isKindOf "Air";
		_isBoat = 			_killerVehicle isKindOf "Sea";

		diag_log _loc_message;

		if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: Input: %1", str[_victimName,_killerName,_distance,_weapon]]); };

		if ((getText (configFile >> "CfgVehicles" >> (typeOf _killerVehicle) >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
			_killedByVehicle = true;
		};

		if (_isCar || _isHeli || _isBoat) then {
			_killedByVehicle = true;
		};

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

		if (isNil "_victimName") then {

			if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _victimName, setting to: %1", name _victim]);};

			_victimName = name _victim;

			if (isNil "_victimName") then {
				if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _victimName, setting to: Unknown"]); };
			};
		};
		
		if (isNil "_killerName") then {

			if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerName, setting to: %1", name _killer]);};

			_killerName = name _killer;

			if (isNil "_killerName") then {
				if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: isNil _killerName, setting to: Unknown"]); };
				_killerName = "Unknown";
			};
		};

		
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
			if (P2DZ_DeathMessage_Debug) then { diag_log(format["P2DZ_DeathMessage_Debug: Firing P2DZE_dM with: %1", str[_victimName,_killerName,_killerDistance,_picture]]); };

			P2DZE_dM = [_victimName,_killerName,_killerDistance,_picture];
			publicVariable "P2DZE_dM";
		};
	};

	diag_log _loc_message;


	// build array to store death messages to allow viewing at message board in trader citys.
	_death_record = [
		_victimName,
		_killerName,
		_weapon,
		_distance,
		ServerCurrentTime
	];
	PlayerDeaths set [count PlayerDeaths,_death_record];

	// Cleanup
	_victim setVariable["AttackedBy", "nil", true];
	_victim setVariable["AttackedByName", "nil", true];
	_victim setVariable["AttackedByWeapon", "nil", true];
	_victim setVariable["AttackedFromDistance", "nil", true];
};

// Might not be the best way...
/*
if (isnil "dayz_disco") then {
	dayz_disco = [];
};
*/

// dayz_disco = dayz_disco - [_playerID];
_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then
{
	_minutes = parseNumber _minutes;
};

diag_log ("PDEATH: Player Died " + _playerID);
if (!isNil '_characterID') then {
	if (_characterID != "0") then
	{
		_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
		#ifdef DZE_SERVER_DEBUG_HIVE
		diag_log ("HIVE: WRITE: "+ str(_key));
		#endif
		_key call server_hiveWrite;
	}
	else
	{
		deleteVehicle _newObject;
	};
};
