params ["_unit", "_enemy"];

private _nearGuys = _unit nearEntities ["Man", 50];

{
    if (side _x isEqualTo (side _unit)) then {
          [_x, _enemy] call ODE_civPanicSystem_fnc_flee;
    };
    sleep 0.3;
} forEach _nearGuys;
