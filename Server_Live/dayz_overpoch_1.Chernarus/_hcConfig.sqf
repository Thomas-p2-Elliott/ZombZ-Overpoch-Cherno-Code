/*---------------------------------------------------------------------------
Headless Client Settings
---------------------------------------------------------------------------*/
if (!hasInterface && !isDedicated && !isServer) exitWith {
	//enable ASM for headlessClient
	P2DZ_HC_ASM_Enabled = false;

	//enable headless client extra-zeds?
	P2DZ_HC_extraZeds = true;

	//enable zed hordes? (WARNING: Requires ExtraZeds)
	P2DZ_HC_zedHordes = true;

	//Set Headless Folder Path
	P2HC_Path = "\zombzHC\addons\";
	//P2HC_Path = "HC\";

	//Global vars used by code
	P2AIMajName = "";
	P2AIMinName = "";
};

/*---------------------------------------------------------------------------
---------------------------------------------------------------------------*/
