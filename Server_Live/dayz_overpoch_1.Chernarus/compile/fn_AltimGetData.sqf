
private ["_hours","_minutes","_myAlt","_mybearing","_date","_transitionMoon","_data"];
_myAlt = round((getPosATL player) select 2);
_mybearing = round(getDir player);

_date = date;
_hours = _date select 3;
if (_hours < 10) then { _hours = "0" + (str _hours); };
_minutes = _date select 4;
if (_minutes < 10) then { _minutes = "0" + (str _minutes); };

_date = format ["%1:%2", _hours, _minutes];

_transitionMoon = 1;

_data = [_myAlt, _mybearing, _date, _transitionMoon];
_data;