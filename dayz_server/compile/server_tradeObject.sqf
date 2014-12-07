private ["_player","_traderID","_buyorsell","_classname","_traderCity","_currency","_qty","_clientID","_price","_currentTime","_day","_hour","_mins","_secs","_statsMessage","_outcome","_key","_data","_result"];

_player =		_this select 0;
_traderID = 	_this select 1;
_buyorsell = 	_this select 2;	//0 > Buy // 1 > Sell
_classname =	_this select 3;
_traderCity = 	_this select 4;
_currency =	_this select 5;
_qty =		_this select 6;
_clientID = 	owner _player;
_price = format ["%2x %1",_currency,_qty];
_name = if (alive _player) then { name _player; } else { "Dead Player"; };

if (_buyorsell == 0) then { //Buy

	diag_log format["EPOCH SERVERTRADE: Player: %1 (%2) bought a %3 in/at %4 for %5", _name, (getPlayerUID _player), _classname, _traderCity, _price];

	/*---------------------------------------------------------------------------
	Stats Output
	----------------------------------------------------------------------------*

	Output:
		Day,Hour,Minutes,Seconds,Transaction Type,Player Name, Player UID, Item Purchased, Trader City, Price
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
		"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6",
		"Buy",(getPlayerUID _player),_classname,_traderCity,_price,GORSYSEVERNUMBER
	];

	//send to stats log
	_statsMessage call stats_trades;

} else { //SELL

	diag_log format["EPOCH SERVERTRADE: Player: %1 (%2) sold a %3 in/at %4 for %5",_name, (getPlayerUID _player), _classname, _traderCity, _price];
	/*---------------------------------------------------------------------------
	Stats Output
	----------------------------------------------------------------------------*

	Output:
		Day,Hour,Minutes,Seconds,Transaction Type,Player Name, Player UID, Item Purchased, Trader City, Price
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
		"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6",
		"Sell",(getPlayerUID _player),_classname,_traderCity,_price,GORSYSEVERNUMBER
	];

	//send to stats log
	_statsMessage call stats_trades;
};

if (DZE_ConfigTrader) then {
	_outcome = "PASS";
} else {
	//Send request
	_key = format["CHILD:398:%1:%2:",_traderID,_buyorsell];

	_data = "HiveEXT" callExtension _key;
	_result = call compile format ["%1",_data];
	// diag_log ("TRADE: RES: "+ str(_result));
	_outcome = _result select 0;
};

dayzTradeResult = _outcome;
if(!isNull _player) then {
	_clientID publicVariableClient "dayzTradeResult";
};
