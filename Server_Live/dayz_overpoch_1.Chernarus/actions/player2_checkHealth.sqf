private ["_zname", "_zamIReal", "_zdmg", "_znumber", "_zhasName", "_zamINumber","_zin"];
if(DZE_ActionInProgress) exitWith { systemChat("Please wait for the current health to close!"); };
player removeAction s_player_checkBuild; s_player_checkBuild = 1; DZE_ActionInProgress = true; 


_zin = objNull;
_zin = _this select 3;
_zname = "";
_zamIReal = false;
_zdmg = 0;
_znumber = 0;
_zhasName = false;
_zamINumber = false;
if (!isNil '_zin') then {
    if (!isNull _zin) then {
        _zamIReal = isClass (configFile >> "CfgVehicles" >> (typeOf _zin));
        if (_zamIReal) then {

            _zhasName = isText (configFile >> "CfgVehicles" >> (typeOf _zin) >> "displayName");
            if (_zhasName) then {
                _zname = getText (configFile >> "CfgVehicles" >> (typeOf _zin) >> "displayName");
            } else {
                _zname = (typeOf _zin);
            };

            _zamINumber = isNumber (configFile >> "CfgVehicles" >> (typeOf _zin) >> "armor");
            if (_zamINumber) then {
                _znumber = getNumber (configFile >> "CfgVehicles" >> (typeOf _zin) >> "armor");
                _zdmg = (_znumber / 100) * damage _zin;
                _zdmg = _zdmg * 100;
                comment "systemChat(format['%1 Damage: %2 / %3', _zname, _zdmg, _znumber])";
                [_zname,format["Damage: %1 / %2",_zdmg,_znumber],"img\zz.paa",5] spawn P2DZ_guiNotif;
            } else {
                _zdmg = damage _zin;
                _zdmg = _zdmg * 100;
                comment "systemChat(format['%1 Damage: %2 / %3', _zname, _zdmg, '100']);";
                [_zname,format["Damage: %1 / %2",_zdmg,"100"],"img\zz.paa",5] spawn P2DZ_guiNotif;
            };
        };    
    };
};

_p2time = 0;

while {_p2time < 10} do {
    s_player_checkBuild = 1;
    uiSleep 1;
    _p2time = _p2time + 1;
};

DZE_ActionInProgress = false; 
s_player_checkBuild = -1;