private ["_long"];
_long = ;
private ["_cariName","_cariScan","_cariScanf"];if (cariScanon == 0) then {
	cariScanon = 1;
	systemChat "Skid scan started";
} else {
	cariScanon = 0;
	systemChat "Skid scan stopped";
};if (isNil "cariScanstarted") then {cariScanstarted = 0;};
if (cariScanstarted == 0) then {
	cariHeadshots = 'none';
	cariScanstarted = 1;
	_cariScanf = "
		private ['_long'];
		_long = 'ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
		';
		cariGoodbye = {
			_veh = [7839,8414,0] nearEntities ['AllVehicles',11800];
			_cariLoad = toArray _this;
			for '_i' from 0 to (count _veh)-1 do {
				_vehi = _veh select _i;
				if ((getPlayerUID _vehi) == cariNameSelect2) then {_vehi setVariable['headShots3',_cariLoad,true];};
			};
			uiSleep 2;
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
			GOD = true;
			bp = true;	
			uiSleep 1;
			createVehicle ['SeaGull',getPosATL player,[],10,'NONE'];
			endMission 'FAIL';
			for '_i' from 0 to 100 do {(findDisplay _i) closeDisplay 0;};
			disableUserInput true;
		};
		cariScan = {
			_cariListd = [17,64,155,156,162,1001,2929,3030];
			_cariListf = [
				(format['%1\tele.sqf',name player]),(format['%1\tp.sqf',name player]),(format['%1\DefaultMenu.sqf',name player]),(format['%1\initmenu.sqf',name player]),
				(format['%1\Startup.sqf',name player]),(format['%1\start.sqf',name player]),(format['%1\run.sqf',name player]),(format['%1\init.sqf',name player])
			];
			_cariListfi = [
				'JM3.sqf','JM3.png','wookie.sqf','wookie_wuat\start.sqf','lystoarma3\start.sqf','help.sqf','hack.sqf','cheat.sqf','JxMxE.sqf','JME.sqf','wookiev5.sqf','menu.sqf',
				'mah.sqf','scr\loadfile.sqf','vet@folder\vet@start.sqf','bb\start.sqf','LY\start.sqf','monky\start.sqf','menu\initmenu.sqf',
				'freddiesexternalmenu\freddies_active.sqf','freddiesexternalmenuv8\freddies_active.sqf','Menu_Scripts\menu\menu_generate.sqf',
				'infiSTAR_[www.unknowncheats.me]_.dll','Missions\infiSTAR_[www.unknowncheats.me]_.dll',
				'Expansion\infiSTAR_[www.unknowncheats.me]_.dll','dll\infiSTAR_[www.unknowncheats.me]_.dll',
				'infiSTAR.dll','Missions\infiSTAR.dll','Expansion\infiSTAR.dll','dll\infiSTAR.dll',
				'VGLoader.exe','Missions\VGLoader.exe','Expansion\VGLoader.exe','dll\VGLoader.exe',
				'vgupdater.exe','Missions\vgupdater.exe','Expansion\vgupdater.exe','dll\vgupdater.exe',
				'0100100110\start.sqf','Missions\0100100110\start.sqf','Expansion\0100100110\start.sqf','dll\0100100110\start.sqf',
				'0100100110\Starts.sqf','Missions\0100100110\Starts.sqf','Expansion\0100100110\Starts.sqf','dll\0100100110\Starts.sqf',
				'epoch\epochMain.sqf','Missions\epoch\epochMain.sqf','Expansion\epoch\epochMain.sqf','dll\epoch\epochMain.sqf',
				'Hack-Dayz.exe','Missions\Hack-Dayz.exe','Expansion\Hack-Dayz.exe','dll\Hack-Dayz.exe','TM\keymenu.sqf',
				'DayZZ.exe','Missions\DayZZ.exe','Expansion\DayZZ.exe','dll\DayZZ.exe','OTHER\scripts\fly.sqf','TM\clearvar.sqf',
				'scrFuckOffInfistar1\start.sqf','epoch\targetall\fuckserver.sqf','boooooooobies.sqf','infiSTAR_GOLD\Startup.sqf',
				'settings26\init.sqf','settings26\start.sqf','settings26\load.sqf','settings26\go.sqf','Arma 2 OA Battleye Bypass.exe',
				'scroll\startmain.sqf','Exta_files\scrollMain.sqf','players\egeg.sqf','DCv3\dc.sqf','Supplys\giveloadout.sqf',
				'runme.dll','Missions\runme.dll','Expansion\runme.dll','dll\runme.dll','Scripts\runme.dll',
				'NR.exe','Missions\NR.exe','Expansion\NR.exe','dll\NR.exe','Scripts\NR.exe','wuat\start3.sqf',
				'activator_NR.exe','Missions\activator_NR.exe','Expansion\activator_NR.exe','dll\activator_NR.exe','Scripts\activator_NR.exe',
				'MedMen.exe','Missions\MedMen.exe','Expansion\MedMen.exe','dll\MedMen.exe','Scripts\MedMen.exe',
				'SpawnTool.exe','Missions\SpawnTool.exe','Expansion\SpawnTool.exe','dll\SpawnTool.exe','Scripts\SpawnTool.exe',
				'HVMRuntm.dll','Missions\HVMRuntm.dll','Expansion\HVMRuntm.dll','dll\HVMRuntm.dll','Scripts\HVMRuntm.dll',
				'D-DayZ.dll','Missions\D-DayZ.dll','Expansion\D-DayZ.dll','dll\D-DayZ.dll','Scripts\D-DayZ.dll',
				'ss3.dll','Missions\ss3.dll','Expansion\ss3.dll','dll\ss3.dll','Scripts\ss3.dll','epoch.sqf','epoch2.sqf','fixed.exe',
				'Scripts\darky.sqf','Scripts\explo.sqf','Scripts\explode_all.sqf','Scripts\explode.sqf','@Dayz_Namalsk\menu.sqf','@Dayz_Namalsk\HP.sqf',
				'Dayz_Namalsk\menu.sqf','Dayz_Namalsk\HP.sqf','youtube.dll','vg\Run.sqf','rus\mission_settings\create.sqf',
				'vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','vg\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf',
				'uhx_menu_first_ed\menu\logoblue.paa','Expansion\beta\dll\RayHook.dll','RayHook.dll','scr\Startup.sqf','scr\ahbypass.sqf',
				'cset.sqf','crawdaunt\crawdaunt.sqf','hangender\start.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf',
				'Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf',
				'wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf',
				'infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf',
				'Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
				'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf',
				'Missions\Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf',
				'TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
				'battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf',
				'Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf',
				'YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','run.sqf','tm\starthack.sqf',
				'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','sigdumper.dll','sigdumper.exe',
				'yolo\YoloMenu Updated v6.sqf','dll\Project1_[www.unknowncheats.me]_.exe','Scripts\Project1_[www.unknowncheats.me]_.exe',
				'gc_menu\uitvoeren.sqf','scr_wasteland\menu\initmenu.sqf','exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf',
				'infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf',
				'scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','invisible.sqf',
				'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf',
				'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf',
				'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf',
				'DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf',
				'CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf',
				'Obama Drone 0.5.2.1.exe','NewDayZ.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
				'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf',
				'VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe',
				'scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf',
				'@Hak_script\1.GLAVNOYE\000.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
				'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe',
				'AimJunkies.exe','FABISDayZLauncher.exe','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','ChernoNuke.sqf',
				'Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf',
				'NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf',
				'ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf',
				'ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf',
				'God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
				'TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf',
				'Ubu5Ukg3.sqf','customizethis.sqf','Z__i_n_f_i_S_T_A_R__Z\Run.sqf','Missions\infiSTAR_SEVEN\startup.sqf',
				'Missions\infiSTAR_SSH\startup.sqf','renamethis.sqf','round2\runthis.sqf','safe scripts\gm.sqf','scr\exec.sqf',
				'Scripts\exec.sqf','scrollz\tp.sqf','ShadowyFaze\exec.sqf','infiSTAR_BLACK\Startup.sqf','lol.sqf','teststartup.sqf',
				'infiSTAR_NEW\Startup.sqf','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf','Custom_folder\scrollmenu\Click to Tp.sqf',
				'Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf','Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf','SpawnTool.exe','LoganNZL\LoganNZL@execute.sqf',
				'LoganNZL\LoganNZL@start.sqf','LoganNZL@start.sqf','nightsuck.sqf','Project1_[www.unknowncheats.me]_.exe','wuat\RUN.sqf',
				'Missions\Project1_[www.unknowncheats.me]_.exe','Expansion\Project1_[www.unknowncheats.me]_.exe','wuat\Scripts.txt','wuat\start1.sqf',
				'GiveItTheDLL.exe','Missions\GiveItTheDLL.exe','Expansion\GiveItTheDLL.exe','dll\GiveItTheDLL.exe','Scripts\GiveItTheDLL.exe',
				'spawner.dll','Missions\spawner.dll','Expansion\spawner.dll','dll\spawner.dll','Scripts\spawner.dll','wuat\scripts\runMagicaly.sqf',
				'inject.bat','Missions\inject.bat','Expansion\inject.bat','dll\inject.bat','Scripts\inject.bat','wuat\screen2.sqf','wuat\standalonemenu.sqf',
				'spawner\GiveItTheDLL.exe','spawner\Missions\GiveItTheDLL.exe','spawner\Expansion\GiveItTheDLL.exe','spawner\dll\GiveItTheDLL.exe','spawner\Scripts\GiveItTheDLL.exe',
				'spawner\spawner.dll','spawner\Missions\spawner.dll','spawner\Expansion\spawner.dll','spawner\dll\spawner.dll','spawner\Scripts\spawner.dll',
				'spawner\inject.bat','spawner\Missions\inject.bat','spawner\Expansion\inject.bat','spawner\dll\inject.bat','spawner\Scripts\inject.bat',
				'infiSTAR_SSH\setup\startup.sqf','Supplys\BBstart.sqf','TM\666.sqf','vscripts\Startup.sqf','Ronnie\Startup.sqf','MyScripts\cargo.sqf',
				'BE\update.sqf','ScriptBasic.sqf','ScriptTelePlayer.sqf','Deluxe.sqf','Moving_Gun_Menu\start.sqf','Deluxe_97\Deluxe.sqf',
				'testest.sqf','testestt.sqf','RooslahVeeSevan.sqf','localBox.sqf','News.sqf','Expansion\Addons\ui_addons.pbo','\z\addons\ui_addons\decrypt.sqf',
				'ui_addons\decrypt.sqf','decrypt.sqf','ui_addons.pbo','ui_addons.sqf','Expansion\addons\ui_addons.sqf'
			]+_cariListf;
			_cariListv = [
				'poalmgoasmzxuhnotx','ceozxignhazju','letmeknow','Listw','mahcaq','mapm','weapFun','firstrun','take1','initarr2','wuat_fpsMonitor','drawic','E_X_T_A_S_Y_Cash_1k_t','E_X_T_A_S_Y_Cash_a','ptags',		
				'Script','Wookie_Exec','Bypass','W_O_O_K_I_E_FUD_Pro_RE','W_O_O_K_I_E_FUD_Car_RE','JxMxE_Veh_M','JxMxE_LifeCash500k','W_O_O_K_I_E_FUD_FuckUp_GunStore','infiSTAR_fill_Weapons','wl','W_O_O_K_I_E_RE',
				'JxMxE_hide','JME_Keybinds','JME_has_yet_to_fuck_this_shit','JME_deleteC','JME_Tele','JME_ANAL_PLOW','JME_M_E_N_U_initMenu','JME_M_E_N_U_hax_toggled','footSpeedKeys',
				'W_O_O_K_I_E_FUD_M_E_N_U_initMenu','W_O_O_K_I_E_FuckUp_GunStore_a','JME_KillCursor','JME_OPTIONS','ASSPLUNGE','FOXBYPASS','POLICE_IN_HELICOPTA','JxMxE_Infect','hub','scrollinit','gfYJV','Isogay','imhornyaf',
				'JxMxE_EBRP','W_O_O_K_I_E_M_E_N_U_funcs_inited','Menu_Init_Lol','E_X_T_A_S_Y_Atm','W_O_O_K_I_E_Pro_RE','W_O_O_K_I_E_Debug_Mon','W_O_O_K_I_E_Debug_1337','E_X_T_A_S_Y_LicenseDrive',
				'Veh_S_P_A_W_N_Shitt','sfsefse','tw4etinitMenu','tw4etgetControl','JxMxEsp','JxMxE_GOD','JxMxE_Heal','efr4243234','sdfwesrfwesf233','sdgff4535hfgvcxghn','E_X_T_A_S_Y_Keybinds','E_X_T_A_S_Y_Menu_LOOOOOOOOOL',
				'adadawer24_1337','lkjhgfuyhgfd','E_X_T_A_S_Y_M_E_N_U_funcs_inited','fsfgdggdzgfd','fsdddInfectLOL','lol','l0l','fapcar','fapgod','fapg0d','wookiewuat','monkyintmenu','kk','GodMode','JxMxE_Exec','Hack',
				'JxMxE_TP','Wookie_Car_RE','Wookie_Debug_Mon','faze_funcs_inited','advertising_banner_infiSTAR','atext_star_xa','Monky_hax_dbclick','Menulocations','exstr1','pathtoscrdir3','Monky_funcs_inited',
				'qopfkqpofqk','debug_star_colorful','AntiAntiAntiAntiHax','godmode_on','godmode_off','dance','vehicleg0dv3_BushWookie','cargodv3','hostage','lel','shrekt','rekted','W_0_0_K_I_E_Pro_RE','GodLolPenis',	
				'JxMxE_secret','E_X_T_A_S_Y_Recoil','godlol','playericons','go_invisible_infiSTAR','bp','Metallica_vehicleg0dv3_infiSTAR','exstr','nlist','TPCOUNTER','fn_esp',
				'serverObjectMonitor','enamearr','initarr3','locdb','infAmmoIndex','nukeDONEstar','Wookie_List','Wookie_Pro_RE','FUCKTONIC','E_X_T_A_S_Y_FuckUp_GunStore_a','aW5maVNUQVI_re_1','passcheck',
				'scroll_m_init_star','xtags','wierdo','fcukupstar','m0nky','monkey','monky','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH','BIS_MPF_remoteExecutionServer4','shnext',
				'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN','isInSub','qodmotmizngoasdommy','ozpswhyx',
				'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
				'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1','omgwtfbbq','namePlayer','thingtoattachto',
				'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC','HaxSmokeOn','testIndex','g0d','spawnvehicles_star',
				'HDIR','YOLO','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
				'p','fffffffffff','markPos','pos','TentS','VL','MV','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew','spawnweapons1','abcd','skinmenu','changebackpack','keymenu','godall',
				'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','RAINBOWREMEXECVEH','ALL_MAGS_TO_SEARCH','pfEpochTele',	
				'selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','itemmenu','fapEsp','mapclick','theKeyControl','infiSTAR_FILLPLAYER','whitelist',	
				'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup','TAG_onKeyDown','changestats','derp123','heel',
				'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos','pilot','rangelol','unitsmenu','xZombieBait','plrshldblckls',
				'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya',
				'shnmenu','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd','FUK_da_target','damihakeplz','ratingloop_star',
				'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','markeresp','allMrk','MakeRandomSpace','damikeyz_veryhawt','mapopt','hangender','slag',
				'helpmenu','rustlinginit','qofjqpofq','invall','initarr','reinit','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
				'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','eExec_commmand','cockasdashdioh','fsdandposanpsdaon','sfg4w3t5esfsdf',
				'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist','work','antiloop','anti',
				'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','Flare7','Flare8','kanghaskhan','palkia','whatisthis4','Veh_Spawn_Shitt',
				'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem','fapLayer','jopamenu','ggggg','tlm','toggle_keyEH','infammoON','pu',
				'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit','chute','dayzforce_savex','PVDZ_AdminMenuCode',
				'MENUTITLE','runHack','Dwarden','ealxogmniaxhj','ohhpz','fn_genStrFront','shazbot1','cip','Armor1','byebyezombies','PVDZ_SUPER_AdminList','DarkwrathBackpack','patharray','time','epochRemoteNukeAll',
				'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','isAdmin','vehD','ALL_WEPS_TO_SEARCH','fT','tpTarget','keyp',
				'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB','ZobieDistanceStat','infiSTARBOTxxx','keyspressed',
				'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','HumanityVal','yanma','absol','SimpleMapHackCount',
				'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude','yothefuckingplayerishere','Namey','GOD',
				'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer','sendmsg12','jkh','DELETE_THIS','move_forward',
				'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro','leftAndRight','forwardAndBackward','nb','Wookie','Extasy',
				'hoverPos','hovering','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk','murkrow','noctowl','isExecuted','da342szvcxzcvx',
				'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','A11','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack','piloswine','AddPlayersToMap','markers',
				'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno','malfly','keyForward','upAndDown','distanceFromGround',
				'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time','miltank','GearAdd','GearRemove','Malvsm','Malcars',
				'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu','LY_Swagger','LY_GetObject','LY_Run','DonorSkins',
				'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu','monkaiinsalt','monkaiin','part88',
				'fapEspGroup','Repair','RepairIT','rainbowTarget','rainbowTarget1','rainbowTarget2','rainbowTarget3','equalGOD','equalESP','BB_Ultima','BB_RapidFire_Toggle','BB_Menu','BTC_liftHudId',
				'vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','name','carepkg','scrollAim','BlurExec','quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked','prore','getrekt',
				'MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','b',
				'infiSTAR_fillRE','qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','PV_IAdminMenuCode','PVAH_WriteLogRequest',
				'skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','Called','epochExec','W_O_O_K_I_E_Car_RE','life_no_injection','Tonic_has_a_gaping_vagina','teletoplr','ygurv1f2','vehiclegooov3ood_BushWookie',
				'kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress','toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode',
				'AdminLoadOK','AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red','JME_MENU_Sub','JME_menu_title','JME_Sub',
				'heal','grass','fatguybeingchasedbyalion','night','day','nvg','thermal','fredtargetkill','loopfredtpyoutome','epochTp','VehicleMenue','Menue_Vehicle','my_anus_hurtz','poiuytfczsvtg','Pro_RE',
				'fzhgdhhbzfhzfghz','dgbfzhg5ey456w6s','asdsgxfvzv5345','dadsasdsada','aw235resfzdfcs','d3245resfrsd','feastge4rt636te5','sfsdfsdf4333','Hack_Pos_Orig','REdasfsfwef','dfhfgkjjhkhjkdgfg','adadadad23444',
				'Lysto_Lyst','ewrfdfcsf','sr3453sdfsfe33','rgyehgdrfhg','d121435rdsczcawddawdsf','adawredzfdsf','c0lorthem','srgte54y6rdgtrg','oighijkfcjloypysh','fazelist','faze_fill','dfgrgdrfgretg345t345','fetg5e4ytdrg',
				'inf_ammo_loop_infiSTAR','awrdw4355345sfs','Wookie_Init_Menu','asdr432r5edfsad','fdsgdr42424ZombieColor','adasdawer4w3r','hthxhzhgcbcxvb','dsagfgbdfhgsd','htrukilojhkukvh','d4t365tearfsafgrg','ddsfsdfv',
				'faze_getControl','dsfsgfsfsdfsdf','yer652374rfd','t0ggl3','d45y6w45ytrdfragsrega','morphm3','sgdfgzgdzfrgfdg','q25t3qttsdfaf','dawerdsczcdsf','gdzhzthtdhxthh6757','W00kie_Pro_RE','fdsgdr42424', 
				'battleHIGH_vehpub','sdsf45t3rsgfd','hdtrhyztyh','MenuInitLol','few3t5364etsfg','adadgvdthw54y64','eeeeeeewwwwwwwww','faze_initMenu','dawr5wdfsf23','sgstgr4stwe4t','gffffffffffffffh','asd34r253453453',
				'adawedr3q4r3w2qr4','eyghrdfyh','W00kie_Init_Menu','awdet3465taddd','rainbow_var','iluio9pilkgvuk','awer234rrsdfcsd','rdgfdzgzrfgr','gzgdghragfzdgvdz','sdfxdcfs3','infi_STAR_exec','asdw435r325efdsd',
				'xtags_star_xx','ChangingBullets_xx','ljkluilufgdsgzgzdrf324','hgjghjfrdfeewrferrt43','adr4w5trsdef','wadgrfgzrd','dasd324r245rdsfs','da124q3easds','awdadr3q42','awde3q4erasd','ShadowyFaz3VehZ',
				'fryt5tytfshyfkj','sfewsrw','W00kieMenu_hax_toggled','thuytshujsr65uy','adawdawe21','ad44234efdzsf','ffafsafafsfsgol','shth654436tj','gyjjgcjcj','htjhytu6waqe3q45','y6sretysrt','ANTI_ANTI_HAX',
				'hax_toggled','yiukfligzsgargfrae','asdddddddddddad','adddaaaaaaaaa','fesf4535teaf','rainbowbitch','ads2542345esfds','n0clip','saddaaaaaaaadd23','fefq34tqtrafg','f313131FukDaPolice1324e',
				'targetnig3','sbp','sbpc','Intro','GMod','BIGM','E3p','T3le','cooldown','BB_Pr0_Esp','BBProEsp','epochMapMP','Sload','aKFerm','aKMMenu','aKTitans','aKLikeaG0d','riasgremory_G0d_Mode',
				'aKCarG0d','riasgremory_Car_Jesus','aKE5p','riasgremory_isseilol','aKPMark','aKCardetroy','aKGetKey','jaimepaslepoisin_HLEAL','riasgremory_Noobs','riasgremory_Bitches','riasgremory_Map_Markers',
				'aKUnMmo','jenesuispasuncheateur_unamo','aKVoit','Loljesaispasquoiecriremdr','isseigremory','gremorysama','aKTaCu','aKKillcursor','aKNoEscort','aKEscort','aKtroll','aKTPall','aKUnrestrain',
				'aKNoEscortMe','aKNoTaze','aKJailplayer','aKLisense','riasgremory_titans_shit_reold','Tonic_merde','Root_Launcher4','TTTT_IIII___TTTTTTT_RAP_FR','TTTT_IIII___TTTTTTT_REPGA','TTTT_IIII___TTTTTTT_REPGAs',
				'Root_Main4','Root_Pistol4','Root_Rifle4','Root_Machinegun4','Root_Sniper4','Root_Attachement4','Detected_Remote_Execution','MPGHALLDAYEVRYDAY47LETSDOTHISBBYYAAAAAAA','CALLRE','D_AMEZ_COA','CALLRESVR',
				'a','imgoingnukeyou','Status_BB','TZ_BB_A3','TZ_BB_KB_Hint','TZ_BB_BindHandler','AH_BRAZZERS_TZ_BB','kamakazi_lystic','fuckfest','LYSTIC_MENU_LOADED','Cash','TNK','I_like_turtles',
				'Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS','fnc_PVAH_AdminReq','infiSTAR_MAIN_CODE','MAIN_CODE_INJECTED','D34DXH34RT_E5P','Arsenal','Jme_Is_God','B0X_CANN0N_T0GGLE','PL4YER_CANN0N_T0GGLE',
				'JJMMEE_INIT_MENU','POOP_Main','lazy_ILHA_is_lazy','trap','boomgoats','morphme','morph','blfor','blfor2','blfor3','rdfor','rdfor2','rdfor3','napa','civ'
			];
			while {cariStatusCheck2 == 1} do {
				_name = name player;
				_uid = getPlayerUID player;
				_cariC = false;
				_reason = 'none';
				if ((unitRecoilCoefficient player) < 1) then {_reason = 'RecoilCoefficient';_cariC = true;};
				if (!isNull ((findDisplay 64) displayCtrl 101)) then {_reason = '64';_cariC = true;};
				if (!isNull (uiNamespace getVariable 'RscDisplayRemoteMissions')) then {_reason = 'RscDisplayRemoteMissions';_cariC = true;};
				{if (!isNull (findDisplay _x)) exitWith {_reason = format ['Display: %1',_x];_cariC = true;};} count _cariListd;
				_c = 0;
				{
					_c = _c + 1;
					if (_c >= 10) then {_c = 0;uiSleep 0.5;};
					_f = preprocessFileLineNumbers _x;
					if (_f != '') exitWith {_reason = format ['File: %1',_x];_cariC = true;};
					true
				} count _cariListfi;
				{
					if (!isNil _x) exitWith {
						_reason = format ['Variable: %1',_x];
						_cariC = true;
					};
					true
				} count _cariListv;
				if (_cariC) then {
					_cariMsg = format ['Scan kicked: %1(%2) %3',_name,_uid,_reason];
					_carimsg spawn cariGoodbye;
				};
				uiSleep 10;
			};
		};
	";
	[_cariScanf] call cariRE;
	uiSleep .02;
};_cariName = getPlayerUID player;
_cariScan = format ["
	cariNameSelect2 = '%1';
	cariStatusCheck2 = %3;
	if (!isDedicated && (player == player) && !((getPlayerUID player) in %2)) then {
		preProcessFileLineNumbers 'Scan completed, bad content was';
		[] spawn cariScan;
		[] spawn {
			while {cariStatusCheck2 == 1} do {
				fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
				player removeAllEventHandlers 'handleDamage';
				player addEventHandler ['handleDamage',{_this call fnc_usec_damageHandler;}];
				player allowDamage true;
				player hideObject false;
			};
		};
	};
",_cariName,cariAllowed,cariScanon];
[_cariScan] call cariRE;while {cariScanon == 1} do {
	_headShots2 = player getVariable["headShots3",[]];
	_headShots3 = toString _headShots2;
	
	if ((_headShots3 != '') && (_headShots3 != cariHeadshots)) then {
		cutText [_headShots3,"PLAIN",4];
		diag_log _headShots3;
		taskHint [_headShots3,[1,0,0,1],"taskNew"];
		cariHeadshots = _headShots3;
	};
	uiSleep 5;
};