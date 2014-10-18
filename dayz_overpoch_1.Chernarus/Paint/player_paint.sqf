private ["_txt","_vehicle"];
VehicleToPaint = cursorTarget;
ColourPrice = 50;
_vehicle = getText(configFile >> "cfgVehicles" >> (typeOf VehicleToPaint) >> "displayName");
createdialog "VehicleColourDialog";
_txt = format ["<t>It will cost %1 Gold Bars<br/>to repaint your %2.</t>",ColourPrice,_vehicle];
((uiNamespace getVariable "VehicleColourDialog") displayCtrl 5703) ctrlSetStructuredText parseText _txt;
