/*---------------------------------------------------------------------------
p2_lootCheck.sqf
Version 0.4
Author: Player2

Description:
	Swaps loot depending on area of the map that it is spawning
	E.g. Swap M4A1's for AK's if spawning in Berezino

Parameters & Use:

	Param 1: Item Classname (_loot, _this select 0)
	Param 2: Worldspace (_position, _this select 1)

	["M4A1",[2500,5000,1]] call p2_lootCheck

Outputs:

	Item Classname (_out)

Configuration Instructions:

	Add and configure these variables prior loot spawning in the files.

	P2DZ_lootCheck_centerPoint - Center point for where the 'improved' loot should spawn (type: position array)
	P2DZ_lootCheck_radius - Radius for this dome for the size of the imrpoved loot zone (type: number, meters)
	P2DZ_lootCheck_debug - Toggles debugging logs (type: boolean)

	Configure the weapons to swap from this file at marked points!

www.ZombZ.net
---------------------------------------------------------------------------*/
private ["_loot","_position","_out","_p2d","_centerPoint","_radius","_dist","_inZone","_timeStart","_timeEnd","_timeBetween"];
_timeStart = diag_tickTime;
//load info parsed in from execution
_loot = _this select 0;
_position = _this select 1;
_out = _loot;

//load info from global vars
_p2d = P2DZ_lootCheck_debug;
_centerPoint = P2DZ_lootCheck_centerPoint;
_radius = P2DZ_lootCheck_radius;

_dist = _position distance _centerPoint;
_inZone = _dist < _radius;

