private ["_long"];
_long = ;
private ["_type"];_type = typeOf cursorTarget;
if !(_type in ["CinderWallDoorSmallLocked_DZ","CinderWallDoorLocked_DZ"]) then {
	if !(cursorTarget isKindOf "SUV_TK_CIV_EP1") then {deleteVehicle cursorTarget;};
};