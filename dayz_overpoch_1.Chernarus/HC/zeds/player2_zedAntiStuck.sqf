/*---------------------------------------------------------------------------
HeadlessZed Anti-Stuck by Player2

 Description:
 	Spawn Loop to make sure zombie gets deleted
 	if it doesnt move more than 10m in 2 checks...
 	Each check runs on 60sec interval
---------------------------------------------------------------------------*/

private["_null"];
_agent = _this;

_null = [_agent] spawn {
	private["_agent","_pos","_lastPos","_notMoveCount","_d"];
	//Variable Initalization
	_agent = objNull; _pos = [];	_lastPos = []; _notMoveCount = 0;
	_agent = _this select 0;

	if (isNil '_agent') exitWith {
		diag_log("P2HC: ZedAntiStuck: Error input agent was nil");
	};
	
	if (isNull _agent) exitWith {
		diag_log("P2HC: ZedAntiStuck: Error input agent was null");
	};

	_lastPos = position _agent;
	
	_d = P2DZ_HC_debugZedFSM;
	if (_d) then { diag_log(format["P2HC: ZedAntiStuck: Starting"]); };

	while {!isNull _agent && {alive _agent}} do {
		_lastPos = position _agent;
		uiSleep 60;
		_pos = position _agent;

		if ((_lastPos distance _pos) < 4) then {
			_notMoveCount = _notMoveCount + 1;
		} else {
			_notMoveCount = 0;
		};

		if (_notMoveCount > 3) exitWith {
			if (_d) then { diag_log(format["P2HC: ZedAntiStuck: Zed Hasn't Moved More than 10m for %1 60 second interval checks...Deleting",_notMoveCount]); };
		};
	};

	if (!isNull _agent) then {
		if (_d) then { diag_log(format["P2HC: ZedAntiStuck: AgentDeleted"]); };
		_agent call P2DZ_HC_ZHorde_cleanupZed;
	};

	if (_d) then { diag_log(format["P2HC: ZedAntiStuck: Finished: IsNull? %1, isAlive: %2",(isNull _agent),(alive _agent)]); };
};