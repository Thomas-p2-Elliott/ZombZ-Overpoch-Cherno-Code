private ["_ai","_sleepTimeMax","_sleepTimeMin","_roofAI","_centerPos"];
//get input values: [AI Object, AI Type (Minor/Major/Castle), is Roof AI (True/false), Mission Center Pos Array]
_ai = _this select 0;
//_aiArrayName = _this select 1; //Unused for now
_roofAI = _this select 2;
_centerPos = _this select 3;

//debugging outputs
private["_f","_d"]; _f = "aiThread"; _d = (P2AI_debugAI);
if (_d) then { diag_log(format["[P2AI]:%1: Starting, Input: %2", _f, _this]); };

//exit if ai is nil
if (isNil '_ai') exitWith {
	if (_d) then { diag_log(format["[P2AI]:%1: Quitting, Nil AI Input: %2", _f, _this]); };
};

//exit if ai is null
if (isNull _ai) exitWith {
	if (_d) then { diag_log(format["[P2AI]:%1: Quitting, Null AI Input: %2", _f, _this]); };
};

//just in case this hasnt been parsed in properly
if (isNil '_roofAI') then {
	_roofAI = false;
	if (_d) then { diag_log(format["[P2AI]:%1: Bad RoofAI Input: %2, Set to False", _f, _this]); };
};

//set to current ai pos if not parsed properly
if (isNil '_centerPos') then {
	_centerPos = getPos _ai;
	if (_d) then { diag_log(format["[P2AI]:%1: Bad centerPos Input: %2, set to AI Pos: %3", _f, _this, _centerPos]); };
};

//Set up sleep times
_sleepTimeMax = 6;
_sleepTimeMin = 3;

//if roofai, sleep less, turn more.
if (_roofAI) then {
	_sleepTimeMin = 1;
	_sleepTimeMax = 3;
};

while {alive _ai} do 
{
	private["_sleepTime","_turnChance","_bestDist","_cDist","_bDistNum","_count","_closestPlayer"];
	//generate random sleeptime to offset the ai shooting
	_sleepTime = random _sleepTimeMax;
	_sleepTime = _sleepTimeMin + _sleepTime;
	//initialize variables
	_bestDist = 100000;
	_cDist = 	1000;
	_bDistNum = 0;
	_count = 	0;

	//find closest player to AI
	{ 
		if (alive _x) then {
			if (name _x != "www.ZombZ.net") then {

				_cDist =  (getPosASL _ai) distance (getPosASL _x);
				if (_bestDist > _cDist) then {
					_bDistNum = _count;
					_bestDist = _cDist;
				};
				_count = _count + 1;
			};
		};
	} count playableUnits;

	//select closest player from created bdistnum
	_closestPlayer = playableUnits select _bDistNum;
	//make sure real value was returned, if not set to null
	if (isNil '_closestPlayer') then { _closestPlayer = objNull };
	//make sure object isnt null
	if (!isNull _closestPlayer) then {
		//reveal enemey
		_ai reveal [(vehicle _closestPlayer), 4];

		//watch enemey
		_ai doWatch (vehicle _closestPlayer);

		//target enemey
		_ai doTarget (vehicle _closestPlayer);

		//order units to fire when ready
		_ai doFire (vehicle _closestPlayer);

		//give ai a chance to turn if not on roof
		if (_roofAI) then { _turnChance = 1; } else {
			_turnChance = random 1;
		};

		//face towards enemey 50% chance, 100% for roof ai
		if (_turnChance > 0.5) then {
			private["_p1","_p2","_dx","_dy","_heading"];
			_p1 = getPos _ai; 						//unit position
			_p2 = getPos (vehicle _closestPlayer); 	//target position
			_dx = (_p2 select 0) - (_p1 select 0); 
			_dy = (_p2 select 1) - (_p1 select 1); 
			_heading = _dx atan2 _dy; 
			if (_heading < 0) then {_heading = _heading + 360}; 
			_ai setDir _heading;
		};
	};

	//if AI wanders too far from mision, tell em to go back
	if (((getPos _ai) distance _centerPos) > 150) then {
		_ai moveTo _centerPos;
		_ai doMove _centerPos;
	};

	//make sure if less than _sleepTimeMin then set to _sleepTimeMin
	if (_sleepTime < _sleepTimeMin) then { _sleepTime = _sleepTimeMin; };
	uiSleep _sleepTime;
};

if (_d) then { diag_log(format["[P2AI]:%1: AI Thread Quitting: Dead AI", _f]); };