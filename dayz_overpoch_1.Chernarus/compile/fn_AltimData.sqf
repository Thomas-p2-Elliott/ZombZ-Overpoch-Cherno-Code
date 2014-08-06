

scopeName "main";

[_display] spawn {
private ["_data"];
disableSerialization;
	_display = uiNamespace getVariable "ATM_Altimeter";

	(_display displayCtrl 5100) ctrlShow false; //Altimeter Night

	(_display displayCtrl 5102) ctrlShow false; //Altitude

	(_display displayCtrl 5105) ctrlShow false; //Bearing

	(_display displayCtrl 5108) ctrlShow false; //Time

	(_display displayCtrl 5100) ctrlShow true; //Altimeter Night


	while {uiNamespace GetVariable ["altiHudOpened",true]} do
	{
		_data = [] call ALTIMETER_fnc_AltimGetData;

		if (_data select 3 == 1) Then {
			(_display displayCtrl 5102) ctrlShow true; //Altitude
			(_display displayCtrl 5102) ctrlSetText format["%1m",_data select 0]; //Altitude
			if (((_data select 0) < 600) && ((_data select 0) > 300)) then {
				(_display displayCtrl 5102) ctrlSetTextColor [1, 0.6, 0, 1];
			};
			if (((_data select 0) < 300) && ((_data select 0) > 130)) then {
				(_display displayCtrl 5102) ctrlSetTextColor [0, 1, 0, 1];
			};
			if (((_data select 0) < 130) && ((_data select 0) > 50) || ((_data select 0) > 600)) then {
				(_display displayCtrl 5102) ctrlSetTextColor [0.7, 0, 0, 1];
			};
		};

		if (_data select 3 == 1) Then {
			(_display displayCtrl 5105) ctrlShow true;
			if (((_data select 1 >= 355) && (_data select 1 <=359)) || ((_data select 1 >= 0) && (_data select 1 <= 5))) Then {
				(_display displayCtrl 5105) ctrlSetText format["N %1°",_data select 1]; //Bearing North
			};
			if ((_data select 1 > 5) && (_data select 1 < 85)) Then {
				(_display displayCtrl 5105) ctrlSetText format["NE %1°",_data select 1]; //Bearing North-East
			};
			if ((_data select 1 >= 85) && (_data select 1 <= 95)) Then {
				(_display displayCtrl 5105) ctrlSetText format["E %1°",_data select 1]; //Bearing East
			};
			if ((_data select 1 > 95) && (_data select 1 < 175)) Then {
				(_display displayCtrl 5105) ctrlSetText format["SE %1°",_data select 1]; //Bearing South-East
			};
			if ((_data select 1 >= 175) && (_data select 1 <= 185)) Then {
				(_display displayCtrl 5105) ctrlSetText format["S %1°",_data select 1]; //Bearing South
			};
			if ((_data select 1 > 185) && (_data select 1 < 265)) Then {
				(_display displayCtrl 5105) ctrlSetText format["SW %1°",_data select 1]; //Bearing South-West
			};
			if ((_data select 1 >= 265) && (_data select 1 <= 275)) Then {
				(_display displayCtrl 5105) ctrlSetText format["W %1°",_data select 1]; //Bearing West
			};
			if ((_data select 1 > 275) && (_data select 1 < 355)) Then {
				(_display displayCtrl 5105) ctrlSetText format["NW %1°",_data select 1]; //Bearing North-West
			};
		};

		if (_data select 3 == 1) Then {
			(_display displayCtrl 5108) ctrlShow true;
			(_display displayCtrl 5108) ctrlSetText format["%1",_data select 2]; //Time
		};
	};
};
