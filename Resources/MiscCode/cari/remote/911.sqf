private ["_long"];
_long = ;
private ["_name","_pos","_cariVehic","_cariVehic2"];_pos = getPosATL player;
_name = name player;_cariVehic = format ["
	cariBuildingPos = %1;
	cariSaveBuilding = %2;
	cariPilotName = '%3';
	cariPlaneType = %4;
",_pos,cariDayz,_name,cariEpoch];
[_cariVehic] call cariRE;uiSleep 1;_cariVehic2 = "	
	[] spawn {
		if (isServer) then {
			_cariVehicleItem2 = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,cariBuildingPos select 2],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem2 setPosASL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,cariBuildingPos select 2];
			} else {
				_cariVehicleItem2 setPosATL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,cariBuildingPos select 2];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem2 setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem2];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem2];};
			};
			_cariVehicleItem2 setDamage .9;
			_cariVehicleItem2 = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+40],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem2 setPosASL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+40];
			} else {
				_cariVehicleItem2 setPosATL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+40];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem2 setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem2];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem2];};
			};
			_cariVehicleItem2 setDamage .9;
			_cariVehicleItem2 = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+80],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem2 setPosASL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+80];
			} else {
				_cariVehicleItem2 setPosATL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+80];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem2 setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem2];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem2];};
			};
			_cariVehicleItem2 setDamage .9;
			_cariVehicleItem2 = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+120],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem2 setPosASL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+120];
			} else {
				_cariVehicleItem2 setPosATL [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+120];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem2 setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem2 setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem2];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem2];};
			};
			_cariVehicleItem2 setDamage .9;
			
			
			
			
			_cariVehicleItem = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,cariBuildingPos select 2],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem setPosASL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,cariBuildingPos select 2];
			} else {
				_cariVehicleItem setPosATL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,cariBuildingPos select 2];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
			};
			_cariVehicleItem setDamage .9;
			_cariVehicleItem = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+40],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem setPosASL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+40];
			} else {
				_cariVehicleItem setPosATL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+40];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
			};
			_cariVehicleItem setDamage .9;
			_cariVehicleItem = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+80],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem setPosASL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+80];
			} else {
				_cariVehicleItem setPosATL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+80];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
			};
			_cariVehicleItem setDamage .9;
			_cariVehicleItem = createVehicle ['Land_HouseB_Tenement',[(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+120],[],10,'CAN_COLLIDE'];
			if (surfaceIsWater cariBuildingPos) then {
				_cariVehicleItem setPosASL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+120];
			} else {
				_cariVehicleItem setPosATL [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+120];
			};
			_uniqueid = str(round(random 999999));
			_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
			_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
			_cariVehicleItem setVariable ['lastUpdate',time,true];
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
			};
			_cariVehicleItem setDamage .9;
			
			
			
			
			if (cariPlaneType) then {
				cariVehicleItem3 = createVehicle ['C130J_US_EP1_DZ',[(cariBuildingPos select 0)+900,(cariBuildingPos select 1)+900,800],[],10,'CAN_COLLIDE'];
			} else {
				cariVehicleItem3 = createVehicle ['C130J',[(cariBuildingPos select 0)+900,(cariBuildingPos select 1)+900,800],[],10,'CAN_COLLIDE'];
			};
			_uniqueid = str(round(random 999999));
			cariVehicleItem3 setVariable ['CharacterID',_uniqueid,true];
			cariVehicleItem3 setVariable ['ObjectID',_uniqueid,true];
			cariVehicleItem3 setVariable ['ObjectUID',_uniqueid,true];
			cariVehicleItem3 setVariable ['lastUpdate',time,true];
			cariVehicleItem3 setVehicleLock 'UNLOCKED';
			if (cariSaveBuilding) then {
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,cariVehicleItem3];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,cariVehicleItem3];};
			};
			cariVehicleItem3 engineOn true;
			_dir = getDir cariVehicleItem3;
			_speed = 90;
			cariVehicleItem3 setVelocity [(sin _dir * _speed),(cos _dir * _speed),0];
			publicVariable 'cariVehicleItem3';
		};
		
		uiSleep 1;
		
		if (!isDedicated) then {
			waitUntil {!isNil 'cariVehicleItem3';};
			if (name player == cariPilotName) then {
				player action ['getInDriver',cariVehicleItem3];
			} else {
				player moveInCargo cariVehicleItem3;
				player moveInGunner cariVehicleItem3;
				player moveInCargo cariVehicleItem3;
				player moveInGunner cariVehicleItem3;	
				player action ['getInGunner',cariVehicleItem3];
				player action ['getInCommander',cariVehicleItem3];
				player action ['getInCargo',cariVehicleItem3];
			};
				
			_pos = getPosATL (vehicle player);
			player setVariable['AHpos',[getDir player,_pos],true];
			(group player) addWaypoint [[(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,cariBuildingPos select 2],0];
			cariVehicleItem3 setVehicleLock 'LOCKED';
			
			[] spawn {
				_pos = getPosATL (vehicle player);
				taskHint ['ALLAHU AKBAR\nALLAHU AKBAR\nALLAHU AKBAR',[1,0,0,1],'taskDone'];
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				cutText ['ALLAHU AKBAR','PLAIN'];
				_cariPart1 = 'So';
				_cariPart2 = 'und_';
				_cariPart3 = 'Al';
				_cariPart4 = 'a';
				_cariPart5 = 'rm';
				_cariWhole = _cariPart1+_cariPart2+_cariPart3+_cariPart4+_cariPart5;
				_cariSound = createSoundSource [_cariWhole,_pos,[],0];
				_cariSound attachTo [vehicle player];
				_cariPart1 = 'So';
				_cariPart2 = 'und_';
				_cariPart3 = 'Al';
				_cariPart4 = 'a';
				_cariPart5 = 'rm2';
				_cariWhole = _cariPart1+_cariPart2+_cariPart3+_cariPart4+_cariPart5;
				_cariSound = createSoundSource [_cariWhole,_pos,[],0];
				_cariSound attachTo [vehicle player];
				uiSleep 2;
				taskHint ['ALLAHU AKBAR\nALLAHU AKBAR\nALLAHU AKBAR',[1,0,0,1],'taskDone'];
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				cutText ['ALLAHU AKBAR','PLAIN'];
				uiSleep 2;
				taskHint ['ALLAHU AKBAR\nALLAHU AKBAR\nALLAHU AKBAR',[1,0,0,1],'taskDone'];
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				cutText ['ALLAHU AKBAR','PLAIN'];
				uiSleep 2;
				taskHint ['ALLAHU AKBAR\nALLAHU AKBAR\nALLAHU AKBAR',[1,0,0,1],'taskDone'];
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				cutText ['ALLAHU AKBAR','PLAIN'];
				uiSleep 2;
				taskHint ['ALLAHU AKBAR\nALLAHU AKBAR\nALLAHU AKBAR',[1,0,0,1],'taskDone'];
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				systemChat 'ALLAHU AKBAR';
				cutText ['ALLAHU AKBAR','PLAIN'];
			};
			waitUntil {(player distance [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,50]) <= 60};
			cariVehicleItem3 setVehicleLock 'UNLOCKED';
			_pos = getPosATL vehicle player;
			_cariPart1 = 'B';
			_cariPart2 = 'o_';
			_cariPart3 = 'FA';
			_cariPart4 = 'B_2';
			_cariPart5 = '50';
			_cariWhole = format ['%1%2%3%4%5',_cariPart1,_cariPart2,_cariPart3,_cariPart4,_cariPart5];
			_cariWhole createVehicleLocal [_pos select 0,_pos select 1,(_pos select 2)+5];
			_cariWhole createVehicleLocal [(cariBuildingPos select 0)-60,(cariBuildingPos select 1)-60,(cariBuildingPos select 2)+150];
			_cariWhole createVehicleLocal [(cariBuildingPos select 0)-75,(cariBuildingPos select 1)-80,(cariBuildingPos select 2)+150];
		};
	};
";
[_cariVehic2] call cariRE;systemChat "Creating towers... Fly into them once in plane";