private ["_long"];
_long = ;
cariEclick = {
	if (vehicle player != player) exitWith {systemChat "Must exit vehicle first!";};
	
	private ["_cariPos","_updates","_playerUID","_charID","_humanity","_worldspace","_model","_fractures","_old","_medical","_zombieKills","_headShots","_humanKills","_banditKills"];
	
	_cariPos = [_this select 0,_this select 1,_this select 2];
	
	_playerUID 	= dayz_playerUID;
	_charID 	= dayz_characterID;
	_model = "Survivor2_DZ";	_old = player;
	player allowDamage false;
	player removeEventHandler ["FiredNear",eh_player_killed];
	player removeEventHandler ["HandleDamage",mydamage_eh1];
	player removeEventHandler ["Killed",mydamage_eh3];
	player removeEventHandler ["Fired",mydamage_eh2];
	_updates = 		player getVariable["updatePlayer",[false,false,false,false,false]];
	_updates set [0,true];
	player setVariable["updatePlayer",_updates,true];
	dayz_unsaved = true;
	_humanity		= player getVariable["humanity",0];
	_medical 		= player call player_sumMedical;
	_worldspace 	= [round(direction player),getPosATL player];
	_zombieKills 	= player getVariable ["zombieKills",0];
	_headShots 		= player getVariable ["headShots",0];
	_humanKills 	= player getVariable ["humanKills",0];
	_banditKills 	= player getVariable ["banditKills",0];	private ["_weapons","_backpackWpn","_backpackMag","_currentWpn","_backpackWpnTypes","_backpackWpnQtys","_countr","_class","_position","_dir","_currentAnim","_playerUID","_countMags","_magazines","_primweapon","_secweapon","_newBackpackType","_muzzles","_oldUnit","_group","_newUnit","_playerObjName","_ismelee"];	_class 			= _model;
	disableSerialization;
	_position 		= _cariPos;
	_dir 			= getDir player;
	_currentAnim 	= animationState player;
	_playerUID = getPlayerUID player;
	_weapons 	= weapons player;
	_countMags = call player_countMagazines; 
	_magazines = _countMags select 0;	_primweapon	= primaryWeapon player;
	_secweapon	= secondaryWeapon player;	if(!(_primweapon in _weapons) && _primweapon != "") then {
		_weapons set [(count _weapons), _primweapon];
	};	if(!(_secweapon in _weapons) && _secweapon != "") then {
		_weapons set [(count _weapons), _secweapon];
	};	dayz_myBackpack = unitBackpack player;
	_newBackpackType = (typeOf dayz_myBackpack);
	if(_newBackpackType != "") then {
		_backpackWpn = getWeaponCargo unitBackpack player;
		_backpackMag = getMagazineCargo unitBackpack player;
	};	_currentWpn = currentWeapon player;
	_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
	if (count _muzzles > 1) then {
		_currentWpn = currentMuzzle player;
	};
	_display = findDisplay 106;
	_display closeDisplay 0;
	_oldUnit = player;
	_group 		= createGroup west;
	_newUnit = _group createUnit [_class,getMarkerPos "respawn_west",[],0,"NONE"];
	_newUnit 	setDir _dir;
	
	{_newUnit removeMagazine _x;} count  magazines _newUnit;
	removeAllWeapons _newUnit;		{
		if (typeName _x == "ARRAY") then {if ((count _x) > 0) then {_newUnit addMagazine [(_x select 0), (_x select 1)]; }; } else { _newUnit addMagazine _x; };
	} count _magazines;	{
		_newUnit addWeapon _x;
	} count _weapons;	if(str(_weapons) != str(weapons _newUnit)) then {
		{
			_weapons = _weapons - [_x];
		} count (weapons _newUnit);		{
			_newUnit addWeapon _x;
		} count _weapons;
	};	if(_primweapon !=  (primaryWeapon _newUnit)) then {
		_newUnit addWeapon _primweapon;		
	};	if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {
		_newUnit addWeapon _secweapon;		
	};	if (!isNil "_newBackpackType") then {
		if (_newBackpackType != "") then {
			_newUnit addBackpack _newBackpackType;
			dayz_myBackpack = unitBackpack _newUnit;			_backpackWpnTypes = [];
			_backpackWpnQtys = [];
			if (count _backpackWpn > 0) then {
				_backpackWpnTypes = _backpackWpn select 0;
				_backpackWpnQtys = _backpackWpn select 1;
			};
			_countr = 0;
			{
				dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
				_countr = _countr + 1;
			} forEach _backpackWpnTypes;
			_backpackmagTypes = [];
			_backpackmagQtys = [];
			if (count _backpackmag > 0) then {
				_backpackmagTypes = _backpackMag select 0;
				_backpackmagQtys = _backpackMag select 1;
			};
			_countr = 0;
			{
				dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
				_countr = _countr + 1;
			} forEach _backpackmagTypes;
		};
	};
	
	addSwitchableUnit _newUnit;
	setPlayable _newUnit;
	_createSafePos = getMarkerPos "respawn_west";
	
	_newUnit 	setPosATL _position;
	selectPlayer _newUnit;
	
	removeAllWeapons _oldUnit;
	{_oldUnit removeMagazine _x;} forEach magazines _oldUnit;
	if !(isNull _oldUnit) then {deleteVehicle _oldUnit;};
	if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};
	
	[objNull, player, rSwitchMove,_currentAnim] call RE;
	player disableConversation true;	{player reveal _x} forEach (nearestObjects [getPosATL player, ["AllVehicles","WeaponHolder"], 75]);	if (count _medical > 0) then {
		player setVariable["USEC_isDead",(_medical select 0),true];
		player setVariable["NORRN_unconscious", (_medical select 1), true];
		player setVariable["USEC_infected",(_medical select 2),true];
		player setVariable["USEC_injured",(_medical select 3),true];
		player setVariable["USEC_inPain",(_medical select 4),true];
		player setVariable["USEC_isCardiac",(_medical select 5),true];
		player setVariable["USEC_lowBlood",(_medical select 6),true];
		player setVariable["USEC_BloodQty",(_medical select 7),true];
		player setVariable["unconsciousTime",(_medical select 10),true];
		
		{
			player setVariable[_x,true,true];
		} count (_medical select 8);
		
		_fractures = (_medical select 9);
		[player,"legs", (_fractures select 0)] call object_setHit;
		[player,"hands", (_fractures select 1)] call object_setHit;
	} else {
		player setVariable ["hit_legs",0,true];
		player setVariable ["hit_hands",0,true];
		player setVariable ["USEC_injured",false,true];
		player setVariable ["USEC_inPain",false,true];	
	};
	player setVariable["humanity",_humanity,true];
	player setVariable["zombieKills",_zombieKills,true];
	player setVariable["headShots",_headShots,true];
	player setVariable["humanKills",_humanKills,true];
	player setVariable["banditKills",_banditKills,true];
	player setVariable["CharacterID",_charID,true];
	player setVariable["worldspace",_worldspace,true];
	call dayz_resetSelfActions;
	call cariAdd;
	call cariNear;
	eh_player_killed = player addeventhandler ["FiredNear",{_this call player_weaponFiredNear;} ];	[player] call fnc_usec_damageHandle;
	player allowDamage true;
	player addWeapon "Loot";
	player addWeapon "Flare";
	sleep 0.2;	if (!isNull _old) then {
		deleteVehicle _old;
	};
};private ["_pos","_target","_cariName"];_target = _this select 0;
_cariName = name _target;
_pos = getPosATL _target;
[(_pos select 0)+4,(_pos select 1)+4,_pos select 2] spawn cariEclick;
systemChat format ["Moved to %1",_cariName];
