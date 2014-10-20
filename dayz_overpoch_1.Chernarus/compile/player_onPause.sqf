private ["_display","_btnTitle0","_btnTitle1","_btnTitle2","_playeruid"];
disableSerialization;
waitUntil {
	_display = findDisplay 49;
	!isNull _display;
};

_playeruid = getplayerUID player;


while {!isNull _display} do {
	
	_btnTitle0 = _display displayCtrl 	523;	//top
	_btnTitle0 ctrlSetText 				format["Server: %1",(missionNamespace getVariable "P2DZ_serverName")];
	
	_btnTitle1 = _display displayCtrl 	121;	//lower top
	_btnTitle1 ctrlSetText 				"Player UID: ";
	
	_btnTitle2 = _display displayCtrl 	120;	//bottom
	_btnTitle2 ctrlSetText 				format["%1",_playeruid];

	sleep 0.1;
};
cutText ["", "PLAIN DOWN"];
