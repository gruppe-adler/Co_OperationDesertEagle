[] execVM "r0ed_SurvivableCrashes\initPlayerLocal.sqf";

[] call ODE_missionControl_fnc_addModulesAchilles;

player setVariable ["ODE_bodyBagWasPlayer", true, true];
