private ["_lastZedHitTime","_lastHr","_lastMin","_curHr","_curMin","_zedHit","_characterID", "_minutes", "_newObject", "_playerID", "_infected", "_victimName", "_deathMessageSent", "_victim", "_victimVehicle", "_pGold", "_killer", "_killerName", "_weapon", "_distance", "_victimPos", "_nearLocations", "_nearestLocation", "_loc_message","_method", "_canHitFree", "_isBandit", "_punishment", "_humanityHit", "_killModifier", "_kills", "_killsV", "_death_record", "_key", "_currentTime", "_day", "_hour", "_mins", "_secs", "_statsMessage"];
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;

_newObject call {
    _this setVariable [
        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
        "hash_id" callExtension format [
            "%1:%2",
            netId _this,
            typeOf _this
        ]
    ];
}; 

//diag_log(format["P2DEBUG: %1: Input: %2","playerDied",_this]);

//Enable Debug Messages?
P2DZ_DeathMessage_Debug = false;

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

/* Add gold to player body */
if (((count _this) >= 6) && {(typeName (_this select 6)) == (typeName (0))} && {(_this select 6) != 0}) then {
	_pGold = 		_this select 6;
	
	//debugging line
	//diag_log(format["P2DEBUG: %1: ZombZGold: %2","playerDied",_pGold]);
	
	if (!isNil '_pGold') then {
		_newObject setVariable ["ZombZGold", _pGold, true];
	};
};

/* Set Victim body name */

_newObject setVariable ["bodyName", _victimName, true];

/* Get Killer Info */

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];
_weapon = _victim getVariable["AttackedByWeapon", "nil"];
_distance = _victim getVariable["AttackedFromDistance", "nil"];

/* Get Town / Location Name */
_victimPos = ([_victim] call FNC_GetPos);
_nearLocations = nearestLocations [(_victimPos), ["NameCityCapital","NameCity","NameVillage","NameLocal"],2500];

