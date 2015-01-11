private ["_long"];
_long = ;
if (cariEnviron == 0) then {
	cariEnviron = 1;
	enableEnvironment false;
	systemChat "Environmental sounds disabled";
} else {
	cariEnviron = 0;
	enableEnvironment true;
	systemChat "Environmental sounds enabled";
};