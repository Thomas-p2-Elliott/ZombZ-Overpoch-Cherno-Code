/*-------------------------------------------------------------------------

    AI Unit Configuration

---------------------------------------------------------------------------*/

//AI Relationships with Other Units

// Create the groups if they aren't created already
createCenter east;
// Make AI Hostile to Survivors
WEST setFriend [EAST,0];
EAST setFriend [WEST,0];
// Make AI Hostile to Zeds
EAST setFriend [CIVILIAN,0];
CIVILIAN setFriend [EAST,0];

P2AI_hunterAI = true; //Enable 'Hunter' AI - AI That will move towards, flank, etc the enemy, leaving its waypoints
P2AI_hunterAIPercent = 15; //Percent of AI that should move towards the enemy

//AI Skill Levels
P2AISkill = [["aimingAccuracy",0.10],
			["aimingShake",1.00],
			["aimingSpeed",1.00],
			["endurance",1.00],
			["spotDistance",1.00],
			["spotTime",1.00],
			["courage",1.00],
			["reloadSpeed",1.00],
			["commanding",1.00],
			["general",1.00]];

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
P2AIBanditSkins = [
  "GUE_Villager3",
  "GUE_Soldier_GL",
  "GUE_Soldier_CO",
  "GUE_Woodlander3",
  "GUE_Soldier_3",
  "Ins_Soldier_GL"
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI

if (P2AIEpoch) then {
  /* Weapons Config for Epoch */
  P2AIWeps1 = [
    //50%
    "AK_47_M",
    "AK_47_M",
    "Sa58V_CCO_EP1",
    "Sa58V_CCO_EP1",
    "Sa58V_RCO_EP1",
    "Sa58V_RCO_EP1",
    "M14_EP1",
    "M14_EP1",
    "FN_FAL",
    "FN_FAL",
    //35%
    "RPK_74",
    "RPK_74",
    "M240_DZ",
    "M240_DZ",
    "Mk_48_DZ",
    //15%
    "DMR_SKN",
    "SVD_CAMO",
    "KSVK_DZE"
  ];

} else {
  /* Weapons Config for Overwatch */
    P2AIWeps1 = [
    //50%
    "AK_47_M",
    "AK_47_M",
    "Sa58V_CCO_EP1",
    "Sa58V_CCO_EP1",
    "Sa58V_RCO_EP1",
    "Sa58V_RCO_EP1",
    "M14_EP1",
    "M14_EP1",
    "FN_FAL",
    "FN_FAL",
    //35%
    "RPK_74",
    "M240_DZ",
    "M240_DZ",
    "Mk_48_DZ",
    "Mk_48_DZ",
    //15%
    "DMR",
    "SVD_CAMO",
    "ksvk"
  ];
};

private["_f","_d"]; _f = "AI_Config"; _d = (P2AI_debugAI);
if (_d) then { diag_log(format["[P2AI]:%1: AI Config Loaded: Epoch Version? %2", _f, P2AIEpoch]); };