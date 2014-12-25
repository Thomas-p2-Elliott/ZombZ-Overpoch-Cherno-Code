/*---------------------------------------------------------------------------
P2AI - Event Loops

Contents:

Major Event Timer Loop
Minor Event Timer Loop
Event Map Marker Loop
---------------------------------------------------------------------------*/
//Variable Initialization
P2AIUnitsMinor = [];
P2AIUnitsMajor = [];
P2AIMajDone = false;
P2AIMinDone = false;
//Debug Logging
private["_f","_d"]; _f = "eventLoops"; _d = (P2AI_debugEvents);
if (_d) then { diag_log(format["[P2AI]:%1: Starting!", _f]); };

/*---------------------------------------------------------------------------
Event Map Marker Loop
---------------------------------------------------------------------------*/
[] spawn {
	private ["_run", "_nul", "_zap", "_nil", "_zip"];

	private["_f","_d"]; _f = "eventLoops:MapMarkerLoop"; _d = P2AI_debugEvents;
	if (_d) then { diag_log(format["[P2AI]:%1: Event Map Marker Loop Started", _f]); };

	//Lets define these
	if (isNil "P2AIMajCoords")then{P2AIMajCoords = [0,0,0];};
	if (isNil "P2AIMinCoords")then{P2AIMinCoords = [0,0,0];};

	//Lets start the timer
	_run = true;
	while {_run} do
	{
	    [25,5] call P2AISleep; // sleep 25 seconds
		//If the marker exists (meaning the mission is active) lets delete it and re-add it
		if (!(getMarkerColor "P2AIMajMarker" == "")) then {
			deleteMarker "P2AIMajMarker";
			deleteMarker "P2AIMajDot";
			//Re-Add the markers
			_nul = createMarker ["P2AIMajMarker", P2AIMajCoords];
			"P2AIMajMarker" setMarkerColor "ColorGreen";
			"P2AIMajMarker" setMarkerShape "ELLIPSE";
			"P2AIMajMarker" setMarkerBrush "Grid";
			"P2AIMajMarker" setMarkerSize [400,400];
			_zap = createMarker ["P2AIMajDot", P2AIMajCoords];
			"P2AIMajDot" setMarkerColor "ColorBlack";
			"P2AIMajDot" setMarkerType "Vehicle";
			"P2AIMajDot" setMarkerText P2AIMajName;
		};
		//Lets do the same for the minor mission
		if (!(getMarkerColor "P2AIMinMarker" == "")) then {
			deleteMarker "P2AIMinMarker";
			deleteMarker "P2AIMinDot";
			//Re-Add the markers
			_nil = createMarker ["P2AIMinMarker", P2AIMinCoords];
			"P2AIMinMarker" setMarkerColor "ColorRed";
			"P2AIMinMarker" setMarkerShape "ELLIPSE";
			"P2AIMinMarker" setMarkerBrush "Grid";
			"P2AIMinMarker" setMarkerSize [300,300];
			_zip = createMarker ["P2AIMinDot", P2AIMinCoords];
			"P2AIMinDot" setMarkerColor "ColorBlack";
			"P2AIMinDot" setMarkerType "Vehicle";
			"P2AIMinDot" setMarkerText P2AIMinName;
		};
		//Now we wait another 25 seconds
	};	
};

