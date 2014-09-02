private["_obj"];
_obj = _this select 3;

P2DZE_plr_pickupGold = [player,_obj];
publicVariableServer "P2DZE_plr_pickupGold";

if (!isNil 's_player_takeGold') then {
	if (s_player_takeGold > 0) then {
		player removeAction s_player_takeGold; 
		s_player_takeGold = -1; 
	};
};

if (P2DZE_goldItemHandlingDebug) then {

	diag_log(format["P2DEBUG: takeGold.sqf: Obj / typeOf Obj: %1 / %2",_obj,typeOf _obj]);

};