private ["_time","_vehicle","_inVehicle","_cursorTarget","_onLadder","_hasToolbox","_canDo","_isDeployed","_isBike","_isATV","_isMoto","_isBtr","_isHumvee","_isGyro","_isLittlebird","_isMerlin"];
if (p2SpT) then { _time = diag_tickTime;  diag_log format ['s.sqf started, Time: %1',_time];  }; 

s_player_packOBJ = -1; 
s_player_upgradehumvee = -1; 
s_player_upgradebtr = -1; 
s_player_upgrade350z = -1; 
s_player_upgradeatv = -1; 
s_player_upgrademoto = -1;
s_player_upgradelittlebird2 = -1; 
s_player_upgradelittlebird = -1;
s_player_upgradegyro = -1;
s_player_upgradebtr2 = -1;
s_player_upgradehumvee2 = -1;
s_player_upgrademerlin = -1; 

while {true} do {	
	if (!isNull player) then {

	_cursorTarget = cursorTarget; 
	_vehicle = vehicle player; 
	_inVehicle = (_vehicle != player); 

	if (player distance _cursorTarget < 4 && {_cursorTarget isKindOf "AllVehicles"} && {!isNull _cursorTarget} && {!_inVehicle}) then {

			_isDeployed = _cursorTarget getVariable ["Deployed",false]; 

			if (_isDeployed) then {

				_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1; 
				_hasToolbox = "ItemToolbox" in items player; 
				_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);  
				_isBike = typeOf _cursorTarget in ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"]; 
				_isATV = typeOf _cursorTarget in ["ATV_US_EP1"]; 
				_isMoto = typeOf _cursorTarget in ["TT650_TK_CIV_EP1"]; 
				_isBtr = typeOf _cursorTarget in ["BTR40_TK_GUE_EP1"]; 
				_isHumvee = typeOf _cursorTarget in ["HMMWV_DZ"]; 
				_isGyro = typeOf _cursorTarget in ["CSJ_GyroC"]; 
				_isLittlebird = typeOf _cursorTarget in ["MH6J_DZ"]; 
				_isMerlin = typeOf _cursorTarget in ["Mi17_Civilian_DZ"]; 
				
				if (s_player_packOBJ < 0) then {
					s_player_packOBJ = player addaction [("<t color=""#00FF04"">" + ("Pack "+typeOf _cursorTarget+"") +"</t>"),"actions\deploys\pack.sqf",_cursorTarget,6,false,true,"", ""]			
				}; 
			
				if ((_isMerlin) && {_hasToolbox} && {_canDo}) then {				
					if (s_player_upgrademerlin < 0) then {					
						s_player_upgrademerlin = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Huey") +"</t>"),"actions\deploys\gyro\upgrade3.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgrademerlin; 
					s_player_upgrademerlin = -1; 
				}; 
				
				if ((_isHumvee) && {_hasToolbox} && {_canDo}) then {
					if (s_player_upgradehumvee2 < 0) then {	
						s_player_upgradehumvee2 = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Humvee (m240)") +"</t>"),"actions\deploys\bike\upgrade_humvee_gun.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradehumvee2; 
					s_player_upgradehumvee2 = -1; 
				}; 

				if ((_isBtr) && {_hasToolbox} && {_canDo}) then {				
					if (s_player_upgradebtr2 < 0) then {
						s_player_upgradebtr2 = player addaction[("<t color=""#007ab7"">" + ("Upgrade to BTR (m240)") +"</t>"),"actions\deploys\bike\upgrade_btr_gun.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradebtr2; 
					s_player_upgradebtr2 = -1; 
				};

				if ((_isGyro) && {_hasToolbox} && {_canDo}) then {				
					if (s_player_upgradegyro < 0) then {
						s_player_upgradegyro = player addaction[("<t color=""#007ab7"">" + ("Upgrade to LittleBird") +"</t>"),"actions\deploys\gyro\upgrade.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradegyro; 
					s_player_upgradegyro = -1; 
				}; 
				
				if ((_isLittlebird) && {_hasToolbox} && {_canDo}) then {				
					if (s_player_upgradelittlebird < 0) then {					
						s_player_upgradelittlebird = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Mi17 Civ") +"</t>"),"actions\deploys\gyro\upgrade2.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradelittlebird; 
					s_player_upgradelittlebird = -1; 
				}; 

				if ((_isLittlebird) && {_hasToolbox} && {_canDo}) then {				
					if (s_player_upgradelittlebird2 < 0) then {					
						s_player_upgradelittlebird2 = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Armed Littlebird") +"</t>"),"actions\deploys\gyro\upgrade2_2.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradelittlebird2; 
					s_player_upgradelittlebird2 = -1; 
				}; 

				if ((_isBike) && {_hasToolbox} && {_canDo}) then {
					if (s_player_upgrademoto < 0) then {
							s_player_upgrademoto = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Motorcycle") +"</t>"),"actions\deploys\bike\upgrade_moto.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgrademoto; 
					s_player_upgrademoto = -1; 
				}; 
				
				if ((_isBike) && {_hasToolbox} && {_canDo}) then {
					if (s_player_upgradeatv < 0) then {			
						s_player_upgradeatv = player addaction[("<t color=""#007ab7"">" + ("Upgrade to ATV") +"</t>"),"actions\deploys\bike\upgrade_atv.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradeatv; 
					s_player_upgradeatv = -1; 
				}; 

				if ((_isMoto) && {_hasToolbox} && {_canDo}) then {			
					if (s_player_upgrade350z < 0) then {
						s_player_upgrade350z = player addaction[("<t color=""#007ab7"">" + ("Upgrade to Nissan 350z") +"</t>"),"actions\deploys\bike\upgrade_350z.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgrade350z; 
					s_player_upgrade350z = -1; 
				}; 

				if ((_isATV) && {_hasToolbox} && {_canDo}) then {
					if (s_player_upgradebtr < 0) then {
							s_player_upgradebtr = player addaction[("<t color=""#007ab7"">" + ("Upgrade to BTR") +"</t>"),"actions\deploys\bike\upgrade_btr.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradebtr; 
					s_player_upgradebtr = -1; 
				};

				if ((_isBtr) && {_hasToolbox} && {_canDo}) then {
					if (s_player_upgradehumvee < 0) then {
							s_player_upgradehumvee = player addaction[("<t color=""#007ab7"">" + ("Upgrade to HMMWV") +"</t>"),"actions\deploys\bike\upgrade_humvee.sqf",_cursorTarget, -1, true, true, "", ""]; 
					}; 
				} else {				
					player removeAction s_player_upgradehumvee; 
					s_player_upgradehumvee = -1; 
				}; 

			} else {			
				player removeAction s_player_packOBJ; 
				s_player_packOBJ = -1; 
			}; 
		} else {
			if (s_player_packOBJ > -1) then {
				player removeAction s_player_packOBJ; 
				s_player_packOBJ = -1;
			};
			if (s_player_upgradehumvee > -1) then {
				player removeAction s_player_upgradehumvee; 
				s_player_upgradehumvee = -1;
			};
			if (s_player_upgradebtr > -1) then {
				player removeAction s_player_upgradebtr; 
				s_player_upgradebtr = -1;
			};
			if (s_player_upgrade350z > -1) then {
				player removeAction s_player_upgrade350z; 
				s_player_upgrade350z = -1;
			};
			if (s_player_upgradeatv > -1) then {
				player removeAction s_player_upgradeatv; 
				s_player_upgradeatv = -1;
			};
			if (s_player_upgrademoto > -1) then {
				player removeAction s_player_upgrademoto; 
				s_player_upgrademoto = -1;
			};
			if (s_player_upgradelittlebird2 > -1) then {
				player removeAction s_player_upgradelittlebird2; 
				s_player_upgradelittlebird2 = -1;
			};
			if (s_player_upgradelittlebird > -1) then {
				player removeAction s_player_upgradelittlebird; 
				s_player_upgradelittlebird = -1;
			};
			if (s_player_upgradegyro > -1) then {
				player removeAction s_player_upgradegyro; 
				s_player_upgradegyro = -1;
			};
			if (s_player_upgradebtr2 > -1) then {
				player removeAction s_player_upgradebtr2; 
				s_player_upgradebtr2 = -1;
			};
			if (s_player_upgrademerlin > -1) then {
				player removeAction s_player_upgrademerlin; 
				s_player_upgrademerlin = -1;
			};
			if (s_player_upgradehumvee2 > -1) then {
				player removeAction s_player_upgradehumvee2; 
				s_player_upgradehumvee2 = -1;
			};
		};
	};
		
	sleep 2;
};