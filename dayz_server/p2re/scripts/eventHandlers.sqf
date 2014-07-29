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









































");

["ZombZ EventHandlers",_rExec] call fnc_p2_RemoteExecute;