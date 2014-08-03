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
P2DZ_debugMonitor = false;
P2DZ_dbCurMode = 1;
diag_log("P2DEBUG: Spawning Debug Monitor in Mode: " + str P2DZ_DebugMonDefault);

fnc_debugFull = {
private ["_p2p","_p2totalPlayers","_p2within2500","_p2mkills","_p2bKills","_p2zKills","_p2zKills","_p2wep","_p2skin","_zombzVehCount","_zombzZedCount","_zombztimeToRestart","_pDir","_gpsP2osZombZ"];
	if (P2DZ_debugMonitor) then {

		P2DZ_humanity = (player getVariable['humanity', 0]);
		P2DZ_humanityLevel = floor(P2DZ_humanity / 5000);

		_p2p = "img\logo.paa";

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
		} else	{
			_p2p = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));	
		};

		if (_p2p == "") then { _p2p = "img\logo.paa"; };

		P2DZ_debugMon_Mode = "Full"; P2DZ_debugMon_ToggleKey = "Insert";

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
		"<img align='center' size='3.5' image=" + str _p2p + "/><br/>
		<t size='1' font='Bitstream' align='left' color='#FF0000'>Players:</t><t size='1' font='Bitstream' align='right' color='#FF0000'>" + str _p2totalPlayers + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#99FF99'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#99FF99'>" + str _p2within2500 + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#FF0000'>Murders: </t><t size='1' font='Bitstream' align='right' color='#FF0000'>" + str _p2mkills + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#99FF99'>Bandit Kills: </t><t size='1' font='Bitstream' align='right' color='#99FF99'>" + str _p2bKills + "</t><br/>
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
		[0, 0, 1, 0.3], //debug design by player2
		false
		] spawn P2DZ_hintFull;
	};
};

fnc_debugMini = {
private ["_p2within2500","_p2mkills","_p2bKills","_pDir","_gpsP2osZombZ"];
	if (P2DZ_debugMonitor) then {

		P2DZ_debugMon_Mode = "Mini";
		P2DZ_debugMon_ToggleKey = "Insert";
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
		"<t size='1' font='Bitstream' align='left' color='#99FF99'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#99FF99'>" + str _p2within2500 + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#FE2E2E'>Murders:</t><t size='1' font='Bitstream' align='right' color='#FE2E2E'>" + str _p2mkills + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#99FF99'>Bandit Kills:</t><t size='1' font='Bitstream' align='right' color='#99FF99'>" + str _p2bKills + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#01DFD7'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str _p2c + ">" + str r_player_blood + "</t><br/>
		<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ str _pDir + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
		[0, 0, 1, 0.2], //debug design by player2
		false
		] spawn P2DZ_hintMini;
	};
};

fnc_debugOff = {
	if (P2DZ_debugMonitor) then {
		hintSilent "";
		P2DZ_debugMon_Mode = "Off";
		P2DZ_debugMon_ToggleKey = "Insert";
		["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
		"<t size='1' font='Bitstream' align='center' color='#FFFFFF'><br/> Re-Enable with the "+ P2DZ_debugMon_ToggleKey + " button.</t>", 
		[0, 0, 1, 0.2], //debug design by player2
		false
		] spawn P2DZ_hintMini;
	};
};

 /* CONFIGURATION END */


fnc_debugMon = {
	[] spawn {
		while {true} do {			
			if (P2DZ_dbCurMode == 1) then  {
				[] call fnc_debugOff;
				P2DZ_debugMonitor = false;
			};
			if (P2DZ_dbCurMode == 2) then {
				[] call fnc_debugFull;
				P2DZ_debugMonitor = true;
			};
			if (P2DZ_dbCurMode == 3) then {
				[] call fnc_debugMini;
				P2DZ_debugMonitor = true;
			};
			uiSleep 0.5;
		};
	};
};


