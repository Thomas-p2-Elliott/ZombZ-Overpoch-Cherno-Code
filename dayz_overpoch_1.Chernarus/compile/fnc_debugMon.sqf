/*---------------------------------------------------------------------------
Function:	Toggleable Triple Mode Debug Monitor
Author:		Player2
www.ZombZ.net

	4 Modes - Off - Minimal - Full - Stats

Configuration Options

	Default setting for when a player loads into the server
	P2DZ_DebugMonDefault = 2; Valid Inputs: 1 (Off), 2 (Full), 3 (Minimal), 4 (Stats) - Disabled for Now
---------------------------------------------------------------------------*/
/* CONFIGURATION START */
//Default setting for when a player loads into the server
P2DZ_debugMonitor = false;
diag_log("P2DEBUG: Spawning Debug Monitor in Mode: " + str P2DZ_dbCurMode);

fnc_debugFull = {
private ["_p2p","_p2ps","_p2totalPlayers","_p2within2500","_p2mkills","_p2bKills","_p2zKills","_p2wep","_p2skin","_zombzVehCount","_zombzZedCount","_zombztimeToRestart","_pDir","_gpsP2osZombZ","_p2bl","_p2c"];

	P2DZ_humanity = (player getVariable['humanity', 0]);
	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	_p2p = "img\logo.paa";
	_p2ps = "3.0";

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel > 0) then {
		P2DZ_humanityPrefix = "Hero Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (P2DZ_humanityLevel == 0) then {
		P2DZ_humanityPrefix = "Survivor Level: ";
		P2DZ_humanityLevelText = format["%1 %2",P2DZ_humanityPrefix, P2DZ_humanityLevel];
	};

	if (player == vehicle player) then
	{
		_p2p = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));	
		_p2ps = "3.0";
	} else	{
		_p2p = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));	
		_p2ps = "3.0";
	};

	if (_p2p == "") then { _p2p = "img\logo.paa"; _p2ps = "3.0"; };

	P2DZ_debugMon_Mode = "Full"; P2DZ_debugMon_ToggleKey = "F5";

	_p2totalPlayers = (count playableUnits);
	_p2within2500 = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1);

	_p2mkills = (player getVariable['humanKills', 0]);
	_p2bKills = (player getVariable['banditKills', 0]);
	_p2zKills = (player getVariable['zombieKills', 0]); _p2zKills = (player getVariable['headShots', 0]);

	r_player_blood;
	_p2wep = (currentWeapon player);
	if ((isNil '_p2wep') || (_p2wep == "")) then {
		_p2wep = "Direct Chat";
	};
	_p2skin = (typeOf player);
	P2DZ_humanity;
	P2DZ_humanityPrefix; P2DZ_humanityLevel;

	_zombzVehCount = ((count vehicles) + 100);
	_zombzZedCount = ({alive _x} count entities "zZombie_Base");
	_zombztimeToRestart = 	(90 - (round(serverTime / 60)));

	_pDir = (round(getDir player)); _gpsP2osZombZ = (mapGridPosition getPos player);
	_p2bl = round((r_player_blood * 2) / 1000);

	_p2c = switch (_p2bl) do {
		//dead
 		default { "#210000" };
	    case 0: { "#210000" };
	    //reds
	    case 1: { "#330000" };
	    case 2: { "#630000" };
	    case 3: { "#910000" };
	    case 4: { "#BF0000" };
	    case 5: { "#E30000" };
	    case 6: { "#FF0000" };
	    //oranges
	    case 7: { "#FF3700" };
	    case 8: { "#FF4800" };
	    case 9: { "#FF6200" };
	    case 10: { "#FF8400" };
	    case 11: { "#FF9D00" };
	    case 12: { "#FFCC00" };
	    //yellows
	    case 13: { "#FFDD00" };
	    case 14: { "#FFEA00" };
	    case 15: { "#E8E800" };
	    case 16: { "#C9E800" };
	    case 17: { "#DDFF00" };
	    case 18: { "#CCFF00" };
	    //greens
	    case 19: { "#BFFF00" };
	    case 20: { "#A2FF00" };
	    case 21: { "#91FF00" };
	    case 22: { "#5EFF00" };
	    case 23: { "#15FF00" };
	    case 24: { "#00FF2F" };
	};


	 
	hintSilent "";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<img align='center' size=" + str _p2ps + " image=" + str _p2p + "/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Players:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2totalPlayers + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders: </t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills: </t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str _p2c + ">" + str r_player_blood + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Gun: </t><t size='0.75' font='Bitstream' align='right' color='#01DFD7'>" + _p2wep + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Headshots / Z Kills: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str _p2zKills + "/" + str _p2zKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Skin: </t><t size='0.8' font='Bitstream' align='right' color='#01DFD7'>" + _p2skin + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Humanity: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanity + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>"+ P2DZ_humanityPrefix + "</t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanityLevel + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Vehicles: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombzVehCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Zombies: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombzZedCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Restart In: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombztimeToRestart + " Mins</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ str _pDir + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] spawn P2DZ_hintFull;
};

