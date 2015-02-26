private ["_di", "_playeruid", "_bAb", "_bAbText", "_ti", "_tiM", "_cbMod", "_cbOld", "_b0", "_b1", "_b2", "_b3", "_b4", "_b5"];
disableSerialization;
waitUntil {
	_di = findDisplay 49;
	!isNull _di;
};

_playeruid = getplayerUID player;

_bAb = _di displayCtrl 104;
_bAb ctrlEnable false;
_bAbText = ctrlText _bAb;
_ti = 0;
_tiM = diag_tickTime+30;
_cbMod = false;
_r = true;
if (isNil 'canBuild') then { canBuild = false; };
if (isNil 'P2_REF') then { P2_REF = false; };
if (isNil '_r') then { _r = true; };
_cbOld = canBuild;

while {!isNull _di} do {
	_b0 = _di displayCtrl 			523;
	_b0 ctrlSetText 						format["Server: %1",(missionNamespace getVariable "P2DZ_serverName")];
	
	_b1 = _di displayCtrl 			121;
	_b1 ctrlSetText 						"Player UID: ";
	
	_b2 = _di displayCtrl 			120;
	_b2 ctrlSetText 						format["%1",_playeruid];

	_b3 = _di displayCtrl 			103;
	_b3 ctrlSetText 						"Server Info";
	_b3 ctrlEnable true;
	_b3 ctrlRemoveAllEventHandlers			"ButtonClick";
	_b3 ctrlAddEventHandler 				["ButtonClick","disableSerialization; _di = findDisplay 49; if (!((str _di) == 'No display')) then { _di closeDisplay 1; }; if (!dialog) then {	createDialog 'RscGorsyMenu'; } else { closeDialog 0; uiSleep 0.1; createDialog 'RscGorsyMenu'; }; "];
  	
  	_b4 = _di displayCtrl 			119;	
	_b4 ctrlSetText 						"Player Stats";
	_b4 ctrlEnable true;
	_b4 ctrlRemoveAllEventHandlers			"ButtonClick";
	_b4 ctrlAddEventHandler 				["ButtonClick","[['<t size=''1'' font=''Bitstream'' align=''left'' color=''#FFFFFF''>Information</t>',  
	'<br /><t size=''1.5'' font=''Bitstream'' align=''center'' color=''#F7F2E0''>Coming Soon!</t>'],4] spawn p2_miniMsg;"];

    _b5 = _di displayCtrl 			1010;	 
	_b5 ctrlSetText 						"Player Options";
	_b5 ctrlEnable true;
	_b5 ctrlRemoveAllEventHandlers			"ButtonClick";
	_b5 ctrlAddEventHandler 				["ButtonClick","disableSerialization; _di = findDisplay 49; if (!((str _di) == 'No display')) then { _di closeDisplay 1; }; if (!dialog) then {	createDialog 'p2_options'; } else { closeDialog 0; uiSleep 0.1; createDialog 'p2_options'; }; "];
    
    _ti = diag_tickTime;
    if (!isNil 'P2_REF') then { P2_REF = false; };
    if (!isNil 'p2RefChk') then { P2_REF = false; };
    if (P2_REF) then {	_r = _ti call p2RefChk;	};
    if (isNil '_r') then { _r = true; };
    if (!_r) then {	_bAb ctrlEnable true; };
    switch (_r) do {
		case (!r_player_dead && {isPlayer _x} count (player nearEntities ["AllVehicles", 12]) > 1) : {
			_bAb ctrlEnable false;
			cutText [localize "str_abort_playerclose", "PLAIN DOWN"];
		};
		case (!r_player_dead && player getVariable["combattimeout", 0] >= time) : {
			_bAb ctrlEnable false;
			cutText [localize "str_abort_playerincombat", "PLAIN DOWN"];
		};
		case (_ti < _tiM) : {
			_bAb ctrlEnable false;
			if (!_cbMod) then { _cbOld = canBuild; canBuild = false; _cbMod = true; }; 
			_bAb ctrlSetText format["%1 (in %2)", "Abort", (ceil ((_tiM - diag_tickTime)*10)/10)];
			cutText ["", "PLAIN DOWN"];	
		};
		default {
			if (_cbMod) then { canBuild = _cbOld; };
			_bAb ctrlEnable true;
			_bAb ctrlSetText "Abort";
			cutText ["", "PLAIN DOWN"];	
		};
	};
	_ti = diag_tickTime;
};

if (_cbMod) then { canBuild = _cbOld; };