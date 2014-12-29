private ["_v","_expl"];

_v=_this select 0;

if (local _v) then {_expl=createVehicle ["HelicopterExploBig", (getPos _v), [], 0, "CAN_COLLIDE"];};