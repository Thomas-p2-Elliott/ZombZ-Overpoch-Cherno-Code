disableSerialization;
private["_dialog"];

Z_traderData = (_this select 3); // gets the trader data ( menu_Functionary1 )

Z_Selling = true;
Z_SellingFrom = 2;

if( isNil "Z_traderData" || count (Z_traderData) == 0)	exitWith {
	cutText [format["Something went wrong, Sorry!"], "PLAIN DOWN"];
	systemChat("[Trader] Something went wrong, sorry!");
};

if(isNil "Z_AdvancedTradingInit")	exitWith {
	cutText [format["Something went wrong, Sorry!"], "PLAIN DOWN"];
	systemChat("[Trader] Something went wrong, sorry!");
};

if(!isNil "Z_AdvancedTradingInit") then {
	createDialog "AdvancedTrading";
	_dialog = findDisplay 711197;
	(_dialog displayCtrl 7432) ctrlSetText " < ";
	(_dialog displayCtrl 7433) ctrlSetText " << ";
	(_dialog displayCtrl 7442) ctrlSetText " < ";
	(_dialog displayCtrl 7443) ctrlSetText " << ";
	{ctrlShow [_x,false];} forEach [7441,7436,7404,7422,7421,7436,7440,7442,7443,7404];
	call Z_getGearItems;
};