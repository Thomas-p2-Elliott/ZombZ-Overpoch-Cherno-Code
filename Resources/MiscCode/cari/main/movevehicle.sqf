private ["_long"];
_long = ;
private ["_vehicle"];_vehicle = _this select 0;
			
_vehicle attachTo [player,[0,3,3]];
uiSleep .1;
detach _vehicle;
detach player;systemChat format ["%1 was moved to you",typeOf _vehicle];