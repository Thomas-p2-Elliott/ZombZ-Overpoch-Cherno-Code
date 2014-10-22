'P2DZE_DeathMessage_GUI' addPublicVariableEventHandler {
	[] spawn {
		private ["_victimName","_killerName","_killerDist","_picture","_adjective","_safeZoneOffset","_layer","_fullmessage"];
		_victimName = P2DZE_dM select 0;
		_killerName = P2DZE_dM select 1;
		_killerDist = P2DZE_dM select 2;
		_picture = 	  P2DZE_dM select 3;

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
		"<t color='#ffffff' align='left' size='0.66'>%1</t><img align='left' size='1' image='%2'/><t color='#ffffff' align='left' size='0.66'>(%4m) %3</t>", 
		_killerName, _picture, _victimName, _killerDist];

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