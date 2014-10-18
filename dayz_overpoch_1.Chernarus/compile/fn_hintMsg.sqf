//Global Variable init
zombz_hintFull_last_title = "";
zombz_hintFull_last_text =  "";
zombz_hintFull_color =      "";
zombz_hintMini_last_title = "";
zombz_hintMini_last_text =  "";
zombz_hintMini_color =      "";

P2DZ_hintFull						= {
   667 cutRsc ["zombz_hintFull", "PLAIN"];
   zombz_hintFull_last_title = _this select 0;
   zombz_hintFull_last_text = _this select 1;
   zombz_hintFull_color = _this select 2;
   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9105) ctrlSetBackgroundColor zombz_hintFull_color;
   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9105) ctrlSetStructuredText parseText(zombz_hintFull_last_text);;
   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9106) ctrlSetStructuredText parseText(zombz_hintFull_last_title);
   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9107) ctrlSetStructuredText parseText(zombz_hintFull_last_text);
};

P2DZ_hintMini						= {
   667 cutRsc ["zombz_hintMini", "PLAIN"];
   zombz_hintMini_last_title = _this select 0;
   zombz_hintMini_last_text = _this select 1;
   zombz_hintMini_color = _this select 2;
   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9101) ctrlSetBackgroundColor zombz_hintMini_color;
   ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9101) ctrlSetStructuredText parseText(zombz_hintFull_last_text);;
   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9102) ctrlSetStructuredText parseText(zombz_hintMini_last_title);
   ((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9103) ctrlSetStructuredText parseText(zombz_hintMini_last_text);
};