private ["_display","_btnTitle0","_btnTitle1","_btnTitle2","_btnTitle3","_btnTitle4","_btnTitle5","_playeruid"];
disableSerialization;
waitUntil {
	_display = findDisplay 49;
	!isNull _display;
};

_playeruid = getplayerUID player;

while {!isNull _display} do {
	
	_btnTitle0 = _display displayCtrl 			523;
	_btnTitle0 ctrlSetText 						format["Server: %1",(missionNamespace getVariable "P2DZ_serverName")];
	
	_btnTitle1 = _display displayCtrl 			121;
	_btnTitle1 ctrlSetText 						"Player UID: ";
	
	_btnTitle2 = _display displayCtrl 			120;
	_btnTitle2 ctrlSetText 						format["%1",_playeruid];

	_btnTitle3 = _display displayCtrl 			103;
	_btnTitle3 ctrlSetText 						"Server Info";
	_btnTitle3 ctrlEnable true;
	_btnTitle3 ctrlRemoveAllEventHandlers		"ButtonClick";
	_btnTitle3 ctrlAddEventHandler 				["ButtonClick","disableSerialization; _display = findDisplay 49; if (!((str _display) == 'No display')) then { _display closeDisplay 1; }; if (!dialog) then {	createDialog 'RscGorsyMenu'; } else { closeDialog 0; uiSleep 0.1; createDialog 'RscGorsyMenu'; }; "];
  	
  	_btnTitle4 = _display displayCtrl 			119;	
	_btnTitle4 ctrlSetText 						"Player Stats";
	_btnTitle4 ctrlEnable true;
	_btnTitle4 ctrlRemoveAllEventHandlers		"ButtonClick";
	_btnTitle4 ctrlAddEventHandler 				["ButtonClick","[['<t size=''1'' font=''Bitstream'' align=''left'' color=''#FFFFFF''>Information</t>',  
	'<br /><t size=''1.5'' font=''Bitstream'' align=''center'' color=''#F7F2E0''>Coming Soon!</t>'],4] spawn p2_miniMsg;"];

    _btnTitle5 = _display displayCtrl 			1010;	 
	_btnTitle5 ctrlSetText 						"Player Options";
	_btnTitle5 ctrlEnable true;
	_btnTitle5 ctrlRemoveAllEventHandlers		"ButtonClick";
	_btnTitle5 ctrlAddEventHandler 				["ButtonClick","disableSerialization; _display = findDisplay 49; if (!((str _display) == 'No display')) then { _display closeDisplay 1; }; if (!dialog) then {	createDialog 'p2_options'; } else { closeDialog 0; uiSleep 0.1; createDialog 'p2_options'; }; "];
    
	sleep 0.05;
};