private ["_long"];
_long = ;
private ["_text"];if (isNil "cariRcfc") then {
	cutText ["Function name incorrect or not defined on client","PLAIN"];
} else {
	_text = format ["%1",cariRcfc];
	cutText [_text,"PLAIN",4];
	"cari\log" callExtension (_text + "~0000");
	diag_log _text;
	profileNamespace setVariable["cariLogClient",_text];saveProfileNamespace;
	systemChat "Output to console, vars.profile file and client RPT. Check cari\config.sqf for paths";
};