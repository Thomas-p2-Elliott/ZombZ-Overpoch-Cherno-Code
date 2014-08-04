private ["_timeout","_inCombat","_started","_finished","_animState","_isMedic","_num_removed","_infectionChance","_disallowinVehicle","_bloodAmount","_useTime","_hospitalDistance","_ambulanceDistance","_hospitalEnable","_ambulanceEnable","_anywhereEnable","_nearHospital","_bloodMultiplier","_infectionMultiplier","_decke","_hospitalFound","_ambulanceFound","_display","_playerASL1","_playerASLx","_playerASLy","_playerASLz","_playerASLz2","_playerASL2"];
disableserialization;
_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };
_useTime = 180; 
_bloodAmount = (6000 + (round(random 2000)));
_infectionChance = 3; 
_disallowinVehicle = true;
_hospitalDistance = 30; 
_ambulanceDistance = 10;
_hospitalEnable = 1; 
_ambulanceEnable = 1; 
_anywhereEnable = 1; 

//bandit
if (P2DZ_humanityLevel < 0) then {
	_infectionChance = 5; //5%
	_bloodAmount = (5000 + (round(random 1000))); //min: 5k max: 6k
	_ambulanceEnable = 0; 
	_hospitalEnable = 0; 
	_useTime = 180; 
	_disallowinVehicle = true;
};

//hero
if (P2DZ_humanityLevel > 0) then {
	_infectionChance = 0;			//sets infection chance to 0% (1 = 1%)
	_bloodAmount = 12000;			//sets bloodbag regen to 12k
	_disallowinVehicle = false;		//allows bloodbag in vehicle
	_useTime = 60; 					//sets re-use wait time to 60 seconds
	_inCombat = false; 				//enables use of bloodbags in combat
};

//survivor
if (P2DZ_humanityLevel == 0) then {
	_infectionChance = 0;			
	_bloodAmount = (6000 + (round(random 2000))); //min: 6k max: 8k
	_disallowinVehicle = false;
	_useTime = 120; 
};

if (_inCombat) exitwith { cutText [format["You are in combat and cannot perform that action!"], "PLAIN DOWN"]};
if (_disallowinVehicle && vehicle player != player) exitWith {cutText [format["You cannot use the bloodbag in a vehicle!"], "PLAIN DOWN"]};
if (r_player_blood == r_player_bloodTotal) exitwith {cutText ["You are not injured!","PLAIN DOWN"]};
private ["_nearHospital","_bloodMultiplier","_infectionMultiplier","_decke","_hospitalFound","_ambulanceFound","_display"];
_nearHospital = false;
_bloodMultiplier = 1;
_infectionMultiplier = 1; 
if (_hospitalEnable == 0 && _ambulanceEnable == 0) then {
    _anywhereEnable = 1;
};
if (_anywhereEnable == 1) then {
    _nearHospital = true;
};  
if (_hospitalEnable == 1)  then { 
    _playerASL1 = getPosASL player;
    _playerASLx = _playerASL1  select 0;
    _playerASLy = _playerASL1  select 1;
    _playerASLz = _playerASL1  select 2;
    _playerASLz2 = _playerASLz + 40;
    _playerASL2 = [_playerASLx,_playerASLy,_playerASLz2];
    _decke = lineIntersects [_playerASL1,_playerASL2];
    _hospitalFound = count nearestObjects[player,["Land_A_Hospital","MASH_EP1","USMC_WarfareBFieldhHospital","Camp", "Land_Church_01", "Land_Church_03", "Land_Church_02", "Land_Church_02a", "Land_Church_05R", "Land_A_TVTower_Base", "Land_Barrack2", "Land_Destroyer", "Land_Fregata", "Land_HouseB_Tenement", "Land_telek1", "GUE_WarfareBFieldhHospital", "CDF_WarfareBFieldhHospital", "INS_WarfareBFieldhHospital", "RU_WarfareBFieldhHospital", "TK_GUE_WarfareBFieldhHospital_EP1", "TK_GUE_WarfareBFieldhHospital_Base_EP1", "TK_WarfareBFieldhHospital_Base_EP1", "TK_WarfareBFieldhHospital_EP1", "US_WarfareBFieldhHospital_EP1", "US_WarfareBFieldhHospital_Base_EP1", "ACamp_EP1", "Land_Campfire", "Land_Campfire_burning", "Plastic_Pole_EP1_DZ"],_hospitalDistance];
    if (_hospitalFound > 0 && _decke) then {
        _nearHospital = true;
        _bloodMultiplier = 2; 
        _infectionMultiplier = 0.5;
        if (P2DZ_humanityLevel < 0) then { systemChat("Did You Know: Since you self transfused near a safe building you could have received more blood if you were a survivor or hero!"); };
        if (P2DZ_humanityLevel == 0) then { systemChat("Did You Know: Since you self transfused near a safe building you get more blood! Become a hero for extra benefits!"); };
    };
}; 
if (_ambulanceEnable == 1)  then {
    _ambulanceFound = count nearestObjects[player,["GAZ_Vodnik_MedEvac","HMMWV_Ambulance","S1203_ambulance_EP1","HMMWV_Ambulance","M113Ambul_UN_EP1_DZ","HMMWV_Ambulance_CZ_DES_EP1","BMP2_Ambul_INS","M113_UN_EP1","UAZ_Unarmed_UN_EP1","Ural_UN_EP1","Mi17_UN_CDF_EP1","Mi17_medevac_CDF","Mi17_medevac_INS","Mi17_medevac_RU","Mi17_UN_CDF_EP1","UH60M_MEV_EP1", "M113Ambul_TK_EP1", "M113Ambul_TK_EP1_DZ", "M113Ambul_UN_EP1",  "HMMWV_Ambulance", "SUV_UN_EP1", "Ural_UN_EP1", "HMMWV_Ambulance_DES_EP1", "BMP2_Ambul_CDF", "M1133_MEV_EP1"],_ambulanceDistance];
    if (_ambulanceFound > 0 ) then {
        _nearHospital = true;
        _bloodMultiplier = 1.5; 
        _infectionMultiplier = 0.75; 
         if (P2DZ_humanityLevel < 0) then { systemChat("Did You Know: Since you self transfused near an ambulance vehicle you could have received more blood if you were a survivor!"); };
         if (P2DZ_humanityLevel == 0) then { systemChat("Did You Know: Since you're not a bandit and you self transfused near an ambulance vehicle you get more blood! Become a hero for extra benefits!"); };
    }; 
};
_bloodAmount = _bloodAmount * _bloodMultiplier; 
_infectionChance = _infectionChance * _infectionMultiplier;
if(!_nearHospital) exitWith {
    if (_hospitalEnable == 1 && _ambulanceEnable == 0) then {
        cutText [format["You need to be inside a hospital to do this!"], "PLAIN DOWN"];
    };
    if (_hospitalEnable == 0 && _ambulanceEnable == 1) then {
        cutText [format["You need to be near a medical vehicle to do this!"], "PLAIN DOWN"];
    };
    if (_hospitalEnable == 1 && _ambulanceEnable == 1) then {
        cutText [format["You need to be inside a hospital or near a medical vehicle to do this!"], "PLAIN DOWN"];
    };
};
if (isNil 'lastUsed') then {lastUsed = time};
if (time - lastUsed < _useTime && time - lastUsed != 0) exitwith {cutText [format["Not so fast! You can use bloodbag again in %1 seconds",(ceil(_useTime - (time - lastUsed)))],"PLAIN DOWN"]};

