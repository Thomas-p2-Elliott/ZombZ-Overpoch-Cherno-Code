P2DZ_HC_ZHorde_tracker = 			compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_tracker.sqf");
P2DZ_HC_ZHorde_spawnHorde = 		compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_spawnHorde.sqf");
P2DZ_HC_ZHorde_respawnHorde = 		compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_respawnHorde.sqf");
P2DZ_HC_ZHorde_spawnZed = 			compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_spawnZed.sqf");
P2DZ_HC_ZHorde_waypointLoop = 		compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_hordeWaypointLoop.sqf");
P2DZ_HC_ZHorde_zedWaypointLoop	= 	compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_zedWaypointLoop.sqf");
zombieHorde_loiterHC =				compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_loiter.sqf");
zombieHorde_loiterHCStandBy =		compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\zombieHorde_loiterHCStandBy.sqf");
P2DZ_HC_ZHorde_getAllZeds =			compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_getAllZeds.sqf");
P2DZ_HC_ZHorde_cleanupZed =			compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_cleanupZed.sqf");
P2DZ_HC_ZHorde_cleanupHorde =		compile preprocessFileLineNumbers ("" + (P2HC_Path) + "zeds\hordes\p2hc_zhorde_cleanupHorde.sqf");



P2DZ_HC_zHorde_standBy = {
	private["_hordeNum","_hordeZeds"];
	_hordeNum = 		_this select 0;
	_currentWaypoint = 	_this select 1;
	_hordeZeds = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;

	{
		_x setVariable ["carryOn", false];
		_x setVariable ["standBy", [true,_currentWaypoint]];
	} forEach _hordeZeds;
};

P2DZ_HC_zHorde_carryOn = {
	private["_hordeNum","_hordeZeds"];
	_hordeNum = _this;
	_hordeZeds = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;

	{
		_x setVariable ["standBy", [false,[]]];
		_x setVariable ["carryOn", true];
	} forEach _hordeZeds;
};






//set functions done to true
P2DZ_HC_zedHordeFunctionsDone = true;