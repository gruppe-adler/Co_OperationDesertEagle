params ["_unit"];


[{

    if ([_unit] call ODE_civPanicSystem_fnc_isInPanic) then {
        [_unit] call ODE_civPanicSystem_fnc_doMove;
    };

}, 1, []] call CBA_fnc_addPerFrameHandler;
