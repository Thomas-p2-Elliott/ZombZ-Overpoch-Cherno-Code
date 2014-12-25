/*---------------------------------------------------------------------------
Get All Alive Zombies in Horde and return as array of zombie objects
---------------------------------------------------------------------------*/

private ["_hordeNum", "_returnArray", "_mn"];
_hordeNum = _this;
_returnArray = [];
_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
{
	//check if any of them men are living zombies that are part of this horde number
	if (_x isKindof "zZombie_Base" && alive _x && (_x getVariable [(format["hordeZed_%1",_hordeNum]), false])) then {
 		_returnArray = _returnArray + [_x];
	}; 
} foreach _mn;

_returnArray;
