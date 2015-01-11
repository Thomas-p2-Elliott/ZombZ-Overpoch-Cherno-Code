private ["_long"];
_long = ;
if (cariZclear == 0) then {
	systemChat "Z clear enabled";
	cariZclear = 1;
} else {
	systemChat "Z clear disabled";
	cariZclear = 0;
};while {cariZclear == 1} do {
	{deleteVehicle _x;} count (vehicle player nearEntities ["zZombie_Base",180]);
	uiSleep 1;
};