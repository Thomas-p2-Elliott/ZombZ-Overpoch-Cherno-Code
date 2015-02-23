/*
	Get Loot Position
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/

/*---------------------------------------------------------------------------
Rcode To Run:

player addAction ["Select Target", "testServer_lootPos.sqf", ["select"], 99];
player addAction ["Get Pos", "testServer_lootPos.sqf", ["get"], 99];
player addAction ["Tag Pos", "testServer_lootPos.sqf", ["tag"], 99];
player addAction ["Tag zPos", "testServer_lootPos.sqf", ["tagzspawn"], 99];
player addAction ["Tag Pile Pos", "testServer_lootPos.sqf", ["tagpile"], 99];
player addAction ["Raise Z .1", "testServer_lootPos.sqf", ["up"], 99, false,false,"User17"];
player addAction ["Lower Z .1", "testServer_lootPos.sqf", ["down"], 99,false,false,"User18"];
player addAction ["Raise Z .01", "testServer_lootPos.sqf", ["up_small"], 99, false,false,"User19"];
player addAction ["Lower Z .01", "testServer_lootPos.sqf", ["down_small"], 99, false,false,"User20"];
player addAction ["Generate Loot", "testServer_lootPos.sqf", ["generateloot"], 99];

WIP: Get ModelPos from nearby objectss

_objs = ((getPosATL player) nearObjects ["Sign_Sphere25cm_ep1",5]); 
diag_Log( str _objs ); 
 
{
 	diag_log(format["%1",_x getVariable ["modelPos", []]]);

} forEach _objs;

---------------------------------------------------------------------------*/
private ["_target","_type","_ppos","_veh","_worldPos","_zheightChanged","_pos","_tagColor","_new"];

_new = (_this select 3) select 0;

if (isNil "Base_Z_height") then {
	Base_Z_height = 0.5;
};

if (isNil 'DZE_target') then { DZE_target = objNull; };

if(_new == "select") then {
	if(!isnull(cursortarget)) then {
		DZE_target = cursortarget;
		hintsilent str(typeOf DZE_target);
	};
};

if(_new == "generateloot") then {

	if(!isnull(cursortarget)) then {
		DZE_target = cursortarget;
		hintsilent str(typeOf DZE_target); 
	};

	_type = toLower(typeOf DZE_target);

	//diag_log format["Spawning loot for: %1", _type];
	_config = 		missionConfigFile >> "CfgBuildingLoot" >> _type;
	_positions =	 [] + getArray (_config >> "lootPos");
	{
		
		_iPos = DZE_target modelToWorld _x;
		
		_veh = createVehicle ["Sign_sphere25cm_EP1", _iPos, [], 0, "CAN_COLLIDE"];
		_veh setPosATL _iPos;
		_tagColor = "#(argb,8,8,3)color(0,1,0,0.5,ca)";
		_veh setobjecttexture [0,_tagColor];
		_veh setVariable ["modelPos", _x];

	} forEach _positions;

	_positionsSmall =	 [] + getArray (_config >> "lootPosSmall");
	{
		_iPos = DZE_target modelToWorld _x;
		
		_veh = createVehicle ["Sign_sphere25cm_EP1", _iPos, [], 0, "CAN_COLLIDE"];
		_veh setPosATL _iPos;
		_tagColor = "#(argb,8,8,3)color(0,0,1,0.5,ca)";
		_veh setobjecttexture [0,_tagColor];
		_veh setVariable ["modelPos", _x];

	} forEach _positionsSmall;
	
	_positionsZombie =	 [] + getArray (_config >> "lootPosZombie");
	{
		_iPos = DZE_target modelToWorld _x;
		
		_veh = createVehicle ["Sign_sphere25cm_EP1", _iPos, [], 0, "CAN_COLLIDE"];
		_veh setPosATL _iPos;
		_tagColor = "#(argb,8,8,3)color(1,0,0,0.5,ca)";
		_veh setobjecttexture [0,_tagColor];
		_veh setVariable ["modelPos", _x];

	} forEach _positionsZombie;

};

 
if (isnil "DZE_target") then {
	_target = nearestObject [player, "Building"];
} else {
	_target = DZE_target;
};

_type = toLower(typeOf _target);

_zheightChanged = false;

switch (_new) do
{
	case "up":			{Base_Z_height = Base_Z_height + 0.1; _zheightChanged = true;};
	case "down":		{Base_Z_height = Base_Z_height - 0.1; _zheightChanged = true;};
	case "up_small":	{Base_Z_height = Base_Z_height + 0.01; _zheightChanged = true;};
	case "down_small":	{Base_Z_height = Base_Z_height - 0.01; _zheightChanged = true;};
};

_pos = player modeltoworld [0,1.5,Base_Z_height];

if(_new == "tagzspawn") then {
	_pos = player modeltoworld [0,0,0.875];
};

_ppos = _target worldToModel _pos;
_worldPos = _pos;

if (isnil "DZE_vehTarget") then {
	DZE_vehTarget = createVehicle ["Sign_arrow_down_EP1", _worldPos, [], 0, "CAN_COLLIDE"];
	DZE_vehTarget setPosATL _worldPos;
	DZE_vehTarget attachto [player]; 
};

if (!isnull(DZE_vehTarget) and _zheightChanged) then {
	detach DZE_vehTarget;
	DZE_vehTarget setPosATL _worldPos;
	DZE_vehTarget attachto [player];
};

if(_new == "tagzspawn") then {
	_veh = createVehicle ["Sign_sphere25cm_EP1", _worldPos, [], 0, "CAN_COLLIDE"];
	_veh setPosATL _worldPos;
	_tagColor = "#(argb,8,8,3)color(0,1,0,0.5,ca)";
	_veh setobjecttexture [0,_tagColor];
};

if(_new == "tag" or _new == "tagpile") then {
	_veh = createVehicle ["Sign_arrow_down_EP1", _worldPos, [], 0, "CAN_COLLIDE"];
	_veh setPosATL _worldPos;
};

if(_new == "get") then {
	systemChat(format["%1",DZE_target getVariable ["modelPos", []]]);
	diag_log(format["%1",DZE_target getVariable ["modelPos", []]]);
	copyToClipboard(format["%1",DZE_target getVariable ["modelPos", []]]);
};

if(_new == "tagpile") then {
	_tagColor = "#(argb,8,8,3)color(0,0,1,0.5,ca)";
	_veh setobjecttexture [0,_tagColor]; 
};

if(_new == "tag" or _new == "tagzspawn" or _new == "tagpile") then {
	diag_log text format ["%1 : %2 | %3", _type,_ppos,_new];
	copyToClipboard format ["%1 : %2", _type,_ppos];
	hintsilent format ["SAVED %1\n%2", _type,_ppos];
};