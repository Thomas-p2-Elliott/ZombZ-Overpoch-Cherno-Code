private ["_rExec"];
_rExec = compile ("
'P2DZ_mH' addPublicVariableEventHandler {
	_hintType = P2DZ_mH select 0;
	_text = P2DZ_mH select 1;
	_gps = P2DZ_mH select 2;
	_vehicleName = P2DZ_mH select 3;

	if (debugMonitor) then 	{
		debugMonitor = false;
	    [] spawn { sleep 10; [] spawn fnc_debug; };
	};

	_pic = getText (configFile >> ""cfgVehicles"" >> _vehicleName >> ""picture"");

	switch (_hintType) do {
    	case ""1"": { 
		  		hintSilent parseText format [""<img size='4.0' image='%1' /><br/><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>%2<br/><br/>
		        </t><t size='0.5' font='Bitstream' align='center' color='#000000'>- - - - - - -</t><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>GPS:</t>
		        <t size='0.95' font='Bitstream' align='right' color='#00FF00'> %3</t>
		        <br/><br/>"",
				(_pic),
				(_text),
				(_gps)
				];
    	};
    	case ""2"": { 
		 		hintSilent parseText format [""<img size='4.0' image='%1' /><br/><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>%2<br/><br/>
		        </t><t size='0.5' font='Bitstream' align='center' color='#000000'>- - - - - - -</t><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFFFFF'>GPS:</t>
		        <t size='0.95' font='Bitstream' align='right' color='#FF0000'> %3</t>
		        <br/><br/>"",
				(_pic),
				(_text),
				(_gps)
				];
    	};
    	case ""3"": { 
		  hintSilent parseText format [""<img size='4.0' image='image\logo.paa' /><br/><t size='0.5' font='Bitstream' align='left' color='#000000'>
		  		- - - - - - - </t><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFBF00'>%2<br/><br/>%3</t><br/><br/>"",
				(_pic),
				(_gps),
				(_text)
				];
    	};
    	case ""4"": { 
		  hintSilent parseText format [""<img size='4.0' image='scripts\y.paa' /><br/><t size='0.5' font='Bitstream' align='left' color='#000000'>
		  		- - - - - - - </t><br/>
		        <t size='0.95' font='Bitstream' align='left' color='#FFBF00'>%2<br/><br/>%3</t><br/><br/>"",
				(_pic),
				(_text),
				(_gps)
				];
    	};
	};
};



'goldRead' addPublicVariableEventHandler {
	_goldRead = goldRead;
	goldRead = nil;
	diag_log (""[P2ARMA2NET]: goldRead: "" + str(_goldRead));

	currentUid = _goldRead select 0; 		
	currentGold = _goldRead select 1;		
	currentGold10z = _goldRead select 2;	
	currentBriefcases = _goldRead select 3;	

	diag_log (""[P2ARMA2NET]: goldRead UID: "" + str(currentUid));
	diag_log (""[P2ARMA2NET]: goldRead Gold: "" + str(currentGold));
	diag_log (""[P2ARMA2NET]: goldRead Gold10Z: "" + str(currentGold10z));
	diag_log (""[P2ARMA2NET]: goldRead Briefcases: "" + str(currentBriefcases));
};

'goldWrite' addPublicVariableEventHandler {
	_goldWrite = goldWrite;
	goldWrite = nil;
	diag_log (""[P2ARMA2NET]: goldWrite Current Balance: "" + str(_goldWrite));

	currentUid = _goldWrite select 0; 		
	currentGold = _goldWrite select 1;		

	if (currentGold == ""failed"") exitWith {
		diag_log (""[P2ARMA2NET]: GoldWrite Transaction Failed UID: "" + str(currentUid));
		cutText [(""[ZombZ Bank] Transaction Failed, not enough funds.""), ""PLAIN DOWN""];
	};

	currentGold10z = _goldWrite select 2;	
	currentBriefcases = _goldWrite select 3;	

	diag_log (""[P2ARMA2NET]: GoldWrite UID: "" + str(currentUid));
	diag_log (""[P2ARMA2NET]: GoldWrite New Balance Gold: "" + str(currentGold));
	diag_log (""[P2ARMA2NET]: GoldWrite New Balance Gold10Z: "" + str(currentGold10z));
	diag_log (""[P2ARMA2NET]: GoldWrite New Balance Briefcases: "" + str(currentBriefcases));
};

'P2DZ_dS' addPublicVariableEventHandler {
	[] spawn {
		private [""_victim"",""_killer"",""_weapon"",""_distance"",""_method"",""_killerVehicle"",""_vehicle"",""_adjectiveChance"",""_killerName"",""_isCar"",""_isHeli"",""_isBoat"",""_vType"",""_adjective"",""_victimName"",""_message"",""_fullmessage""];
		_victim = 	P2DZ_dS select 0;
		_killer = 	P2DZ_dS select 1;
		_weapon = 	P2DZ_dS select 2;
		_distance = P2DZ_dS select 3;
		_method = 	P2DZ_dS select 4;

		_killerVehicle = false;

		waitUntil {!isNull _killer};

		_vehicle = vehicle _killer;			
		_adjectiveChance = round (random 4);
		_killerName = (name _killer);

		waitUntil {!isNil ""_vehicle""};

		_isCar = _vehicle isKindOf ""Car"";
		_isHeli = _vehicle isKindOf ""Air"";
		_isBoat = _vehicle isKindOf ""Sea"";
		_vType = (typeOf _vehicle);
		_adjective = ""killed"";

		waitUntil {!isNil ""_adjectiveChance""};

		if (_adjectiveChance > 1) then {
			if (_adjectiveChance > 2) then {
				if (_adjectiveChance > 3) then {
					_adjective = ""taken out"";
				};
			_adjective = ""gunned down"";
			};
			_adjective = ""murdered"";
		};

		if (_isCar) then {
			_killerVehicle = true;
		};
		if (_isHeli) then {
			_killerVehicle = true;
		};		
		if (_isBoat) then {
			_killerVehicle = true;
		};

		waitUntil {!isNil ""_killerName""};
		waitUntil {!isNil ""_adjective""};

		waitUntil {!isNull _victim};

		_victimName = (name _victim);
		waitUntil {!isNil ""_victimName""};

		if (_killerVehicle) then {
			_message = format[""%1 was %5 by %2 with vehicle %3 from %4m."",_victimName, _killerName, _vType, _distance, _adjective];
			systemChat ((str _message)+ "". "");
			KM_pic = (gettext (configFile >> 'cfgVehicles' >> _vType >> 'picture'));
		} else {

			//headshot detection (testing) (player2)
			if (_method == ""shot_head"") then { 
				_message = format[""%1 was %5 by %2 with weapon %3 from %4m with a headshot!"",_victimName, _killerName, _weapon, _distance, _adjective];
				systemChat ((str _message)+ "". "");
			} else {
				_message = format[""%1 was %5 by %2 with weapon %3 from %4m."",_victimName, _killerName, _weapon, _distance, _adjective];
				systemChat ((str _message)+ "". "");
			};
			
			KM_pic = (gettext (configFile >> 'cfgWeapons' >> (_weapon) >> 'picture'));
		};

		offset_check =
		{
			if (isNil ""kill_txt1"") then {kill_txt1=false;};
			if (isNil ""kill_txt2"") then {kill_txt2=false;};
			if (isNil ""kill_txt3"") then {kill_txt3=false;};
			if (isNil ""kill_txt4"") then {kill_txt4=false;};
			if (isNil ""kill_txt5"") then {kill_txt5=false;};
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

		if (isNil ""display_text"") then {display_text = 0;} else {display_text = display_text + 1;};
		call offset_check;
		waitUntil {offset_check_done};
		if (display_text == 0) then {
			KM_safeOffset = 0;
			K_lvl = 6000;
			[] spawn {kill_txt1 = false;sleep 10;kill_txt1 = true;};
		};
		if (display_text == 1) then {
			KM_safeOffset = 0.05;
			K_lvl = 6001;
			[] spawn {kill_txt2 = false;sleep 10;kill_txt2 = true;};
		};
		if (display_text == 2) then {
			KM_safeOffset = 0.1;
			K_lvl = 6002;
			[] spawn {kill_txt3 = false;sleep 10;kill_txt3 = true;};
		};
		if (display_text == 3) then {
			KM_safeOffset = 0.15;
			K_lvl = 6003;
			[] spawn {kill_txt4 = false;sleep 10;kill_txt4 = true;};
		};
		if (display_text == 4) then {
			KM_safeOffset = 0.2;
			K_lvl = 6004;
			[] spawn {kill_txt5 = false;sleep 10;kill_txt5 = true;};
		};
		if (display_text > 4) then {
			KM_safeOffset = 0.25;
			K_lvl = 6005;
			[] spawn {display_text0 = false;sleep 10;display_text0 = true;};
		};

		_fullmessage = format [""<t color='#ffffff' align='left' size='0.66'>%1</t><img align='left' size='1' image='%2'/><t color='#ffffff' align='left' size='0.66'>(%4m) %3</t>"", 
		_killerName, KM_pic, _victimName, _distance];

		[
			_fullmessage,
			safezoneX,
			(safezoneY+KM_safeOffset),
			9,
			0,
			0,
			K_lvl
		] spawn bis_fnc_dynamictext;
	};
};




































");

["ZombZ EventHandlers",_rExec] call fnc_p2_RemoteExecute;