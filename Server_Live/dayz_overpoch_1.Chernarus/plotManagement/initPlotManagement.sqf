diag_log(format['%1: %2: %3','P2DEBUG','initPlotManagement, input',_this]);
/*---------------------------------------------------------------------------
Set up default variables
---------------------------------------------------------------------------*/

_plots = [];
_friends = [];
_ownerPUID = "-2";
_thePlot = nil;

_canManage = false;

/*---------------------------------------------------------------------------
Get the plot pole from input/near plots
---------------------------------------------------------------------------*/

_thePlot = _this select 3;

if (isNil '_thePlot') then { 
	_thePlot = objNull;
};

if (typeName _thePlot != "OBJECT") then {
	_thePlot = objNull;
};

if (isNull _thePlot) then {
	_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];	
	_thePlot = _plots select 0;
};

if (isNil '_thePlot') exitWith { 
	systemChat("Error: Plot not found!");
};

if (isNull _thePlot) exitWith {
	systemChat("Error: Plot not found!");
};

if (typeName _thePlot != "OBJECT") exitWith {
	systemChat("Error: Plot not found!");
};

/*---------------------------------------------------------------------------
Found the plot pole, now get the variables for owner and friendly players
---------------------------------------------------------------------------*/

_friends =  _thePlot getVariable ["plotfriends", []];
sleep 0.1;
_ownerPUID = _thePlot getVariable ["ownerPUID","-2"];
sleep 0.1;

diag_log(format['%1: %2: %3','P2DEBUG','initPlotManagement, plotFriends: ',_friends]);
diag_log(format['%1: %2: %3','P2DEBUG','initPlotManagement, _ownerPUID: ',_ownerPUID]);

/*---------------------------------------------------------------------------
Now check if the player is in either variable
---------------------------------------------------------------------------*/

{
	if ((_x  select 0) == (getPlayerUID player)) then { _canManage = true; }; 
} forEach _friends;

if (_ownerPUID == (getPlayerUID player)) then { _canManage = true; }; 

diag_log(format['%1: %2: %3','P2DEBUG','initPlotManagement, _canManage: ', _canManage]);

if (!_canManage) exitWith { cutText ["You do not have the rights to manage.","PLAIN DOWN"]; };

/*---------------------------------------------------------------------------
Player is Allowed to Manage the Plot, create Dialog and run functions
---------------------------------------------------------------------------*/

createdialog "PlotManagement";
call PlotNearbyHumans;
call PlotGetFriends;
["preview"] call MaintainPlot;
call PlotObjects;
