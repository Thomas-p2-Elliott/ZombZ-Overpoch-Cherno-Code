/*---------------------------------------------------------------------------
Zombie Loiter Replacement -Standby Mode
---------------------------------------------------------------------------*/
private ["_unit","_newPos","_pos","_d"];
_unit = 		_this select 0;
_pos = 			_this select 1;

if (isNil '_pos') then {
	_pos = 	getPosATL _unit;
};

_d = 			P2DZ_HC_debugHordeZedFSM;
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:LoiterStandBy:Input: %1",_this]);	};

//get me a random pos within 49m of mypos
_newPos = [_pos,0,49,2,0,0,0] call BIS_fnc_findSafePos;

if (isNil '_newPos') then {
	_newPos = _pos;
};

if(isNull group _unit) then {
	_unit moveTo _newPos;
} else {
	_unit domove _newPos;
};

_unit forceSpeed 2;