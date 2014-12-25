/*
	This function is called when an AI Unit is killed.
	It handles the humanity allocation and body cleanup.
*/

private ["_unit","_player","_humanity","_banditkills"];
_unit = _this select 0;
_player = _this select 1;

private["_f","_d"]; _f = "aiDeath"; _d = (P2AI_debugAI);
if (_d) then { diag_log(format["[P2AI]:%1: Input: %2", _f, _this]); };

//If the killer is a player, lets handle the humanity
if (isPlayer _player) then {
	private ["_banditkills","_humanity"];
	
	if (_d) then { diag_log(format["[P2AI]:%1: (%5/%6) Killed by Player: (%2/%3) @ %4", _f, _player, (name _player), mapGridPosition _unit, _unit, typeOf(_unit)]); };
	//Lets grab some info
	_humanity = _player getVariable ["humanity",0];
	_banditkills = _player getVariable ["banditKills",0];
	
	//If the player gets humanity per config, lets give it
	if (P2AIMissHumanity) then {
		_player setVariable ["humanity",(_humanity + P2AICntHumanity),true];
		//if (_d) then { diag_log(format["[P2AI]:%1: Killer Humanity Was: %2, Now: %3", _f, _humanity, (_humanity + P2AICntHumanity)]); };
	};
	
	//If this counts as a bandit kill, lets give it
	if (P2AICntBanditKls) then {
		_player setVariable ["banditKills",(_banditkills + 1),true];
		//if (_d) then { diag_log(format["[P2AI]:%1: Killer banditKills Was: %2, Now: %3", _f, _banditkills, (_banditkills + 1)]); };
	};
	
	//Lets inform the nearby AI of roughly the players position
	//This makes the AI turn and react instead of laying around
	{
		if (((position _x) distance (position _unit)) <= 300) then {
			_x reveal [_player, 4.0];
			//if (_d) then { diag_log(format["[P2AI]:%1: Position of Killer (%4) Revealed To Nearby Unit: %2/%3", _f, _x, typeOf(_x), _player]); };
		}
	} forEach allUnits;
	
} else {

	if (_d) then { diag_log(format["[P2AI]:%1: AI Killed by: (%2/%3) @ %3", _f, _player, typeOf(_player), mapGridPosition _unit]); };


	if (P2AIRunGear) then {
		//Since a player ran them over, or they died from unknown causes
		//Lets strip their gear
		removeBackpack _unit;
		removeAllWeapons _unit;
		{
			_unit removeMagazine _x
		} forEach magazines _unit;

		if (_d) then { diag_log(format["[P2AI]:%1: P2AIRunGear Enabled: Gear Stripped From: %2", _f, _unit]); };

	};
	
};

if (P2AICleanDeath) then {
	if (_d) then { diag_log(format["[P2AI]:%1: P2AICleanDeath Enabled, Purging: %2", _f, _unit]); };
	_unit call P2AIPurgeObject;
	if (P2AICleanDeath) exitWith {};
};

if (_d) then { diag_log(format["[P2AI]:%1: Starting Body Cleanup Timer (Seconds): %2", _f, P2AIBodyTime]); };

//Dead body timer and cleanup
[P2AIBodyTime,10] call P2AISleep;

if (_d) then { diag_log(format["[P2AI]:%1: Cleanup Timer Finished For: %2, Purging.", _f, _unit]); };

_unit call P2AIPurgeObject;