fnc_debugMini = {
private ["_p2within2500","_p2mkills","_p2bKills","_pDir","_gpsP2osZombZ"];

	P2DZ_debugMon_Mode = "Mini";
	P2DZ_debugMon_ToggleKey = "F5";
	_p2within2500 = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1);
	_p2mkills = (player getVariable['humanKills', 0]);
	_p2bKills = (player getVariable['banditKills', 0]);
	_pDir = (round(getDir player));
	_gpsP2osZombZ = (mapGridPosition getPos player);
	_p2bl = round((r_player_blood * 2) / 1000);

	_p2c = switch (_p2bl) do {
		//dead
 		default { "#210000" };
	    case 0: { "#210000" };
	    //reds
	    case 1: { "#330000" };
	    case 2: { "#630000" };
	    case 3: { "#910000" };
	    case 4: { "#BF0000" };
	    case 5: { "#E30000" };
	    case 6: { "#FF0000" };
	    //oranges
	    case 7: { "#FF3700" };
	    case 8: { "#FF4800" };
	    case 9: { "#FF6200" };
	    case 10: { "#FF8400" };
	    case 11: { "#FF9D00" };
	    case 12: { "#FFCC00" };
	    //yellows
	    case 13: { "#FFDD00" };
	    case 14: { "#FFEA00" };
	    case 15: { "#E8E800" };
	    case 16: { "#C9E800" };
	    case 17: { "#DDFF00" };
	    case 18: { "#CCFF00" };
	    //greens
	    case 19: { "#BFFF00" };
	    case 20: { "#A2FF00" };
	    case 21: { "#91FF00" };
	    case 22: { "#5EFF00" };
	    case 23: { "#15FF00" };
	    case 24: { "#00FF2F" };
	};



	hintSilent "";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='left' color='#FFFFFF'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders:</t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills:</t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str _p2c + ">" + str r_player_blood + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ str _pDir + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] spawn P2DZ_hintMini;
};

fnc_debugOff = {
	hintSilent "";
	P2DZ_debugMon_Mode = "Off";
	P2DZ_debugMon_ToggleKey = "F5";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='center' color='#FFFFFF'><br/> Re-Enable with the "+ P2DZ_debugMon_ToggleKey + " button.</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] spawn P2DZ_hintMini;
};

 /* CONFIGURATION END */


fnc_debugMon = {
	[] spawn {
		private["_handle1","_handle2","_handle3"];
		_handle1 = -1;
		_handle2 = -1;
		_handle3 = -1;
		while {true} do {
			while {P2DZ_debugMonitor} do {
				if (P2DZ_dbCurMode == 1) then  {
					_handle1 = [] spawn fnc_debugOff;
					P2DZ_debugMonitor = false;
				};
				if (P2DZ_dbCurMode == 2) then {
					_handle2 = [] spawn fnc_debugFull;
					P2DZ_debugMonitor = true;
				};
				if (P2DZ_dbCurMode == 3) then {
					_handle3 = [] spawn fnc_debugMini;
					P2DZ_debugMonitor = true;
				};
			};
			sleep 0.5;
		};
	};
};

