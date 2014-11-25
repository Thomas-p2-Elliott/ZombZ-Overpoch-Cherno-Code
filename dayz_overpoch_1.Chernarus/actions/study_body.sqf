private["_body","_name","_method","_methodStr","_bodyTempText","_timeOfDeath","_currentTime","_timeDiff"];
_body = 		_this select 3;
_name = 		_body getVariable["bodyName","unknown"];
_method = 		_body getVariable["deathType","unknown"];
_timeOfDeath = 	_body getVariable["tod",0];
_currentTime = serverTime;
_timeDiff = _currentTime - _timeOfDeath;


if (_method == "pvp") then {
	_methodStr = "it appears he died from a gun shot wound...";
};
if (_method == "zombie") then {
	_methodStr = "it appears he died to zombies...";
};
if (_method == "suicide") then {
	_methodStr = "it appears he by suicide...";
};
if (_method == "vehsuicide") then {
	_methodStr = "it appears he by suicide in a vehicle...";
};
if (_method == "unknown") then {
	_methodStr = "I can't tell how he died...";
};

_bodyTempText = "The body is still very fresh.";

if (_timeDiff > 120) then {
	_bodyTempText = "The body is still fresh.";
};
if (_timeDiff > 180) then {
	_bodyTempText = "The body is still very warm.";
};
if (_timeDiff > 240) then {
	_bodyTempText = "The body is still warm.";
};
if (_timeDiff > 300) then {
	_bodyTempText = "The body is almost warm.";
};
if (_timeDiff > 420) then {
	_bodyTempText = "The body is starting to get cold.";
};
if (_timeDiff > 600) then {
	_bodyTempText = "The body is almost cold.";
};
if (_timeDiff > 1200) then {
	_bodyTempText = "The body is cold.";
};

cutText [format["His name was %1, %2%3",_name,_methodStr,_bodyTempText], "PLAIN DOWN"];
//Example: His name was Player2, it appears he died from a gun shot wound...The body is still fresh.