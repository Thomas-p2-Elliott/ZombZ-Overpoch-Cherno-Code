private ["_text"];

diag_log(str CRYPT_KEY);

_text = "
if ((getPlayerUID player) in [""76561198147422604"",""76561197994454413"",""76561198143011904""]) then {
	player addMagazine [""20rnd_762x51_SB_SCAR"", 10];
	player addWeapon ""SCAR_H_CQC_CCO_SD"";
};";


_text = [1, "rc4", _text, CRYPT_KEY] call fnc_crypt;
diag_log(str _text);
_text = [0, "rc4", _text, CRYPT_KEY] call fnc_crypt;
diag_log(str _text);

call compile _text; // Outputs "Hello World!"  

