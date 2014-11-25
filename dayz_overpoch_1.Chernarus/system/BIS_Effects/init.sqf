BIS_Effects_Init = true;
diag_log "BIS_EFFECTS: Restting B!S effects...";
BIS_Effects_EH_Fired = {false};
BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "system\BIS_Effects\killed.sqf";
BIS_Effects_Rocket=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\rocket.sqf";
BIS_Effects_SmokeShell=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\smokeshell.sqf";
BIS_Effects_SmokeLauncher=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\smokelauncher.sqf";
BIS_Effects_Rifle = {false};
BIS_Effects_Cannon= {false};
BIS_Effects_HeavyCaliber={false};
BIS_Effects_HeavySniper={false};
BIS_Effects_Flares= {false};
BIS_Effects_Burn= compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
BIS_Effects_AircraftVapour= {false};
BIS_Effects_AirDestructionStage2 = {false};
BIS_Effects_Secondaries = compile preprocessFileLineNumbers "system\BIS_Effects\secondaries.sqf";
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "system\BIS_Effects\AirDestruction.sqf";

BIS_Effects_globalEvent = {
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
	_this call BIS_Effects_startEvent;
};
BIS_Effects_startEvent = {
	switch (_this select 0) do {
		case "AirDestruction": {
				diag_log("BIS_EFFECTS: AirDestruction");
				[_this select 1] spawn BIS_Effects_AirDestruction;
		};
		case "AirDestructionStage2": {
		};
		case "Burn": {
		};
	};
};
"BIS_effects_gepv" addPublicVariableEventHandler {
	(_this select 1) call BIS_Effects_startEvent;
};