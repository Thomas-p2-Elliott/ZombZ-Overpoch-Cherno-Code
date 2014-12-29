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