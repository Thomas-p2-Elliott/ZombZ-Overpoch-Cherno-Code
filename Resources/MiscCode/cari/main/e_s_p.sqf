private ["_text"];
_text = "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
neXt_G_B_isp = {	if (isNil "STatus_3B_ESP") then {STatus_3B_ESP = 0;};
	if (STatus_3B_ESP == 0) then 
	{
		cutText [" ESP Enabled", "PLAIN DOWN"];
		systemChat format["[BB-Console] ESP enabled"];
		B_1_g_B_3_nSS_Pro_E_s_p = {
			disableSerialization;
			if (isNil "Id_4_isp") then {Id_4_isp = 2733;};
			Id_4_isp cutRsc ["rscDynamicText", "PLAIN"];
			Id_4_isp = Id_4_isp + 1;
			_cntr0l_nXGB = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
			_cntr0l_nXGB ctrlShow true; 
			_cntr0l_nXGB ctrlEnable true; 
			_cntr0l_nXGB ctrlSetFade 0;
			_targ_pl = _this select 0;
			while {((((positionCameraToWorld [0,0,0]) distance _targ_pl) < B3_B_B_dist) && (STatus_3B_ESP == 1))} do
			{
				if ((isNull _targ_pl) || !(alive _targ_pl)) exitWith {};
			    if (getPlayerUID _targ_pl == '') exitWith {};
	        
				_p00s = (positionCameraToWorld [0,0,0]);
				_p00sU = getPos _targ_pl;
				_diiist = round(_p00s distance _p00sU);
			
				
				_vih = vehicle _targ_pl;
				_p00sU2 = [(getPosATL _vih) select 0, (getPosATL _vih) select 1, ((getPosATL _vih) select 2) + (((boundingBox _vih) select 1) select 2) + 1.5];
				_p00s2D = worldToScreen _p00sU2;
				if (count _p00s2D > 0) then	{
					if (_diiist <= 100) then {_cntr0l_nXGB ctrlSetFade 0;};
					if (_diiist > 100) then {_cntr0l_nXGB ctrlSetFade 0.1;};
					if (_diiist > 250) then {_cntr0l_nXGB ctrlSetFade 0.2;};
					if (_diiist > 500) then {_cntr0l_nXGB ctrlSetFade 0.3;};
					if (_diiist > 750) then {_cntr0l_nXGB ctrlSetFade 0.4;};
					if (_diiist > 1000) then {_cntr0l_nXGB ctrlSetFade 0.5;};
					if (_diiist > 1250) then {_cntr0l_nXGB ctrlSetFade 0.6;};
					if (_diiist > 1500) then {_cntr0l_nXGB ctrlSetFade 0.7;};
					if (_diiist > 1750) then {_cntr0l_nXGB ctrlSetFade 0.8;};
					if (_diiist > 2500) then {_cntr0l_nXGB ctrlSetFade 0.85;};
			
					_T_size = 0.35;	
					_hand = currentWeapon _targ_pl;
					_weppName = getText(configFile >> "cfgWeapons" >> _hand >> "displayName");
					if(_weppName == "") then {_weppName = _hand;};
					_selecteditemDescription = format['<t size=''%3'' font=''TahomaB'' color=''#FD1D18''>%1<br/>[%2m]</t>',name _targ_pl,round _diiist,_T_size];
					if (name _targ_pl == name player) then {_selecteditemDescription = ''};
					if (_targ_pl != _vih) then {
						_passengers = [];
						{_passengers = _passengers + [name _x];} forEach crew _vih;
						_p00sU2 = [_p00sU2 select 0,_p00sU2 select 1,(_p00sU2 select 2) + 2];
						_p00s2D = worldToScreen _p00sU2;
						_selecteditemDescription = format['<t size=''%3'' font=''TahomaB'' color=''#1593F0''>%1<br/>[%2m]<br/>%4</t>',_passengers,round _diiist,_T_size,typeOf _vih];
					};
					_cntr0l_nXGB ctrlSetStructuredText (parseText _selecteditemDescription);
					if (count _p00s2D > 1.5) then {_cntr0l_nXGB ctrlSetPosition [(_p00s2D select 0) - (safezoneW / 2), (_p00s2D select 1), safezoneW, safezoneH];};
					_cntr0l_nXGB ctrlCommit 0;
				};
				uisleep .001;
			};
			_cntr0l_nXGB ctrlShow false;
			_cntr0l_nXGB ctrlEnable false;
			_a = _a - [_targ_pl];
		};
		STatus_3B_ESP = 1;
		B3_B_B_dist = 2500;
		_a = [];
		while {STatus_3B_ESP == 1} do
		{
	       	{	/*_p00s = (positionCameraToWorld [0,0,0]); _p00sX = getPos _x;	_diiist = (_p00s distance _p00sX);*/
				if ((_x != player) && (name _x != "") && !(_x in _a) && ((player distance _x) < B3_B_B_dist)) then {
					_a = _a + [_x];
					[_x] spawn B_1_g_B_3_nSS_Pro_E_s_p;
				};
				if ((_x in _a) && (_diiist > B3_B_B_dist)) then {_a = _a - [_x];};
			//} forEach ([1,2,3] nearEntities ['AllVehicles',16000]); 
			} forEach playableUnits;	
			uisleep .5;
		};
	} 
	else 
	{
		STatus_3B_ESP = 0;
		cutText [" ESP Dissabled", "PLAIN DOWN"];
		systemChat format["[BB-Console] ESP Disabled"];
	};
};
call neXt_G_B_isp;