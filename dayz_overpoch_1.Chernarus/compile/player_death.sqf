private ["_display","_body","_playerID","_array","_source","_method","_canHitFree","_isBandit","_punishment","_humanityHit","_myKills","_humanity","_kills","_killsV","_myGroup"];
disableSerialization;
if (deathHandled) exitWith {};
deathHandled = true;
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
//add weapon on back to player...
//if (dayz_onBack != "") then {
//	_body addWeapon dayz_onBack;
//};

_infected = 0;
if (r_player_infected && DZE_PlayerZed) then {
	_infected = 1;
};

PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,_infected, dayz_playerName];
publicVariableServer "PVDZE_plr_Died";

_id = [player,20,true,getPosATL player] call player_alertZombies;

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

_array = _this;
if (count _array > 0) then {
	_source = _array select 0;
	_method = _array select 1;
	if ((!isNull _source) && (_source != player)) then {
		_canHitFree = player getVariable ["freeTarget",false];
		_isBandit = (player getVariable["humanity",0]) <= -5000; //Default: 2000
		_punishment = _canHitFree || _isBandit; //if u are bandit || start first - player will not recieve humanity drop
		_humanityHit = 0;

		/*---------------------------------------------------------------------------
			Fucking Sexy CS-Style Death Messages by Player2
		---------------------------------------------------------------------------*/
		[_array,player] call {
			private ["_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_killfeed"];
			_array = _this select 0;
			//victim info
			_victim = 		_this select 1;
			_victimName =	name _victim;
			//killer info
			_killer = 		_array select 0;
			_killerName = 	name _killer;
			//death method
			_method = _array select 1;

			diag_log(__FILE__ + "  _victim: " +  str(_victim) + "  _victimName: " + str(_victimName) + "  _killer: " + str (_killer) + "  _killerName: " + str(_killerName) + "  _method: " + str(_method));

			//if killer has a name
			if (_killerName != "nil") then
			{
				if (_victimName == _killerName) then 
				{
					_message = format["%1 killed himself",_victimName];
					diag_log(_message);
				}
				else 
				{
					_weapon = weaponState _killer;
					if (_weapon select 0 == "Throw") then 
					{
						_weapon = _weapon select 3;
					}
					else
					{
						_weapon = _weapon select 0;
					};

					_vehicle = typeOf (vehicle _killer); 
					if ((getText (configFile >> "CfgVehicles" >> _vehicle >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
						_weapon = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
					};

					_distance = [getPosASL _victim, getPosASL _killer] call KK_fnc_distanceASL;
					_distance = floor(_distance);

					P2DZ_dS = [_victim,_killer,_weapon,_distance,_method];
					publicVariable "P2DZ_dS";
					diag_log("[P2_PubVar]: P2DZ_dS: " + str(P2DZ_dS));
				};
			};
		};

		if (!_punishment) then {
			//i'm "not guilty" - kill me && be punished
			_myKills = ((player getVariable ["humanKills",0]) / 30) * 1000;
			_humanityHit = -(1000 - _myKills);  //Default: 2000
			_kills = _source getVariable ["humanKills",0];
			_source setVariable ["humanKills",(_kills + 1),true];
			PVDZE_send = [_source,"Humanity",[_source,_humanityHit,300]];
			publicVariableServer "PVDZE_send";
		} else {
			//i'm "guilty" - kill me as bandit
			_killsV = _source getVariable ["banditKills",0];
			_source setVariable ["banditKills",(_killsV + 1),true];
			//Give humanity for killing as bandit
			_humanityHit = 500;
			PVDZE_send = [_source,"Humanity",[_source,_humanityHit,300]];
			publicVariableServer "PVDZE_send";
		};
	};
	_body setVariable ["deathType",_method,true];
};

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
