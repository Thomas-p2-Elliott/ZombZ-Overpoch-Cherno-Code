p2_strInStr = {
	_needle = _this select 0;				//needle input		"wo"
	_haystack = _this select 1;				//haystack input    "hello world"
	_needle = strToArray(_needle);			//converts to: ["w","o"];
	_haystack = strToArray(_haystack);		//converts to: ["h","e","l","l","o"," ","w","o","r","l","d"];
	_needleLength = count (_needle);		//converts to: 2
	_foundCount = 0;						//used later
	_foundPos = 0;							//^
	_return = 0;							//output for later
	_continue = true;						//used later

	//for each item in the haystack, each letter in hello world...
	{
		//if the first letter of the needle (w), matches any of the characters in the haystack, then run some code...
		if (_haystack select _foundPos == _needle select 0) then {
			//firstly, add 1 to foundCount...we'll use it later
			_foundCount = 1;
			//this tells it to continue searching the haystack for other matching chars
			_continue = true;
			//while the length of wo, aka 2, is greater than the amount of letters its found we need to keep searching the haystack for the rest of the matching characters
			//we also check if continue is still true
			while ((_needleLength ) > _foundCount && _continue == true) {
				if (_haystack select (_foundPos + 1)) then {
					_foundCount = _foundCount + 1; //stops the loop if it finds all the letters
					_continue = true;			  // keeps the loop going if it hasnt found them all
				} else {
					_foundCount = 0;			   //reset foundCount
					_continue = false;				//end the loop, so it continues to the next letter in the haystack
				};
			};

			_foundPos = _foundPos + 1; 			//continue to next letter in haystack once loop has ended
		};

	} count _haystack;

	//once its done, if foundcount is the same as needle length then it did find the full length of wo in hello world.
	if (_foundCount == (_needleLength -1)) then {
		_return = _foundPos;	//set the return output to the position in hello world that it found wo
	} else {
		_return = 0;			//if foundcount not same as needle lenght, string was not found, return 0, a failure.
	};
	
	_return
};