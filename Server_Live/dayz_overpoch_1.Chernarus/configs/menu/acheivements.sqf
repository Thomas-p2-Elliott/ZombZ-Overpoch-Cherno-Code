_choose_section = _this select 0;

	 _leftmenu = ["Coming Soon"];
	//0 //1 //2 //3 //4 //5 //6
	if (_choose_section == "Left") exitWith {
	
		//sends left menu array to file
		_leftmenu 

	};
	if (_choose_section == "Right") exitWith {
		_selectright = _this Select 1;
		_text = switch (_selectright) do {



case (_leftmenu Select 0):{ 
"Coming soon 
"
};
			};//end of switch
		//sends text back to file

		_text

	};