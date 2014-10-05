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
				_itemTypes = [
							 ["M32_EP1", "weapon"], 					 //LauncherWeaps
							 ["M79_EP1", "weapon"],  					 //LauncherWeaps
							 ["Mk13_EP1", "weapon"], 					 //LauncherWeaps
							 
							 ["revolver_gold_EP1", "weapon"],  			 //UltraWeaps
							 ["RH_Deagleg", "weapon"], 					 //UltraWeaps
							 ["RH_anacg", "weapon"], 					 //UltraWeaps
							 ["Javelin", "weapon"], 					 //UltraWeaps
							 ["AKS_GOLD", "weapon"], 					 //UltraWeaps
							 ["AA12_PMC", "weapon"], 					 //UltraWeaps

							 ["BAF_LRR_scoped", "weapon"],               //SniperTopWeaps
							 ["KSVK_DZE", 	"weapon"], 			         //SniperTopWeaps
							 ["USSR_cheytacM200", "weapon"], 			 //SniperTopWeaps
							 ["USSR_cheytacM200_sd", "weapon"], 	     //SniperTopWeaps
							 ["BAF_AS50_scoped_DZ", "weapon"], 			 //SniperTopWeaps
							 ["m107_SKN", "weapon"], 					 //SniperTopWeaps
							 ["BAF_LRR_scoped_W", "weapon"], 			 //SniperTopWeaps
							 ["FHQ_MSR_DESERT","weapon"],				 //SniperTopWeaps
							 ["FHQ_MSR_SD_DESERT","weapon"],			 //SniperTopWeaps
							 ["FHQ_XM2010_SD_DESERT","weapon"],			 //SniperTopWeaps
							 ["FHQ_XM2010_DESERT","weapon"],			 //SniperTopWeaps

							 ["M136", "weapon"],              			 //RocketWeaps
							 ["RPG7V", "weapon"], 			       	 	 //RocketWeaps
							 ["MetisLauncher", "weapon"], 				 //RocketWeaps
							 ["SMAW", "weapon"], 	    				 //RocketWeaps
							 ["MAAWS", "weapon"], 						 //RocketWeaps
							 ["Vil_RPG16", "weapon"], 					 //RocketWeaps
							 ["Vil_RPG7V_PGO", "weapon"], 				 //RocketWeaps
							 ["Vil_RPG7d_PGO","weapon"],				 //RocketWeaps
							 ["Vil_RPG29","weapon"],					 //RocketWeaps
							 ["Vil_RPO_A","weapon"],					 //RocketWeaps
							 ["vilas_rpg22","weapon"],					 //RocketWeaps
							 ["vilas_rpg26","weapon"],					 //RocketWeaps
							 ["vil_CG84T","weapon"],					 //RocketWeaps
							 ["vil_Panzerfaust3","weapon"],				 //RocketWeaps

							 ["BAF_L85A2_RIS_CWS", "weapon"],            //TWSWeaps
							 ["M249_TWS_EP1", "weapon"], 			     //TWSWeaps
							 ["AKS_74_GOSHAWK", "weapon"], 				 //TWSWeaps
							 ["SCAR_L_STD_EGLM_TWS", "weapon"], 	     //TWSWeaps
							 ["SCAR_H_STD_TWS_SD", "weapon"], 		     //TWSWeaps
							 ["m8_tws_sd", "weapon"], 					 //TWSWeaps
							 ["FHQ_ACR_WDL_TWS_F", "weapon"], 			 //TWSWeaps
							 ["FHQ_ACR_BLK_TWS_SD", "weapon"], 			 //TWSWeaps
							 ["FHQ_ACR_TAN_TWS_GL_SD", "weapon"], 		 //TWSWeaps
							 ["FHQ_ACR_SNW_TWS", "weapon"], 			 //TWSWeaps
							 ["FHQ_ACR_SNW_TWS_GL", "weapon"], 			 //TWSWeaps

							 ["RH_deagle", "weapon"],              		 //PistolTopWeaps
							 ["RH_Deaglem", "weapon"], 			       	 //PistolTopWeaps
							 ["RH_Deaglemz", "weapon"], 				 //PistolTopWeaps
							 ["RH_Deaglemzb", "weapon"], 	    		 //PistolTopWeaps
							 ["RH_Deagles", "weapon"], 					 //PistolTopWeaps
							 ["UZI_SD_EP1", "weapon"], 					 //PistolTopWeaps
							 ["RH_uspm", "weapon"], 				     //PistolTopWeaps
							 ["RH_bull", "weapon"], 				     //PistolTopWeaps
							 ["vil_apssd", "weapon"], 				     //PistolTopWeaps
							 ["vil_APS", "weapon"], 				     //PistolTopWeaps

							 ["Pecheneg_DZ", "weapon"],              	 //HMGWeaps
							 ["Mk_48_DZ", "weapon"], 			       	 //HMGWeaps
							 ["m240_scoped_EP1_DZE", "weapon"], 		 //HMGWeaps
							 ["M240_DZ", "weapon"], 	    		     //HMGWeaps
							 ["M60A4_EP1_DZE", "weapon"], 				 //HMGWeaps
							 ["PK_DZ", "weapon"], 					     //HMGWeaps
							 ["vil_PKP_EOT", "weapon"], 				 //HMGWeaps
							 ["BAF_L7A2_GPMG", "weapon"], 				 //HMGWeaps
							 ["vil_PKP", "weapon"], 				 	 //HMGWeaps
							 ["vil_PK", "weapon"], 				 		 //HMGWeaps
							 ["vil_zastava_m84", "weapon"], 			 //HMGWeaps
							 ["vil_PKM", "weapon"], 			 		 //HMGWeaps
							 ["skavil_M60", "weapon"], 			 		 //HMGWeaps
							 ["skavil_M60e3", "weapon"], 			     //HMGWeaps
							 ["vil_Mg3", "weapon"], 			 		 //HMGWeaps
							 ["vil_FnMag", "weapon"], 			 		 //HMGWeaps
							 ["vil_M240_B", "weapon"], 			 		 //HMGWeaps

							

							 ["SCAR_L_STD_EGLM_RCO", "weapon"],     //ScarHighWeaps
							 ["SCAR_H_CQC_CCO_SD", "weapon"], 		//ScarHighWeaps
							 ["SCAR_H_STD_EGLM_Spect", "weapon"],   //ScarHighWeaps
							 ["SCAR_H_LNG_Sniper", "weapon"], 	    //ScarHighWeaps
							 ["SCAR_H_LNG_Sniper_SD", "weapon"], 	//ScarHighWeaps

							 
							 ["glock17_EP1","weapon"],              //PistolMilWeaps
							 ["RH_g18","weapon"],					//PistolMilWeaps
							 ["RH_g17","weapon"],					//PistolMilWeaps
							 ["RH_g19","weapon"],					//PistolMilWeaps
							 ["RH_g19t","weapon"],					//PistolMilWeaps
							 ["RH_g17sd","weapon"],					//PistolMilWeaps
							 ["UZI_EP1","weapon"],					//PistolMilWeaps
							 ["M9SD","weapon"],					    //PistolMilWeaps
					 		 ["RH_m9sd","weapon"],					//PistolMilWeaps
							 ["RH_m9csd","weapon"],				    //PistolMilWeaps
							 ["vil_USPSD","weapon"],				//PistolMilWeaps
							 ["vil_USP45","weapon"],				//PistolMilWeaps
							 ["vil_USP45SD","weapon"],			    //PistolMilWeaps
							 ["RH_anac","weapon"],					//PistolMilWeaps
							 ["RH_uspsd","weapon"],					//PistolMilWeaps
							 ["RH_vz61","weapon"],					//PistolMilWeaps
							 ["RH_tec9","weapon"],					//PistolMilWeaps
						     ["vil_Glock","weapon"],				//PistolMilWeaps
							 ["vil_Glock_o","weapon"],				//PistolMilWeaps
							 ["Sa61_EP1","weapon"],					//PistolMilWeaps
							 ["M9","weapon"],						//PistolMilWeaps
							 ["RH_usp","weapon"],					//PistolMilWeaps
							 ["RH_m9","weapon"],					//PistolMilWeaps
							 ["RH_m9c","weapon"],					//PistolMilWeaps
							 ["RH_muzi","weapon"],					//PistolMilWeaps
							 ["vil_USP","weapon"],					//PistolMilWeaps

							
							["RH_hk417","weapon"], 					//HK417Weaps
							["vil_HK417s","weapon"],				//HK417Weaps
							["RH_hk417aim","weapon"],				//HK417Weaps
							["RH_hk417eotech","weapon"],			//HK417Weaps
							["RH_hk417acog","weapon"],				//HK417Weaps
							["RH_hk417saim","weapon"],				//HK417Weaps
							["RH_hk417seotech","weapon"],			//HK417Weaps
							["RH_hk417sacog","weapon"],				//HK417Weaps
							["RH_hk417sd","weapon"],				//HK417Weaps
							["RH_hk417sdaim","weapon"],				//HK417Weaps
							["RH_hk417sdeotech","weapon"],			//HK417Weaps
							["RH_hk417sdacog","weapon"],			//HK417Weaps
							["RH_hk417sgl","weapon"],				//HK417Weaps
							["RH_hk417sglaim","weapon"],			//HK417Weaps
							["RH_hk417sgleotech","weapon"],			//HK417Weaps
							["RH_hk417sglacog","weapon"],			//HK417Weaps
							["RH_hk417s","weapon"],					//HK417Weaps


							["vil_SV_98","weapon"],					//SVDWeaps
							["vil_SV_98_69","weapon"],				//SVDWeaps
							["vil_SV_98_SD","weapon"],				//SVDWeaps
							["SVD_des_EP1","weapon"],				//SVDWeaps
							["SVD_CAMO","weapon"],					//SVDWeaps
							["vil_SVD_63","weapon"],				//SVDWeaps
							["vil_SVD_S","weapon"],					//SVDWeaps
							["vil_SVD_M","weapon"],					//SVDWeaps
							["vil_SVD_P21","weapon"],				//SVDWeaps
							["vil_SVDK","weapon"],					//SVDWeaps
							["SVD","weapon"],						//SVDWeaps
							["vil_SVU","weapon"],					//SVDWeaps


							["RH_sc2acog","weapon"], 				//SniperMedWeaps
							["RH_sc2sp","weapon"],					//SniperMedWeaps
							["RH_hk417sp","weapon"],				//SniperMedWeaps
							["RH_hk417sdsp","weapon"],				//SniperMedWeaps
							["vil_M110","weapon"],					//SniperMedWeaps
							["vil_M110sd","weapon"],				//SniperMedWeaps
							["vil_SR25","weapon"],					//SniperMedWeaps
							["vil_SR25SD","weapon"],				//SniperMedWeaps
							["FHQ_RSASS_TAN","weapon"],				//SniperMedWeaps
							["FHQ_RSASS_SD_TAN","weapon"],			//SniperMedWeaps
							["DMR_SKN","weapon"],					//SniperMedWeaps
							["vil_DRM_BASE","weapon"],				//SniperMedWeaps
							

							["RH_sc2aim","weapon"],					//RiflesMedWeaps
							["RH_sc2eot","weapon"],					//RiflesMedWeaps
							["RH_sc2shd","weapon"],					//RiflesMedWeaps
							["M14_EP1","weapon"],					//RiflesMedWeaps
							["vil_M14","weapon"],					//RiflesMedWeaps
							["vil_M14G","weapon"],					//RiflesMedWeaps
							["RH_m14acog","weapon"],				//RiflesMedWeaps
							["RH_m14aim","weapon"],					//RiflesMedWeaps
							["RH_m14eot","weapon"],					//RiflesMedWeaps
							["vil_G3a3","weapon"],					//RiflesMedWeaps
							["vil_G3a2","weapon"],					//RiflesMedWeaps
							["vil_G3ZF","weapon"],					//RiflesMedWeaps
							["vil_G3zfb","weapon"],					//RiflesMedWeaps
							["vil_G3SG1","weapon"],					//RiflesMedWeaps
							["vil_G3sg1b","weapon"],				//RiflesMedWeaps
							["vil_AG3EOT","weapon"],			    //RiflesMedWeaps
							["vil_Groza_HG","weapon"],				//RiflesMedWeaps

							["MedBox0", "object"],					//Misc. Loot
							["AmmoBoxSmall_762", "object"],			//Misc. Loot
							["Binocular_Vector", "weapon"]	,		//Misc. Loot

							["Skin_Sniper1_DZ", "magazine"]	,	      //Ghillie Suit
							["Skin_Camo1_DZ", "magazine"]	,		  //Camo Clothing
							["Skin_Survivor2_DZ", "magazine"]	,	  //Civilian Clothing
							["Skin_Soldier1_DZ", "magazine"]	,	  //Soldier Clothing
							["Skin_Rocket_DZ", "magazine"]	,	      //Officer Suit
							["Skin_RU_Policeman_DZ", "magazine"],      //Policeman "Sergei"
							["Skin_Ins_Soldier_GL_DZ", "magazine"]  ,  //Terrorist Uniform
							["Skin_GUE_Commander_DZ", "magazine"]   ,  //Rebel Uniform
							["Skin_Bandit1_DZ","magazine"]	,	      //Bandit Outfit
							["Skin_Bandit2_DZ","magazine"]	,		  //Bandit Camo
							["Skin_GUE_Soldier_MG_DZ", "magazine"]	,  //Bandit Gunner
							["Skin_GUE_Soldier_Crew_DZ", "magazine"] ,   //Bandit Baklava
							["Skin_GUE_Soldier_CO_DZ", "magazine"] ,   //Bandit Mask
							["Skin_GUE_Soldier_2_DZ", "magazine"] ,   //Bandit Hat
							["Skin_TK_INS_Warlord_EP1_DZ", "magazine"],	  //Takistani Warlord
							["Skin_TK_INS_Soldier_EP1_DZ", "magazine"],	  //Takistani Soldier
							["Skin_CZ_Special_Forces_GL_DES_EP1_DZ  ", "magazine"] ,   //Special Forces
							["Skin_Drake_Light_DZ", "magazine"]	,					//Desert Camo
							["Skin_Soldier_Bodyguard_AA12_PMC_DZ", "magazine"],		//Bodyguard
							["Skin_FR_OHara_DZ", "magazine"],					//Jungle Camo
							["Skin_FR_Rodriguez_DZ", "magazine"],					 //Gunner Outfit
							["Skin_CZ_Soldier_Sniper_EP1_DZ  ", "magazine"]	,		//Desert Ghillie
							["Skin_Graves_Light_DZ", "magazine"],					//Urban Camo
							["Skin_Soldier_Sniper_PMC_DZ  ", "magazine"],			 //Marksman
							["Skin_Soldier_TL_PMC_DZ", "magazine"],					//Team Leader
							["Skin_TK_Special_Forces_MG_EP1_DZ", "magazine"],		//Smuggler
							["Skin_TK_Soldier_Sniper_EP1_DZ", "magazine"],			//Desert Sniper
							["Skin_TK_Commander_EP1_DZ  ", "magazine"],				//General
							["Skin_RU_Soldier_Crew_DZ  ", "magazine"]				//Crewman
							];

				_itemChance = [ 
								//LauncherWeaps
								0.03,  
							    0.03,  
							    0.03,  
							    
							    //UltraWeaps
							    0.01,  
							    0.01,   
							    0.01,   
							    0.01,   
							    0.01,   
							    0.01,   

							    //SniperTopWeaps
							    0.02,  
							    0.02,   
							    0.02,   
							    0.02,   
							    0.02,   
							    0.02, 
							    0.02,  
							    0.02,   
							    0.02,   
							    0.02,   
							    0.02,   

							    //RocketWeaps
							    0.02,  
							    0.02,  
							    0.02,   
							    0.02,   
							    0.02,   
							    0.02, 
							    0.02,  
							    0.02,   
							    0.02,  
							    0.02,   
							    0.02, 
							    0.02,   
							    0.02, 

							    //TWSWeaps  = 0.22
							    0.01,  
							    0.01,  
							    0.01,   
							    0.01,   
							    0.01,   
							    0.01, 
							    0.01,  
							    0.01,   
							    0.01,   
							    0.01,   
							    0.01, 
							    0.01,  
							    0.01,   
							    0.01,  
							    0.01, 
							    0.01,   
							    0.01,  
							    0.01, 
							    0.01, 
							    0.01,   
							    0.01,  
							    0.01, 

							    //ScarHighWeaps = 0.10
							    0.02,  
							    0.02,  
							    0.02,   
							    0.02,   
							    0.02, 
							     
							    //PistolMilWeaps = 1.04
							    0.04,  
							    0.04,  
							    0.04,   
							    0.04,   
							    0.04,   
							    0.04, 
							    0.04,  
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04,  
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 

							    //HK417Weaps = 0.51
							    0.03, 
							    0.03,   
							    0.03,  
							    0.03, 
							    0.03, 
							    0.03,   
							    0.03,  
							    0.03, 
							    0.03,  
							    0.03, 
							    0.03,   
							    0.03,  
							    0.03, 
							    0.03, 
							    0.03,   
							    0.03,  
							    0.03, 

							    //SVDWeaps = 0.56
							    0.04,  
							    0.04, 
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04,  
							    0.04, 
							    0.04,   
							    0.04,  
							    0.04, 
							    0.04, 
							    0.04,   
							    0.04,  

							    //SniperMedWeaps = 0.65
							    0.05, 
							    0.05, 
							    0.05,   
							    0.05,  
							    0.05, 
							    0.05,  
							    0.05, 
							    0.05,   
							    0.05,  
							    0.05, 
							    0.05, 
							    0.05,   
							    0.05,  

							    //RiflesMedWeaps = 1.86
							    0.06, 
							    0.06, 
							    0.06,   
							    0.06,  
							    0.06, 
							    0.06,  
							    0.06, 
							    0.06,   
							    0.06,  
							    0.06, 
							    0.06, 
							    0.06,   
							    0.06, 
							    0.06,  
							    0.06, 
							    0.06, 
							    0.06,   
							    0.06,  
							    0.06, 
							    0.06,  
							    0.06, 
							    0.06,   
							    0.06,  
							    0.06, 
							    0.06, 
							    0.06,   
							    0.06, 
							    0.06, 
							    0.06, 
							    0.06,   
							    0.06,

							    //Misc. Loot
							    0.09,
							    0.09,
							    0.09,

							    //Skins **Percentages need to be adjusted**
							    0.002,   
							    0.002,  
							    0.002, 
							    0.002,  
							    0.002, 
							    0.002,   
							    0.002,  
							    0.002, 
							    0.002, 
							    0.002,   
							    0.002, 
							    0.002,  
							    0.002, 
							    0.002, 
							    0.002,   
							    0.002,  
							    0.002, 
							    0.002,  
							    0.002, 
							    0.002,   
							    0.002,  
							    0.002, 
							    0.002, 
							    0.002,   
							    0.002, 
							    0.002, 
							    0.002, 
							    0.002,   
							    0.002


							 ];
 				
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