private ["_dikCode","_handled","_objs","_primaryWeapon","_secondaryWeapon","_nearbyObjects","_shift","_ctrl","_alt","_dropPrimary","_dropSecondary","_iItem","_removed","_iPos","_radius","_item","_vehicle","_inVehicle","_onLadder","_canDo"];
_dikCode = 	_this select 1;

_handled = false;

if (_dikCode in[0x02,0x03,0x04,0x58,0x57,0x44,0x43,0x42,0x41,0x3E,0x3D,0x3C,0x3B,0x0B,0x0A,0x09,0x08,0x07,0x06,0x05]) then {
	_handled = true;
};

if ((_dikCode == 0x3E || _dikCode == 0x0F || _dikCode == 0xD3)) then {
	if(diag_tickTime - dayz_lastCheckBit > 10) then {
		dayz_lastCheckBit = diag_tickTime;
		call dayz_forceSave;
	};
	call dayz_EjectPlayer;
};

// esc
if (_dikCode == 0x01) then {
	DZE_cancelBuilding = true;
	call dayz_EjectPlayer;
};

// Disable ESC after death
if (_dikCode == 0x01 && r_player_dead) then {
	_handled = true;
};


// surrender 
if (_dikCode in actionKeys "Surrender") then {
	
	_vehicle = vehicle player;
	_inVehicle = (_vehicle != player);
	_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
	_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder && !_inVehicle);
	
	if (_canDo && !DZE_Surrender && !(player isKindOf  "PZombie_VB")) then {
		DZE_Surrender = true;
		_dropPrimary = false;
		_dropSecondary = false;

		_primaryWeapon = primaryWeapon player;
		if (_primaryWeapon != "") then {_dropPrimary = true;};
		_secondaryWeapon = "";
		{
			if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Type")) == 2) exitWith {
					_secondaryWeapon = _x;
			};
		} count (weapons player);
		if (_secondaryWeapon != "") then {_dropSecondary = true;};

		if (_dropPrimary || _dropSecondary) then {
			player playActionNow "PutDown";
			_iPos = getPosATL player;
			_radius = 1;
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item setposATL _iPos;
			if (_dropPrimary) then {
				_iItem = _primaryWeapon;
				_removed = ([player,_iItem,1] call BIS_fnc_invRemove);
				if (_removed == 1) then {
					_item addWeaponCargoGlobal [_iItem,1];
				};
			};
			if (_dropSecondary) then {
				_iItem = _secondaryWeapon;
				_removed = ([player,_iItem,1] call BIS_fnc_invRemove);
				if (_removed == 1) then {
					_item addWeaponCargoGlobal [_iItem,1];
				};
			};
			player reveal _item;
		};

		// set publicvariable that allows other player to access gear
		player setVariable ["DZE_Surrendered", true, true];
		// surrender animation
		player playMove "AmovPercMstpSsurWnonDnon";
	};
	_handled = true;
};

if (_dikCode in actionKeys "MoveForward") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveLeft") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveRight") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveBack") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};

//Prevent exploit of glitching through doors
if (_dikCode in actionKeys "Prone") then {
	_doors = nearestObjects [player, DZE_DoorsLocked, 3];
	if (count _doors > 0) then {
		_handled = true;
	};
};

//Prevent exploit of drag body
if ((_dikCode in actionKeys "Prone") && r_drag_sqf) exitWith { force_dropBody = true; };
if ((_dikCode in actionKeys "Crouch") && r_drag_sqf) exitWith { force_dropBody = true; };

_shift = 	_this select 2;
_ctrl = 	_this select 3;
_alt =		_this select 4;

//diag_log format["Keypress: %1", _this];
if ((_dikCode in actionKeys "Gear") && (vehicle player != player) && !_shift && !_ctrl && !_alt && !dialog) then {
	createGearDialog [player, "RscDisplayGear"];
	_handled = true;
};

if (_dikCode in (actionKeys "GetOver") && (diag_tickTime - dayz_lastCheckBit > 1)) then {
	_nearbyObjects = nearestObjects[getPosATL player, dayz_disallowedVault, 8];
	if (count _nearbyObjects > 0) then {
		if((diag_tickTime - dayz_lastCheckBit > 2)) then {
			[objNull, player, rSwitchMove,"GetOver"] call RE;
			player playActionNow "GetOver";
			dayz_lastCheckBit = diag_tickTime;
		} else {
			_handled = true;
		};
	};
};

/* Debug Mon HotKeys */
if (_dikCode == 0x3F || _dikCode in actionKeys "User20") then {
	if (isNil "P2DZ_dbCurMode") then {
		P2DZ_dbCurMode = 2;
		P2DZ_dbCurMode = P2DZ_DebugMonDefault;
		//diag_log("Debug Mon Start!");
		dayz_lastCheckBit = diag_tickTime;
		_handled = true;
	} else {
		//diag_log("Debug Mon Pressed (F5)! Mode: " + str P2DZ_dbCurMode);
		if (P2DZ_dbCurMode < 3) then {
			P2DZ_dbCurMode = P2DZ_dbCurMode + 1;
			P2DZ_debugMonitor = true;
			dayz_lastCheckBit = diag_tickTime;
			_handled = true;
		} else {
			P2DZ_dbCurMode = 1;
			P2DZ_debugMonitor = true;
			dayz_lastCheckBit = diag_tickTime;
			_handled = true;
		};
	};
};

