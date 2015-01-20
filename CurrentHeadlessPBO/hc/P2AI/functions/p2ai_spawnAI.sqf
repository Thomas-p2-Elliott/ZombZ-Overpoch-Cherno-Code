/*																			//
	P2AI_spawnAI.sqf by Vampire & Modified by Player2 & Gorsy for www.ZombZ.net
	Usage: [position,unitcount,skillLevel] execVM "dir\P2AI_spawnAI.sqf";
		Position is the coordinates to spawn at [X,Y,Z]
		UnitCount is the number of units to spawn
		SkillLevel is the skill number defined in P2AIAIConfig.sqf
*/																			//
private ["_hunterCount","_rand","_behaviourAdded","_position","_unitcount","_skill","_unitArrayName","_wpRadius","_xpos","_ypos","_unitGroup","_roofAI","_roofChance","_aiskin","_unit","_weaponArray","_weapon","_magazine","_aigear","_gearmagazines","_aicskill","_wppos1","_wppos2","_wppos3","_wppos4","_wp1","_wp2","_wp3","_wp4","_wpfin","_unitMissionCount"];
_position = _this select 0;
_unitcount = _this select 1;
_skill = _this select 2;
_unitArrayName = _this select 3;
_hunterCount = 0;

private["_f","_d"]; _f = "spawnAI"; _d = P2AI_debugAI;

if (_d) then { diag_log(format["[P2AI]:%1: AI Pos:%2 / Amount to Spawn: %3 / AI Skill: %4, UnitArrayName: %5, Hunters Enabled? %6 Hunter Percentage: %7", _f, _position, _unitcount, _skill, _unitArrayName, P2AI_hunterAI, P2AI_hunterAIPercent]); };
_wpRadius = 20;

_xpos = _position select 0;
_ypos = _position select 1;

//Create the unit group. We use east by default.
_unitGroup = createGroup east;

if (_d) then { diag_log(format["[P2AI]:%1: Unit Group Created: %2", _f, _unitGroup]); };

for "_x" from 1 to _unitcount do {
	_roofAI = false; _roofChance = 1;
	_rand = (random 1); //used for hunter ai
	_behaviourAdded = false; //if not true later, add default behaviour

	if (_d) then { diag_log(format["[P2AI]:%1:AISpawn: _x: %2", _f, _x]); };

	/*---------------------------------------------------------------------------
	If unit is devils caslte spawn
	---------------------------------------------------------------------------*/
	if (_unitArrayName == "P2AIUnitsDevilsCastle") then {
		_roofChance = (random 1);

		if (_d) then { diag_log(format["[P2AI]:%1: Castle Unit Behaviour Added: Stationary", _f]); };

		if (_roofChance > 0.2) then {
			private["_randS"];
			//5% chance: select a roof position

			//use only unused roofai positions, (eg never spawn 2 in same place!)

			//declare global var if it doesnt exist (eg at first run)
			if (isNil 'P2AI_DC_unusedRPL') then {
				P2AI_DC_unusedRPL = P2AI_Castle_RoofAIPosList;
			};

			if (!(str P2AI_DC_unusedRPL == str [])) then {
				//pick random selection index
				_randS = (floor (random ((count P2AI_DC_unusedRPL) -1 )));

				//select position using index
				_position = P2AI_DC_unusedRPL select _randS;
				//if (_d) then { diag_log(format["[P2AI]:%1: Chose (%3) from P2AI_DC_unusedRPL: %2", _f, P2AI_DC_unusedRPL, _position]); };
				//set it to a string so we can remove it from the array
				P2AI_DC_unusedRPL set [_randS, -1];

				//remove it from the array
				P2AI_DC_unusedRPL = P2AI_DC_unusedRPL - [-1];
				//	if (_d) then { diag_log(format["[P2AI]:%1: Removed (%3) from P2AI_DC_unusedRPL: %2", _f, P2AI_DC_unusedRPL, _position]); };
				_roofAI = true;
				_wpRadius = 5;
			} else {
				//if array has emptied and we've run out of roof ai spawn points, use ground spawn points
				_position = P2AI_Castle_GroundAIPosList select (floor (random ((count P2AI_Castle_GroundAIPosList) -1 )));
				_roofAI = false;
				_wpRadius = 10;
			};
		} else {
			//95% chance: select a ground position
			_position = P2AI_Castle_GroundAIPosList select (floor (random ((count P2AI_Castle_GroundAIPosList) -1 )));
			_roofAI = false;
			_wpRadius = 10;
		};

		_xpos = _position select 0;
		_ypos = _position select 1;

		if (_d) then { diag_log(format["[P2AI]:%1:CaslteAI: AI Pos: %2 / is Roof AI: %3 / UnitNum / unitCount: %4/%5", _f, _position,_roofAI,_x,_unitcount]); };
	};

	//Lets pick a skin from the array
	_aiskin = P2AIBanditSkins call BIS_fnc_selectRandom;

	if (_d) then { diag_log(format["[P2AI]:%1: Skin Chosen: %2", _f, _aiskin]); };

	//Lets spawn the unit
	_unit = _unitGroup createUnit [_aiskin, [(_position select 0),(_position select 1),(_position select 2)], [], 10, "PRIVATE"];
	
	if (_d) then { diag_log(format["[P2AI]:%1: Unit Created: %2", _f, _unit]); };

	//Make him join the correct team
	[_unit] joinSilent _unitGroup;

	if (_d) then { diag_log(format["[P2AI]:%1: Unit Joined Group: %2", _f, _unitGroup]); };

	if (P2AI_hunterAI && !_behaviourAdded) then {
		if ((P2AI_hunterAIPercent * 0.01) > _rand) then {
			//Add the hunter behaviour
			_unit enableAI "TARGET"; //targetting lets them hunt outside of their waypoint area.
			_unit enableAI "AUTOTARGET";
			_unit enableAI "MOVE";
			_unit enableAI "ANIM";
			_unit enableAI "FSM";
			_unit setCombatMode "RED";
			_unit setBehaviour "COMBAT";
			_unit setVariable ["P2AIHunter", true];
			_hunterCount = _hunterCount + 1;
			if (_d) then { diag_log(format["[P2AI]:%1: Unit Behaviour Added: Hunter", _f]); };
			_behaviourAdded = true; //dont re-add behaviour later
		};
	};

	if (!_behaviourAdded) then {
		//Add the stationary, gaurd behaviour
		_unit disableAI "TARGET";
		_unit enableAI "AUTOTARGET";
		//freeze roofai on top of roof, direction is updated by script
		if (_roofAI) then { 
			_unit disableAI "MOVE"; doStop _unit;
		} else { 
			_unit enableAI "MOVE";  
		};
		_unit enableAI "ANIM";
		_unit enableAI "FSM";
		_unit setCombatMode "RED";
		_unit setBehaviour "COMBAT";
		_unit setVariable ["P2AIHunter", false];
		if (_d) then { diag_log(format["[P2AI]:%1: Unit Behaviour Added: Stationary", _f]); };
	};

	//Remove the items he spawns with by default
	removeAllWeapons _unit;
	removeAllItems _unit;
	
	//	Now we need to figure out their loadout, and assign it
	//Get the weapon array based on skill
	_weaponArray = [_skill] call P2AIGetWeapon;
	
	_weapon = _weaponArray select 0;
	_magazine = _weaponArray select 1;
		
	//Get the gear array
	_aigear = P2AIGear1;
	_gearmagazines = _aigear select 0;
	
	//Lets add it to the Unit
	for "_i" from 1 to 6 do {
		_unit addMagazine _magazine;
	};

	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	
	_unit addWeapon "M136";
	_unit addMagazine "M136";

		
	{
		_unit addMagazine _x
	} forEach _gearmagazines;
	
	//set ai skill level (same for all)
	_aicskill = P2AISkill;
	
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} forEach _aicskill;
	
	//Lets prepare the unit for cleanup
	_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] execVM P2AI_aiDeath; }];
	_unit setVariable ["P2AIAI", true];

	if (_roofAI) then {
		if (_d) then { diag_log(format["[P2AI]:%1: RoofAI: %2, SetPosATL: %3", _f, _roofAI, _position]); };
		_unit setPosATL _position;
		uiSleep 2;
		_unit setPosATL _position;
	};

	if (_d) then { diag_log(format["[P2AI]:%1:AISpawn: Group: %2, Skin: %2, Gear: %3, Pos: %4", _f, _unitGroup, _aiskin, [_weapon,_gearmagazines], _position]); };

	//start ai handler thread
	[_unit,_unitArrayName,_roofAI,_position] spawn P2AI_aiThread;
};

