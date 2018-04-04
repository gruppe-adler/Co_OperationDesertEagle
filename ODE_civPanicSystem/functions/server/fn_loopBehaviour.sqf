params ["_unit"];

[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    if ([_unit] call ODE_civPanicSystem_fnc_isInPanic) then {
        [_unit] call ODE_civPanicSystem_fnc_doMove;
    };

    if (!alive _unit) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
