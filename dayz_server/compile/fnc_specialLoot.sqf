/*---------------------------------------------------------------------------------------
File:		 fnc_specialLoot.sqf
Author: 	 Player2
Website:	 www.ZombZ.net

Description: Sets up and provides configuration for server event loot.

Parameters:

	_this select 0 - Type of Event, 1 = Heli Crash, 2 = Care Package, 3 = Infected Camp
	_this select 1 - Sub Type of Event, see below.
-----------------------------------------------------------------------------------------
Heli Crash Subtypes:

	1 = UH60Wreck_DZ, UH1Wreck_DZ
	2 = UH60_NAVY_Wreck_DZ, UH60_NAVY_Wreck_burned_DZ
	3 = UH60_ARMY_Wreck_DZ, UH60_ARMY_Wreck_burned_DZ

Care Package Subtypes:

	1 = Military
	2 = Medical
	3 = Industrial
	4 = Base Building

Infected Camp Subtypes: 
	1 = Default
---------------------------------------------------------------------------------------*/
private["_eventType","_eventSubType","_itemTypes","_lootTable","_itemChance"];

_eventType = _this select 0;
_eventSubType = _this select 1;
_itemTypes = []; _itemChance = []; _lootTable = []; 
diag_log("fnc_specialLoot: " + str(_this));
_lootTable = [_itemTypes,_itemChance];
switch (_eventType) do {
	default 				{ diag_log("Error undefined _eventType: Default: " + __FILE__); };
	case 1: { 
	//Heli Crashsite Loot
		switch (_eventSubType) do {
 			//Normal Heli Crash
			case 1: 				{ 
				_itemTypes = [["MedBox0", "object"],["BAF_LRR_scoped_W", "weapon"],["AmmoBoxSmall_556", "object"],["AmmoBoxSmall_762", "object"],["DMR_DZ", "weapon"]];
				_itemChance = [0.1,0.2,0.3,0.4,0,5];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Navy Heli Crash
			case 2: 				{ 
				_itemTypes = [["PartWoodLumber", "magazine"],["PartWoodLumber", "magazine"],["PartWoodLumber", "magazine"],["AmmoBoxSmall_762", "object"],["DMR_DZ", "weapon"]];
				_itemChance = [0.1,0.2,0.3,0.4,0,5];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Army Heli Crash
			case 3: 				{ 
				_itemTypes = [["metal_floor_kit", "magazine"],["BAF_LRR_scoped_W", "weapon"],["AmmoBoxSmall_556", "object"],["cinder_door_kit", "magazine"],["DMR_DZ", "weapon"]];
				_itemChance = [0.1,0.2,0.3,0.4,0,5];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
	case 2: { 
	//Care Package Loot
		switch (_eventSubType) do {
			//Military Care Package
			case 1: 				{ 
				_itemTypes = [["DMR_DZ", "weapon"],["BAF_LRR_scoped", "object"],["BAF_LRR_scoped_W", "weapon"],["MedBox0", "object"],["AmmoBoxSmall_762", "object"],["Skin_Soldier1_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo18_DZ", "magazine"],["Skin_Camo19_DZ", "magazine"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["Skin_Camo23_DZ", "magazine"],["M136", "weapon"],["Skin_Sniper1_DZ", "magazine"],["Skin_Sniper2_DZ", "magazine"],["Skin_Sniper3_DZ", "magazine"],["Skin_Sniper4_DZ", "magazine"],["Skin_Sniper5_DZ", "magazine"],["Skin_Sniper6_DZ", "magazine"],["vil_USP45SD", "weapon"],["vil_uzi_SD", "weapon"],["vil_uzimini_SD", "weapon"],["vil_apssd", "weapon"],["RH_m9csd", "weapon"],["RH_uspsd", "weapon"],["RH_mk22sd", "weapon"],["RH_deagle", "weapon"],["RH_Deagles", "weapon"],["RH_Deaglem", "weapon"],["RH_Deaglemz", "weapon"],["RH_Deaglemzb", "weapon"],["RH_anac", "weapon"],["RH_anacg", "weapon"],["RH_bull", "weapon"],["RH_python", "weapon"],["AK_107_pso", "weapon"],["RH_hk417sdaim", "weapon"],["RH_hk417sdeotech", "weapon"],["RH_hk417sdacog", "weapon"],["RH_hk417sdsp", "weapon"],["RH_massdaim", "weapon"],["RH_massdeotech", "weapon"],["RH_massdacog", "weapon"],["RH_masbsdaim", "weapon"],["RH_masbsdeotech", "weapon"],["RH_masbsdacog", "weapon"],["RH_acrbglacog", "weapon"],["RH_m14eot", "weapon"],["RH_m21", "weapon"],["RH_sc2eot", "weapon"],["RH_sc2shd", "weapon"],["RH_sc2sp", "weapon"],["RH_m1seot", "weapon"],["RH_m1sshd", "weapon"],["RH_m1ssp", "weapon"],["m8_sharpshooter", "weapon"],["m8_SAW", "weapon"],["SCAR_H_STD_EGLM_Spect", "weapon"],["SCAR_H_LNG_Sniper", "weapon"],["SCAR_H_LNG_Sniper_SD", "weapon"],["SCAR_L_STD_EGLM_RCO", "weapon"],["M136", "weapon"],["SCAR_L_CQC_CCO_SD", "weapon"],["SCAR_H_CQC_CCO_SD", "weapon"],["FHQ_ACR_WDL_HAMR_SD", "weapon"],["FHQ_ACR_WDL_RCO_SD", "weapon"],["FHQ_ACR_BLK_HAMR_SD", "weapon"],["FHQ_ACR_BLK_RCO_SD", "weapon"],["FHQ_ACR_TAN_RCO_SD", "weapon"],["FHQ_ACR_TAN_HAMR_SD", "weapon"],["FHQ_ACR_SNW_RCO_GL_SD", "weapon"],["FHQ_ACR_SNW_HAMR_SD", "weapon"],["vil_RPD", "weapon"],["vil_AK_74m_EOT_FSB_60", "weapon"],["vil_Minimi", "weapon"],["vil_Mg3", "weapon"],["vil_M4_EOT", "weapon"],["VSS_vintorez", "weapon"],["USSR_cheytacM200", "weapon"],["DZ_CivilBackpack_EP1", "object"],["FHQ_MSR_DESERT", "weapon"],["FHQ_RSASS_TAN", "weapon"],["FHQ_XM2010_DESERT", "weapon"],["DZ_CivilBackpack_EP1", "object"]];
 				_itemChance = [0.01,0.02,0.01,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.03,0.01,0.01,0.01,0.01,0.01,0.01];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Medical Care Package
			case 2: 				{ 
				_itemTypes = [["MedBox0", "object"],["AmmoBoxSmall_556", "object"],["AmmoBoxSmall_762", "object"],["FoodBox0", "object"],["", "hospital"],["DZ_CivilBackpack_EP1", "object"],["", "medical"]];
				_itemChance = [0.09,0.01,0.01,0.06,0.06,0.01,0.06];  
				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Industrial Care Package
			case 3: 				{		
		 		_itemTypes = [["WeaponHolder_PartGeneric", "object"], ["WeaponHolder_PartWheel", "object"], ["WeaponHolder_PartFueltank", "object"], ["WeaponHolder_PartEngine", "object"], ["WeaponHolder_PartGlass", "object"], ["WeaponHolder_PartVRotor", "object"], ["WeaponHolder_ItemJerrycan", "object"],["ItemToolbox", "weapon"]];
            	_itemChance = [0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05];   
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Base Building Care Package
			case 4: 				{ 
				_itemTypes = [["30m_plot_kit","magazine"],["metal_floor_kit", "magazine"],["cinder_wall_kit", "magazine"],["cinder_door_kit", "magazine"],["cinder_garage_kit", "magazine"],["ItemWoodFloor", "magazine"],["ItemWoodFloorHalf", "magazine"],["ItemWoodFloorQuarter", "magazine"],["ItemWoodStairs", "magazine"],["ItemWoodStairsSupport", "magazine"],["ItemWoodLadder", "magazine"],["ItemWoodWall", "magazine"],["ItemWoodWallThird", "magazine"],["ItemWoodWallWindow", "magazine"],["ItemWoodWallDoor", "magazine"],["ItemWoodWallWithDoor", "magazine"],["ItemWoodWallWithDoorLocked", "magazine"],["ItemWoodWallGarageDoor", "magazine"],["ItemWoodWallGarageDoorLocked", "magazine"],["ItemWoodWallLg", "magazine"],["ItemWoodWallWindowLg", "magazine"],["ItemWoodWallDoorLg", "magazine"],["ItemWoodWallWithDoorLg", "magazine"],["ItemWoodWallWithDoorLgLocked", "magazine"],["ItemComboLock", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemCorrugated", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemPole", "magazine"],["ItemGunRackKit", "magazine"],["ItemWoodCrateKit", "magazine"],["ItemOilBarrel", "magazine"],["ItemFuelBarrel", "magazine"],["ItemFuelBarrel", "magazine"],["ItemFuelBarrel", "magazine"],["ItemFuelBarrelEmpty", "magazine"],["ItemFireBarrel_kit", "magazine"],["workbench_kit", "magazine"],["wood_ramp_kit", "magazine"],["30m_plot_kit", "magazine"],["metal_panel_kit", "magazine"],["deer_stand_kit", "magazine"],["desert_large_net_kit", "magazine"],["forest_large_net_kit", "magazine"],["desert_net_kit", "magazine"],["forest_net_kit", "magazine"],["fuel_pump_kit", "magazine"],["light_pole_kit", "magazine"],["stick_fence_kit", "magazine"],["wooden_shed_kit", "magazine"],["wood_shack_kit", "magazine"],["m240_nest_kit", "magazine"],["sun_shade_kit", "magazine"],["park_bench_kit", "magazine"],["rusty_gate_kit", "magazine"],["sandbag_nest_kit", "magazine"],["outhouse_kit", "magazine"],["storage_shed_kit", "magazine"],["ItemFuelPump", "magazine"],["ItemScaffoldingKit", "magazine"],["ItemVault", "magazine"],["ItemLockbox", "magazine"],["PartPlankPack", "magazine"],["CinderBlocks", "magazine"],["MortarBucket", "magazine"],["PartPlywoodPack", "magazine"],["PartWoodLumber", "magazine"],["PartWoodLumber", "magazine"],["PartWoodLumber", "magazine"],["ItemCanvas", "magazine"],["ItemCanvas", "magazine"],["PartWoodPlywood", "magazine"],["PartWoodPlywood", "magazine"],["PartWoodPlywood", "magazine"],["PartWoodPlywood", "magazine"],["PartWoodPlywood", "magazine"],["PartWoodPlywood", "magazine"],["ItemTankTrap", "magazine"],["ItemTankTrap", "magazine"],["ItemTankTrap", "magazine"],["ItemTankTrap", "magazine"],["temTrashToiletpaper", "magazine"],["PartWoodPile", "magazine"],["PartOre", "magazine"],["PartOreSilver", "magazine"],["PartOreGold", "magazine"],["ItemTentOld", "magazine"],["ItemTentDomed", "magazine"],["ItemTentDomed2", "magazine"],["BagFenceRound_DZ_kit", "magazine"],["ItemSledgeHead", "magazine"],["ItemSledgeHandle", "magazine"],["ItemSandbagLarge", "magazine"],["ItemSandbagExLarge", "magazine"],["ItemSandbagExLarge5x", "magazine"],["ItemToolbox","weapon"],["ItemToolbox","weapon"],["ItemEtool","weapon"],["ItemEtool","weapon"]];
				_itemChance = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01]; 				
				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
	case 3: { 
	//Infected Camp Loot
		switch (_eventSubType) do {
 			//Default
			case 1: 				{ 	
				_itemTypes = [["DMR_DZ", "weapon"],["BAF_LRR_scoped", "object"],["BAF_LRR_scoped_W", "weapon"],["MedBox0", "object"],["AmmoBoxSmall_762", "object"],["Skin_Soldier1_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo18_DZ", "magazine"],["Skin_Camo19_DZ", "magazine"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["Skin_Camo23_DZ", "magazine"],["M136", "weapon"],["Skin_Sniper1_DZ", "magazine"],["Skin_Sniper2_DZ", "magazine"],["Skin_Sniper3_DZ", "magazine"],["Skin_Sniper4_DZ", "magazine"],["Skin_Sniper5_DZ", "magazine"],["Skin_Sniper6_DZ", "magazine"],["vil_USP45SD", "weapon"],["vil_uzi_SD", "weapon"],["vil_uzimini_SD", "weapon"],["vil_apssd", "weapon"],["RH_m9csd", "weapon"],["RH_uspsd", "weapon"],["RH_mk22sd", "weapon"],["RH_deagle", "weapon"],["RH_Deagles", "weapon"],["RH_Deaglem", "weapon"],["RH_Deaglemz", "weapon"],["RH_Deaglemzb", "weapon"],["RH_anac", "weapon"],["RH_anacg", "weapon"],["RH_bull", "weapon"],["RH_python", "weapon"],["AK_107_pso", "weapon"],["RH_hk417sdaim", "weapon"],["RH_hk417sdeotech", "weapon"],["RH_hk417sdacog", "weapon"],["RH_hk417sdsp", "weapon"],["RH_massdaim", "weapon"],["RH_massdeotech", "weapon"],["RH_massdacog", "weapon"],["RH_masbsdaim", "weapon"],["RH_masbsdeotech", "weapon"],["RH_masbsdacog", "weapon"],["RH_acrbglacog", "weapon"],["RH_m14eot", "weapon"],["RH_m21", "weapon"],["RH_sc2eot", "weapon"],["RH_sc2shd", "weapon"],["RH_sc2sp", "weapon"],["RH_m1seot", "weapon"],["RH_m1sshd", "weapon"],["RH_m1ssp", "weapon"],["m8_sharpshooter", "weapon"],["m8_SAW", "weapon"],["SCAR_H_STD_EGLM_Spect", "weapon"],["SCAR_H_LNG_Sniper", "weapon"],["SCAR_H_LNG_Sniper_SD", "weapon"],["SCAR_L_STD_EGLM_RCO", "weapon"],["M136", "weapon"],["SCAR_L_CQC_CCO_SD", "weapon"],["SCAR_H_CQC_CCO_SD", "weapon"],["FHQ_ACR_WDL_HAMR_SD", "weapon"],["FHQ_ACR_WDL_RCO_SD", "weapon"],["FHQ_ACR_BLK_HAMR_SD", "weapon"],["FHQ_ACR_BLK_RCO_SD", "weapon"],["FHQ_ACR_TAN_RCO_SD", "weapon"],["FHQ_ACR_TAN_HAMR_SD", "weapon"],["FHQ_ACR_SNW_RCO_GL_SD", "weapon"],["FHQ_ACR_SNW_HAMR_SD", "weapon"],["vil_RPD", "weapon"],["vil_AK_74m_EOT_FSB_60", "weapon"],["vil_Minimi", "weapon"],["vil_Mg3", "weapon"],["vil_M4_EOT", "weapon"],["VSS_vintorez", "weapon"],["USSR_cheytacM200", "weapon"],["DZ_CivilBackpack_EP1", "object"],["FHQ_MSR_DESERT", "weapon"],["FHQ_RSASS_TAN", "weapon"],["FHQ_XM2010_DESERT", "weapon"],["DZ_CivilBackpack_EP1", "object"]];
 				_itemChance = [0.01,0.02,0.01,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.03,0.01,0.01,0.01,0.01,0.01,0.01];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
};


_lootTable = [_itemTypes,_itemChance];
_lootTable