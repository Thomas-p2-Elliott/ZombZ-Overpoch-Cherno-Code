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
P2DZ_DebugMonDefault = 2; //Valid Inputs: 1 (Off), 2 (Full), 3 (Minimal), 4 (Stats) - Disabled for Now


diag_log("P2DEBUG: Spawning Debug Monitor in Mode: " + str P2DZ_DebugMonDefault);

/*

Mode: Full 		    Toggle: INSERT
-----------------------------------


	[WEAPON / VEHICLE PICTURE]


Total Players:					10
Players Within 2500m:		    10

Murders:						 2
Bandit Kills:			  		 2
Z Kills	/ HS:		  		 2 / 2
Longest Distance Kill:		 1400m
Blood:						 12000

Weapon:				   Direct Chat
Skin:				  Survivor3_DZ
Humanity:					 15100
Hero Level:					   	 3

Active Vehicles:			   400
Active Zombies:	 		 	   400
Server Restart in: 		   90 Mins

DIR: -132			  GPS: 010 010

*/



fnc_debugFull = {
private ["_pic","_totalPlayers","_within2500","_mKills","_bKills","_zKills","_zHs","_wep","_skin","_vehCount","_zedCount","_timeToRestart","_pDir","_gpsPos"];
	P2DZ_humanity = (player getVariable['humanity', 0]);
	P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

	_pic = "img\logo.paa";

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
		_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));	
	} else	{
		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));	
	};

	if (_pic == "") then { _pic = "img\logo.paa"; };

	P2DZ_debugMon_Mode = "Full"; P2DZ_debugMon_ToggleKey = "Insert";

	_totalPlayers = (count playableUnits);
	_within2500 = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1);

	_mKills = (player getVariable['humanKills', 0]);
	_bKills = (player getVariable['banditKills', 0]);
	_zKills = (player getVariable['zombieKills', 0]); _zHs = (player getVariable['headShots', 0]);

	r_player_blood;
	_wep = (currentWeapon player);
	if ((isNil '_wep') || (_wep == "")) then {
		_wep = "Direct Chat";
	};
	_skin = (typeOf player);
	P2DZ_humanity;
	P2DZ_humanityPrefix; P2DZ_humanityLevel;

	_vehCount = ((count vehicles) + 100);
	_zedCount = ({alive _x} count entities "zZombie_Base");
	_timeToRestart = 	(90 - (round(serverTime / 60)));

	_pDir = (round(getDir player)); _gpsPos = (mapGridPosition getPos player);
	_bloodLvl = round((r_player_blood * 2) / 1000);

	_colour = switch (_bloodLvl) do {
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
	"<img align='center' size='3.5' image=" + str _pic + "/><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Players:</t><t size='1' 'font='Bitstream' align='right' color='#FF0000'>" + str _totalPlayers + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#99FF99'> Players (2500m): </t><t size='1' 'font='Bitstream' align='right' color='#99FF99'>" + str _within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Murders: </t><t size='1' 'font='Bitstream' align='right' color='#FF0000'>" + str _mKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#99FF99'>Bandit Kills: </t><t size='1' 'font='Bitstream' align='right' color='#99FF99'>" + str _bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Blood: </t><t size='1' 'font='Bitstream' align='right' color=" + str _colour + ">" + str r_player_blood + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Weapon: </t><t size='0.8' 'font='Bitstream' align='right' color='#01DFD7'>" + _wep + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Headshots / Z Kills: </t><t size='1' 'font='Bitstream' align='right' color='#01DFD7'>" + str _zKills + "/" + str _zHs + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Skin: </t><t size='0.8' 'font='Bitstream' align='right' color='#01DFD7'>" + _skin + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Humanity: </t><t size='1' 'font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanity + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>"+ P2DZ_humanityPrefix + "</t><t size='1' 'font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanityLevel + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Vehicles: </t><t size='1' 'font='Bitstream' align='right' color='#FFBF00'>" + str _vehCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Zombies: </t><t size='1' 'font='Bitstream' align='right' color='#FFBF00'>" + str _zedCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Restart In: </t><t size='1' 'font='Bitstream' align='right' color='#FFBF00'>" + str _timeToRestart + " Mins</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ str _pDir + "</t><t size='1' 'font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsPos + "</t>", 
	[0, 0, 1, 0.3], 
	false
	] spawn P2DZ_hintFull;
};


/*

Mode: Mini 		     Toggle: INS
--------------------------------
Players in 2500m:		      20
Murders:					  20
Bandit Kills:				  20
Blood:					  120000
DIR: -132			GPS: 010 010

*/

fnc_debugMini = {
private ["_within2500","_mKills","_bKills","_pDir","_gpsPos"];
	P2DZ_debugMon_Mode = "Mini";
	P2DZ_debugMon_ToggleKey = "Insert";
	_within2500 = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1);
	_mKills = (player getVariable['humanKills', 0]);
	_bKills = (player getVariable['banditKills', 0]);
	_pDir = (round(getDir player));
	_gpsPos = (mapGridPosition getPos player);
	_bloodLvl = round((r_player_blood * 2) / 1000);

	_colour = switch (_bloodLvl) do {
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
	"<t size='1' font='Bitstream' align='left' color='#99FF99'> Players (2500m): </t><t size='1' 'font='Bitstream' align='right' color='#99FF99'>" + str _within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FE2E2E'>Murders:</t><t size='1' 'font='Bitstream' align='right' color='#FE2E2E'>" + str _mKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#99FF99'>Bandit Kills:</t><t size='1' 'font='Bitstream' align='right' color='#99FF99'>" + str _bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Blood: </t><t size='1' 'font='Bitstream' align='right' color=" + str _colour + ">" + str r_player_blood + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ str _pDir + "</t><t size='1' 'font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsPos + "</t>", 
	[0, 0, 1, 0.2], 
	false
	] spawn P2DZ_hintMini;

};

fnc_debugOff = {
	hintSilent "";
	P2DZ_debugMon_Mode = "Off";
	P2DZ_debugMon_ToggleKey = "Insert";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='center' color='#FFFFFF'><br/> Re-Enable with the "+ P2DZ_debugMon_ToggleKey + " button.</t>", 
	[0, 0, 1, 0.2], 
	false
	] spawn P2DZ_hintMini;
};

 /* CONFIGURATION END */


fnc_debugMon = {
	[] spawn {
		if (isNil "P2DZ_dbCurMode") then {
			P2DZ_dbCurMode = 2;
			P2DZ_dbCurMode = P2DZ_DebugMonDefault;
			diag_log("Debug Mon Start!");
		} else {

			if (P2DZ_dbCurMode < 3) then {
				P2DZ_dbCurMode = P2DZ_dbCurMode + 1;
			} else {
				P2DZ_dbCurMode = 1;
			};
		};
		
		diag_log("Debug Mon Pressed! Mode: " + str P2DZ_dbCurMode);
	};


	[] spawn {				
		while {P2DZ_dbCurMode == 1} do {
			[] call fnc_debugOff;
			P2DZ_debugMonitor = true;
			uiSleep 10;
		};
	};

	[] spawn {				
		while {P2DZ_dbCurMode == 2} do {
			[] call fnc_debugFull;
			P2DZ_debugMonitor = true;
			uiSleep 0.1;
		};
	};

	[] spawn {				
		while {P2DZ_dbCurMode == 3} do {
			[] call fnc_debugMini;
			P2DZ_debugMonitor = true;
			uiSleep 0.1;
		};
	};
};