fnc_p2debugMonColorGUI = {
    private ["_handle1","_handle2"];
	disableSerialization;
	uiNamespace setVariable ['ZombZHintColour_Dialog', displayNull];
	createDialog 'ZombZHintColour_Dialog';
	ctrlSetText [169691, str P2DZE_debugCol];
	hintSilent "";
	P2DZ_debugMon_Mode = "BackGround Color Setting: ";
	P2DZ_debugMon_ToggleKey = str P2DZE_debugCol;
	P2DZ_updateDebugMonCol = true;
	P2DZE_allowDebugColInputTime = 30;
	_handle1 = [] spawn {
		private ["_P2DZE_debugMon_array","_textCtrl","_text","_string","_result","_result2","_result3","_result4","_result5","_result6","_display"];
		disableSerialization;
		_P2DZE_debugMon_array = [];
		for "_x" from 0 to P2DZE_allowDebugColInputTime do {
			if (_x < P2DZE_allowDebugColInputTime / 4) then {
				P2DZ_dbCurMode = 2;
				P2DZ_debugMonitor = true;
			};
			sleep 1;
			_display = findDisplay 10666;
			if (str (_display) != "no display") then {
				_textCtrl = ((uiNamespace getVariable 'ZombZHintColour_Dialog') displayCtrl 169691);
				_text = ctrlText (_textCtrl);
				_P2DZE_debugMon_array = _text;
				_P2DZE_debugMon_array = call compile str _P2DZE_debugMon_array;
				_string = _P2DZE_debugMon_array;
				_result = [_string] 			 call KRON_strToArray;
				_result2 = [str _result,'"','']  call KRON_Replace;
				_result3 = [ _result2,',.,','.'] call KRON_Replace;
				_result4 = [ _result3,',,,',','] call KRON_Replace;
				_result5 = [ _result4,',]]',']'] call KRON_Replace;
				_result6 = [ _result5,'[[,','['] call KRON_Replace;
				_P2DZE_debugMon_array = call compile _result6;
				P2DZE_allowDebugColInputTimeLeft = P2DZE_allowDebugColInputTime - _x;
				if (!isNil '_P2DZE_debugMon_array' && {(count _P2DZE_debugMon_array == 4)}) then {
					P2DZE_debugMon_array_r = _P2DZE_debugMon_array select 0;
					P2DZE_debugMon_array_g = _P2DZE_debugMon_array select 1; 
					P2DZE_debugMon_array_b = _P2DZE_debugMon_array select 2;
					P2DZE_debugMon_array_a = _P2DZE_debugMon_array select 3;   
					if (P2DZE_debugColoutput) then { diag_log(format['DebugMon: ChatCheck: VALID: Red:	(%1)	Green:	(%2)	Blue:	(%3)	Alpha:	(%4)	', 
											P2DZE_debugMon_array_r,P2DZE_debugMon_array_g,P2DZE_debugMon_array_b,P2DZE_debugMon_array_a]); };
					P2DZE_debugCol = [P2DZE_debugMon_array_r,P2DZE_debugMon_array_g,P2DZE_debugMon_array_b,P2DZE_debugMon_array_a];
				} else { 
					_P2DZE_debugMon_array = []; 
					if (_x > (P2DZE_allowDebugColInputTime / 3) && _x < (P2DZE_allowDebugColInputTime / 2) || _x > (P2DZE_allowDebugColInputTime - 1)) then { systemChat('DEBUG MONITOR ERROR: INCORRECT COLOUR FORMAT'); };
				};
			};
		};
		closeDialog 0;
	};
	_handle2 = [] spawn {
		private ["_display"];
		disableSerialization;

		for "_x" from 0 to P2DZE_allowDebugColInputTime do {
			sleep 1;
			_display = findDisplay 169691;

			if (str (_display) != "no display") then {
				if (_x > P2DZE_allowDebugColInputTime / 4) then {
					P2DZ_dbCurMode = 1;
					P2DZ_debugMonitor = false;
					["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
					"<t size='1' font='Bitstream' align='center' color='#FFFFFF'><br/><br/> You have " + str(P2DZE_allowDebugColInputTimeLeft) + " seconds to pick a color and transparency setting! <br/></t>",
					P2DZE_debugCol, 
					false
					] spawn P2DZ_hintMini;
				};
			};
		};
	}; 
	titleText ["You have 30 seconds to pick a color and transparency setting!", "PLAIN"];
	systemChat("You have 30 seconds to pick a color and transparency setting!");
	systemChat(" ");
	systemChat("Input:   [0 - 1,		0 - 1,   	0 - 1,   	0 - 1]");
	systemChat("Format: [RED,   GREEN,  BLUE,   ALPHA]");
	systemChat("E.g:     [1,      0.1,      0.2,     0.3]  ");
	systemChat("Result: 100% Red, 10% Green, 20% Blue, 0% Transparent");
	waitUntil{scriptDone _handle1 || scriptDone _handle2};
	if ((count P2DZE_debugCol != 4)) exitWith {
		terminate _handle1; terminate _handle2;
		P2DZE_debugCol = [0,0,1,0.1];
		diag_log(format['DebugMon: ChatCheck: INVALID: RESET P2DZE_debugCol: %1	', P2DZE_debugCol]);
	};
	systemChat("Debug Monitor Input Valid and Accepted!");  
	player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
	player setVariable ["P2_DebugMonColours", P2DZE_debugCol, true];
};

