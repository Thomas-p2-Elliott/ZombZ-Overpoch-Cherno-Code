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

diag_log("P2DEBUG: Spawning Debug Monitor in Mode: " + str P2DZ_dbCurMode + " Refresh Time: " + str P2DZ_debugMonSleep);


fnc_bloodCol = {
	private["_input","_output"];
	_input = round((r_player_blood * 2) / 1000);

	_output = switch (_input) do {
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

	_output
};


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

	_p2totalPlayers = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 14000]))-1);
	_p2within2500 = (({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1);

	_p2mkills = (player getVariable['humanKills', 0]);
	_p2bKills = (player getVariable['banditKills', 0]);
	_p2zKills = (player getVariable['zombieKills', 0]); 
	_p2zHSKills = (player getVariable['headShots', 0]);

	r_player_blood;
	_p2wep = toUpper(currentWeapon player);
	if ((isNil '_p2wep') || (_p2wep == "")) then {
		_p2wep = "Direct Chat";
	};
	_p2skin = (typeOf player);
	P2DZ_humanity;
	P2DZ_humanityPrefix; P2DZ_humanityLevel;

	_zombzVehCount = (count (player nearEntities [["LandVehicle", "Ship", "Air"], 14500]) + 100);
	_zombzZedCount = (({alive _x} count (getPos vehicle player nearEntities [["zZombie_Base"], 12000]))-1);

	_zombztimeToRestart = 	(90 - (round(serverTime / 60)));

	_pDir = (round(getDir player)); _gpsP2osZombZ = (mapGridPosition getPos player);
	_pDirT = switch (true) do {
	 		default { (format["N %1", _pDir]) };
	 		case (((_pDir >= 355) && (_pDir <=359)) || ((_pDir >= 0) && (_pDir <= 5))): { (format["N %1", _pDir]) };
		    case ((_pDir > 5) && (_pDir < 85)): { (format["NE %1", _pDir]) };
		    case ((_pDir >= 85) && (_pDir <= 95)): { (format["E %1", _pDir]) };
		    case ((_pDir > 95) && (_pDir < 175)): { (format["SE %1", _pDir]) };
		    case ((_pDir >= 175) && (_pDir <= 185)): { (format["S %1", _pDir]) };
		    case ((_pDir > 185) && (_pDir < 265)): { (format["SW %1", _pDir]) };
		    case ((_pDir >= 265) && (_pDir <= 275)): { (format["W %1", _pDir]) };
		    case ((_pDir > 275) && (_pDir < 355)): { (format["NW %1", _pDir]) };
	};

	hintSilent "";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<img align='center' size=" + str _p2ps + " image=" + str _p2p + "/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Players:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2totalPlayers + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders: </t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills: </t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str P2DZ_debugBloodCol + ">" + str r_player_blood + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Gun: </t><t size='0.75' font='Bitstream' align='right' color='#01DFD7'>" + _p2wep + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Headshots / Z Kills: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str _p2zKills + "/" + str _p2zHSKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Skin: </t><t size='0.8' font='Bitstream' align='right' color='#01DFD7'>" + _p2skin + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Humanity: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanity + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>"+ P2DZ_humanityPrefix + "</t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanityLevel + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Vehicles: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombzVehCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Zombies: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombzZedCount + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Restart In: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombztimeToRestart + " Mins</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ _pDirT + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] call P2DZ_hintFull;
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
	_pDirT = switch (true) do {
	 		default { (format["N %1", _pDir]) };
	 		case (((_pDir >= 355) && (_pDir <=359)) || ((_pDir >= 0) && (_pDir <= 5))): { (format["N %1", _pDir]) };
		    case ((_pDir > 5) && (_pDir < 85)): { (format["NE %1", _pDir]) };
		    case ((_pDir >= 85) && (_pDir <= 95)): { (format["E %1", _pDir]) };
		    case ((_pDir > 95) && (_pDir < 175)): { (format["SE %1", _pDir]) };
		    case ((_pDir >= 175) && (_pDir <= 185)): { (format["S %1", _pDir]) };
		    case ((_pDir > 185) && (_pDir < 265)): { (format["SW %1", _pDir]) };
		    case ((_pDir >= 265) && (_pDir <= 275)): { (format["W %1", _pDir]) };
		    case ((_pDir > 275) && (_pDir < 355)): { (format["NW %1", _pDir]) };
	};


	hintSilent "";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='left' color='#FFFFFF'> Players (2500m): </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str _p2within2500 + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders:</t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills:</t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str P2DZ_debugBloodCol + ">" + str r_player_blood + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ _pDirT + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] call P2DZ_hintMini;
};

