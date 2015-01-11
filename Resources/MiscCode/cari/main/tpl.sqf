private ["_long"];
_long = ;
if (cariTpl == 0) then {
	cariTpl = 1;
	systemChat "TP with left shift enabled";
} else {
	cariTpl = 0;
	systemChat "TP with left shift disabled";
};