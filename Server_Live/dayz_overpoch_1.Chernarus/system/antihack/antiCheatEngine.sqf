private ["_puid","_pname","_LoadTest","_Loaded","_cfg","_cname","_Load","_Unload","_CE1","_CE2","_CE3","_CE4","_CE5","_CE6","_CE7","_CE8","_CE9","_CE10","_CE11","_CE12","_CE13","_CE14","_CEA1","_CEC1","_CEC2","_CEC3","_CEC4","_CEC5","_CEC6","_CEC7","_CEC8","_CEC9","_CEC10","_CEC11","_CEC12","_CEC13","_CEC14","_CECA2","_a","_b","_A","_OL","_OUL","_OL1","_OUL1"];
_pname = _this select 0; _puid = _this select 1; 

_LoadTest = [];
_Loaded = [-1,4,21,24,34,141,142,157,158,159,160,161,162,163,164,165,
166,167,168,169,170,171,172,173,174,175,183,184,185,191,194,195,196,199,215,216,217,218,219,228,229,
230,232,233,240,241,243,244,264,265,274,320,321,324,326,328,329,330,333,334,335,336,337,342,343,344,
345,346,347,348,349,350,351,352,353,354,355,356,358,364,365,497,500,501,503,507,618];

for '_i' from 0 to (count configFile)-1 do {
	if !(_i in _Loaded) then
	{
		_cfg = configFile select _i;
		if(isClass _cfg) then
		{
			_cname = configName _cfg;
			_cfg = configFile >> _cname >> 'controls';
			if(isClass _cfg) then
			{
				_Load = toArray(str(getText(configFile >> _cname >> 'onLoad')));
				_Unload = toArray(str(getText(configFile >> _cname >> 'onUnload')));
				_LoadTest = _LoadTest + [[_cname,_Load,_Unload,_i]];
			};
		};
	};
};

_CE1 = toArray (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
_CE2 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
_CE3 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
_CE4 = toArray (getText(configFile >> 'RscDisplayGear' >> 'onLoad'));
_CE5 = toArray (getText(configFile >> 'RscDisplayInterrupt' >> 'onLoad'));
_CE6 = toArray (getText(configFile >> 'RscDisplayInterrupt' >> 'onUnload'));
_CE7 = toArray (getText(configFile >> 'RscDisplayProfileController' >> 'onLoad'));
_CE8 = toArray (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onLoad'));
_CE9 = toArray (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onUnload'));
_CE10 = toArray (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onLoad'));
_CE11 = toArray (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onUnload'));
_CE12 = toArray (getText(configFile >> 'RscDisplayClientGetReady' >> 'onLoad'));
_CE13 = toArray (getText(configFile >> 'RscDisplayServerGetReady' >> 'onLoad'));
_CE14 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));

call compile ("
	_CE1 = ("+(str _CE1)+");
	_CE2 = ("+(str _CE2)+");
	_CE3 = ("+(str _CE3)+");
	_CE4 = ("+(str _CE4)+");
	_CE5 = ("+(str _CE5)+");
	_CE6 = ("+(str _CE6)+");
	_CE7 = ("+(str _CE7)+");
	_CE8 = ("+(str _CE8)+");
	_CE9 = ("+(str _CE9)+");
	_CE10 = ("+(str _CE10)+");
	_CE11 = ("+(str _CE11)+");
	_CE12 = ("+(str _CE12)+");
	_CE13 = ("+(str _CE13)+");
	_CE14 = ("+(str _CE14)+");
	_CEA1 = [_CE1,_CE2,_CE3,_CE4,_CE5,_CE6,_CE7,_CE8,_CE9,_CE10,_CE11,_CE12,_CE13,_CE14];
	while {11250 == 11250} do
	{
		_CEC1 = (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
		_CEC2 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
		_CEC3 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
		_CEC4 = (getText(configFile >> 'RscDisplayGear' >> 'onLoad'));
		_CEC5 = (getText(configFile >> 'RscDisplayInterrupt' >> 'onLoad'));
		_CEC6 = (getText(configFile >> 'RscDisplayInterrupt' >> 'onUnload'));
		_CEC7 = (getText(configFile >> 'RscDisplayProfileController' >> 'onLoad'));
		_CEC8 = (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onLoad'));
		_CEC9 = (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onUnload'));
		_CEC10 = (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onLoad'));
		_CEC11 = (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onUnload'));
		_CEC12 = (getText(configFile >> 'RscDisplayClientGetReady' >> 'onLoad'));
		_CEC13 = (getText(configFile >> 'RscDisplayServerGetReady' >> 'onLoad'));
		_CEC14 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));				
		_CECA2 = [_CEC1,_CEC2,_CEC3,_CEC4,_CEC5,_CEC6,_CEC7,_CEC8,_CEC9,_CEC10,_CEC11,_CEC12,_CEC13,_CEC14];
		for '_i' from 0 to (count _CEA1)-1 do
		{
			_a = _CEA1 select _i;
			_b = _CECA2 select _i;
			if (str _a != str (toArray _b)) then
			{
				P2DZ_fire = ["+(str _pname)+", "+(str _puid)+",  ('MemoryHack'),  (str [_a,_b])];
				publicVariableServer 'P2DZ_fire';
				[] spawn P2DZ_AHKick;
			};
		};

		uiSleep 0.5;

		_LoadTest = ("+(str _LoadTest)+");
		{
			_A = _x;
			_cname = _A select 0;
			_OL = _A select 1;
			_OUL = _A select 2;
			_OL1 = toArray(str(getText(configFile >> _cname >> 'onLoad')));
			_OUL1 = toArray(str(getText(configFile >> _cname >> 'onUnload')));
			if (str _OL != str _OL1) then
			{
				P2DZ_fire = ["+(str _pname)+", "+(str _puid)+",  ('MemoryHack'),  (str [_OL1,_OL])];
				publicVariableServer 'P2DZ_fire';
				[] spawn P2DZ_AHKick;
			};
			if (str _OUL != str _OUL1) then
			{
				P2DZ_fire = ["+(str _pname)+", "+(str _puid)+",  ('MemoryHack'),  (str [_OUL1,_OUL])];
				publicVariableServer 'P2DZ_fire';
				[] spawn P2DZ_AHKick;
			};
		} forEach _LoadTest;

		uiSleep 60;
	};
");