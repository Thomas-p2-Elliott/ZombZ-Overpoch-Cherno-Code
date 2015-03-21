/*
	DayZ Safe
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_scrambled2","_scrambled","_distance","_isNearLootBuild","_tent","_location","_isOk","_cancel","_location3","_location4","_location1","_location2","_counter","_pondPos","_isPond","_ppos","_hastentitem","_dir","_building","_isBuilding","_playerPos","_item","_offset_x","_offset_y","_offset_z","_offset_z_attach","_config","_text","_tmpvault","_vault_location","_objectsPond","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_removed","_playerUID","_OwnerUID"];
//check if can pitch here

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_108") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

//disableSerialization;

_playerPos = 	getPosATL player;
_item = _this;
_hastentitem = _this in magazines player;
_offset_x = 0; 
_offset_y = 1.5;
_offset_z = 0;
_offset_z_attach = 0.5;

_location = player modeltoworld [_offset_x,_offset_y,_offset_z];

_playerUID = [player] call FNC_GetPlayerUID;

if (DZE_APlotforLife) then {
	_OwnerUID = _playerUID;
}else{
	_OwnerUID = dayz_characterID;
};

// Allow placement anywhere.

_isOk = true;
 
//diag_log ("Pitch Tent: " + str(_isok) );

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");

if (!_hastentitem) exitWith {cutText [format[(localize "str_player_31"),_text,"pitch"] , "PLAIN DOWN"]};

// blocked
// Allow on concrete since we dont force to ground.
// if (["concrete",dayz_surfaceType] call fnc_inString) then { _isOk = true; diag_log ("surface concrete"); };

_isNearLootBuild = 0;
_isNearLootBuild = count (nearestObjects [player, ["Land_Mil_Barracks_i","Land_A_Hospital","Land_a_stationhouse","Land_A_GeneralStore_01a","Land_A_GeneralStore_01","land_barn_metal","Land_A_BuildingWIP","Land_A_MunicipalOffice","Land_Mil_Barracks_i_EP1","Land_Mil_House_EP1","Land_Barrack2","land_st_vez","land_mil_house","Land_Mil_House_EP1","Land_Mil_hangar_EP1","Land_Mil_ControlTower_EP1","Land_Mil_ControlTower","Land_Farm_Cowshed_a","Land_Farm_Cowshed_b","Land_Farm_Cowshed_c","Land_SS_hangar","Land_A_TVTower_Base","Land_A_Castle_Bergfrit","Land_A_Castle_Gate","Land_Mil_Barracks_L","Land_Barn_W_02","land_repair_center","Land_Mil_Barracks_L_EP1","Land_Mil_Barracks_EP1","Land_Barn_W_01","Land_stodola_old_open","Land_Hangar_2","Land_A_Office01"], 60]);
if (_isNearLootBuild > 0) exitWith { cutText [format["You cannot build within 60m of a loot-spawning building."], "PLAIN DOWN"]; };

//no building of safes unless near a plot
_p2require = false;

_p2require = call {
	private ["_distance", "_canBuildOnPlot", "_playerID", "_findNearestPoles", "_findNearestPole", "_IsNearPlot", "_nearestPole", "_ownerID", "_friendlies", "_fuid", "_friendUID", "_builder"];
	_findNearestPoles = []; _findNearestPole = [];
	_distance = 55; _distance = DZE_PlotPole select 0;
	_canBuildOnPlot = false;
	_playerID = "";  _playerID = getPlayerUID player;
	_IsNearPlot = 0; _nearestPole = objNull; _ownerID = "";
	_friendlies = []; _fuid = []; _friendUID = "";
	_builder = ""; _builder = getPlayerUID player;

	_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
	_findNearestPole = [];
	{
		if (alive _x) then {
			_findNearestPole set [(count _findNearestPole),_x];
		};
	} count _findNearestPoles;
	_IsNearPlot = count (_findNearestPole);

	if(_IsNearPlot == 0) then {
		_canBuildOnPlot = false;
	} else {
		_nearestPole = _findNearestPole select 0;
		_ownerID = _nearestPole getVariable ["ownerPUID","0"];
		if(_playerID == _ownerID) then {
			_canBuildOnPlot = true;
		} else {
			_friendlies = _nearestPole getVariable ["plotfriends",[]];
			_fuid  = [];
			{
			      _friendUID = _x select 0;
			      _fuid  =  _fuid  + [_friendUID];
			} forEach _friendlies;
			_builder  = getPlayerUID player;
			if(_builder in _fuid) then {
			    _canBuildOnPlot = true;
			}; 
		};
	};
	_canBuildOnPlot
};

if (!_p2require) exitWith { cutText [format[(localize "STR_EPOCH_PLAYER_135"),"Plot Pole",55] , "PLAIN DOWN"]; };


//diag_log ("Pitch Tent: " + str(_isok) );
_dir = getDir player;

// Start Preview loop 
_tmpvault = createVehicle ["VaultStorageLocked", _location, [], 0, "CAN_COLLIDE"];
_tmpvault setdir _dir;
_tmpvault attachTo [player,[_offset_x,_offset_y,_offset_z_attach]];

_cancel = false;
_counter = 0;


while {_isOk} do {
	
	if(_counter == 0) then {
		cutText [(localize "str_epoch_player_109"), "PLAIN DOWN"];
		sleep 5; 
		_location1 = getPosATL player;
		sleep 5;
		_location2 = getPosATL player;
	
		if(_location1 distance _location2 < 0.1) exitWith {
			
			cutText [(localize "str_epoch_player_109"), "PLAIN DOWN"];
			_location3 = getPosATL player;
			sleep 5;
			_location4 = getPosATL player;

			if(_location3 distance _location4 > 0.1) exitWith {
				_isOk = false;
				_cancel = true;
			};

			_isOk = false;
		};
	};
	if(_counter >= 1) exitWith {
		_isOk = false;
		_cancel = true;
	};
	_counter = _counter + 1;
};

detach _tmpvault;

_vault_location = (getPosATL _tmpvault);



// Make sure vault is not placed on road. 
if (isOnRoad _vault_location) then { _isOk = true; };
// Make sure vault is not placed in trader citys
if(!canbuild) then { _isOk = true; };

//Block Tents in pounds
_objectsPond = 		nearestObjects [_playerPos, [], 10];
	{
		_isPond = ["pond",str(_x),false] call fnc_inString;
		if (_isPond) then {
			_pondPos = (_x worldToModel _playerPos) select 2;
			if (_pondPos < 0) then {
				_isOk = true;
			};
		};
	} count _objectsPond;

deleteVehicle _tmpvault;

if(!_cancel) then {
	if (!_isOk) then {
		
		//remove safe

		_hastentitem = _this in magazines player;
		if (!_hastentitem) exitWith {cutText [format[(localize "str_player_31"),_text,"pitch"] , "PLAIN DOWN"]};

		_removed = ([player,_item] call BIS_fnc_invRemove);

		if(_removed == 1) then {

			//call dayz_forceSave;

			_dir = round(direction player);	
			[1,1] call dayz_HungerThirst;
			//wait a bit
			player playActionNow "Medic";
			sleep 1;
			[player,"tentunpack",0,false] call dayz_zombieSpeak;
	
			[player,50,true,(getPosATL player)] spawn player_alertZombies;
	
			_building = nearestObject [(vehicle player), "HouseBase"];
			_isBuilding = [(vehicle player),_building] call fnc_isInsideBuilding;

			if(_isBuilding) then {
			
				_ppos = _building worldToModel _vault_location;
				_location = _building modelToWorld _ppos;

			} else {
				_location = player modelToWorld [_offset_x,_offset_y,_offset_z];
			};

			sleep 5;
			//place tent (local)
			_tent = createVehicle ["VaultStorageLocked", _location, [], 0, "CAN_COLLIDE"];
			_tent setdir _dir;
			_tent setpos _location;
			player reveal _tent;
	
			// Generate Combination
			_combination_1 = floor(random 10);
			_combination_2 = floor(random 10);
			_combination_3 = floor(random 10);
			_combination_4 = floor(random 10);

			// Format Combination
			_combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
			_scrambleChar = nil; _scrambleChar = ""; _scrambleUID = nil; _scrambleUID = "";
			_scrambleUID = 	[_OwnerUID,1,true]		call KRON_Scramble;
			_scrambleChar = [_combination,1,false]		call KRON_Scramble;

			//diag_log(format["P2Scramble:VaultPitch: Encrypting: UID Mode: 				%1, 				Output: 	%2",_OwnerUID,	_scrambleUID]);
			//diag_log(format["P2Scramble:VaultPitch: Encrypting: CID Mode:  				%1, 				Output: 	%2",_combination,	_scrambleChar]);

			_tent setVariable ["ownerPUID",_scrambleUID,true];
			_tent setVariable ["CharacterID",_scrambleChar,true];
			_tent setVariable ["OEMPos",_location,true];

			//["PVDZE_obj_Publish",[_combination,_tent,[_dir,_location],"VaultStorageLocked"]] call callRpcProcedure;
			PVDZE_obj_Publish = [_combination,_tent,[_dir,_location, _playerUID],"VaultStorageLocked",(p2pn + (random 10))];
			publicVariableServer  "PVDZE_obj_Publish";
	
			cutText [format[(localize "str_epoch_player_179"),_combination], "PLAIN DOWN", 5];
		};
	
	} else {
		cutText [(localize "str_epoch_player_110"), "PLAIN DOWN"];
	};

} else {
	cutText [(localize "str_epoch_player_111"), "PLAIN DOWN"];
};

DZE_ActionInProgress = false;