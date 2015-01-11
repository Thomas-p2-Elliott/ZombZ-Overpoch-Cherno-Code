private ["_long"];
_long = ;
private ["_cariDayG","_cariNightG"];if (cariNight == 0) then {
	cariNight = 1;
	systemChat "Night";
	_cariNightG = format ["setDate [2012,9,1,3,30];"];
	uiSleep 1;
	[_cariNightG] call cariRE;
} else {
	cariNight = 0;
	systemChat "Day";
	_cariDayG = format ["setDate [2012,9,1,14,0];"];
	uiSleep 1;
	[_cariDayG] call cariRE;
};