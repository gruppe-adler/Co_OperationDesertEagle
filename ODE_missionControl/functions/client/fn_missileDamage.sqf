params ["_vehicle"];

_vehicle setVariable ["r0ed_SurvivableCrashes_NotShotDown", false];
[_vehicle, _this] call r0ed_SurvivableCrashes_OnVehicleCrash;
