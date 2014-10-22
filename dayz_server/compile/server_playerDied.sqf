private ["_characterID","_minutes","_newObject","_playerID","_infected","_victimName","_victim","_killer","_killerName","_weapon","_distance","_loc_message","_nearLocations","_nearestLocation","_rExec","_killMsgThread","_death_record","_key"];
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;

//Enable Debug Messages?
P2DZ_DeathMessage_Debug = true;

//Enable Death Messages in Chat?
P2DZ_DeathMessage_Chat_Enabled = true;

//Enable GUI Death Messages?
P2DZ_DeathMessage_GUI_Enabled = true;

if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"Unknown";};
};

_deathMessageSent = 	false;

/* Get Victim Info */

_victim = 			_newObject;
_victimVehicle = 	vehicle _victim;

/* Set Victim body name */

_newObject setVariable ["bodyName", _victimName, true];

/* Get Killer Info */

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];

/* Get Town / Location Name */

_nearLocations = nearestLocations [([_victim] call FNC_GetPos), ["NameCityCapital","NameCity","NameVillage","NameLocal"],2500];

if (count _nearLocations > 0) then {
	_nearestLocation = text (_nearLocations select 0); 
} else {
	_nearestLocation = "Wilderness";
};

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.
if ((typeName _killer) != "STRING") then
{
	_weapon = _victim getVariable["AttackedByWeapon", "nil"];
	_distance = _victim getVariable["AttackedFromDistance", "nil"];

	if ((owner _victim) == (owner _killer)) then 
	{
		_loc_message = format["PKILL: %1 killed himself", _victimName];

		/*---------------------------------------------------------------------------
		Death by Suicide & Vehicle Suicide Chat Message
		---------------------------------------------------------------------------*/
		if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {

			/* if the victim was in a vehicle */
			if ((getText (configFile >> "CfgVehicles" >> (typeOf _victimVehicle) >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
				P2DZE_systemChat = format["%1 committed suicide near %2 in a %3",(_victimName),(_nearestLocation),(typeOf _victimVehicle)];
				publicVariable "P2DZE_systemChat";
				_deathMessageSent = true;
			} else {
				P2DZE_systemChat = format["%1 committed suicide near %2",(_victimName),(_nearestLocation)];
				publicVariable "P2DZE_systemChat";
				_deathMessageSent = true;
			};
		};
	}
	else
	{
		/*---------------------------------------------------------------------------
		Death was caused by PvP
		---------------------------------------------------------------------------*/

		/*---------------------------------------------------------------------------
		PVP Kill Messages (GUI & Chat)
		---------------------------------------------------------------------------*/
		if (P2DZ_DeathMessage_GUI_Enabled) then {
			[_killer,_killerName,_victim,_victimName,_weapon,_distance,_nearestLocation] call player2_deathMessage;
			_deathMessageSent = true;
		};

	};

	/*---------------------------------------------------------------------------
	Death was caused by Other Killer?
	---------------------------------------------------------------------------*/


	/*---------------------------------------------------------------------------
	Other Killer Death Message (Chat)
	---------------------------------------------------------------------------*/
	if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {
		P2DZE_systemChat = format["%1 was killed near %2",(_victimName),(_nearestLocation)];
		publicVariable "P2DZE_systemChat";
		_deathMessageSent = true;
	};


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

/*---------------------------------------------------------------------------
Death was caused by no Killer?
---------------------------------------------------------------------------*/

if (P2DZ_DeathMessage_Debug) then {
	diag_log("P2DZ_DeathMessage_Debug: Player Died");
	diag_log(format["	_this: %1",(str _this)]);
	diag_log(format["	_killer: %1",(str _killer)]);
	diag_log(format["	_killerName: %1",(str _killerName)]);
	diag_log(format["	_victim: %1",(str _victim)]);
	diag_log(format["	_victimName: %1",(str _victimName)]);
	diag_log(format["	_victimVehicle: %1",(str (typeOf _victimVehicle))]);
	diag_log(format["	_weapon: %1",(str _weapon)]);
	diag_log(format["	_distance: %1",(str _distance)]);
	diag_log(format["	_nearestLocation: %1",(str _nearestLocation)]);
	diag_log(format["									"]);
};

/*---------------------------------------------------------------------------
Unknown Causes Death Message (Chat)
---------------------------------------------------------------------------*/

if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {
	P2DZE_systemChat = format["%1 died near %2",(_victimName),(_nearestLocation)];
	publicVariable "P2DZE_systemChat";
	_deathMessageSent = true;
};

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
