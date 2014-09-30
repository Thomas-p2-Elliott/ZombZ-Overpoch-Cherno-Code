P2DZE_goldDropEditInFocus = false;
P2DZE_goldDrop_runCount = 0;

ui_goldDrop = {
	private ["_input","_display","_zGold","_amTextControl","_aSliderIdc","_amText","_amNum","_aSliderVal","_newAmText"];
	disableSerialization;
	_zGold = nil;
	_input = [];
	_display = displayNull;
	_input = _this select 0;
	_display = _input select 0;
	_zGold = _this select 1;

	if (isNil '_zGold') then {
		_zGold = player getVariable ["ZombZGold", nil];
		waitUntil {sleep 0.1; !isNil '_zGold'};
	};

	if (P2DZE_goldDrop_runCount < 1) exitWith {
		sleep 0.5;
		[_input,_zGold] spawn ui_goldDrop;
		P2DZE_goldDrop_runCount = P2DZE_goldDrop_runCount + 1;
	};
  
	if (!isNull _display && !isNil '_zGold') then {
		_amTextControl = ((_display) displayCtrl 601101);
		_amTextControl ctrlSetText "Loading . . ";
		if (_zGold > 0) then {
				_aSliderIdc = 601903; 
				sliderSetRange [_aSliderIdc, 1, _zGold];
				while {!isNull _display} do {
					if (P2DZE_goldDropEditInFocus) then {
						_amText = ctrlText _amTextControl;
						_amNum = parseNumber _amText;
						sliderSetPosition [_aSliderIdc, _amNum];
					} else {
						_aSliderVal = sliderPosition _aSliderIdc;
						_aSliderVal = floor _aSliderVal;
						_newAmText = (format["%1",_aSliderVal]);
						_amTextControl ctrlSetText _newAmText;
					};
					sleep 0.15;
				};

		} else {
			systemChat("Error: You have no gold!");
			diag_log("Error: You have no gold!");
		};
	} else {
		systemChat("Error: Gold Drop Dialog failed to open!");
		diag_log("Error: Gold Drop Dialog failed to open!"); 
	};	
};

ui_goldDropEditInFocus = {
	P2DZE_goldDropEditInFocus = true;
};

ui_goldDropEditOutOfFocus = {
	P2DZE_goldDropEditInFocus = false;
};