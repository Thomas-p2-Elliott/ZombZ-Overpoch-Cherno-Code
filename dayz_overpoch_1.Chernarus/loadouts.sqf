// Player2's Custom Loadout / Random Loadout Generator for Dayz Overwatch
// Created for www.ZombZ.net
if (p2SpT) then { _time = diag_tickTime;  diag_log format ['oldloadouts.sqf started, Time: %1',_time];  }; 

//		Standard Starter Loadouts
//Loadout 1
_loadout1_weapons = ["Winchester1866","DDOPP_X26_b"];
_loadout1_tools	= ["ItemMap","ItemCompass"];
_loadout1_items = ["15Rnd_W1866_Slug","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout1_backpack = "CZ_VestPouch_EP1";
_loadout1_backpack_weapons = [];
_loadout1_backpack_items = [];

//Loadout 2
_loadout2_weapons = ["MR43","RH_anac"];
_loadout2_tools	= ["ItemMap","ItemCompass"];
_loadout2_items = ["TrashJackDaniels","2Rnd_shotgun_74Pellets","RH_6Rnd_44_Mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout2_backpack = "CZ_VestPouch_EP1";
_loadout2_backpack_weapons = [];
_loadout2_backpack_items = [];

//Loadout 3
_loadout3_weapons = ["gms_k98","DDOPP_X26_b"];
_loadout3_tools	= ["ItemMap","ItemCompass"];
_loadout3_items = ["gms_k98_mag","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout3_backpack = "CZ_VestPouch_EP1";
_loadout3_backpack_weapons = [];
_loadout3_backpack_items = [];

//Loadout 4
_loadout4_weapons = ["Crossbow_DZ","DDOPP_X26_b"];
_loadout4_tools	= ["ItemMap","ItemCompass"];
_loadout4_items = ["TrashJackDaniels","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout4_backpack = "CZ_VestPouch_EP1";
_loadout4_backpack_weapons = [];
_loadout4_backpack_items = [];

//Loadout 5
_loadout5_weapons = ["vil_USP45SD"];
_loadout5_tools	= ["ItemMap","ItemCompass"];
_loadout5_items = ["vil_usp45sd_mag","vil_usp45sd_mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout5_backpack = "CZ_VestPouch_EP1";
_loadout5_backpack_weapons = [];
_loadout5_backpack_items = [];

//Loadout 6
_loadout6_weapons = ["RH_anac"];
_loadout6_tools	= ["ItemMap","ItemCompass"];
_loadout6_items = ["RH_6Rnd_44_Mag","RH_6Rnd_44_Mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout6_backpack = "CZ_VestPouch_EP1";
_loadout6_backpack_weapons = [];
_loadout6_backpack_items = [];


//OLD LOADOUT SYSTEM TO ADD PLAYER BACK TO IT USE THIS FORMAT PART 1 
_custom1_weapons = ["RH_hk417sdacog","vil_USP45SD"];
_custom1_tools= ["ItemMap","ItemCompass","ItemToolbox","Binocular_Vector","ItemHatchet","ItemKnife","ItemMatchbox","ItemGPS","ItemEtool","ItemWatch","ItemFlashlight","ItemFlashlightRed","NVGoggles"];
_custom1_items = ["ItemBandage","ItemBandage","ItemPainkiller","ItemPainkiller","ItemMorphine",
"RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417",
"vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","ItemBloodbag","ItemBloodbag","Skin_Sniper6_DZ","FoodMRE","FoodMRE","FoodMRE"];
_custom1_backpack = "DZ_CivilBackpack_EP1";
_custom1_backpack_weapons = ["ItemToolbox","FHQ_XM2010_SD_DESERT"];
_custom1_backpack_items = ["ItemSodaRabbit","FoodMRE","PartGeneric",
"ItemBandage","ItemEpinephrine","ItemAntibiotic","Skin_Sniper5_DZ","PartEngine",
"FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD"];
_custom1_players = [""];

//OLD LOADOUT SYSTEM PART 1 END


//remove default overwatch items
{player removeMagazine _x} forEach magazines player;
player removeWeapon "DDOPP_X26";
removeBackpack player;
dayz_myBackpack = "";
dayz_myBackpackMags = [];
dayz_myBackpackWpns = [];

//OLD LOADOUTS PART 2 - to put a player back in add uid here
_custom_loadout_players =[""];

if ((getPlayerUID player) in _custom_loadout_players) then {

//OLD LOADOUT PART 3 - TEMPLATE BELOW MUST MATCH _CUSTOM NUMBER AS THE ONE ABOVE
    
if ((getPlayerUID player) in _custom1_players) exitWith {
		{player addMagazine _x} forEach _custom1_items;
		{player addWeapon _x} forEach _custom1_weapons;
		{player addWeapon _x} forEach _custom1_tools;
		player addBackpack _custom1_backpack;
		(unitBackpack player) setVariable["actionSet", true];
		dayz_myBackpack =	unitBackpack player;
		{(unitBackpack player) addWeaponCargoGlobal [_x, 1]} forEach _custom1_backpack_weapons;
		{(unitBackpack player) addMagazineCargoGlobal [_x, 1]} forEach _custom1_backpack_items;
		dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
		dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
	};


} else {
	randomvar = round (random 6);
	//diag_log("randomvar = " + str(randomvar));
	
	switch (randomvar) do
	{
		case 0:
		{
			{player addMagazine _x} forEach _loadout1_items;
			{player addWeapon _x} forEach _loadout1_weapons;
			{player addWeapon _x} forEach _loadout1_tools;
			player addBackpack _loadout1_backpack;
			(unitBackpack player) setVariable["actionSet", true];
			dayz_myBackpack =	unitBackpack player;
			(unitBackpack player) addMagazineCargoGlobal _loadout1_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout1_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
		case 1:
		{
			{player addMagazine _x} forEach _loadout2_items;
			{player addWeapon _x} forEach _loadout2_weapons;
			{player addWeapon _x} forEach _loadout2_tools;
			player addBackpack _loadout2_backpack;
			(unitBackpack player) addMagazineCargoGlobal _loadout2_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout2_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
		case 2:
		{
			{player addMagazine _x} forEach _loadout3_items;
			{player addWeapon _x} forEach _loadout3_weapons;
			{player addWeapon _x} forEach _loadout3_tools;
			player addBackpack _loadout3_backpack;
			(unitBackpack player) setVariable["actionSet", true];
			dayz_myBackpack =	unitBackpack player;
			(unitBackpack player) addMagazineCargoGlobal _loadout3_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout3_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
		case 3:
		{
			{player addMagazine _x} forEach _loadout4_items;
			{player addWeapon _x} forEach _loadout4_weapons;
			{player addWeapon _x} forEach _loadout4_tools;
			player addBackpack _loadout4_backpack;
			(unitBackpack player) setVariable["actionSet", true];
			dayz_myBackpack =	unitBackpack player;
			(unitBackpack player) addMagazineCargoGlobal _loadout4_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout4_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
		case 4:
		{
			{player addMagazine _x} forEach _loadout5_items;
			{player addWeapon _x} forEach _loadout5_weapons;
			{player addWeapon _x} forEach _loadout5_tools;
			player addBackpack _loadout5_backpack;
			(unitBackpack player) setVariable["actionSet", true];
			dayz_myBackpack =	unitBackpack player;
			(unitBackpack player) addMagazineCargoGlobal _loadout5_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout5_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
		case 5:
		{
			{player addMagazine _x} forEach _loadout6_items;
			{player addWeapon _x} forEach _loadout6_weapons;
			{player addWeapon _x} forEach _loadout6_tools;
			player addBackpack _loadout6_backpack;
			(unitBackpack player) setVariable["actionSet", true];
			dayz_myBackpack =	unitBackpack player;
			(unitBackpack player) addMagazineCargoGlobal _loadout6_backpack_items;
			(unitBackpack player) addWeaponCargoGlobal _loadout6_backpack_weapons;
			dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
			dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		};
	};
};

if (p2SpT) then { _time = diag_tickTime;  diag_log format ['oldloadouts.sqf finished, Time: %1',_time];  }; 