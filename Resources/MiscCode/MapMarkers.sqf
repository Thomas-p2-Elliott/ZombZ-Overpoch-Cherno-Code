disableSerialization;
_map = (findDisplay 12) displayCtrl 51;
_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call p2_drawIcons;"];
systemChat("AI/Vehicles: MapIcons: Handler Added");

p2_drawIcons = 
{
	if (!isnil "p2_drawIcons") then 
	{
		private["_ctrl"];
		_ctrl =  _this select 0;
		_iscale = (1 - ctrlMapScale _ctrl) max .2;
		_irad = 30;
		_color = [0, 0, 0, 1];
		_icon = "\ca\ui\data\icon_zora_ca.paa";
		
		_objects = vehicles;
		{
			_type = typeOf _x;
			if !((getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName') == 'Wreck') || (_type in ["ClutterCutter_small_2_EP1","UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"])) then 
			{
				_icon = getText(configFile >> "CfgVehicles" >> typeOf _x >> "icon");
				_irad = 30;
				
				if ((_x iskindof "Air") or (_x iskindof "Tank")) then 
				{
					_irad = 35;
					_ctrl drawIcon [_icon, [1, 0, 1, 1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
				} 
				else 
				{

				};
			};
		} forEach _objects;
		
		{
			if ((!isnull _x) and !(vehicle _x != _x) and !(typeOf(vehicle _x) isKindOf "zZombie_Base") and !(typeOf(vehicle _x) == "Survivor1_DZ")) then 
			{
				if (!isPlayer _x) then {
					_color = [0, 0, 1, 1];
					_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
				};
			};
		} forEach allUnits;

	};
};		