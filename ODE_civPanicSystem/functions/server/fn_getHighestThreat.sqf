params ["_targets"];

private _return = objNull;
private _value = 0;

private _highestThreat = {
    if ((_x select 3 > _value) && (_x select 3 > 1)) then {
        _value = _x select 3;
        _return = _x select 4;
    };
} forEach _targets;

if (!isMultiplayer) then {
    sideChat format ["ODE_civPanicSystem: highest threat: %1", _return];
};

_return
