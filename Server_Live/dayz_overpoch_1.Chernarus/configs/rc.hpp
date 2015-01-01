class ExtraRc {
	class Quiver {
		class takeArrowsOut {
			text = "Remove Arrows";
			script = "player removeMagazine ""Quiver""; for ""_i"" from 0 to 4 do { player addMagazine ""WoodenArrow""; };"; 
		};
	};
    class ItemToolbox {
        class Use {
            text = "Build Bike";
            script = "closeDialog 0; execVM ""actions\deploys\bike\deploy.sqf""";
        };
        class Use2 {
            text = "Build GyroCopter";
            script = "closeDialog 0; execVM ""actions\deploys\gyro\deploy.sqf""";
        };
    };
    class Binocular_Vector  {
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	class Binocular {
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	/*DJ Multi Skin Change */
	class Skin_INS_Worker2_DZ { class ZombZSkins { text = "Scientist2"; script = "[""Skin_gsc_scientist2"", ""Skin_INS_Worker2_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Bardak_DZ { class ZombZSkins { text = "Scientist1"; script = "[""Skin_gsc_scientist1"", ""Skin_INS_Bardak_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Soldier_CO_DZ { class ZombZSkins { text = "Trooper"; script = "[""Skin_gsc_military_head_grey_AT"", ""Skin_INS_Soldier_CO_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Soldier_AR_DZ { class ZombZSkins { text = "TrooperHelmet"; script = "[""Skin_gsc_military_helmet_wdl"", ""Skin_INS_Soldier_AR_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Lopotev_DZ { class ZombZSkins { text = "SAS1"; script = "[""Skin_SFSG_des_tl"", ""Skin_INS_Lopotev_DZ""] call player_wearClothes"; }; };
	class Skin_RU_Soldier_Crew_DZ { class ZombZSkins { text = "DesertRanger"; script = "[""Skin_Desert_SOF_AC"", ""Skin_RU_Soldier_Crew_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Commander_EP1_DZ { class ZombZSkins { text = "DesertForce"; script = "[""Skin_Desert_SOF_AT"", ""Skin_TK_Commander_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Soldier_Sniper_EP1_DZ { class ZombZSkins { text = "Leeroy"; script = "[""Skin_frb_mark"", ""Skin_TK_Soldier_Sniper_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Special_Forces_MG_EP1_DZ { class ZombZSkins { text = "SpecForce1"; script = "[""Skin_frb_tl_mask"", ""Skin_TK_Special_Forces_MG_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier_TL_PMC_DZ { class ZombZSkins { text = "SAS2"; script = "[""Skin_SFSG_mtp_tl"", ""Skin_Soldier_TL_PMC_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier_Sniper_PMC_DZ { class ZombZSkins { text = "SAS3"; script = "[""Skin_SFSG_wdl_tl"", ""Skin_Soldier_Sniper_PMC_DZ""] call player_wearClothes"; }; };
	class Skin_Graves_Light_DZ { class ZombZSkins { text = "SpecOps"; script = "[""Skin_Mercenary_Default20b "", ""Skin_Graves_Light_DZ""] call player_wearClothes"; }; };
	class Skin_CZ_Soldier_Sniper_EP1_DZ { class ZombZSkins { text = "Hacker1"; script = "[""Skin_SBH_Alpha_Soldier1"", ""Skin_CZ_Soldier_Sniper_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_FR_Rodriguez_DZ { class ZombZSkins { text = "Hacker2"; script = "[""Skin_SBH_Alpha_Soldier2"", ""Skin_FR_Rodriguez_DZ""] call player_wearClothes"; }; };
	class Skin_FR_OHara_DZ { class ZombZSkins { text = "WoodSoldier"; script = "[""Skin_MVD_Soldier_AT"", ""Skin_FR_OHara_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier_Bodyguard_AA12_PMC_DZ { class ZombZSkins { text = "Gimp"; script = "[""Skin_Navy_SEAL_diver"", ""Skin_Soldier_Bodyguard_AA12_PMC_DZ""] call player_wearClothes"; }; };
	class Skin_Drake_Light_DZ { class ZombZSkins { text = "Seal"; script = "[""Skin_Navy_SEAL_TL"", ""Skin_Drake_Light_DZ""] call player_wearClothes"; }; };
	class Skin_CZ_Special_Forces_GL_DES_EP1_DZ { class ZombZSkins { text = "TheRussian"; script = "[""Skin_RU_Soldier2"", ""Skin_CZ_Special_Forces_GL_DES_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_INS_Soldier_EP1_DZ { class ZombZSkins { text = "Pilot"; script = "[""Skin_USMC_Soldier_Pilot"", ""Skin_TK_INS_Soldier_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_INS_Warlord_EP1_DZ { class ZombZSkins { text = "Jak"; script = "[""Skin_SBH_Alpha_Soldier5"", ""Skin_TK_INS_Warlord_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_2_DZ { class ZombZSkins { text = "StalkerNeutral"; script = "[""Skin_gsc_eco_stalker_head_neutral"", ""Skin_GUE_Soldier_2_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_CO_DZ { class ZombZSkins { text = "StalkerUrban"; script = "[""Skin_gsc_eco_stalker_mask_camo"", ""Skin_GUE_Soldier_CO_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_Crew_DZ { class ZombZSkins { text = "StalkerElite"; script = "[""Skin_gsc_eco_stalker_mask_duty"", ""Skin_GUE_Soldier_Crew_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_Sniper_DZ { class ZombZSkins { text = "Stalker Camo"; script = "[""Skin_gsc_eco_stalker_mask_fred"", ""Skin_GUE_Soldier_Sniper_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_MG_DZ { class ZombZSkins { text = "StalkerWood"; script = "[""Skin_gsc_eco_stalker_mask_neutral"", ""Skin_GUE_Soldier_MG_DZ""] call player_wearClothes"; }; };
	class Skin_Bandit2_DZ { class ZombZSkins { text = "UrbanSoldier"; script = "[""Skin_US_Delta_Force_Marksman_EP1"", ""Skin_Bandit2_DZ""] call player_wearClothes"; }; };
	class Skin_Bandit1_DZ { class ZombZSkins { text = "Alpha3"; script = "[""Skin_arma1_us_soldier_sabass"", ""Skin_Bandit1_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker4_DZ { class ZombZSkins { text = "Matt"; script = "[""Skin_SFSG_wdl_mrk"", ""Skin_Rocker4_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker3_DZ { class ZombZSkins { text = "Loner"; script = "[""Skin_gsc_eco_stalker_head_fred"", ""Skin_Rocker3_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker2_DZ { class ZombZSkins { text = "Scientist3"; script = "[""Skin_gsc_scientist1_head"", ""Skin_Rocker2_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker1_DZ { class ZombZSkins { text = "Scientist4"; script = "[""Skin_gsc_scientist2_head"", ""Skin_Rocker1_DZ""] call player_wearClothes"; }; };
	class Skin_Priest_DZ { class ZombZSkins { text = "Frank"; script = "[""Skin_Desert_SOF_DA1a"", ""Skin_Priest_DZ""] call player_wearClothes"; }; };
	class Skin_Functionary1_EP1_DZ { class ZombZSkins { text = "Maca"; script = "[""Skin_FR_Commander"", ""Skin_Functionary1_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Commander_DZ { class ZombZSkins { text = "Samuel"; script = "[""Skin_Soldier_Bodyguard_M4_PMC"", ""Skin_GUE_Commander_DZ""] call player_wearClothes"; }; };
	class Skin_Ins_Soldier_GL_DZ { class ZombZSkins { text = "Alpha1"; script = "[""Skin_UKSF_des_mrk"", ""Skin_Ins_Soldier_GL_DZ""] call player_wearClothes"; }; };
	class Skin_Pilot_EP1_DZ { class ZombZSkins { text = "Alpha2"; script = "[""Skin_UKSF_des_mrk_l"", ""Skin_Pilot_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_Haris_Press_EP1_DZ { class ZombZSkins { text = "Bravo1"; script = "[""Skin_UKSF_wdl_mrk_l"", ""Skin_Haris_Press_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_RU_Policeman_DZ { class ZombZSkins { text = "Commando"; script = "[""Skin_UKSF_des_demo_l"", ""Skin_RU_Policeman_DZ""] call player_wearClothes"; }; };
	class Skin_Rocket_DZ { class ZombZSkins { text = "Punisher"; script = "[""Skin_UN_CDF_Soldier_Officer_EP1"", ""Skin_Rocket_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier1_DZ { class ZombZSkins { text = "Jonse"; script = "[""Skin_UN_CDF_Soldier_EP1"", ""Skin_Soldier1_DZ""] call player_wearClothes"; }; };
	class Skin_Camo1_DZ { class ZombZSkins { text = "WinterSoldier"; script = "[""Skin_Winter_SOF_DA1b"", ""Skin_Camo1_DZ""] call player_wearClothes"; }; };
	class Skin_Sniper1_DZ { class ZombZSkins { text = "WinterSniper"; script = "[""Skin_Winter_SOF_Marksman"", ""Skin_Sniper1_DZ""] call player_wearClothes"; }; };
};