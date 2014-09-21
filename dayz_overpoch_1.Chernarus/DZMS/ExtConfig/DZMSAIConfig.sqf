/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.10,0.125],
	["aimingShake",0.45,0.55],
	["aimingSpeed",0.45,0.55],
	["endurance",0.40,0.50],
	["spotDistance",0.30,0.45],
	["spotTime",0.30,0.45],
	["courage",0.40,0.60],
	["reloadSpeed",0.50,0.60],
	["commanding",0.40,0.50],
	["general",0.40,0.60]
];

DZMSSkills1 = [
["aimingAccuracy",1.00],
["aimingShake",0.60],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

DZMSSkills2 = [
["aimingAccuracy",1.00],
["aimingShake",0.60],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

DZMSSkills3 = [
["aimingAccuracy",1.00],
["aimingShake",0.60],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps1 = [
"M249_DZ",
"M4A1_Aim",
"AKS_74_kobra",
"M24",
"SVD_CAMO",
"DMR_DZ",
"M14_EP1",
"M240_DZ",
"M16A4_ACG",
"Mk_48_DZ",
"Sa58V_RCO_EP1",
"FN_FAL",
"RPK_74"
];

DZMSWeps2 = [
"M249_DZ",
"M4A1_Aim",
"AKS_74_kobra",
"M24",
"SVD_CAMO",
"DMR_DZ",
"M14_EP1",
"M240_DZ",
"M16A4_ACG",
"Mk_48_DZ",
"Sa58V_RCO_EP1",
"FN_FAL",
"RPK_74"
];

DZMSWeps3 = [
"M249_DZ",
"M4A1_Aim",
"AKS_74_kobra",
"M24",
"SVD_CAMO",
"DMR_DZ",
"M14_EP1",
"M240_DZ",
"M16A4_ACG",
"Mk_48_DZ",
"Sa58V_RCO_EP1",
"FN_FAL",
"RPK_74"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_Patrol_Pack_EP1",
"DZ_Assault_Pack_EP1",
"DZ_Czech_Vest_Puch",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_British_ACU",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1"
];