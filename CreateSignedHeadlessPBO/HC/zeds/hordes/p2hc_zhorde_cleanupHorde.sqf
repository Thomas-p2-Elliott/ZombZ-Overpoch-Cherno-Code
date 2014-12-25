/*---------------------------------------------------------------------------
delete each zombie in given horde number on map
---------------------------------------------------------------------------*/
private ["_hordeNum", "_mn"];
_hordeNum = _this;
_mn = [];
_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
{ 
	//check if any of them men are living zombies that are part of this horde number
	if (_x isKindof "zZombie_Base" && {(_x getVariable [(format["hordeZed_%1",_hordeNum]), false])}) then {
		_x call P2DZ_HC_ZHorde_cleanupZed;
	};
} foreach _mn;

