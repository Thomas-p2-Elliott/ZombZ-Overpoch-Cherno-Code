/*Important: For this to work you MUST include: OBJECT call P2LOS_OpenDoors_CheckObject per object on its creation*/

//REQUIRED FUNCTIONS/PREDEFINED VARS
waitUntil{!isNil "KRON_strInStr"};
waitUntil{!isNil "KRON_Replace"};

P2LOS_OpenDoors_DoorObjectsList = [];
P2LOS_OpenDoors_DoorObjectsBasicList  = [];

/*---------------------------------------------------------------------------
Open Door Function: Inputs: Object Itself, Door Action ID Array
Checks if door actually needs opening before opening
...just incase animate command is badly coded and sends local object
animate info over network even with enableSimulation false applied
---------------------------------------------------------------------------*/
P2LOS_OpenDoors_OpenListedDoors = {
	private ["_objActionList", "_obj", "_objName", "_objActionCfg", "_animStatement","_animCondition"];
	_obj = _this select 0;
	_objActionList = _this select 1;
	_objName = (typeOf _obj);
	_objActionCfg = (configFile >> "CfgVehicles" >> _objName >> "UserActions");
	{
		_animCondition = _obj call compile ([getText ((_objActionCfg select _x) >> "Condition"),"this","_this"] call KRON_Replace);
		if (_animCondition) then { 
			_obj call compile ([getText ((_objActionCfg select _x) >> "Statement"),"this","_this"] call KRON_Replace);
		};
	} forEach (_objActionList);
};

/*---------------------------------------------------------------------------
Adds non-existing items to loop-list, does nothing if item already exists
---------------------------------------------------------------------------*/
P2LOS_OpenDoors_AddToLoop = {
	private["_exists"];
	_exists = false;
	{
	 	if ((_x select 0) == (_this select 0)) then {
	 		_exists = true;
	 	};
	} count P2LOS_OpenDoors_DoorObjectsList;

	if (!_exists) then {
		P2LOS_OpenDoors_DoorObjectsList set [count (P2LOS_OpenDoors_DoorObjectsList),_this];
		P2LOS_OpenDoors_DoorObjectsBasicList set [count (P2LOS_OpenDoors_DoorObjectsBasicList),_this select 0];
	};
};


 /*---------------------------------------------------------------------------
 Check object, takes object as input and checks if it has any 'open' user actions,
 if it does, play them, then add them to the loop-list to be replayed over and over

 Add this to all objects created with createVehicleLocal
 ---------------------------------------------------------------------------*/ 
 
P2LOS_OpenDoors_CheckObject = {
	private ["_obj", "_objName", "_objOpenDoorActionList", "_objActionCfg", "_objAction", "_actionsFound"];
	_obj = _this;
	_objName = typeOf _this;
	_objOpenDoorActionList = [];
	_actionsFound = false;
	if (isNil '_obj') exitWith {};
	if (typeName _obj != "OBJECT") exitWith { };
	if (isNull _obj) exitWith {};
	if (simulationEnabled _obj) exitWith { };
	if (!local _obj) exitWith {  };

	if (isClass (configFile >> "CfgVehicles" >> _objName >> "UserActions")) then {
		_objActionCfg = (configFile >> "CfgVehicles" >> _objName >> "UserActions");
		for "_i" from 0 to ((count _objActionCfg)-1) do {
			_objAction = _objActionCfg select _i;

			if (!isNil '_objAction' && {isClass _objAction}) then {

				if ((["p2" + str(_objActionCfg select _i) + "p2", "open"] call KRON_strInStr) || (["p2" + str(_objActionCfg select _i)  + "p2", "Open"] call KRON_strInStr)) then {
					_objOpenDoorActionList = _objOpenDoorActionList + [_i];
					_actionsFound = true;
				};
			};
		};
		if (_actionsFound) then {
			[_obj,_objOpenDoorActionList] call P2LOS_OpenDoors_AddToLoop;
			[_obj,_objOpenDoorActionList] call P2LOS_OpenDoors_OpenListedDoors;
		};
	};
};

/*---------------------------------------------------------------------------
Loops through loop-list array, calls opens door func for all objects in list
---------------------------------------------------------------------------*/
P2LOS_OpenDoors_Loop = {
	while {true} do {
		{
		  	if (_x in P2LOS_OpenDoors_DoorObjectsBasicList) then {
		  		_nearObj = _x;
				{
					if (_nearObj == _x select 0) then {
						[_nearObj,_x select 1] call P2LOS_OpenDoors_OpenListedDoors;
					};
				} forEach P2LOS_OpenDoors_DoorObjectsList;
		  	};
		} forEach ((position player) nearObjects 50);
		sleep 0.1;
	};
	[] spawn P2LOS_OpenDoors_Loop;
};

/*---------------------------------------------------------------------------
Starts the loop
---------------------------------------------------------------------------*/
[] spawn P2LOS_OpenDoors_Loop;