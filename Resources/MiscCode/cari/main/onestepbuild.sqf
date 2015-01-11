private ["_long"];
_long = ;
if (cariOnestep == 0) then {
	cariOnestep = 1;
	DZE_BuildingLimit = 900;
	DZE_PlotPole = [1,1];
	DZE_requireplot = 0;
	DZE_StaticConstructionCount = 1;
	systemChat "One step build enabled";
} else {
	cariOnestep = 0;
	DZE_PlotPole = [50,75];
	DZE_StaticConstructionCount = 0;
	systemChat "One step build disabled";
};