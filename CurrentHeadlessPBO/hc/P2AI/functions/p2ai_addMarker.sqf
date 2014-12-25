P2AIAddMajMarker = {
	private["_nul","_nil"];
	P2AIMajCoords = _this select 0;
	P2AIMajName = _this select 1;

	_nul = createMarker ["P2AIMajMarker", P2AIMajCoords];
	"P2AIMajMarker" setMarkerColor "ColorGreen";
	"P2AIMajMarker" setMarkerShape "ELLIPSE";
	"P2AIMajMarker" setMarkerBrush "Grid";
	"P2AIMajMarker" setMarkerSize [175,175];
	_nil = createMarker ["P2AIMajDot", P2AIMajCoords];
	"P2AIMajDot" setMarkerColor "ColorBlack";
	"P2AIMajDot" setMarkerType "Vehicle";
	"P2AIMajDot" setMarkerText P2AIMajName;
	
	private["_f","_d"]; _f = "addMarker:P2AIAddMajMarker"; _d = (P2AI_debugEvents);
	if (_d) then { diag_log(format["[P2AI]:%1: %2 @ %3", _f, P2AIMajName, P2AIMajCoords]); };
};


P2AIAddMinMarker = {
	private["_nul","_nil"];
	P2AIMinCoords = _this select 0;
	P2AIMinName = _this select 1;

	_nul = createMarker ["P2AIMinMarker", P2AIMinCoords];
	"P2AIMinMarker" setMarkerColor "ColorRed";
	"P2AIMinMarker" setMarkerShape "ELLIPSE";
	"P2AIMinMarker" setMarkerBrush "Grid";
	"P2AIMinMarker" setMarkerSize [150,150];
	_nil = createMarker ["P2AIMinDot", P2AIMinCoords];
	"P2AIMinDot" setMarkerColor "ColorBlack";
	"P2AIMinDot" setMarkerType "Vehicle";
	"P2AIMinDot" setMarkerText P2AIMinName;

	private["_f","_d"]; _f = "addMarker:P2AIAddMinMarker"; _d = (P2AI_debugEvents);
	if (_d) then { diag_log(format["[P2AI]:%1: %2 @ %3", _f, P2AIMinName, P2AIMinCoords]); };

};