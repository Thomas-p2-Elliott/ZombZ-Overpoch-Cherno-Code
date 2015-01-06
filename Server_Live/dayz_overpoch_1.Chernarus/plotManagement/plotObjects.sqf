disableSerialization;
private ["_range", "_count", "_colour", "_ctrl", "_result"];
_range = DZE_PlotPole select 0;

if (((vehicle player) nearObjectsReady _range)) then {
	_count = nearestObjects [(vehicle player), DZE_maintainClasses, _range];
	_count = count _count;
	_colour = "#ffffff";

	if(_count / DZE_BuildingLimit * 100 < 40)then{
		_colour = "#00ff00"; 
	};
	if(_count / DZE_BuildingLimit * 100 > 75)then{
		_colour = "#ff0000"; 
	};

	_ctrl = ((uiNamespace getVariable "PlotManagement") displayCtrl 7014);
	_result =  format["<t color='%3'>%1 / %2</t>" , _count, DZE_BuildingLimit,_colour];
	_ctrl ctrlSetStructuredText parseText _result;	
} else {
	_colour = "#ff0000"; 
	_ctrl = ((uiNamespace getVariable "PlotManagement") displayCtrl 7014);
	_result =  format["<t color='%3'>%1 / %2</t>" , "Error", DZE_BuildingLimit, _colour];
	_ctrl ctrlSetStructuredText parseText _result;	
};