//If player is in the zone
if (_inZone) then {
	/*---------------------------------------------------------------------------
	Configuration Start: Inside of Zone (NATO Weapons)
	---------------------------------------------------------------------------*/

	switch (_loot) do {
		case "AK_47_M": { 				_out = "BAF_L85A2_RIS_Holo"};
		case "AK_47_S": { 				_out = "BAF_L85A2_UGL_Holo"};
		case "AK_74": { 				_out = "MP5SD"};
		case "AK_74_GL": { 				_out = "MP5SD"};
		case "AK_107_kobra": { 			_out = "BAF_L85A2_RIS_ACOG"};
		case "AK_107_GL_kobra": { 		_out = "BAF_L85A2_RIS_ACOG"};
		case "AK_107_pso": { 			_out = "BAF_L85A2_RIS_ACOG"};
		case "AKS_74_kobra": { 			_out = "SCAR_L_CQC_EGLM_Holo"};
		case "AKS_74_pso": { 			_out = "SCAR_H_CQC_CCO"};
		case "AKS_74_U": {				_out = "SCAR_H_CQC_CCO_SD"};
		case "AKS_74_UN_kobra": { 		_out = "SCAR_L_CQC_EGLM_Holo"};
		case "RPK_74": { 				_out = "M249_DZ"};
		case "AK_74_GL_kobra": { 		_out = "SCAR_L_CQC_EGLM_Holo"};
		case "AKS_74": {			 	_out = "M4A1_HWS_GL_SD_Camo"};
		case "RPK_74_Large": { 			_out = "M249_DZ"};
		case "Sa58P_EP1": { 			_out = "M4A3_CCO_EP1"};
		case "Sa58V_EP1": { 			_out = "M4A3_CCO_EP1"};
		case "Sa58V_RCO_EP1": { 		_out = "SCAR_L_CQC_CCO_SD"};
		case "Sa58V_CCO_EP1": {			_out = "SCAR_L_CQC_EGLM_Holo"};
		case "bizon": {					_out = "MP5SD"};
		case "bizon_silenced": {		_out = "MP5SD"};
		case "FN_FAL": {				_out = "M14_EP1"};
		case "G36C_camo": {				_out = "M4A1_Aim_camo"};
		case "G36_C_SD_camo": {			_out = "M4A1_AIM_SD_camo"};
		case "G36A_camo": {				_out = "m16a4_acg"};
		case "G36K_camo": {				_out = "M4SPR"};
		case "G36C": {				 	_out = "M4A1_Aim"};
		case "G36_C_SD_eotech": {		_out = "SCAR_L_CQC_CCO_SD"};
		case "G36a": {				 	_out = "M4A1_Aim"};
		case "G36K": {				 	_out = "M4A1_HWS_GL"};
		case "m8_carbine": {			_out = "BAF_L85A2_RIS_Holo"};
		case "m8_carbineGL": {			_out = "BAF_L85A2_UGL_Holo"};
		case "m8_compact": {			_out = "SCAR_H_CQC_CCO"};
		case "m8_sharpshooter": {		_out = "SCAR_H_CQC_CCO"};
		case "m8_SAW": {				_out = "SCAR_H_CQC_CCO"};
		case "m8_carbine_pmc": {		_out = "SCAR_H_CQC_CCO"};
		case "m8_compact_pmc": {		_out = "SCAR_H_CQC_CCO"};
		case "m8_holo_sd": {			_out = "M14_EP1"};
		case "m8_SAW_Large": {			_out = "M4A3_CCO_EP1"};
		case "VSS_vintorez": {			_out = "SCAR_H_LNG_Sniper_SD"};
		case "PK": {				 	_out = "Mk_48_DZ"};
		case "Pecheneg": {				_out = "Mk_48_DZ"};
		case "M60A4_EP1_DZE": {			_out = "Mk_48_DZ"};
		case "Mk_48_DZ": {				_out = "Mk_48_DZ"};
		case "revolver_EP1": {			_out = "Colt1911"};
		case "MakarovSD": {				_out = "M9SD"};
		case "Sa61_EP1": {				_out = "UZI_EP1"};
		case "M9": {				 	_out = "glock17_EP1"};

		default {};
	};

//Player is outside of the zone
} else {

	/*---------------------------------------------------------------------------
	Configuration Start: Out of Zone (Russian Weapons)
	---------------------------------------------------------------------------*/
	switch (_loot) do {
		case "SCAR_L_CQC": { 			_out = "bizon"};
		case "SCAR_L_CQC_Holo": { 		_out = "bizon_silenced"};
		case "SCAR_L_STD_Mk4CQT": { 	_out = "huntingrifle"};
		case "SCAR_L_STD_EGLM_RCO": { 	_out = "m8_sharpshooter"};
		case "SCAR_L_CQC_EGLM_Holo": { 	_out = "m8_sharpshooter"};
		case "SCAR_L_STD_HOLO": { 		_out = "AKS_74_UN_kobra"};
		case "SCAR_L_CQC_CCO_SD": { 	_out = "G36_C_SD_eotech"};
		case "SCAR_H_CQC_CCO": { 		_out = "AKS_74_UN_kobra"};
		case "SCAR_H_CQC_CCO_SD": { 	_out = "G36_C_SD_eotech"};
		case "SCAR_H_STD_EGLM_Spect": {	_out = "SVD_CAMO"};
		case "SCAR_H_LNG_Sniper": { 	_out = "VSS_vintorez"};
		case "SCAR_H_LNG_Sniper_SD": { 	_out = "VSS_vintorez"};
		case "M4A3_CCO_EP1": { 			_out = "Sa58V_CCO_EP1"};
		case "M4A3_RCO_GL_EP1": { 		_out = "Sa58V_RCO_EP1"};
		case "M4A1": { 					_out = "AKS_74_UN_kobra"};
		case "M4A1_Aim": { 				_out = "AKS_74_UN_kobra"};
		case "M4A1_Aim_camo": { 		_out = "Sa58V_CCO_EP1"};
		case "M4SPR": { 				_out = "AKS_74_UN_kobra"};
		case "M4A1_RCO_GL": { 			_out = "m8_sharpshooter"};
		case "M4A1_AIM_SD_camo": { 		_out = "G36_C_SD_eotech"};
		case "M4A1_HWS_GL_SD_Camo": {	_out = "G36_C_SD_camo"};
		case "M4A1_HWS_GL": { 			_out = "G36_C_SD_camo"};
		case "M4A1_HWS_GL_camo": {		_out = "G36_C_SD_eotech"};
		case "M16A2": { 				_out = "m8_carbine"};
		case "M16A2GL": { 				_out = "m8_carbineGL"};
		case "m16a4": { 				_out = "m8_carbine"};
		case "m16a4_acg": {				_out = "m8_sharpshooter"};
		case "M16A4_GL": { 				_out = "m8_sharpshooter"};
		case "m16a4": { 				_out = "m8_compact"};
		case "m16a4_acg": {				_out = "G36K_camo"};
		case "M16A4_ACG_GL": { 			_out = "G36K_camo"};
		case "BAF_L85A2_RIS_Holo": { 	_out = "bizon"};
		case "BAF_L85A2_UGL_Holo": { 	_out = "AK_74_GL"};
		case "BAF_L85A2_RIS_SUSAT": { 	_out = "AKS_74_pso"};
		case "BAF_L85A2_UGL_SUSAT": { 	_out = "AKS_74_pso"};
		case "BAF_L85A2_RIS_ACOG": { 	_out = "G36_C_SD_eotech"};
		case "BAF_L85A2_UGL_ACOG": { 	_out = "G36_C_SD_eotech"};
		case "BAF_L86A2_ACOG": { 		_out = "AK_107_pso"};
		case "M24_des_EP1": { 			_out = "M40A3"};
		case "SVD_des_EP1": { 			_out = "SVD"};
		case "Mk_48_DES_EP1": {			_out = "M60A4_EP1_DZE"};
		case "MP5A5": {					_out = "bizon"};
		case "MP5SD": { 				_out = "bizon_silenced"};
		case "Colt1911": { 				_out = "revolver_EP1"};
		case "M9SD": { 					_out = "MakarovSD"};
		case "glock17_EP1": {			_out = "Sa61_EP1"};
		case "UZI_SD_EP1": { 			_out = "UZI_EP1"};
		case "M24_des_EP1": { 			_out = "M24"};
		case "SVD_des_EP1": { 			_out = "SVD"};
		case "Mk_48_DES_EP1": { 		_out = "Mk_48_DZ"};
		case "MG36_camo": { 			_out = "MG36"};
		default {};
	};

};
_timeEnd = diag_tickTime;
_timeBetween = _timeEnd - _timeStart;
if (_p2d) then { diag_log("fn_lootCheck:	_loot:	" + str _loot + "	_inZone:	" + str _inZone + "	_out:	" + str _out + "	Ticks Taken: " + str _timeBetween); };
_out