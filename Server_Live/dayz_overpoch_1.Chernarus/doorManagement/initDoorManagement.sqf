disableSerialization;
private ["_display", "_canOpen", "_friends", "_ownerPUID", "_ownerUID"];

diag_log(format['%1: %2: %3','P2DEBUG','initDoorManagement, input',format["_this: %1, dayz_selectedDoor: %2",_this, dayz_selectedDoor]]);

if(count(_this) > 0) then {
	TheDoor = _this select 3;
}else{
	TheDoor = dayz_selectedDoor;
};

_display = findDisplay 41144;
_display closeDisplay 3000;
_canOpen = false;
_friends = TheDoor getVariable ["doorfriends",[]];
_ownerPUID = (TheDoor getVariable ["ownerPUID","-2"]);

diag_log(format['%1: %2: %3','P2DEBUG','initDoorManagement, doorFriends: ',_friends]);

{
	if ((_x  select 0) == (getPlayerUID player)) then{ _canOpen = true; }; 
} forEach _friends;

diag_log(format['%1: %2: %3','P2DEBUG','initDoorManagement, ownerPUID: ',_ownerPUID]);

if (_ownerPUID == (getPlayerUID player)) then{ _canOpen = true; }; 

//if(isNil "P2DZ_DoorAdminList")then{ P2DZ_DoorAdminList = ["-2"]; };
//if ((getPlayerUID player) in P2DZ_DoorAdminList) then{ _canOpen = true; }; 

if(_canOpen)then{
	createDialog "DoorManagement";
	call DoorNearbyHumans;
	call DoorGetFriends;
}else{
	cutText ["You do not have the rights to manage.","PLAIN DOWN"];
};