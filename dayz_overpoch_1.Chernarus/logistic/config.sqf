
LOG_CFG_lANG = "en"; 				/*  en = english , de = german , fr = french  */
LOG_CFG_ALLOW_LOCKED = false;	 	/* allow to transport locked vehicles */
LOG_CFG_ALLOW_CHAINING = false; 	/* allow chain towing  */
LOG_CFG_ALLOW_GETIN = false; 		/* allow player to get into a towed / lifted object  */
P2LOG_CFG_ALLOW_FROMPLOT = false; 	/* player2: allow player to tow or lift from plots */

/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES WHERE CAN TOW
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANTOW=[
	"2s6m_tunguska",
	"aav",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_merlin_dze",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"car_hatchback",
	"car_sedan",
	"chukar",
	"chukar_ep1",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"gnt_c185",
	"gnt_c185c",
	"gnt_c185e",
	"gnt_c185f",
	"gnt_c185r",
	"gnt_c185t",
	"gnt_c185u",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"offroad_spg9_tk_gue_ep1",
	"old_bike_tk_civ_ep1",
	"old_bike_tk_ins_ep1",
	"old_moto_tk_civ_ep1",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1"
];



/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES WHERE IS TOWABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISTOWABLE=[	
	"2s6m_tunguska",
	"aav",
	"an2_1_tk_civ_ep1",
	"an2_2_tk_civ_ep1",
	"an2_dz",
	"an2_dz",
	"an2_tk_ep1",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"c130j",
	"c130j_us_ep1",
	"c130j_us_ep1_dz",
	"car_hatchback",
	"car_sedan",
	"chukar",
	"chukar_ep1",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"gnt_c185",
	"gnt_c185c",
	"gnt_c185e",
	"gnt_c185f",
	"gnt_c185r",
	"gnt_c185t",
	"gnt_c185u",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"offroad_spg9_tk_gue_ep1",
	"old_bike_tk_civ_ep1",
	"old_bike_tk_ins_ep1",
	"old_moto_tk_civ_ep1",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1"
];




/*--------------------------------------------------------------------------------------------------------------
	LIST OF HELIS WHERE CAN LIFT
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANLIFT=[
	"a10",
	"a10_us_ep1",
	"ah64d_ep1",
	"ah6j_ep1",
	"ah6x_dz",
	"an2_1_tk_civ_ep1",
	"an2_2_tk_civ_ep1",
	"an2_dz",
	"an2_tk_ep1",
	"baf_merlin_dze",
	"c130j",
	"c130j_us_ep1",
	"c130j_us_ep1_dz",
	"ch53_dze",
	"ch_47f_baf",
	"ch_47f_ep1",
	"ch_47f_ep1_dz",
	"ch_47f_ep1_dze",
	"csj_gyroc",
	"csj_gyrocover",
	"csj_gyrop",
	"f35b",
	"l39_tk_ep1",
	"m6_ep1",
	"mh6j_dz",
	"mi17_civilian_dz",
	"mi17_dze",
	"mq9predatorb_us_ep1",
	"mv22_dz",
	"su25_cdf",
	"su25_ins",
	"su25_tk_ep1",
	"su34",
	"su39",
	"uh1h_dze",
	"uh1h_tk_ep1",
	"uh1y",
	"uh1y_dze",
	"uh60m_ep1_dze"
];




/*--------------------------------------------------------------------------------------------------------------
		LIST OF VEHICLES WHERE IS LIFTABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISLIFTABLE=[
	"2s6m_tunguska",
	"a10",
	"a10_us_ep1",
	"aav",
	"ah64d_ep1",
	"ah6j_dz",
	"ah6j_ep1",
	"ah6j_ep1",
	"ah6x_dz",
	"ah6x_ep1",
	"an2_1_tk_civ_ep1",
	"an2_1_tk_civ_ep1",
	"an2_2_tk_civ_ep1",
	"an2_2_tk_civ_ep1",
	"an2_dz",
	"an2_dz",
	"an2_tk_ep1",
	"an2_tk_ep1",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_merlin_dze",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"c130j",
	"c130j_us_ep1",
	"c130j_us_ep1",
	"c130j_us_ep1_dz",
	"car_hatchback",
	"car_sedan",
	"ch53_dze",
	"ch_47f_baf",
	"ch_47f_baf",
	"ch_47f_ep1",
	"ch_47f_ep1",
	"ch_47f_ep1_dz",
	"ch_47f_ep1_dze",
	"chukar",
	"chukar_ep1",
	"csj_gyroc",
	"csj_gyrocover",
	"csj_gyrop",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"f35b",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"gnt_c185",
	"gnt_c185c",
	"gnt_c185e",
	"gnt_c185f",
	"gnt_c185r",
	"gnt_c185t",
	"gnt_c185u",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"l39_tk_ep1",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mh6j_dz",
	"mh6j_ep1",
	"mi171sh_cz_ep1",
	"mi17_civilian_dz",
	"mi17_dze",
	"mi17_tk_ep1",
	"mi17_un_cdf_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"mv22",
	"mv22_dz",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"offroad_spg9_tk_gue_ep1",
	"old_bike_tk_civ_ep1",
	"old_bike_tk_ins_ep1",
	"old_moto_tk_civ_ep1",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"su25_cdf",
	"su25_ins",
	"su25_tk_ep1",
	"su34",
	"su39",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"uh1h",
	"uh1h_dze",
	"uh1h_tk_ep1",
	"uh1y",
	"uh1y_dze",
	"uh60m_ep1",
	"uh60m_ep1_dze",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1"
];
