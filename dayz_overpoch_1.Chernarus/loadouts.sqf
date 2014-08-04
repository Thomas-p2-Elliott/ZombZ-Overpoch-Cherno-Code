// Player2"s Custom Loadout / Random Loadout Generator for Dayz OverPoch
// Created for www.ZombZ.net
private ["_time","_loadout1_weapons","_loadout1_tools","_loadout1_items","_loadout1_backpack","_loadout1_backpack_weapons","_loadout1_backpack_items","_loadout2_weapons","_loadout2_tools","_loadout2_items","_loadout2_backpack","_loadout2_backpack_weapons","_loadout2_backpack_items","_loadout3_weapons","_loadout3_tools","_loadout3_items","_loadout3_backpack","_loadout3_backpack_weapons","_loadout3_backpack_items","_loadout4_weapons","_loadout4_tools","_loadout4_items","_loadout4_backpack","_loadout4_backpack_weapons","_loadout4_backpack_items","_loadout5_weapons","_loadout5_tools","_loadout5_items","_loadout5_backpack","_loadout5_backpack_weapons","_loadout5_backpack_items","_loadout6_weapons","_loadout6_tools","_loadout6_items","_loadout6_backpack","_loadout6_backpack_weapons","_loadout6_backpack_items","_custom1_weapons","_custom1_tools","_custom1_items","_custom1_backpack","_custom1_backpack_weapons","_custom1_backpack_items","_custom1_players","_custom_loadout_players"];

if (p2SpT) then { _time = diag_tickTime;  diag_log format ["oldloadouts.sqf started, Time: %1",_time];  }; 