/* Debug Mon Colour GUI */
if (_dikCode == 0x40) then {
	if (!dialog) then {	[] spawn fnc_p2debugMonColorGUI; } else { [] spawn { closeDialog 0; uiSleep 0.1; [] call fnc_p2debugMonColorGUI; }; }; 
	dayz_lastCheckBit = diag_tickTime;
	_handled = true;
};

/* F1 Menu */
if (_dikCode == 0x3B) then {
	if (!dialog) then {	createDialog "RscGorsyMenu"; } else { [] spawn { closeDialog 0; uiSleep 0.1; createDialog "RscGorsyMenu"; }; }; 
	dayz_lastCheckBit = diag_tickTime;
	_handed = true;
};


/*Move Into Nearest Heli / HeliDoor Script - Disabled 
if (_dikCode == 0xD2  && (diag_tickTime - dayz_lastCheckBit > 1) && (player getVariable ["NORRN_inVehMount", false])) then {
	diag_log("P2DEBUG: Insert Key presed!");
	[] spawn {
		diag_log("P2DEBUG: Insert Key presed Thread!");
		detach player;
		player setVariable ["NORRN_inVehMount", false];
		_objs = nearestObjects [player, ["AllVehicles"], 100];
		player action ["getInCargo", (_objs select 0)];
	};
	dayz_lastCheckBit = diag_tickTime;
	_handled = true;
};
*/

/*Q and E Lean / HeliDoor - Disabled
if ((player getVariable ["NORRN_inVehMount", false]) && (diag_tickTime - dayz_lastCheckBit > 1) && {(_dikCode in actionKeys "LeanRight")}) then {
	player setDir ((getDir player) + 4);
	dayz_lastCheckBit = diag_tickTime;
	_handled = true;
};
if ((player getVariable ["NORRN_inVehMount", false]) && (diag_tickTime - dayz_lastCheckBit > 1) && {(_dikCode in actionKeys "LeanLeft")}) then {
	player setDir ((getDir player) - 4);
	dayz_lastCheckBit = diag_tickTime;
	_handled = true;
};
*/
/* HeliDoor reload magazine with reloadMagazine Key - Disabled
if ((player getVariable ["NORRN_inVehMount", false]) && (diag_tickTime - dayz_lastCheckBit > 1) && {(_dikCode in actionKeys "ReloadMagazine")}) then {
	reload player;
	dayz_lastCheckBit = diag_tickTime;
	_handled = true;
};
*/

//if (_dikCode == 57) then {_handled = true}; // space
//if (_dikCode in actionKeys 'MoveForward' || _dikCode in actionKeys 'MoveBack') then {r_interrupt = true};

if (_dikCode in actionKeys "ForceCommandingMode") then {_handled = true};
if (_dikCode in actionKeys "PushToTalk" && (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,50,true,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "VoiceOverNet" && (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,50,true,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "PushToTalkDirect" && (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,15,false,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "Chat" && (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,15,false,(getPosATL player)] spawn player_alertZombies;
};



// numpad 8 0x48 now pgup 0xC9 1
if ((_dikCode == 0xC9 && (!_alt || !_ctrl)) || (_dikCode in actionKeys "User15")) then {
	DZE_Q = true;
};
// numpad 2 0x50 now pgdn 0xD1
if ((_dikCode == 0xD1 && (!_alt || !_ctrl)) || (_dikCode in actionKeys "User16")) then {
	DZE_Z = true;
};


// numpad 8 0x48 now pgup 0xC9 0.1
if ((_dikCode == 0xC9 && (_alt && !_ctrl)) || (_dikCode in actionKeys "User13")) then {
	DZE_Q_alt = true;
};
// numpad 2 0x50 now pgdn 0xD1
if ((_dikCode == 0xD1 && (_alt && !_ctrl)) || (_dikCode in actionKeys "User14")) then {
	DZE_Z_alt = true;
};


// numpad 8 0x48 now pgup 0xC9 0.01
if ((_dikCode == 0xC9 && (!_alt && _ctrl)) || (_dikCode in actionKeys "User7")) then {
	DZE_Q_ctrl = true;
};
// numpad 2 0x50 now pgdn 0xD1
if ((_dikCode == 0xD1 && (!_alt && _ctrl)) || (_dikCode in actionKeys "User8")) then {
	DZE_Z_ctrl = true;
};




// numpad 4 0x4B now Q 0x10
if (_dikCode == 0x10 || (_dikCode in actionKeys "User17")) then {
	DZE_4 = true;
};		
// numpad 6 0x4D now E 0x12
if (_dikCode == 0x12 || (_dikCode in actionKeys "User18")) then {
	DZE_6 = true;
};
// numpad 5 0x4C now space 0x39
if (_dikCode == 0x39 || (_dikCode in actionKeys "User19")) then {
	DZE_5 = true;
};

// F key
if ((_dikCode == 0x21 && (!_alt && !_ctrl)) || (_dikCode in actionKeys "User6")) then {
	DZE_F = true;
};

_handled
