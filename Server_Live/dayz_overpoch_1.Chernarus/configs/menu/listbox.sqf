//Populate Menu List
//diag_log format["GorsyDebug: Menu: BaseBuilding Loaded"]; 
_count = 0;
ctrlSetText [1200,(_this select 1)];

_previousselect = 90000;
_leftcount = 0;
_rightcount =0;

MenuActive = true;
_leftMenu = [];
//	diag_log format["GorsyDebug left0: %1",_leftMenu];
//	diag_log format["GorsyDebug File: %1",_this select 0];
_leftmenu = ["Left"] call compile preprocessFileLineNumbers ("configs\menu\" + (_this select 0) + ".sqf");
//	diag_log format["GorsyDebug left3: %1",_leftMenu];


//builds left menu
{
	_leftcount = _leftcount +1;

 	_index = lbAdd [1500, _x];
} forEach _leftmenu;

//builds right menu
while {MenuActive} do {
	sleep 0.5;
	_index = lbCurSel 1500; //1
	if (_previousselect == _index) then{ //0 //1

	}else{

		lbClear 1501;
	  	//0 //1 //2 //3 //4
  		if (_index == -1) then{
  			_add = lbAdd [1501, "Choose A Selection from the Right"];
  			_add = lbAdd [1501, ""];
  			_add = lbAdd [1501, "<--------------------------------"];
	  	}else{
		   	_selectright =(_leftmenu Select _index); 
//			diag_log format["GorsyDebug: Menu Building switch should be=%1",_selectright]; 


		   	//edit here for each section
		   _text = ["Right",_selectright] call compile preprocessFileLineNumbers ("configs\menu\" + (_this select 0) + ".sqf");

//			diag_log format["GorsyDebug: Menu BaseBuilding text info = %1",_text]; 

			((uiNamespace getVariable 'ZombZ_GorsyMenuLB') displayCtrl 1501) ctrlSetStructuredText parseText(_text);


			/* REMOVED FOR STRUCTURE TEST
		   	{
		   		_rightcount = _rightcount +1;
		 		//diag_log format["GorsyDebug: Building rightside = %1",_rightcount]; 

		   	  	_buildright = lbAdd [1501, _x];
		   	} forEach _rightbox;
		   	*/

		};   	
		_previousselect = _index;	//1
	};
};


 //  ((uiNamespace getVariable 'zombz_hintFull') displayCtrl 9101) ctrlSetStructuredText parseText(hMTx);;

/* Debug monitor frame colour 

((uiNamespace getVariable 'zombz_hintMini') displayCtrl 9101) ctrlSetBackgroundColor hMC;

*/