//		Standard Starter Loadouts
//Loadout 1
_loadout1_weapons = ["Winchester1866","DDOPP_X26_b"];
_loadout1_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout1_items = ["15Rnd_W1866_Slug","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout1_backpack = "CZ_VestPouch_EP1";
_loadout1_backpack_weapons = [""];
_loadout1_backpack_items = ["ItemAntibiotic"];

//Loadout 2n
_loadout2_weapons = ["MR43","RH_anac"];
_loadout2_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout2_items = ["TrashJackDaniels","2Rnd_shotgun_74Pellets","RH_6Rnd_44_Mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout2_backpack = "CZ_VestPouch_EP1";
_loadout2_backpack_weapons = [""];
_loadout2_backpack_items = ["ItemAntibiotic"];

//Loadout 3
_loadout3_weapons = ["gms_k98","DDOPP_X26_b"];
_loadout3_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout3_items = ["gms_k98_mag","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout3_backpack = "CZ_VestPouch_EP1";
_loadout3_backpack_weapons = [""];
_loadout3_backpack_items = ["ItemAntibiotic"];

//Loadout 4
_loadout4_weapons = ["Crossbow_DZ","DDOPP_X26_b"];
_loadout4_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout4_items = ["TrashJackDaniels","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","WoodenArrow","DDOPP_1Rnd_X26","DDOPP_1Rnd_X26","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout4_backpack = "CZ_VestPouch_EP1";
_loadout4_backpack_weapons = [""];
_loadout4_backpack_items = ["ItemAntibiotic"];

//Loadout 5
_loadout5_weapons = ["vil_USP45SD"];
_loadout5_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout5_items = ["vil_usp45sd_mag","vil_usp45sd_mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout5_backpack = "CZ_VestPouch_EP1";
_loadout5_backpack_weapons = [""];
_loadout5_backpack_items = ["ItemAntibiotic"];

//Loadout 6
_loadout6_weapons = ["RH_anac"];
_loadout6_tools	= ["ItemMap","ItemCompass","ItemToolbox","Binocular"];
_loadout6_items = ["RH_6Rnd_44_Mag","RH_6Rnd_44_Mag","ItemPainkiller","ItemMorphine","ItemBandage","ItemBandage","ItemSodaRabbit"];
_loadout6_backpack = "CZ_VestPouch_EP1";
_loadout6_backpack_weapons = [""];
_loadout6_backpack_items = ["ItemAntibiotic"];


//OLD LOADOUT SYSTEM TO ADD PLAYER BACK TO IT USE THIS FORMAT PART 1 
_custom1_weapons = ["RH_hk417sdacog","vil_USP45SD"];
_custom1_tools= ["ItemMap","ItemCompass","ItemToolbox","Binocular","ItemToolbox","Binocular_Vector","ItemHatchet","ItemKnife","ItemMatchbox","ItemGPS","ItemEtool","ItemWatch","ItemFlashlight","ItemFlashlightRed","NVGoggles"];
_custom1_items = ["ItemBandage","ItemBandage","ItemPainkiller","ItemPainkiller","ItemMorphine","RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417","RH_20Rnd_762x51_SD_hk417","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","vil_usp45sd_mag","ItemBloodbag","ItemBloodbag","Skin_Sniper6_DZ","FoodMRE","FoodMRE","FoodMRE"];
_custom1_backpack = "DZ_CivilBackpack_EP1";
_custom1_backpack_weapons = ["ItemToolbox","FHQ_XM2010_SD_DESERT"];
_custom1_backpack_items = ["ItemSodaRabbit","FoodMRE","PartGeneric","ItemBandage","ItemEpinephrine","ItemAntibiotic","Skin_Sniper5_DZ","PartEngine","FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD","FHQ_rem_5Rnd_300Win_XM2010_NT_SD"];
_custom1_players = ["76561197994454413"];

//OLD LOADOUT SYSTEM PART 1 END

//OLD LOADOUTS PART 2 - to put a player back in add uid here
_custom_loadout_players =["76561197994454413"];

DefaultMagazines = [];
DefaultWeapons = [];
DefaultBackpack = "";
DefaultBackpackWeapons = [];

if (isServer || !isDedicated || hasInterface) then {
	DefaultMagazines = _loadout5_items;
	DefaultWeapons = _loadout5_weapons + _loadout5_tools;
	DefaultBackpack =  _loadout5_backpack;
	DefaultBackpackWeapons = _loadout5_backpack_weapons + _loadout5_backpack_items;	
	randomvar = 5;
} else {

	if ((toUpper(getPlayerUID player)) in _custom_loadout_players) exitWith {
		//OLD LOADOUT PART 3 - TEMPLATE BELOW MUST MATCH _CUSTOM NUMBER AS THE ONE ABOVE
		if ((toUpper(getPlayerUID player)) in _custom1_players) exitWith {
			DefaultMagazines = _custom1_items;
			DefaultWeapons = _custom1_weapons + _custom1_tools;
			DefaultBackpack =  _custom1_backpack;
			DefaultBackpackWeapons = _custom1_backpack_weapons + _custom1_backpack_items;
		};
	};


	DefaultMagazines = _loadout5_items;
	DefaultWeapons = _loadout5_weapons + _loadout5_tools;
	DefaultBackpack =  _loadout5_backpack;
	DefaultBackpackWeapons = _loadout5_backpack_weapons + _loadout5_backpack_items;

	randomvar = round (random 6);
	//diag_log("randomvar = " + (randomvar));

	switch (randomvar) do
	{
		case 0:
		{
			DefaultMagazines = _loadout1_items;
			DefaultWeapons = _loadout1_weapons + _loadout1_tools;
			DefaultBackpack =  _loadout1_backpack;
			DefaultBackpackWeapons = _loadout1_backpack_weapons + _loadout1_backpack_items;
		};
		case 1:
		{
			DefaultMagazines = _loadout2_items;
			DefaultWeapons = _loadout2_weapons + _loadout2_tools;
			DefaultBackpack =  _loadout2_backpack;
			DefaultBackpackWeapons = _loadout2_backpack_weapons + _loadout2_backpack_items;	
		};
		case 2:
		{
			DefaultMagazines = _loadout3_items;
			DefaultWeapons = _loadout3_weapons + _loadout3_tools;
			DefaultBackpack =  _loadout3_backpack;
			DefaultBackpackWeapons = _loadout3_backpack_weapons + _loadout3_backpack_items;
		};
		case 3:
		{
			DefaultMagazines = _loadout4_items;
			DefaultWeapons = _loadout4_weapons + _loadout4_tools;
			DefaultBackpack =  _loadout4_backpack;
			DefaultBackpackWeapons = _loadout4_backpack_weapons + _loadout4_backpack_items;
		};
		case 4:
		{
			DefaultMagazines = _loadout5_items;
			DefaultWeapons = _loadout5_weapons + _loadout5_tools;
			DefaultBackpack =  _loadout5_backpack;
			DefaultBackpackWeapons = _loadout5_backpack_weapons + _loadout5_backpack_items;
		};
		case 5:
		{
			DefaultMagazines = _loadout6_items;
			DefaultWeapons = _loadout6_weapons + _loadout6_tools;
			DefaultBackpack =  _loadout6_backpack;
			DefaultBackpackWeapons = _loadout6_backpack_weapons + _loadout6_backpack_items;
		};
	};
};

if (P2DZE_loadoutsDebug) then {
	diag_log format ["P2DEBUG: P2DZE_loadoutsDebug = true; File: %1",__FILE__];
	diag_log format ["P2DEBUG: randomvar %1",randomvar];
	diag_log format ["P2DEBUG: DefaultMagazines %1",DefaultMagazines];
	diag_log format ["P2DEBUG: DefaultWeapons %1",DefaultWeapons];
	diag_log format ["P2DEBUG: DefaultBackpack %1",DefaultBackpack];
	diag_log format ["P2DEBUG: DefaultBackpackWeapons %1",DefaultBackpackWeapons];
	diag_log format ["P2DEBUG: isDedicated %1 isServer %2 hasInterface %3 CustomLoadout: %4 ",isServer,isDedicated,hasInterface,((toUpper(getPlayerUID player)) in _custom_loadout_players)];
};

if (p2SpT) then { _time = diag_tickTime;  diag_log format ["oldloadouts.sqf finished, Time: %1",_time];  }; 