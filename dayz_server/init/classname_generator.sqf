diag_log "         ,. –  - .,  °              , ·. ,.-·~·.,   ‘        ,·'´¨;.  '                         ,.  - · - .,  '                ,. –  - .,  °       ";
diag_log "        ';_,.., _     '\`. '         /  ·'´,.-·-.,   \`,'‚        ;   ';:\           .·´¨';\   ,·'´,.-,   ,. -.,   \`';,'            ';_,.., _     '\`. '   ";
diag_log "         \:::::::::::';   ,'\       /  .'´\:::::::'\   '\ °     ;     ';:'\      .'´     ;:'\   \::\.'´  ;'\::::;:'  ,·':\'           \:::::::::::';   ,'\  ";
diag_log "          '\_;::;:,·´  .·´::\‘  ,·'  ,'::::\:;:-·-:';  ';\‚     ;   ,  '·:;  .·´,.´';  ,'::;'    '\:';   ;:;:·'´,.·'´\::::';           '\_;::;:,·´  .·´::\‘";
diag_log "              , '´ .·´:::::;'   ;.   ';:::;´       ,'  ,':'\‚   ;   ;'\`.    ¨,.·´::;'  ;:::;     ,.·'   ,.·:'´:::::::'\;·´                , '´ .·´:::::;'  ";
diag_log "            .´  .'::::::;·´'     ';   ;::;       ,'´ .'´\::';‚  ;  ';::; \*´\:::::;  ,':::;‘     '·,   ,.\`' ·- :;:;·'´                  .´  .'::::::;·´'   ";
diag_log "        .·´ ,·´:::::;·´         ';   ':;:   ,.·´,.·´::::\;'° ';  ,'::;   \::\;:·';  ;:::; '        ;  ';:\:\`*·,  '\`·,  °          .·´ ,·´:::::;·´       ";
diag_log "     ,·´  .´;::–·~^*'´';\‚      \·,   \`*´,.·'´::::::;·´    ;  ';::;     '*´  ;',·':::;‘          ;  ;:;:'-·'´  ,.·':\         ,·´  .´;::–·~^*'´';\‚   ";
diag_log "     '.,_ ,. -·~:*'´¨¯:\:\ °    \\:¯::\:::::::;:·´       \´¨\::;          \¨\::::;        ,·',  ,. -~:*'´\:::::'\‘       '.,_ ,. -·~:*'´¨¯:\:\ °";
diag_log "      \:::::::::::::::::::\;       \`\:::::\;::·'´  °         '\::\;            \:\;·'          \:\\`'´\:::::::::'\;:·'´         \:::::::::::::::::::\;  ";
diag_log "       \:;_;::-·~^*'´¨¯'             ¯                      '´¨               ¨'             '\;\:::\;: -~*´‘              \:;_;::-·~^*'´¨¯'    ";
diag_log "                                        ‘                                                               '                                            ";
diag_log "Classname List Generator by Player2";


diag_log " ";
diag_log "=======================================";
diag_log "                                       ";
diag_log "  /\  o ._   \  / _  |_  o  _ |  _   _ ";
diag_log " /--\ | |     \/ (/_ | | | (_ | (/_ _> ";
diag_log "                                       ";
diag_log "=======================================";
diag_log "Air Vehicles: ";

_cfgvehicles = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
		{
			diag_log((_veh_type));
		};
	};
};

diag_log " ";
diag_log "============================================";
diag_log "                                            ";
diag_log " |   _. ._   _|   \  / _  |_  o  _ |  _   _ ";
diag_log " |_ (_| | | (_|    \/ (/_ | | | (_ | (/_ _> ";
diag_log "                                            ";
diag_log "============================================";
diag_log "Land Vehicles: ";

for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
		{
			diag_log((_veh_type));
		};
	};
};

diag_log " ";
diag_log "=========================================";
diag_log "  __                                     ";
diag_log " (_   _   _.   \  / _  |_  o  _ |  _   _ ";
diag_log " __) (/_ (_|    \/ (/_ | | | (_ | (/_ _> ";
diag_log "                                         ";
diag_log "=========================================";
diag_log "Sea Vehicles: ";


