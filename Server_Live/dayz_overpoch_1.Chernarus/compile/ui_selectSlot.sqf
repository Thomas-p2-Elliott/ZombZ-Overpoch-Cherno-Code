private ["_m","_r","_v","_k","_c","_p","_control","_button","_parent","_group","_pos","_item","_conf","_name","_cfgActions","_numActions","_height","_menu","_config","_type","_script","_outputOriented","_compile","_array","_outputClass","_outputType"];
disableSerialization;
_control = 	_this select 0;
_button =	_this select 1;
_parent = 	findDisplay 106;

//if ((time - dayzClickTime) < 1) exitWith {};
if (!DZE_SelfTransfuse && ((gearSlotData _control) == "ItemBloodBag")) exitWith {};

if (_button == 1) then {
	//dayzClickTime = time;
	_group = _parent displayCtrl 6902;
	
	_pos = 		ctrlPosition _group;
	_pos set [0,((_this select 2) + 0.48)];
	_pos set [1,((_this select 3) + 0.07)];
	
	_item = gearSlotData _control;

	_conf = configFile >> "cfgMagazines" >> _item;
	if (!isClass _conf) then {
		_conf = configFile >> "cfgWeapons" >> _item;
	};
	_name = getText(_conf >> "displayName");
	
	_cfgActions = _conf >> "ItemActions";
	_numActions = (count _cfgActions);
	_height = 0;

	/* Block Exploits */
	_k = false;
	_k = isClass (configFile >> "CfgMagazines" >> _item);
 	_c = (configFile >> "CfgMagazines" >> "20Rnd_762x51_DMR");

	//block actions for: DMR type rounds that aren't actually DMR rounds to prevent duping - pending new split script overwrite
	_r = false; _v = false; _p = [];
	if (_k) then {
		_c = (configFile >> "CfgMagazines" >> _item);
		_p = [_c,true] call BIS_fnc_returnParents;
	};
	if ("20Rnd_762x51_DMR" in _p && _item != "20Rnd_762x51_DMR") then { _r = true; };
	//diag_log(format["_r: (%1) _p: (%2) _v: (%4) _c: (%4) _k: (%5) _item: (%6)",_r,_p,_v,_c,_k,_item]);
	if (_r) exitWith {  };

	//block combine actions for magazines
	_a = false;
	if (_k) then {
		_a = ((isClass ((configFile >> "CfgMagazines" >> _item) >> "ItemActions" >> "ReloadMag")) && (_item != "20Rnd_762x51_DMR"));
	};
	if (_a) exitWith { };

	//Disable broken female skins - Handled via humanity morph model exist check
	//if ((_item == "Skin_SurvivorWsequisha_DZ") || (_item == "Skin_SurvivorWsequishaD_DZ")) exitWith { };

	//Block standard RC options for gold bars 
	if !(_item == "ItemGoldBar10oz") then 
	{
		for "_i" from 0 to (_numActions - 1) do 
		{
			_menu = 	_parent displayCtrl (1600 + _i);
			_menu ctrlShow true;
			_config = 	(_cfgActions select _i);
			_type = 	getText	(_config >> "text");
			_script = 	getText	(_config >> "script");
			_outputOriented = 	getNumber	(_config >> "outputOriented") == 1;
			_height = _height + (0.025 * safezoneH);
			_compile =  format["_id = '%2' %1;",_script,_item];
			uiNamespace setVariable ['uiControl', _control];

			if (_outputOriented) then {		
				_array = 	getArray	(_config >> "output");
				_outputClass = _array select 0;
				_outputType = _array select 1;
				_name = getText (configFile >> _outputType >> _outputClass >> "displayName");
				_compile =  format["_id = ['%2',%3] %1;",_script,_item,_array];
			};

			_menu ctrlSetText format[_type,_name];
			_menu ctrlSetEventHandler ["ButtonClick",_compile];
		};

		//block extra rc actions for gold bars!
		_erc_cfgActions = (missionConfigFile >> "ExtraRc" >> _item);
		_erc_numActions = (count _erc_cfgActions);
		if (isClass _erc_cfgActions) then {
		    for "_j" from 0 to (_erc_numActions - 1) do 
		    {
		        _menu =  _parent displayCtrl (1600 + _j + _numActions);
		        _menu ctrlShow true;
		        _config =  (_erc_cfgActions select _j);
		        _text =  getText (_config >> "text");
		        _script =  getText (_config >> "script");
		        _height = _height + (0.025 * safezoneH);
		        uiNamespace setVariable ['uiControl', _control];
		        _menu ctrlSetText _text;
		        _menu ctrlSetEventHandler ["ButtonClick",_script];
		    };
		};
	} else {
		//if item is gold bar
		if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: GearMenu, Gold Right Clicked!"); };
		//spawn gold drop amount slider dialog
		disableSerialization;
		uiNamespace setVariable ['goldDropUISMON', displayNull];
		_ok = createDialog 'goldDropUISMON';
		if (_ok) then {
			if (P2DZE_goldDropUIFirstRun) then {
				if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: GearMenu, Gold Dialog UI Handler Spawned. First run."); };
				[(uiNamespace getVariable 'ZombZ_goldDropUISMON'),nil] spawn ui_goldDrop;
				if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: GearMenu, Gold Dialog UI Handler First run! Gonna run again with delay in 0.5secs!"); };
				P2DZE_goldDropUIFirstRun = false;
				[] spawn {
					sleep 0.5;
					if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: GearMenu, Gold Dialog UI Handler Re-run!"); };
					[(uiNamespace getVariable 'ZombZ_goldDropUISMON'),nil] spawn ui_goldDrop;
				};
			} else {
				if (P2DZE_goldItemHandlingDebug) then { diag_log("P2DEBUG: GearMenu, Gold Dialog UI Handler Spawned."); };
				[(uiNamespace getVariable 'ZombZ_goldDropUISMON'),nil] spawn ui_goldDrop;
			};
		} else {
			systemChat("Error: Drop gold dialog failed to open! Sorry about that...Please try again!");
		};
	};


	
	_pos set [3,_height];

	_group ctrlShow true;
	ctrlSetFocus _group;
	_group ctrlSetPosition _pos;
	_group ctrlCommit 0;
};