r_action = false;
if (vehicle player == player) then {
    player playActionNow "Medic";
};
r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
while {r_doLoop} do {
    _animState = animationState player;
    _isMedic = ["medic",_animState] call fnc_inString;
    if (_isMedic) then {
        _started = true;
    };
    if (_started and !_isMedic) then {
        r_doLoop = false;
        _finished = true;
    };
    if (r_interrupt) then {
        r_doLoop = false;
    };
    if (vehicle player != player) then {
        sleep 3;
        r_doLoop = false;
        _finished = true;
    };
    sleep 0.1;
};
r_doLoop = false;
if (_finished) then {
    _num_removed = ([player,"ItemBloodbag"] call BIS_fnc_invRemove);
    if(_num_removed == 1) then {

        lastUsed = time;

        if (vehicle player != player) then {
            _display = findDisplay 106;
            _display closeDisplay 0;
        };

        r_player_blood = r_player_blood + _bloodAmount; 
        
        if(r_player_blood > r_player_bloodTotal) then {
            r_player_blood = r_player_bloodTotal; 
        };
        
        [player,25] call player_humanityChange; 

        if (floor((random(100))+1) <= _infectionChance) then {
            r_player_infected = true;
            player setVariable["USEC_infected",true,true];
            cutText [format["You gave yourself blood, but got infected in the process!"], "PLAIN DOWN"];
        } else {
            cutText [format["You successfully gave yourself some blood!"], "PLAIN DOWN"];
        }; 
        if (P2DZ_humanityLevel < 0) then { systemChat("Did You Know: Bandits receive less blood, get infected, receive no hospital/ambulance benefits, cannot use in a vehicle, and have to wait longer to re-use selfbloodbags. Raise your humanity!"); };
        if (P2DZ_humanityLevel == 0) then { systemChat("Did You Know: Survivors receive less blood than heroes and also unlike heroes cannot self bloodbag whilst in combat. Raise your humanity to receive these benefits!"); };
        if (P2DZ_humanityLevel > 0) then { systemChat("Did You Know: Heroes can bloodbag in combat, while in vehicles, every 60 seconds and always receive 12k blood!"); };

    };
} else {
    r_interrupt = false;
    player switchMove "";
    player playActionNow "stop";
    cutText [format["Giving yourself blood was interrupted!"], "PLAIN DOWN"];
};