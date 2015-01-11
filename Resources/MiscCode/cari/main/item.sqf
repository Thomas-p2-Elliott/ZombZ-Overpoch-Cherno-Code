private ["_long"];
_long = ;
private ["_mag","_object","_qty"];_mag = _this select 0;_object = createVehicle ["WeaponHolder",position player,[],0,"CAN_COLLIDE"];
_object setVariable ["permaLoot",true];
_qty=1;_object addMagazineCargoGlobal [_mag,1];systemChat format ["%1 created at your feet",_mag];
systemChat "Warning: Picking up bad items may result in AH ban!";