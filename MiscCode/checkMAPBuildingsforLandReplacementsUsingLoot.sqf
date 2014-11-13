//run this without comment in rcode_opoch_s.txt

_nearby = (position player) nearObjects ["building",45000];
_foundList = [];
_ignoredList = [];
_count = 0;

{

	_type = typeOf _x;
	
	_res = [_type,"MAP"] call KRON_strInStr; 
	if (_res) then {


		_unmap = [_type,"MAP","Land"] call KRON_Replace;


		_config = 		missionConfigFile 		>> "CfgBuildingLoot" >> _unmap;

		_pos = 			[] + getArray 	(_config >> "lootPos");
		_itemTypes = 	[] + getArray 	(_config >> "lootType");
		_lootChance = 	getNumber 		(_config >> "lootChance");

		if (str _config != "" && str _itemTypes != "[]" && !(_unmap in _foundList)) then {
			_foundList = _foundList + [_unmap];

		} else {
			if (!(_unmap in _ignoredList)) then {
				
				_ignoredList = _ignoredList + [_unmap];
			};
		};
	}; 
	 _count = _count + 1;

	 diag_log("Processing..." + str (_count) + " / " + str (count _nearby));
} forEach _nearby;  


diag_log("Found MAP->Land Building Replacements:");
{
  diag_log(_x);
} forEach _foundList;

diag_log("Failed on MAP->Land Building Replacements:");
{
  diag_log(_x);
} forEach _ignoredList;
    
