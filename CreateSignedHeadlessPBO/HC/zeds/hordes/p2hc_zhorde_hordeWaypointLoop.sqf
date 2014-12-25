/*---------------------------------------------------------------------------
Zombie Horde Waypoint Loop

Basic Description: Keeps zeds moving along their hordes waypoints

HowToUse:
Spawn all zombie hordes you want first, set their hordeZed_<HORDE_NUMBER> variable to true so
that the function P2DZ_HC_ZHorde_getAllZeds used in this loop will recognise which zeds to run code on
and which horde number them zeds are in, then run this loop once.
Then run call P2DZ_HC_ZHorde_waypointLoop once all zeds are spawned in.

Advanced Description/Code Map:
For each horde configured it runs this:
	Get horde path waypoint and trigger waypoints using horde number
	Get all living zombies from that horde number on the map
	For Each alive zombie from each horde:
		Start a new thread to run on that zombie:
			Check to make sure that this waypoint thread isn't already running on the zombie, exit if it is
			use P2DZ_HC_zHorde_waypointLoop_sleepTime and add a random number between 1 and 10 to it
			(adding random number to it so each zombie has its own update timer offset to the other zombies to improve performance)
			Start a loop that runs while the zombie is alive with our randomised sleep timer:
				Get the zombies position
				Check which waypoint the zombie is closest to, and store it for later
				if the zombie has reached the destination set to it
					Find out which waypoint the zombie has set to it
					If it cant find the destination the zombie has reached in waypoint list, set its new destination to its closest waypoint
					If the zombies waypoint is in the path list
					check which direction zombie is currently travelling
					if waypoint is last in list, switch direction of travel
					if waypoint is major, trigger horde respawner using hordeNum and position
					get zombies next waypoint by doing current waypoint + or - 1
					set zombie to go to next waypoint
				else 
				  zombie has not reached its destination, do nothing
		end loop & exit thread if zombie dies (or if exit is called because thread was already running on that zed)
	exit for each after opening thread on each zombie


Warning: Never call for this loop more than once! It will auto adjust live
depending on how many hordes or zombies are in-game
---------------------------------------------------------------------------*/
//vars specific to this horde
private["_d","_hordeNum","_pathWaypoints","_pathVar","_triggerVar","_selectNum","_triggerWaypoints","_allZedsInHorde"];
//Initialize variables (prevent undefined variable error)
_allZedsInHorde = [];
_triggerWaypoints = [];
_pathWaypoints = [];
_hordeNum = 0;
_selectNum = 0;
_pathVar = "";
_triggerVar = "";
_zed = objNull;
_d = P2DZ_HC_HordeZedsDebug;

_hordeNum = _this select 0;
_plusOrMinus = _this select 1;

if (isNil '_plusOrMinus') then {
	_plusOrMinus = "+";
};

if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: Looking for New Zeds in Horde %1",_hordeNum]);	};

//take 1 away for 0 based array since for starts at 1
_selectNum = _hordeNum - 1;

//Select horde path var name P2DZ_HC_ZHorde_PathWayp_%VarName%
_pathVar = P2DZ_HC_ZHorde_PathWaypointNames select _selectNum;
//Select horde trigger var name (P2DZ_HC_ZHorde_TriggerWayp_%VarName%)
_triggerVar = P2DZ_HC_ZHorde_TriggerWaypointNames select _selectNum; 

//Get path waypoints
_pathWaypoints = call compile format["P2DZ_HC_ZHorde_PathWayp_%1",_pathVar];
//Get trigger waypoints
_triggerWaypoints = call compile format["P2DZ_HC_ZHorde_TriggerWayp_%1",_triggerVar];

//Use horde number (_x) to get all zeds in horde as an array 
_allZedsInHorde = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;


//for each zombie in horde number _x
{
	_zed = _x;

	/*---------------------------------------------------------------------------
	Check to make sure this code isn't already running on this zombie
	---------------------------------------------------------------------------*/
	if (!(_zed getVariable ["p2dz_hordeWaypointBrain", false])) then {

		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: Adding WP loop to: %1",_zed]);	};

		//Warning, _x has changed to the zombie itself. It is no longer the hordeNum
		//Pass some variables into this code so the zombie knows what horde it is in and what waypoints it should be using
		[_zed,_hordeNum,_pathWaypoints,_triggerWaypoints,_plusOrMinus] spawn P2DZ_HC_ZHorde_zedWaypointLoop;
	};


	//end of for each zombie in horde
} forEach _allZedsInHorde;

