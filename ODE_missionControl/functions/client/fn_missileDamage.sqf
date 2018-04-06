params ["_vehicle"];

_vehicle setVariable ["r0ed_SurvivableCrashes_NotShotDown", false];
[_vehicle, _this] call r0ed_SurvivableCrashes_OnVehicleCrash;

private _smoke = createVehicle ["test_EmptyObjectForSmoke", position _vehicle, [], 0, "CAN_COLLIDE"];
_smoke attachTo [_vehicle,[0,0.0,0.0],"motor"];
