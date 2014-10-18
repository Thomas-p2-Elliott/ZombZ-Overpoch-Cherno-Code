P2DZE_deathMessage = {
	private ['_killerVehicle','_killer','_victim','_victimName','_killerName','_weaponClassname','_picture','_killerDistance','_isCar','_isHeli','_isBoat','_killedByVehicle'];
	_killerVehicle = 	objNull;
	_killer = 			objNull;
	_victim = 			objNull;
	_victimName = 		'';
	_killerName = 		'';
	_weaponClassname =  '';
	_picture = 			'';
	_killerDistance = 	0;
	_isCar =			false;
	_isHeli =			false;
	_isBoat = 			false;
	_killedByVehicle = 	false;

	_killer = 			_this;
	_killerName = 		name _killer;
	_killerVehicle = 	vehicle _killer;
	_weaponClassname = 	weaponState _killer;
	_victim = 			player;
	_victimName = 		dayz_playerName;

	_killerDistance = _victim distance _killer;
	_killerDistance = floor(_killerDistance);

	if ((getText (configFile >> 'CfgVehicles' >> (typeOf _killerVehicle) >> 'vehicleClass')) in ['CarW','Car','CarD','Armored','Ship','Support','Air','ArmouredW','ArmouredD','SupportWoodland_ACR']) then {
		_killedByVehicle = true;
	};	

	_isCar = _killerVehicle isKindOf 'Car';
	_isHeli = _killerVehicle isKindOf 'Air';
	_isBoat = _killerVehicle isKindOf 'Sea';

	if (_isCar || _isHeli || _isBoat) then {
		_killedByVehicle = true;
	};

	if (_killedByVehicle) then {
		_weaponClassname = typeOf _killerVehicle;
		_picture = (gettext (configFile >> 'cfgVehicles' >> (_weaponClassname) >> 'picture'));
	} else {
		if (_weaponClassname select 0 == 'Throw') then 
		{
			_weaponClassname = _weaponClassname select 3;
		}
		else
		{
			_weaponClassname = _weaponClassname select 0;
		};

		_picture = (gettext (configFile >> 'cfgWeapons' >> (_weaponClassname) >> 'picture'));
	};

	if (!isNil '_victimName' && !isNil '_killerName' && !isNil '_killerDistance' && !isNil '_picture') then {
		if ((_victimName != '') && (_killerName != '') && (_killerDistance > 0) && (_picture != '')) then {
			P2DZE_dM = [_victimName,_killerName,_killerDistance,_picture];
			publicVariable 'P2DZE_dM';
		};
	};
};

'P2DZE_dM' addPublicVariableEventHandler {
	[] spawn {
		private ['_victim','_killer','_weapon','_distance','_method','_killerVehicle','_vehicle','_adjectiveChance','_killerName','_isCar','_isHeli','_isBoat','_vType','_adjective','_victimName','_message','_fullmessage','_killerDist','_weaponType','_isWeaponVehicle','_weaponClassname','_picture','_safeZoneOffset','_layer'];		
		_victimName = P2DZE_dM select 0;
		_killerName = P2DZE_dM select 1;
		_killerDist = P2DZE_dM select 2;
		_picture = 	  P2DZE_dM select 3;

		switch (ceil(random 10)) do {
    		case (1): 	{ _adjective = 'murdered'; 		};
    		case (2): 	{ _adjective = 'taken out'; 	};
    		case (3): 	{ _adjective = 'killed'; 		};
    		case (4): 	{ _adjective = 'defeated'; 		};
    		case (5): 	{ _adjective = 'wasted'; 		};
    		case (6): 	{ _adjective = 'assasinated'; 	};
    		case (7): 	{ _adjective = 'finished off';	};
    		case (8): 	{ _adjective = 'dispatched'; 	};
    		case (9): 	{ _adjective = 'slaughtered';	};
    		case (10): 	{ _adjective = 'executed'; 		};
   			default 	{ _adjective = 'killed'; 		};
		};

		offset_check =
		{
			if (isNil 'kill_txt1') then {kill_txt1=false;};
			if (isNil 'kill_txt2') then {kill_txt2=false;};
			if (isNil 'kill_txt3') then {kill_txt3=false;};
			if (isNil 'kill_txt4') then {kill_txt4=false;};
			if (isNil 'kill_txt5') then {kill_txt5=false;};
			if (kill_txt1) then {
				display_text = 0;
				offset_check_done = true;
			} else {
				if (kill_txt2) then {
					display_text = 1;
					offset_check_done = true;
				} else {
					if (kill_txt3) then {
						display_text = 2;
						offset_check_done = true;
					} else {
						if (kill_txt4) then {
							display_text = 3;
							offset_check_done = true;
						} else {
							if (kill_txt5) then {
								display_text = 4;
								offset_check_done = true;
							} else {
								offset_check_done = true;
							};
						};
					};
				};
			};
		};

		if (isNil 'display_text') then {
			display_text = 0;
		} else {
			display_text = display_text + 1;
		};

		call offset_check;
		waitUntil {offset_check_done};

		if (display_text == 0) then {
			_safeZoneOffset = 0;
			_layer = 6000;
			[] spawn {kill_txt1 = false;sleep 10;kill_txt1 = true;};
		};
		if (display_text == 1) then {
			_safeZoneOffset = 0.05;
			_layer = 6001;
			[] spawn {kill_txt2 = false;sleep 10;kill_txt2 = true;};
		};
		if (display_text == 2) then {
			_safeZoneOffset = 0.1;
			_layer = 6002;
			[] spawn {kill_txt3 = false;sleep 10;kill_txt3 = true;};
		};
		if (display_text == 3) then {
			_safeZoneOffset = 0.15;
			_layer = 6003;
			[] spawn {kill_txt4 = false;sleep 10;kill_txt4 = true;};
		};
		if (display_text == 4) then {
			_safeZoneOffset = 0.2;
			_layer = 6004;
			[] spawn {kill_txt5 = false;sleep 10;kill_txt5 = true;};
		};
		if (display_text > 4) then {
			_safeZoneOffset = 0.25;
			_layer = 6005;
			[] spawn {display_text0 = false;sleep 10;display_text0 = true;};
		};

		_fullmessage = format [
		""<t color='#ffffff' align='left' size='0.66'>%1</t><img align='left' size='1' image='%2'/><t color='#ffffff' align='left' size='0.66'>(%4m) %3</t>"", 
		_killerName, _picture, _victimName, _distance];

		[
			_fullmessage,
			safezoneX,
			(safezoneY+_safeZoneOffset),
			9,
			0,
			0,
			_layer
		] spawn bis_fnc_dynamictext;
	};
};

