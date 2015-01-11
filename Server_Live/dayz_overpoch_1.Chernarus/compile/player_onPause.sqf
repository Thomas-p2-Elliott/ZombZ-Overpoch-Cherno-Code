private ["_display", "_playeruid", "_btnAbort", "_btnAbortText", "_timeOut", "_timeMax", "_canBuildModded", "_canBuildOld", "_btnTitle0", "_btnTitle1", "_btnTitle2", "_btnTitle3", "_btnTitle4", "_btnTitle5"];
disableSerialization;
waitUntil {
	_display = findDisplay 49;
	!isNull _display;
};

_playeruid = getplayerUID player;

_btnAbort = _display displayCtrl 104;
_btnAbort ctrlEnable false;
_btnAbortText = ctrlText _btnAbort;
_timeOut = 0;
_timeMax = diag_tickTime+30;
_canBuildModded = false;
if (isNil 'canBuild') then { canBuild = false; };
_canBuildOld = canBuild;

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
    
    _timeOut = diag_tickTime;
    switch true do {
		case (!r_player_dead && {isPlayer _x} count (player nearEntities ["AllVehicles", 12]) > 1) : {
			_btnAbort ctrlEnable false;
			cutText [localize "str_abort_playerclose", "PLAIN DOWN"];
		};
		case (!r_player_dead && player getVariable["combattimeout", 0] >= time) : {
			_btnAbort ctrlEnable false;
			cutText [localize "str_abort_playerincombat", "PLAIN DOWN"];
		};
		case (_timeOut < _timeMax) : {
			_btnAbort ctrlEnable false;
			if (!_canBuildModded) then { _canBuildOld = canBuild; canBuild = false; _canBuildModded = true; }; 
			_btnAbort ctrlSetText format["%1 (in %2)", "Abort", (ceil ((_timeMax - diag_tickTime)*10)/10)];
			cutText ["", "PLAIN DOWN"];	
		};
		default {
			if (_canBuildModded) then { canBuild = _canBuildOld; };
			_btnAbort ctrlEnable true;
			_btnAbort ctrlSetText "Abort";
			cutText ["", "PLAIN DOWN"];	
		};
	};
	_timeOut = diag_tickTime;
};

if (_canBuildModded) then { canBuild = _canBuildOld; };