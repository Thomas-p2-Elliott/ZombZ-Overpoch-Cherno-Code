/*---------------------------------------------------------------------------
Zombie Loiter Replacement
---------------------------------------------------------------------------*/
private ["_unit","_originalPos","_pos","_d"];
_unit = 		_this select 0;
_originalPos = 	_this select 1;
_pos = 			getPosATL _unit;

_d = 			P2DZ_HC_debugHordeZedFSM;
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:Loiter:Input: %1",_this]);	};

if (count _this > 2) then {
	_pos = _this select 2;
};

if(isNull group _unit) then {
	_unit moveTo _pos;
} else {
	_unit domove _pos;
};

_unit forceSpeed P2DZ_HC_hordeZedSpeed;
