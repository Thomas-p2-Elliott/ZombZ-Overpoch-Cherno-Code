private ["_long"];
_long = ;
private ["_classname","_location","_item","_iItem","_itemOut","_uniqueid"];_classname = "Foodbox1";
_location = (position player);
_item = _classname createVehicleLocal _location;
clearWeaponCargo _item;
clearMagazineCargo _item;
_item setVariable ["permaLoot",true];
_uniqueid = str(round(random 999999));
_item setVariable ["CharacterID",_uniqueid,true];
_item setVariable ["ObjectID",_uniqueid,true];
_item setVariable ["ObjectUID",_uniqueid,true];
systemChat "Please wait for box to fill. It may take up to 60 seconds";
systemChat "Warning: taking bad items may ban";_itemOut=0;_item addMagazineCargo["30Rnd_556x45_StanagSD",5];
_itemOut=0;_item addMagazineCargo["15Rnd_9x19_M9SD",5];
_iItem = "M4A1_AIM_SD_camo";
_item addWeaponCargo [_iItem,1];
_iItem = "DMR";
_item addWeaponCargo [_iItem,1];
_item addWeaponCargo [_iItem,1];
_iItem = "M9SD";
_item addWeaponCargo [_iItem,1];
_iItem = "SVD_CAMO";
_item addWeaponCargo [_iItem,1];
_iItem = "M40A3";
_item addWeaponCargo [_iItem,1];
_iItem = "ItemGPS";
_item addWeaponCargo [_iItem,1];
_iItem = "ItemMap";
_item addWeaponCargo [_iItem,1];
_iItem = "NVGoggles";
_item addWeaponCargo [_iItem,1];
_iItem = "ItemCompass";
_item addWeaponCargo [_iItem,1];
uiSleep 1;
_iItem = "Binocular_Vector";
_item addWeaponCargo [_iItem,1];
_itemOut=0;_item addMagazineCargo["5Rnd_762x51_M24",5];
uiSleep 1;
_itemOut=0;_item addMagazineCargo["20Rnd_762x51_DMR",10];
_itemOut=0;_item addMagazineCargo["10Rnd_762x54_SVD",5];
uiSleep 1;if (cariDayz) then {
	_itemOut=0;_item addMagazineCargo["ItemTent",2];
	_itemOut=0;_item addMagazineCargo["Skin_Sniper1_DZ",2];
	_itemOut=0;_item addMagazineCargo["ItemJerrycan",2];
	_itemOut=0;_item addMagazineCargo["PartVRotor",1];
	_itemOut=0;_item addMagazineCargo["100Rnd_762x51_M240",3];
	_iItem = "Mk_48_DZ";
	_item addWeaponCargo [_iItem,1];
	_iItem = "ItemMatchbox";
	_item addWeaponCargo [_iItem,1];
	_iItem = "ItemEtool";
	_item addWeaponCargo [_iItem,1];
	_iItem = "ItemToolbox";
	_item addWeaponCargo [_iItem,1];
	_item addBackpackCargo["DZ_Backpack_EP1",1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["PartEngine",1];
	_itemOut=0;_item addMagazineCargo["PartGeneric",1];
	_itemOut=0;_item addMagazineCargo["PartGlass",3];
	_itemOut=0;_item addMagazineCargo["PartFueltank",1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["PartWheel",6];
	_itemOut=0;_item addMagazineCargo["ItemBloodbag",5];
	_itemOut=0;_item addMagazineCargo["ItemAntibiotic",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemMorphine",3];
	_itemOut=0;_item addMagazineCargo["ItemEpinephrine",2];
	_itemOut=0;_item addMagazineCargo["ItemPainkiller",3];
	_itemOut=0;_item addMagazineCargo["ItemBandage",4];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWaterbottle",4];
	_itemOut=0;_item addMagazineCargo["FoodSteakCooked",4];
	_itemOut=0;_item addMagazineCargo["FoodCanBakedBeans",4];
	_itemOut=0;_item addMagazineCargo["ItemSodaCoke",4];
	uiSleep 1;
};if (cariEpoch) then {
	_itemOut=0;_item addMagazineCargo["30Rnd_556x45_StanagSD",3];
	_itemOut=0;_item addMagazineCargo["30Rnd_9x19_UZI_SD",5];
	_iItem = "M4SPR";
	_item addWeaponCargo [_iItem,1];
	_iItem = "BAF_LRR_scoped_W";
	_item addWeaponCargo [_iItem,1];
	_iItem = "BAF_LRR_scoped";
	_item addWeaponCargo [_iItem,1];
	_iItem = "UZI_SD_EP1";
	_item addWeaponCargo [_iItem,1];
	_iItem = "KSVK_DZE";
	_item addWeaponCargo [_iItem,1];
	_iItem = "G36_C_SD_camo";
	_item addWeaponCargo [_iItem,1];
	_iItem = "m240_scoped_EP1_DZE";
	_item addWeaponCargo [_iItem,1];
	_iItem = "SCAR_H_LNG_Sniper";
	_item addWeaponCargo [_iItem,1];
	_iItem = "SCAR_H_STD_EGLM_Spect";
	_item addWeaponCargo [_iItem,1];
	_iItem = "ChainSaw";
	_item addWeaponCargo [_iItem,1];
	_iItem = "ItemSledge";
	_item addWeaponCargo [_iItem,1];
	_iItem = "MeleeCrowbar";
	_item addWeaponCargo [_iItem,1];
	_item addBackpackCargo["DZ_LargeGunBag_EP1",1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["100Rnd_556x45_BetaCMag",5];
	_itemOut=0;_item addMagazineCargo["5Rnd_127x108_KSVK",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["5Rnd_86x70_L115A1",8];
	_itemOut=0;_item addMagazineCargo["100Rnd_762x51_M240",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["20Rnd_762x51_B_SCAR",5];
	_itemOut=0;_item addMagazineCargo["1Rnd_HE_M203",3];
	_itemOut=0;_item addMagazineCargo["ItemMixOil",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemBriefcase100oz",20];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemJerrycan",2];
	_itemOut=0;_item addMagazineCargo["Skin_GUE_Commander_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_GUE_Soldier_2_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_GUE_Soldier_Sniper_DZ",1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["light_pole_kit",5];
	_itemOut=0;_item addMagazineCargo["sandbag_nest_kit",3];
	_itemOut=0;_item addMagazineCargo["workbench_kit",3];
	_itemOut=0;_item addMagazineCargo["wood_shack_kit",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["wooden_shed_kit",3];
	_itemOut=0;_item addMagazineCargo["ItemGenerator",3];
	_itemOut=0;_item addMagazineCargo["ItemSandbagLarge",10];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemCorrugated",10];
	_itemOut=0;_item addMagazineCargo["ItemVault",10];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemTentDomed2",2];
	_itemOut=0;_item addMagazineCargo["ItemHotwireKit",5];
	_itemOut=0;_item addMagazineCargo["metal_panel_kit",10];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["cinder_wall_kit",20];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["metal_floor_kit",20];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["CinderBlocks",20];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["MortarBucket",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWoodFloor",12];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWoodWallLg",12];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["cinder_door_kit",3];
	_itemOut=0;_item addMagazineCargo["cinder_garage_kit",3];
	_itemOut=0;_item addMagazineCargo["ItemComboLock",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWoodStairs",5];
	_itemOut=0;_item addMagazineCargo["ItemWoodStairsSupport",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["desert_net_kit",2];
	_itemOut=0;_item addMagazineCargo["forest_large_net_kit",2];
	_itemOut=0;_item addMagazineCargo["forest_net_kit",2];
	_itemOut=0;_item addMagazineCargo["ItemFuelBarrel",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemLockbox",5];
	_itemOut=0;_item addMagazineCargo["ItemOilBarrel",3];
	_itemOut=0;_item addMagazineCargo["ItemLightBulb",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemSandbag",20];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["deer_stand_kit",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodLadder",5];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallGarageDoor",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallDoorLg",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWoodWallDoor",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallGarageDoorLocked",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallWindow",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallWindowLg",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemWoodWallWithDoorLgLocked",3];
	_itemOut=0;_item addMagazineCargo["ItemWoodWallWithDoorLocked",3];
	_itemOut=0;_item addMagazineCargo["outhouse_kit",3];
	_itemOut=0;_item addMagazineCargo["rusty_gate_kit",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["stick_fence_kit",3];
	_itemOut=0;_item addMagazineCargo["storage_shed_kit",3];
	_itemOut=0;_item addMagazineCargo["sun_shade_kit",3];
	_itemOut=0;_item addMagazineCargo["wood_ramp_kit",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["bulk_empty",5];
	_itemOut=0;_item addMagazineCargo["desert_large_net_kit",2];
	_itemOut=0;_item addMagazineCargo["m240_nest_kit",3];
	_itemOut=0;_item addMagazineCargo["30m_plot_kit",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemPole",12];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["ItemTankTrap",12];
	uiSleep 1;
};if (cariOverwatch) then {
	_itemOut=0;_item addMagazineCargo["30Rnd_556x45_Stanag",5];
	_itemOut=0;_item addMagazineCargo["30Rnd_556x45_StanagSD",2];
	_iItem = "RH_m1stacog";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_WDL_HAMR_SD";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_SR25";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_SVU";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_HK416_Eot";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_RSASS_TAN";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_RSASS_SD_TAN";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_XM2010_DESERT";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_BLK_RCO_SD";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_BLK_CCO_SD";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_WDL_HWS_GL";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_TAN_RCO";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_ACR_TAN_HWS_SD";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_M40A3";
	_item addWeaponCargo [_iItem,1];
	_iItem = "RH_m9csd";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_M110";
	_item addWeaponCargo [_iItem,1];
	_iItem = "RH_m14aim";
	_item addWeaponCargo [_iItem,1];
	_iItem = "VIL_SVD_P21";
	_item addWeaponCargo [_iItem,1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["20Rnd_762x51_B_SCAR",5];
	_itemOut=0;_item addMagazineCargo["7Rnd_45ACP_1911",3];
	_itemOut=0;_item addMagazineCargo["FHQ_rem_5Rnd_300Win_XM2010_TS",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["FHQ_rem_30Rnd_680x43_ACR_T_SD",5];
	_itemOut=0;_item addMagazineCargo["15Rnd_9x19_M9SD",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["FHQ_rem_30Rnd_680x43_ACR",5];
	_itemOut=0;_item addMagazineCargo["20Rnd_762x51_DMR",3];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["FHQ_rem_20Rnd_762x51_PMAG_T_SD",5];
	_itemOut=0;_item addMagazineCargo["FHQ_rem_20Rnd_762x51_PMAG_T",5];
	_itemOut=0;_item addMagazineCargo["FHQ_rem_10Rnd_338Lapua_MSR_TS",5];
	_iItem = "RH_m1911sd";
	_item addWeaponCargo [_iItem,1];
	_iItem = "FHQ_MSR_DESERT";
	_item addWeaponCargo [_iItem,1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["Skin_Sniper3_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Sniper4_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Sniper5_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Sniper6_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Camo1_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Camo2_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Camo3_DZ",1];
	_itemOut=0;_item addMagazineCargo["Skin_Camo4_DZ",1];
	uiSleep 1;
};if (cariBanned) then {
	_itemOut=0;_item addMagazineCargo["10Rnd_127x99_M107",20];
	_iItem = "BAF_AS50_TWS";
	_item addWeaponCargo [_iItem,1];
	_iItem = "BAF_AS50_scoped";
	_item addWeaponCargo [_iItem,1];
	_iItem = "m107_TWS_EP1_DZ";
	_item addWeaponCargo [_iItem,1];
	_iItem = "m107_DZ";
	_item addWeaponCargo [_iItem,1];
	_iItem = "M110_NVG_EP1";
	_item addWeaponCargo [_iItem,1];
	_iItem = "AA12_PMC";
	_item addWeaponCargo [_iItem,1];
	_iItem = "BAF_L85A2_RIS_CWS";
	_item addWeaponCargo [_iItem,1];
	_iItem = "SCAR_H_STD_TWS_SD";
	_item addWeaponCargo [_iItem,1];
	_iItem = "M32_EP1";
	_item addWeaponCargo [_iItem,1];
	_iItem = "SMAW";
	_item addWeaponCargo [_iItem,1];
	_iItem = "BAF_NLAW_Launcher";
	_item addWeaponCargo [_iItem,1];
	_iItem = "RPG7V";
	_item addWeaponCargo [_iItem,1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["5Rnd_127x99_as50",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["10Rnd_127x99_M107",5];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["NLAW",2];
	_itemOut=0;_item addMagazineCargo["6Rnd_HE_M203",2];
	_itemOut=0;_item addMagazineCargo["SMAW_HEDP",2];
	_itemOut=0;_item addMagazineCargo["20Rnd_B_AA12_HE",2];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["20Rnd_762x51_SB_SCAR",5];
	_itemOut=0;_item addMagazineCargo["PG7V",2];
	uiSleep 1;
};if (cariNamalsk) then {
	_itemOut=0;_item addMagazineCargo["Skin_CamoWinter_DZN",1];
	_itemOut=0;_item addMagazineCargo["Skin_CamoWinterW_DZN",1];
	_itemOut=0;_item addMagazineCargo["Skin_Sniper1W_DZN",1];
	_iItem = "nsw_er7a";
	_item addWeaponCargo [_iItem,1];
	_iItem = "nsw_er7s";
	_item addWeaponCargo [_iItem,1];
	uiSleep 1;
	_itemOut=0;_item addMagazineCargo["nsw_er7mm",5];
	uiSleep 1;
};