if (_d) then { diag_log(format["[P2AI]:%1: Event Marker Loop Started", _f]); };
if (_d) then { diag_log(format["[P2AI]:%1: Starting Major Event Timer", _f]); };
/*---------------------------------------------------------------------------
Major Event Timer
---------------------------------------------------------------------------*/
[] spawn {
	private ["_timeDiff", "_timeVar", "_run", "_wait", "_cntMis", "_ranMis", "_varName"];

	//Let's get our time Min and Max
	_timeDiff = P2AIMajorMax - P2AIMajorMin;
	_timeVar = _timeDiff + P2AIMajorMin;

	private["_f","_d"]; _f = "eventLoops:MajorEventTimer"; _d = P2AI_debugEvents;
	if (_d) then { diag_log(format["[P2AI]:%1: Major Event Timer: Max Time Between Events: %2", _f, _timeVar]); };

	//Lets get the loop going
	_run = true;
	while {_run} do
	{
		//Lets wait the random time
		_wait  = round(random _timeVar);
	    [_wait,5] call P2AISleep;
		
		//Let's check that there are events in the array.
		//If there are none, lets end the timer.
		_cntMis = count P2AIMajorArray;
		if (_cntMis == 0) then { _run = false; };

		//Lets pick an event
		_ranMis = floor (random _cntMis);
		_varName = P2AIMajorArray select _ranMis;
	    
		if (_d) then { diag_log(format["[P2AI]:%1: Starting A New Major Event: %2", _f, _varName]); };

	    // clean up all the existing units before starting a new one
	    {if (alive _x) then {_x call P2AIPurgeObject;};} forEach P2AIUnitsMajor;
	    
	    // rebuild the array for the next event
	    P2AIUnitsMajor = [];
	    
		//Let's Run the event
		[] execVM format ["%1\events\Major\%2.sqf",P2AI_FileLocation,_varName];
		
		//Let's wait for it to finish or timeout
		waitUntil {P2AIMajDone};
		P2AIMajDone = false;
		if (_d) then { diag_log(format["[P2AI]:%1: Major Event Finished: %2", _f, _varName]); };
	};
};

/*---------------------------------------------------------------------------
Minor Event Timer
---------------------------------------------------------------------------*/
if (_d) then { diag_log(format["[P2AI]:%1: Major Event Timer Started", _f]); };
if (_d) then { diag_log(format["[P2AI]:%1: Starting Minor Event Timer", _f]); };

[] spawn {
	private ["_timeDiff", "_timeVar", "_run", "_wait", "_cntMis", "_ranMis", "_varName"];

	//Let's get our time Min and Max
	_timeDiff = P2AIMinorMax - P2AIMinorMin;
	_timeVar = _timeDiff + P2AIMinorMin;

	private["_f","_d"]; _f = "eventLoops:MinorEventTimer"; _d = P2AI_debugEvents;
	if (_d) then { diag_log(format["[P2AI]:%1: Minor Event Timer: Max Time Between Events: %2", _f, _timeVar]); };

	//Lets get the loop going
	_run = true;
	while {_run} do
	{
		//Lets wait the random time
		_wait  = round(random _timeVar);
	    [_wait,5] call P2AISleep;
		
		//Let's check that there are events in the array.
		//If there are none, lets end the timer.
		_cntMis = count P2AIMinorArray;
		if (_cntMis == 0) then { _run = false; };
		
		//Lets pick a event
		_ranMis = floor (random _cntMis);
		_varName = P2AIMinorArray select _ranMis;
	    
		if (_d) then { diag_log(format["[P2AI]:%1: Starting A New Minor Event: %2", _f, _varName]); };

	    // clean up all the existing units before starting a new one
	    {if (alive _x) then {_x call P2AIPurgeObject;};} forEach P2AIUnitsMinor;
	    
	    // reset the array for the next event
	    P2AIUnitsMinor = [];
	    
		//Let's Run the event
		[] execVM format ["%1\events\Minor\%2.sqf",P2AI_FileLocation,_varName];

		//Let's wait for it to finish or timeout
		waitUntil {P2AIMinDone};
		P2AIMinDone = false;
		if (_d) then { diag_log(format["[P2AI]:%1: Minor Event Finished: %2", _f, _varName]); };
	};	

};

if (_d) then { diag_log(format["[P2AI]:%1: Minor Event Timer Started", _f]); };
if (_d) then { diag_log(format["[P2AI]:%1: eventLoops Finished!", _f]); };
