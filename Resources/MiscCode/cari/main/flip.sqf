private ["_long"];
_long = ;
(getPos player nearestObject "Air") setVectorUp [0,0,1];
(getPos player nearestObject "LandVehicle") setVectorUp [0,0,1];
(getPos player nearestObject "Ship") setVectorUp [0,0,1];systemChat "Nearest vehicle was flipped";