if (_d) then { diag_log(format["[P2AI]:%1: Finished Spawning Group", _f]); };

// These are 4 waypoints in a NorthSEW around the center
_wppos1 = [_xpos, _ypos+_wpRadius, 0];
_wppos2 = [_xpos+_wpRadius, _ypos, 0];
_wppos3 = [_xpos, _ypos-_wpRadius, 0];
_wppos4 = [_xpos-_wpRadius, _ypos, 0];

// We add the 4 waypoints
_wp1 = _unitGroup addWaypoint [_wppos1, _wpRadius];
_wp1 setWaypointType "MOVE";
_wp2 = _unitGroup addWaypoint [_wppos2, _wpRadius];
_wp2 setWaypointType "MOVE";
_wp3 = _unitGroup addWaypoint [_wppos3, _wpRadius];
_wp3 setWaypointType "MOVE";
_wp4 = _unitGroup addWaypoint [_wppos4, _wpRadius];
_wp4 setWaypointType "MOVE";

// Then we add a center waypoint that tells them to visit the rest
_wpfin = _unitGroup addWaypoint [[_xpos,_ypos, 0], _wpRadius];
_wpfin setWaypointType "CYCLE";

if (_d) then { diag_log(format["[P2AI]:%1:EventAI: Waypoint Added: %2", _f, [[_xpos,_ypos, 0], _wpRadius]]); };

if !(_unitArrayName == "P2AIUnitsDevilsCastle") then {
	// load the unit groups into a passed array name so they can be cleaned up later
	call compile format["
	%1 = %1 + (units _unitGroup); 
	_unitMissionCount = count %1;
	",_unitArrayName];

	if (_d) then { diag_log(format["[P2AI]:%1:EventAI: (%4) %2 AI Spawned, %5 are Hunters, %3 units in mission", _f, count (units _unitGroup),_unitMissionCount,_unitArrayName,_hunterCount]); };

} else {
	if (_d) then { diag_log(format["[P2AI]:%1:CastleAI: %2 AI Spawned, %3 are Hunters", _f, count (units _unitGroup),_hunterCount]); };
};