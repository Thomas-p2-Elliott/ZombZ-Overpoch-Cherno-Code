_config = [];
if (DZE_MissionLootTable) then {
	_config = missionConfigFile >> "CfgBuildingLoot";
} else {
	_config = configFile >> "CfgBuildingLoot";
};

for "_i" from 0 to ((count _config) - 1) do {
	private ["_classname","_itemChances","_itemCount","_newPos","_veh"];
	_classname = toLower(configName (_config select _i));
	_itemChances = getArray (_config >> _classname >> "lootType");
	_itemCount = count _itemChances; 
	_position = [([player] call FNC_GetPos),30,600,10,0,0,0] call BIS_fnc_findSafePos;
	_veh = createVehicle [_classname, _position, [], 0, "NONE"];
	diag_log(_classname);
};  

diag_log("Done");  