/*****************************************************************
Copyright © 2013 Double Doppler

File: fnc_server.sqf
Date: 21/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
// Functions executed on server
// If run in single player mode functions are executed on client
DDOPP_taser_babel = {
	if (isNil "DDOPP_taser_globalChat") then {
		private ["_center","_group","_logic"];
		diag_log "D.DOPPLER Taser Mod: No global chat logic exists! Creating a global chat logic...";
		_center = createCenter sideLogic;
		_group = createGroup _center;
		_logic = _group createUnit ["LOGIC", [0, 0, 0] , [], 0, ""];
		_logic setVehicleInit "DDOPP_taser_globalChat = this; this setVehicleVarName ""DDOPP_taser_globalChat"";";
		processInitCommands;
		sleep 1;
		diag_log "D.DOPPLER Taser Mod: Global chat logic created.";	
	};
};



