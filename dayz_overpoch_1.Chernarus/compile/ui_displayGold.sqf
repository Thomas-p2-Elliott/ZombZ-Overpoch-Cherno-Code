private ["_gearControl","_itemName","_itemPic","_itemDesc","_imageText","_gold","_plyrGoldVar","_object","_objGoldVar","_objectName","_strResult","_control","_text","_nearObjects","_onPlayer","_itemText","_lbIDC","_lbcontrol","_lbsize","_lbRows","_inCargo"];
disableSerialization;

_gold = (player getVariable ["ZombZGold", 0]);

_gearControl = (findDisplay 106); 
_itemName = ((_gearControl) displayCtrl 1101);
_itemPic = ((_gearControl) displayCtrl 1104);
_itemDesc = ((_gearControl) displayCtrl 1106);

_itemName ctrlSetText "	Gold Bars";
_itemPic ctrlSetText "\z\addons\dayz_epoch\pictures\equip_gold_bar_10oz_CA.paa";
_imageText = parseText format["
<img size='1.5' image='\z\addons\dayz_epoch\pictures\equip_gold_bar_CA.paa' />x	%1
<br/><t size='0.74'>Gold bars, the only currency in Chernarus. They use one slot no matter how many you carry.", _gold];
_itemDesc ctrlSetStructuredText _imageText;

_lbIDC = 105;
_inCargo = "";
_onPlayer = "";
_itemText = "";
_object = objNull;

_lbcontrol = _gearControl displayctrl _lbIDC;
_lbsize = lnbSize _lbControl;
_lbRows = _lbSize select 0;


for "_i" from 0 to _lbRows do {
	_inCargo = "";
	_onPlayer = "";
	_itemText = "";

	_itemText = _lbcontrol lnbText [_i,1];

	if ((_itemText) == "10oz Gold") then {
		_onPlayer = _lbcontrol lnbText [_i,2];
	 	_inCargo = _lbcontrol lnbText [_i,0];

	 	if (!((_onPlayer) == "") && ((_inCargo) == "")) then {
 			_plyrGoldVar = player getVariable ["ZombZGold", 1];
 			_lbcontrol lnbSetText [[_i,1], (str _plyrGoldVar + " Gold Bars")]; 
	 	} else {

			if (vehicle player != player) then {
				_object = vehicle player;
			} else {
				_object = cursorTarget;
			};
 
			if !(isNull _object) then {
				_objGoldVar = _object getVariable ["ZombZGold", 1];
	 			_lbcontrol lnbSetText [[_i,1], (str _objGoldVar + " Gold Bars")]; 
			} else {
				disableSerialization;
				_control = (findDisplay 106) displayCtrl 156;
				_text = ctrlText _control;
				_nearObjects = nearestObjects [position player, ["Man","AllVehicles","Land_A_Tent","VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"], 30];
				{
					_objectName = getText (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
					_strResult = [_text,_objectName] call KRON_StrInStr;

					if (_strResult) then {
						_object = _x;
						_objGoldVar = _object getVariable ["ZombZGold", 1];
	 					_lbcontrol lnbSetText [[_i,1], (str _objGoldVar + " Gold Bars")]; 
					};

				} forEach _nearObjects;
			};
	 	};
	};
};
 
true