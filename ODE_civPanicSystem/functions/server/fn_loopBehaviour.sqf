params ["_unit"];

[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    if ([_unit] call ODE_civPanicSystem_fnc_isInPanic) then {
        [_unit] call ODE_civPanicSystem_fnc_doMove;
    };

    private _targets = _unit nearTargets 300;

    _highestTarget = objNull;

    if (count _targets > 0) then {
        _highestTarget = [_targets] call ODE_civPanicSystem_fnc_getHighestThreat;
    };

    if (!isNull _highestTarget) then {
        [_unit, _highestTarget] call ODE_civPanicSystem_fnc_flee;
    };

    if (!alive _unit) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
