private ["_item","_id","_onLadder","_hasmeditem","_config","_text"];
_item = _this;
call gear_ui_init;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasmeditem = _this in magazines player;

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");

if (!_hasmeditem) exitWith {cutText [format[(localize "str_player_31"),_text,"use"] , "PLAIN DOWN"]};
switch (_item) do {
	case "ItemBandage": {
		_id = [0,0,0,[player]] execVM "\z\addons\dayz_code\medical\bandage.sqf";
	};
	case "ItemMorphine": {
		_id = [0,0,0,[player]] execVM "\z\addons\dayz_code\medical\morphine.sqf";
		playSound "morphine_01"; addCamShake [2, 0.5, 25]; sleep 1; playSound "heartbeat_1"; sleep 1; playSound "heartbeat_1";
	};
	case "ItemPainkiller": {
		_id = [0,0,0,[player]] execVM "\z\addons\dayz_code\medical\painkiller.sqf";
		playSound "painkiller_01";
	};
	case "ItemAntibiotic": {
		_id = [0,0,0,[player]] execVM "\z\addons\dayz_code\medical\antibiotics.sqf";
		playSound "painkiller_01";
	};
	case "ItemBloodbag": {
		_id = [0,0,0,[player]] execVM "actions\self_transfusion.sqf";
		playSound "administer_iv_02"; addCamShake [2, 3, 25]; sleep 1; playSound "heartbeat_1"; sleep 0.1; playSound "heartbeat_1"; sleep 0.1; playSound "heartbeat_1"; sleep 0.2; playSound "heartbeat_1"; sleep 0.5; playSound "heartbeat_1"; sleep 0.7; playSound "heartbeat_1"; sleep 0.7; playSound "heartbeat_1";
	};
	case "ItemHeatPack": {
		player removeMagazine "ItemHeatPack";
		dayz_temperatur = (dayz_temperatur + 5) min dayz_temperaturmax;
		cutText [localize "str_player_27", "PLAIN DOWN"];
		playSound "morphine_01";
	};
};