//P2LOS_createVeh
//exmaple input: ["MAP_CncBlock_stripes",[8245.3574, 4897.6006, 3.0517578e-005],-37.706978,"checkpoint_6"] call P2LOS_createVeh;
//in prog [$objClass,$objPos,$objDir,"$objVar"] call P2LOS_createVeh;
private ["_in", "_vN", "_di", "_wP", "_cN", "_c", "_lB"];
_lB = false;
_in = _this;
_vN = _in select 3;
_di = _in select 2;
_wP = _in select 1;
_cN = _in select 0;
_c = missionConfigFile >> "CfgBuildingLoot" >> _cN;
_lB = isClass (_c);

if(!(_lB)) then {

	P2DZ_customBuildingCount_Local = P2DZ_customBuildingCount_Local + 1;
	//diag_log(format['P2DEBUG:LocalBuildingCreated: %1 / %2... Custom Local Objs So far: %3',_vN,_cN,(str P2DZ_customBuildingCount_Local)]);

	[_wP,_di] call compile (format["%1 = objNull;
		%1 = '%2' createVehicleLocal (_this select 0);
		%1 enableSimulation false;
		%1 allowDamage false;
		%1 setPos (_this select 0);
		%1 setDir (_this select 1);
		%1 setVariable [""p2lv"", true];
		%1 call P2LOS_OpenDoors_CheckObject;
	",_vN,_cN]);
};

if (isDedicated && !hasInterface || isServer) then {
	if(_lB) then {

		P2DZ_customBuildingCount_Global = P2DZ_customBuildingCount_Global + 1;
		//diag_log(format['P2DEBUG:GlobalBuildingCreated: %1 / %2... Custom Global Objs so far: %3',_vN,_cN,(str P2DZ_customBuildingCount_Global)]);

		[_wP,_di] call compile (format["%1 = objNull;
			%1 = '%2' createVehicle (_this select 0);
			%1 enableSimulation false;
			%1 allowDamage false;
			%1 removeAllEventHandlers ""handleDamage"";
			%1 removeAllEventHandlers ""killed"";
			%1 removeAllEventHandlers ""HitPart"";
			%1 removeAllMPEventHandlers ""MPKilled"";
			%1 removeAllMPEventHandlers ""MPRespawn"";
			%1 removeAllMPEventHandlers ""MPHit"";
			%1 setPos (_this select 0);
			%1 setDir (_this select 1);
		",_vN,_cN]);
	};
};