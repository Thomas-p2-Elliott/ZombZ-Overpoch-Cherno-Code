private["_state"];
disableSerialization;
_state = uiNamespace getVariable ['DZ_displayUI', 0];
if (dayzState != 0) then {
	3 cutRsc ["playerStatusGUI", "PLAIN",0];
	call player_updateGui;
	call ui_initDisplay;
};
dayzDebug = false;