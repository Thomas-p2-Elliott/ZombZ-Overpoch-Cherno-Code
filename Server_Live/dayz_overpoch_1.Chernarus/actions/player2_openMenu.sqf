private ["_m"];
disableSerialization;
_m = "No Display";
_m = uiNamespace getVariable ["p2_options", "No Display"];

if (str _m != "No Display") then {
	private["_p", "_bg", "_nt", "_vd", "_en", "_kn", "_sn", "_db", "_ntV", "_vdV", "_nA", "_nB", "_c", "_dbV", "_bgc"];
	_p = player;

	// "ListBox Control Vars"
	_nt = 7601;
	_vd = 7602;
	_en = 7603;
	_kn = 7604;
	_sn = 7605;
	_db = 7606;

	// "Add Options to Boxes"
	((_m) displayCtrl _nt) lbAdd 'Enabled';
	((_m) displayCtrl _nt) lbAdd 'Disabled';
	((_m) displayCtrl _vd) lbAdd '500';
	((_m) displayCtrl _vd) lbAdd '750';
	((_m) displayCtrl _vd) lbAdd '1000';
	((_m) displayCtrl _vd) lbAdd '1250';
	((_m) displayCtrl _vd) lbAdd '1500';
	((_m) displayCtrl _vd) lbAdd '1750';
	((_m) displayCtrl _vd) lbAdd '2000';
	((_m) displayCtrl _vd) lbAdd '2500';
	((_m) displayCtrl _vd) lbAdd '3000';
	((_m) displayCtrl _en) lbAdd 'Enabled (Full)';
	((_m) displayCtrl _en) lbAdd 'Enabled (Chat)';
	((_m) displayCtrl _en) lbAdd 'Disabled';
	((_m) displayCtrl _kn) lbAdd 'Enabled (Full)';
	((_m) displayCtrl _kn) lbAdd 'Enabled (Chat)';
	((_m) displayCtrl _kn) lbAdd 'Disabled';
	((_m) displayCtrl _sn) lbAdd 'Enabled (Full)';
	((_m) displayCtrl _sn) lbAdd 'Enabled (Chat)';
	((_m) displayCtrl _sn) lbAdd 'Disabled';
	((_m) displayCtrl _db) lbAdd 'Enabled (Full)';
	((_m) displayCtrl _db) lbAdd 'Enabled (Mini)';
	((_m) displayCtrl _db) lbAdd 'Disabled';


	// "View Distance"
	_vdV = 1000;
	_vdV = viewDistance;
	_vdV = switch (true) do {
 		default { 3 };
 		case (((_vdV >= 0) && (_vdV <= 500))): { 0 };
	    case ((_vdV > 500) && (_vdV < 750)): { 1 };
	    case ((_vdV >= 750) && (_vdV <= 1000)): { 2 };
	    case ((_vdV > 1000) && (_vdV < 1250)): { 3 };
	    case ((_vdV >= 1250) && (_vdV <= 1500)): { 4 };
	    case ((_vdV > 1500) && (_vdV < 1750)): { 5 };
	    case ((_vdV >= 1750) && (_vdV <= 2000)): { 6 };
	    case ((_vdV > 2000) && (_vdV <= 2500)): { 7 };
	    case ((_vdV > 2500)): { 8 };
	};

	switch (_vdV) do {
		default { ((_m) displayCtrl _vd) lbSetCurSel 0; };
		case 0: { ((_m) displayCtrl _vd) lbSetCurSel 0;	};
		case 1: { ((_m) displayCtrl _vd) lbSetCurSel 1;	};
		case 2: { ((_m) displayCtrl _vd) lbSetCurSel 2;	};
		case 3: { ((_m) displayCtrl _vd) lbSetCurSel 3;	};
		case 4: { ((_m) displayCtrl _vd) lbSetCurSel 4;	};
		case 5: { ((_m) displayCtrl _vd) lbSetCurSel 5;	};
		case 6: { ((_m) displayCtrl _vd) lbSetCurSel 6;	};
		case 7: { ((_m) displayCtrl _vd) lbSetCurSel 7;	};
		case 8: { ((_m) displayCtrl _vd) lbSetCurSel 8;	};
	};


	// "Name Tags"

	_ntV = false;
	_ntV = _p getVariable ["DZE_display_name", false];
	if (_ntV) then {
		((_m) displayCtrl _nt) lbSetCurSel 0;
	} else {
		((_m) displayCtrl _nt) lbSetCurSel 1;
	};

	// "Notifications"

	_nA = P2DZ_notifsMode;
	_nB = [_en,_kn,_sn];
	if (isNil "_nA") then {
		_nA = [2,2,2];
	};

	_c = 0;
	{
		switch (_x) do {
			default { ((_m) displayCtrl (_nB select _c)) lbSetCurSel 0; };
			case 0: { ((_m) displayCtrl (_nB select _c)) lbSetCurSel 2;	};
			case 1: { ((_m) displayCtrl (_nB select _c)) lbSetCurSel 1;	};
			case 2: { ((_m) displayCtrl (_nB select _c)) lbSetCurSel 0;	};
		};
		_c = _c + 1;
	} count _nA;

 
	// "Debug Monitor"

	_dbV = 2;
	_dbV = P2DZ_dbCurMode; 

	switch (_dbV) do {
		default { ((_m) displayCtrl _db) lbSetCurSel 0; };
		case 1: { ((_m) displayCtrl _db) lbSetCurSel 2;	};
		case 2: { ((_m) displayCtrl _db) lbSetCurSel 0;	};
		case 3: { ((_m) displayCtrl _db) lbSetCurSel 1;	};
	};


	// "Background Colour"
	_bg = [8850,8851,8852];
	_bgc = P2DZE_debugCol;
	if (isNil '_bgc') then { _bgc = [0,0,0,0.2]; };
	{
	  	((_m) displayCtrl _x) ctrlSetBackgroundColor _bgc;
	} count _bg;
};   
 


