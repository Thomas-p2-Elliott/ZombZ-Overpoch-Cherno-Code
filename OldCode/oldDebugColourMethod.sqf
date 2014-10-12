
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
					] call P2DZ_hintMini;
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
	