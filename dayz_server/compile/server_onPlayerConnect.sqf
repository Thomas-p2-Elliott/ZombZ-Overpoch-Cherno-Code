private["_input","_uid","_name"];
_input = _this;
_uid = _input select 0;
_name = _input select 1;

/*---------------------------------------------------------------------------
Stats Output
----------------------------------------------------------------------------*

Output:
	Month,Day,Hour,Minutes,Seconds,Name,UID
---------------------------------------------------------------------------*/

//		Get current real time
//	[yyyy,mm,dd,mm,ss,wd,yd,dow,dst] example: [2014,9,24,21,9,57,3,266,0])
//	wd = weekday, yd = yearday, dow = day of week (0 = sun, 6 = sat), dst = daylight savings
_currentTime = "real_date" callExtension "+";
_currentTime = call compile _currentTime;

_month = 		_currentTime select 1;
_day = 			_currentTime select 2;
_hour = 		_currentTime select 3;
_mins = 		_currentTime select 4;
_secs = 		_currentTime select 5;

//build message
_statsMessage = format[
	"%1,%2,%3,%4,%5,%6,%7",
	_month,_day,_hour,_mins,_secs,_uid,_name
];

//send to stats log
_statsMessage call stats_connects;
