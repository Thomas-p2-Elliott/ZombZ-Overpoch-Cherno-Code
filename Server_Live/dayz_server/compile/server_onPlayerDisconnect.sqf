private ["_invehicle","_isplayernearby","_playerObj","_myGroup","_id","_playerUID","_playerName","_characterID","_timeout","_message","_magazines","_playerPos"];
_playerUID = _this select 0;
_playerName = _this select 1;
_playerObj = nil;
_playerPos = [];
{
	if ((getPlayerUID _x) == _playerUID) exitWith {_playerObj = _x;};
} count playableUnits;

if (isNil "_playerObj") then {
//	diag_log format["nil player object attempting PV, :%1", _this];
	
	// fall back to using PV for now so we have a better chance at finding the player
	_playerObj = call compile format["PVDZE_player%1",_playerUID];
};

if (isNil "_playerObj") exitWith {
	//diag_log format["%1: nil player object, _this:%2", __FILE__, _this];
};

//diag_log format["get: %1 (%2), sent: %3 (%4)",typeName (getPlayerUID _playerObj), getPlayerUID _playerObj, typeName _playerUID, _playerUID];

if (!isNull _playerObj) then {

	_playerPos = getPos _playerObj;
	_characterID =	_playerObj getVariable ["CharacterID","0"];
	_timeout = _playerObj getVariable["combattimeout",0];

	_invehicle = false;

	if (vehicle _playerObj != _playerObj) then {
		_playerObj action ["eject", vehicle _playerObj];
		_invehicle = true;
		//diag_log format["LOGOUT IN VEHICLE: %1 at location %2", _playerName,(getPos _playerObj)];
	};

	if ((_timeout - time) > 0) then {

		_playerObj setVariable["NORRN_unconscious",true, true];
		_playerObj setVariable["unconsciousTime",15,true];
	
		//diag_log format["COMBAT LOGGED: %4/%1 (%2) at location %3", _playerName,_timeout,(getPos _playerObj),_playerUID];
	
		// Message whole server when player combat logs
		_message = format["%1 Combat Logged, KO Timer Set.",_playerName];
		P2DZE_systemChat = [2,_message];
		publicVariable 'P2DZE_systemChat'; 
	};

	//diag_log format["DISCONNECT: %1 (%2) Object: %3, _characterID: %4 at loc %5", _playerName,_playerUID,_playerObj,_characterID, (getPos _playerObj)];

	_id = [_playerUID,_characterID,2] spawn dayz_recordLogin;

	if (alive _playerObj) then {

		_isplayernearby = (DZE_BackpackGuard && !_invehicle && ({(isPlayer _x) && (alive _x)} count (_playerPos nearEntities ["AllVehicles", 5]) > 1));

		// prevent saving more than 20 magazine items
		_magazines = [(magazines _playerObj),20] call array_reduceSize;

		[_playerObj,_magazines,true,true,_isplayernearby] call server_playerSync;
		
		// remove player
		_playerObj call dayz_removePlayerOnDisconnect;
	} else {
		//Update Vehicle
		{ 
			[_x,"gear"] call server_updateObject;
		} count (nearestObjects [_playerPos, dayz_updateObjects, 10]);
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

_month =		_currentTime select 1;
_day = 			_currentTime select 2;
_hour = 		_currentTime select 3;
_mins = 		_currentTime select 4;
_secs = 		_currentTime select 5;

//build message
_statsMessage = format[
	"%1,%2,%3,%4,%5,%6,%7,%8",
	_month,_day,_hour,_mins,_secs,_playerName,_playerUID,(getPos _playerObj)
];

//send to stats log
_statsMessage call stats_disconnects;
