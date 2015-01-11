private ["_long"];
_long = ;
if (cariNoweight == 0) then {
	cariNoweight = 1;
	R3F_TIRED_FNCT_Voile_Noir = {};
	R3F_TIRED_FNCT_DoBlackVanish = {};
	systemChat "No weight limit on";
} else {
	cariNoweight = 0;
	R3F_TIRED_FNCT_Voile_Noir = {_level = "not empty";};
	R3F_TIRED_FNCT_DoBlackVanish = {
		cutText ['You are overburdened.', 'PLAIN DOWN'];
	};
	systemChat "No weight limit off";
};