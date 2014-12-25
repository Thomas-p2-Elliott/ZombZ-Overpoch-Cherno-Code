/*---------------------------------------------------------------------------
Zombie Horde Tracker

Tracks a horde after it is first spawned
  to make sure it fully respawns when most of the zeds die.
---------------------------------------------------------------------------*/

private ["_hordeNum", "_zc", "_mn","_d","_hordeAlreadyTracked","_thresh"];
_hordeNum = _this select 0;
_hordeType = _this select 1;
_d = P2DZ_HC_HordeZedsDebug;
_thresh = (P2DZ_HC_ZHorde_HordeRespawnPerc * 0.1);
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:P2DZ_HC_ZHorde_tracker:Input: %1, RespawnThreshold: (%2%3)",_this,(_thresh * 10),"%"]);	};

if (isNil 'P2DZ_HC_ZHorde_tracker_TrackedNums') then {
	P2DZ_HC_ZHorde_tracker_TrackedNums = [];
};

_hordeAlreadyTracked = false;
{
  if (_hordeNum == _x) then {
  	_hordeAlreadyTracked = true;
  };
} forEach P2DZ_HC_ZHorde_tracker_TrackedNums;

if (_hordeAlreadyTracked) exitWith {
	if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:P2DZ_HC_ZHorde_tracker:Error, Horde %1 already Tracked!",_hordeNum]);	};
};
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:P2DZ_HC_ZHorde_tracker:Starting Horde Tracking For HordeNumber: %1",_hordeNum]);	};

P2DZ_HC_ZHorde_tracker_TrackedNums = P2DZ_HC_ZHorde_tracker_TrackedNums + [_hordeNum];
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:P2DZ_HC_ZHorde_tracker:TrackedHordes: %1",P2DZ_HC_ZHorde_tracker_TrackedNums]);	};

while {true} do {

	//sleep 2 minutes between each check
	uiSleep 120;

	_zc = 0;	//reset z count
	_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
	//check if any of them men are living zombies that are part of this horde number
	{ if (_x isKindof "zZombie_Base" && alive _x && (_x getVariable [(format["hordeZed_%1",_hordeNum]), false])) then { _zc = _zc + 1;	}; } foreach _mn;

	//If less than eg 10% of zombies left, respawn entire horde
	if (_zc < (_thresh)) then {
		if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:P2DZ_HC_ZHorde_tracker:Respawning Horde! ZedsPerHorde * 0.1 (%2) > ZedsLeft(%2): %1",(P2DZ_HC_ZHorde_ZombiesPerHorde * 0.1),_zc]);	};

		//delete existing horde
		_hordeNum call P2DZ_HC_ZHorde_cleanupHorde;
		//spawn new horde
		[_hordeNum,_hordeType] call P2DZ_HC_ZHorde_spawnHorde;
	};

};

