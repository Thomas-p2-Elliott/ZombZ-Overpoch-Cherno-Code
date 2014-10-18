private ["_rExec"];
_rExec = compile ("
'P2DZ_mH' addPublicVariableEventHandler {
	_hintType = P2DZ_mH select 0;
	_text = P2DZ_mH select 1;
	_gps = P2DZ_mH select 2;
	_vehicleName = P2DZ_mH select 3;

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
");

["ZombZ EventHandlers",_rExec] call fnc_p2_RemoteExecute;