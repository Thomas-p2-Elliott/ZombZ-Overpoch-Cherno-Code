private ["_pGold", "_display", "_body", "_playerID", "_myGroup"];
disableSerialization;

/*
if (format["%1",(uiNameSpace getVariable "BIS_loadingScreen")] != "No display") then {
	endLoadingScreen;
	diag_log(format["P2DEBUG: %1","player_death: Close KO Screen"]);
};	
*/

if (deathHandled) exitWith {};
deathHandled = true;

_pGold = [false,player] call p2_gv;

/*---------------------------------------------------------------------------
Add Skin to Dead Body on Death by Player2 - Either backpack or Main Inv
---------------------------------------------------------------------------*/
[] call {
	private ["_b", "_p", "_s", "_k", "_r", "_h"];
	_b = objNull;	_p = objNull;	_s = "";	_k = false;	_r = false;	_h = false;
	_b = player;	_s = (typeOf _b);	_s = "Skin_" + _s;	_k = isClass (configFile >> "CfgMagazines" >> _s); 	_p = unitBackpack _b;
	if (!_k) then {
		_k = isClass (missionConfigFile >> "ZombZSkins" >> _s);
		if (_k) then {
			_h = isText (missionConfigFile >> "ZombZSkins" >> _s >> "package");
			if (_h) then {
				_s = getText (missionConfigFile >> "ZombZSkins" >> _s >> "package");
				if (!isNil "_s") then { _k = true; } else { _k = false };
			};
		};
	};
	if (_k) then {
		_r = [_b,_s] call BIS_fnc_invAdd;
		if (!_r) then {
			if (!isNil "_p") then { 
				if (!isNull _p) then {
					_p addMagazineCargoGlobal [_s,1];
				};
			};
		};
	};   
};

if ((alive player) && {isNil {dayz_playerName}}) then {
	dayz_playerName = name player;
};

//Prevent client freezes
_display = findDisplay 49;
if(!isNull _display) then {_display closeDisplay 0;};
if (dialog) then {closeDialog 0;};
if (visibleMap) then {openMap false;};

_body = player;
_playerID = getPlayerUID player;

disableUserInput true;

PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,0, dayz_playerName,_pGold];
publicVariableServer "PVDZE_plr_Died";

_id = [player,100,true,getPosATL player] call player_alertZombies;

sleep 0.5;

player setDamage 1;
0.1 fadeSound 0;

player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
player setVariable ["startcombattimer", 0];
r_player_unconscious = false;
r_player_cardiac = false;

terminate dayz_musicH;
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;

r_player_dead = true;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

//Player is Dead!
3 fadeSound 0;
sleep 1;

dayz_originalPlayer enableSimulation true;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

//_myGroup = group _body;
//[_body] joinSilent dayz_firstGroup;
//deleteGroup _myGroup;

3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];

_body setVariable["combattimeout", 0, true];

//["dayzFlies",player] call broadcastRpcCallAll;
sleep 2;

1 cutRsc ["DeathScreen","BLACK OUT",3];

playMusic "dayz_track_death_1";

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;

sleep 2;

for  "_x" from 5 to 1 step -1 do {
	titleText [format[localize "str_return_lobby", _x], "PLAIN DOWN", 1];
	sleep 1;
};

PVDZE_Server_Simulation = [_body, false];
publicVariableServer "PVDZE_Server_Simulation";

endMission "END1";