for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
		{
			diag_log((_veh_type));
		};
	};
};

diag_log " ";
diag_log "==================================";
diag_log "                              ";
diag_log " \    / _   _. ._   _  ._   _ ";
diag_log "  \/\/ (/_ (_| |_) (_) | | _> ";
diag_log "               |              ";
diag_log "==================================";
diag_log "Weapons: ";

_cfgweapons = configFile >> 'cfgWeapons';
for "_i" from 0 to (count _cfgweapons)-1 do
{
	_weapon = _cfgweapons select _i;
	if (isClass _weapon) then
	{
		_wpn_type = configName _weapon;
		_plx = toArray _wpn_type;
		_plx resize 7;
		_plx;
		_plx = toString _plx;
		if (_plx != "ItemKey") then {
			if (((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then {
				_mags = getArray(configfile >> 'cfgWeapons' >> _wpn_type >> 'magazines');
				_config = str _mags;
				diag_log(_wpn_type);
				diag_log(_config);
			};
		};
	};
};

diag_log " ";
diag_log "===========================";
diag_log "  _                        ";
diag_log " /  |  _ _|_ |_  o ._   _  ";
diag_log " \_ | (_) |_ | | | | | (_| ";
diag_log "                        _| ";
diag_log "===========================";
diag_log "Clothing: ";

_cfgvehicles = configFile >> "cfgMagazines";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2)) then
		{
			_base = inheritsFrom (_vehicle);
			if ("bin\config.bin/CfgMagazines/SkinBase" == str _base) then {
				_displayName = getText (_vehicle >> "displayName");
				_descriptionShort = getText (_vehicle >> "descriptionShort");
				diag_log(_veh_type + " 				" + _displayName);
			};
		};
	};
};

diag_log " ";
diag_log "================================";
diag_log "  _                             ";
diag_log " |_)  _.  _ |  ._   _.  _ |   _ ";
diag_log " |_) (_| (_ |< |_) (_| (_ |< _> ";
diag_log "               |                ";
diag_log "================================";
diag_log "Backpacks: ";

_cfgvehicles = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((_veh_type isKindOf "Bag_Base_EP1")) then
		{
			diag_log(_veh_type);
		};
	};
};


diag_log " ";
diag_log "=================";
diag_log "  __             ";
diag_log " (_  |  o ._   _ ";
diag_log " __) |< | | | _> ";
diag_log "                 ";
diag_log "=================";
diag_log "Skins: ";

_cfgvehicles = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Man") && !(_veh_type isKindOf "zZombie_Base") && !(_veh_type == "Survivor1_DZ")) then
		{
			diag_log(str _veh_type);
		};
		if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && !(_veh_type == "zZombie_Base") && (_veh_type isKindOf "zZombie_Base")) then
		{
			diag_log("Zed Skin: " + str _veh_type);
		};
		if ((getNumber (_vehicle >> "scope") == 2) && (_veh_type isKindOf "CAAnimalBase") && !(_veh_type == "Cock")) then
		{
			diag_log("Animal Skin: " + str _veh_type);
		};
	};
};



diag_log " ";
diag_log "==================================";
diag_log "                                  ";
diag_log " |\/|  _.  _   _. _  o ._   _   _ ";
diag_log " |  | (_| (_| (_| /_ | | | (/_ _> ";
diag_log "           _|                     ";
diag_log "==================================";
diag_log "Magazines: ";

_cfgvehicles = configFile >> "cfgMagazines";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then
	{
		_veh_type = configName _vehicle;
		if ((getNumber (_vehicle >> "scope") == 2)) then
		{
			diag_log(_veh_type);
		};
	};
};
 

diag_log " ";
diag_log "==============================";
diag_log "  _                           ";
diag_log " |_)     o |  _| o ._   _   _ ";
diag_log " |_) |_| | | (_| | | | (_| _> ";
diag_log "                        _|    ";
diag_log "==============================";
diag_log "Buildings: ";


_cfgobjects = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgobjects)-1 do
{
	_object = _cfgobjects select _i;
	if (isClass _object) then
	{
		_obj_type = configName _object;
		if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
		{
			diag_log((_obj_type));
		};
	};
};