fnc_debugOff = {
	hintSilent "";
	P2DZ_debugMon_Mode = "Off";
	P2DZ_debugMon_ToggleKey = "F5";
	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='center' color='#FFFFFF'><br/> Re-Enable with the "+ P2DZ_debugMon_ToggleKey + " button.</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] call P2DZ_hintMini;
};

 /* CONFIGURATION END */

fnc_debugMon = {
	[] spawn {
		private["_handle0","_handle1","_handle2","_handle3"];
		_handle0 = -1;
		_handle1 = -1;
		_handle2 = -1;
		_handle3 = -1;
		while {true} do {
			if (P2DZ_debugMonitor) then {
				switch (P2DZ_dbCurMode) do
				{
				    case 1:
				    {
				        _handle1 = [] call fnc_debugOff;
						P2DZ_debugMonitor = false;
						if (random 10 > 8) then { player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true]; };
				    };
				    case 2:
				    {

				    	P2DZ_debugBloodCol = [] call fnc_bloodCol;
				        _handle2 = [] call fnc_debugFull;
						P2DZ_debugMonitor = true;
						if (random 10 > 8) then { player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true]; };
				    };
				    case 3:
				    {
				    	P2DZ_debugBloodCol = [] call fnc_bloodCol;
						_handle3 = [] call fnc_debugMini;
						P2DZ_debugMonitor = true;
						if (random 10 > 8) then { player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true]; };
					};
					default
					{
						_handle0 = [] call fnc_debugOff;
						P2DZ_debugMonitor = false;
						if (random 10 > 8) then { player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true]; };
					};
				};
			};
			sleep P2DZ_debugMonSleep;
		};
	};
};



fnc_p2debugMonColorGUI = {
	private ["_dialog","_rSliderIdc","_gSliderIdc","_bSliderIdc","_aSliderIdc","_sliderIdcArray"];
	disableSerialization;
	uiNamespace setVariable ['DEBUGSMON', displayNull];
	_dialog = createDialog 'DEBUGSMON';
	
	if (_dialog) then {
		_rSliderIdc = 501900;	_gSliderIdc = 501901;	_bSliderIdc = 501902;	_aSliderIdc = 501903; 
		_sliderIdcArray = [_rSliderIdc,_gSliderIdc,_bSliderIdc,_aSliderIdc];
		{
		 	sliderSetRange [_x, 0, P2DZ_debugSliderRange];
		} forEach _sliderIdcArray;
		sliderSetPosition [_rSliderIdc, (P2DZE_debugCol select 0) * P2DZ_debugSliderRange];	sliderSetPosition [_gSliderIdc, (P2DZE_debugCol select 1) * P2DZ_debugSliderRange];
		sliderSetPosition [_bSliderIdc, (P2DZE_debugCol select 2) * P2DZ_debugSliderRange];	sliderSetPosition [_aSliderIdc, (P2DZE_debugCol select 3) * P2DZ_debugSliderRange];
		_thread = [] spawn {
			private ["_rSliderVal","_rSliderIdc","_gSliderVal","_gSliderIdc","_bSliderVal","_bSliderIdc","_aSliderVal","_aSliderIdc","_sliderIdcArray"];
			_rSliderIdc = 501900;		_gSliderIdc = 501901;		_bSliderIdc = 501902;		_aSliderIdc = 501903; 
			_sliderIdcArray = [_rSliderIdc,_gSliderIdc,_bSliderIdc,_aSliderIdc];
			while {dialog} do {
				_rSliderVal = ((sliderPosition _rSliderIdc) / P2DZ_debugSliderRange);			_gSliderVal = ((sliderPosition _gSliderIdc) / P2DZ_debugSliderRange);
				_bSliderVal = ((sliderPosition _bSliderIdc) / P2DZ_debugSliderRange);			_aSliderVal = ((sliderPosition _aSliderIdc) / P2DZ_debugSliderRange);
				if (!isNil '_sliderIdcArray' && {(count _sliderIdcArray == 4)}) then {
					P2DZE_debugMon_array_r = _rSliderVal;				P2DZE_debugMon_array_g = _gSliderVal; 
					P2DZE_debugMon_array_b = _bSliderVal;				P2DZE_debugMon_array_a = _aSliderVal;   
					P2DZE_debugCol = [P2DZE_debugMon_array_r,P2DZE_debugMon_array_g,P2DZE_debugMon_array_b,P2DZE_debugMon_array_a];
				};
				sleep 0.33;
			};
			systemChat("Debug Monitor Input Valid and Accepted!");  
			player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
			player setVariable ["P2_DebugMonColours", P2DZE_debugCol, true];
		};
	} else {
		systemChat("Error: Debug Monitor Colour Dialog failed to open!");
		diag_log("Error: Debug Monitor Colour Dialog failed to open!");
	};
};