if (count _nearLocations > 0) then {
	_nearestLocation = text (_nearLocations select 0); 
} else {
	_nearestLocation = "Wilderness";
};

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.
if ((typeName _killer) != "STRING") then
{
	if ((owner _victim) == (owner _killer)) then 
	{
		_loc_message = format["PKILL: %1 killed himself", _victimName];

		/*---------------------------------------------------------------------------
		Death by Suicide & Vehicle Suicide Chat Message
		---------------------------------------------------------------------------*/
		if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {

			/* if the victim was in a vehicle */
			if ((getText (configFile >> "CfgVehicles" >> (typeOf _victimVehicle) >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
				P2DZE_systemChat = [1,format["%1 committed suicide near %2 in a %3",(_victimName),(_nearestLocation),(typeOf _victimVehicle)]];
				publicVariable "P2DZE_systemChat";
				_deathMessageSent = true;
				_newObject setVariable ["deathType","vehsuicide",true];
			} else {
				P2DZE_systemChat = [1,format["%1 committed suicide near %2",(_victimName),(_nearestLocation)]];
				publicVariable "P2DZE_systemChat";
				_deathMessageSent = true;
				_newObject setVariable ["deathType","suicide",true];
			};
		};
	}
	else
	{
		/*---------------------------------------------------------------------------
		Death was caused by PvP
		---------------------------------------------------------------------------*/

		/*
		PVP Kill Messages (GUI & Chat)
		*/
		if (P2DZ_DeathMessage_GUI_Enabled) then {
			[_killer,_killerName,_victim,_victimName,_weapon,_distance,_nearestLocation] call player2_deathMessage;
			_deathMessageSent = true;
		};

		/*
		Check if Victim was Innocent or Not
		*/
		_canHitFree = _newObject getVariable ["freeTarget",false];
		_isBandit = (_newObject getVariable["humanity",0]) <= -5000; //Default: 2000
		_punishment = _canHitFree || _isBandit; //if u are bandit || start first - player will not recieve humanity drop
		_humanityHit = 0;

		/*
		Set Attacker Humanity & Set Attacker Kills
		*/

		if (!_punishment) then {
			//i'm "not guilty" - kill me && be punished
			_killModifier = ((_newObject getVariable ["humanKills",0]) / 30) * 1000;
			_humanityHit = -(1000 - _killModifier);  //Default: 2000
			_kills = _killer getVariable ["humanKills",0];
			_killer setVariable ["humanKills",(_kills + 1),true];
			PVDZE_send = [_killer,"Humanity",[_killer,(round _humanityHit),300]];
			PVDZE_send call server_sendToClient;
		} else {
			//i'm "guilty" - kill me as bandit
			_killsV = _killer getVariable ["banditKills",0];
			_killer setVariable ["banditKills",(_killsV + 1),true];
			//Give humanity for killing as bandit
			_humanityHit = 1000;
			PVDZE_send = [_killer,"Humanity",[_killer,(round _humanityHit),300]];
			PVDZE_send call server_sendToClient;
		};

		_newObject setVariable ["deathType","pvp",true];

		/*---------------------------------------------------------------------------
		---------------------------------------------------------------------------*/
	};

	/*---------------------------------------------------------------------------
	Death was caused by Other Killer? (runover detection?)
	---------------------------------------------------------------------------*/


	/*---------------------------------------------------------------------------
	Other Killer Death Message (Chat)
	---------------------------------------------------------------------------*/
	if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {
		P2DZE_systemChat = [1,format["%1 was killed near %2",(_victimName),(_nearestLocation)]];
		publicVariable "P2DZE_systemChat";
		_deathMessageSent = true;
	};


	// build array to store death messages to allow viewing at message board in trader citys.
	_death_record = [
		_victimName,
		_killerName,
		_weapon,
		_distance,
		serverTime
	];
	PlayerDeaths set [count PlayerDeaths,_death_record];

	// Cleanup
	_victim setVariable["AttackedBy", "nil", true];
	_victim setVariable["AttackedByName", "nil", true];
	_victim setVariable["AttackedByWeapon", "nil", true];
	_victim setVariable["AttackedFromDistance", "nil", true];
};

/*---------------------------------------------------------------------------
Death Was caused by Zombie?
---------------------------------------------------------------------------*/
if (!_deathMessageSent) then {
	//Was player hit by zombie in the last 10 minutes?
	_lastZedHitTime = _victim getVariable["lastZedHitTime", false];
	waitUntil {!isNil "_lastZedHitTime"};

	if (typeName _lastZedHitTime == typeName []) then {
		_zedHit = false;
		_lastHr	 = _lastZedHitTime select 0;
		_lastMin = _lastZedHitTime select 1;
		_curHr = ((date) select 3);
		_curMin = ((date) select 4);
		if (_lastHr == _curHr) then {
			if ((_curMin - _lastMin) > 5) then {
				//If cur minute (eg 56) - LastMin (eg 51) = 5, is not greater than 5, then zed hit player less than 5 mins ago!
				_zedHit = false;
			} else {
				//If cur minute (eg 55) - lastMin (eg 3) = 52, is greater than 5, then zed hit player more than 5 mins ago!
				_zedHit = true;
			};
		} else {
			if (_lastHr == (_curHr - 1)) then {
				if ((_lastMin - _curMin) > 54) then {
					//If last minute (eg 56) - currentMin (eg 1) = 55, is greater than 54, then zed hit player less than 5 mins ago!
					_zedHit = true;
				} else {
					//If last minute (eg 58) - currentMin (eg 4) = 54, is not greater than 54, then zed hit player more than 5 mins ago!
					_zedHit = false;
				};
			} else {
				_zedHit = false;
			}
		};

		if (_zedHit) then {
			P2DZE_systemChat = [1,format["%1 was eaten by zombies near %2",(_victimName),(_nearestLocation)]];
			publicVariable "P2DZE_systemChat";
			_deathMessageSent = true;
			//Set death type to zombie
			_newObject setVariable ["deathType","zombie",true];
		};
	};
};



/*---------------------------------------------------------------------------
Unknown Causes Death Message (Chat)
---------------------------------------------------------------------------*/

if (P2DZ_DeathMessage_Chat_Enabled && !_deathMessageSent) then {
	P2DZE_systemChat = [1,format["%1 died near %2",(_victimName),(_nearestLocation)]];
	publicVariable "P2DZE_systemChat";
	_deathMessageSent = true;
};

//Set Time of death for server-cleanup script
_newObject setVariable["processedDeath",diag_tickTime];

//Set Time of Death for study body warmth
_newObject setVariable["tod",serverTime,true];

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
Send death to hive if legit character
---------------------------------------------------------------------------*/

//diag_log ("PDEATH: Player Died " + _playerID);
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

/*---------------------------------------------------------------------------
Stats Output
----------------------------------------------------------------------------*

Output:
	Day,Hour,Minutes,Seconds,VictimName,VictimUID,VictimPos,Victim Vehicle,Nearest Location
---------------------------------------------------------------------------*/

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
	"%1,%2,%3,%4,%5,%6,%7,%8,%9",
	_day,_hour,_mins,_secs,_victimName,(getPlayerUID _victim),mapGridPosition _victimPos,(typeOf (vehicle _victim)),_nearestLocation
];

//send to stats log
_statsMessage call stats_deaths;

