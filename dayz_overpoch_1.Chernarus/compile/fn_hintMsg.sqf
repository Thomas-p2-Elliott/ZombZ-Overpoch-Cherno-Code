//Custom Hint Messages by player2 for www.zombz.net:
P2DZ_hintFull						= {
	private["_continue"];
	if (isNil "zombz_hintFull_last_title") then
	{
	   zombz_hintFull_last_title = "";
	};
	if (isNil "zombz_hintFull_last_text") then
	{
	   zombz_hintFull_last_text = "";
	};

	_continue = true;
	if (count _this > 4) then
	{
	   if (((_this select 4) select 1) != 35) then
	   {
	      _continue = false;
	   }
	   else
	   {
	      if (!isNull (uiNamespace getVariable 'zombz_hintFull')) then
	      { 
	         _continue = false;
	         titleText["", "PLAIN"]; 
	      };
	   };
	};

	if (_continue) then
	{
	   uiNamespace setVariable ["zombz_hintFull", displayNull];
	   667 cutRsc ["zombz_hintFull", "PLAIN"];
	   zombz_hintFull_last_title = _this select 0;
	   zombz_hintFull_last_text = _this select 1;
	   zombz_hintFull_color = _this select 2;
	   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9105) ctrlSetBackgroundColor zombz_hintFull_color;
	   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9105) ctrlSetStructuredText parseText(zombz_hintFull_last_text);;
	   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9106) ctrlSetStructuredText parseText(zombz_hintFull_last_title);
	   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9107) ctrlSetStructuredText parseText(zombz_hintFull_last_text);
	};
};

P2DZ_hintMini						= {
	private["_continue"];
	if (isNil "zombz_hintMini_last_title") then
	{
	   zombz_hintMini_last_title = "";
	};
	if (isNil "zombz_hintMini_last_text") then
	{
	   zombz_hintMini_last_text = "";
	};

	_continue = true;
	if (count _this > 4) then
	{
	   if (((_this select 4) select 1) != 35) then
	   {
	      _continue = false;
	   }
	   else
	   {
	      if (!isNull (uiNamespace getVariable 'zombz_hintMini')) then
	      { 
	         _continue = false;
	         titleText["", "PLAIN"]; 
	      };
	   };
	};

	if (_continue) then
	{
	   uiNamespace setVariable ["zombz_hintMini", displayNull];
	   667 cutRsc ["zombz_hintMini", "PLAIN"];
	   zombz_hintMini_last_title = _this select 0;
	   zombz_hintMini_last_text = _this select 1;
	   zombz_hintMini_color = _this select 2;
	   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9101) ctrlSetBackgroundColor zombz_hintMini_color;
	   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9101) ctrlSetStructuredText parseText(zombz_hintFull_last_text);;
	   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9102) ctrlSetStructuredText parseText(zombz_hintMini_last_title);
	   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9103) ctrlSetStructuredText parseText(zombz_hintMini_last_text);
	};
};
