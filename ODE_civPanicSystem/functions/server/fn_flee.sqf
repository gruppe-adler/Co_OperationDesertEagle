params ["_unit", ["_enemy", objNull]];


private _enemy = _unit findNearestEnemy (position _unit);

if (isNull _enemy) then {
    _enemy = allPlayers select 0;
};

[_enemy] call ODE_civPanicSystem_fnc_setSafePoint;

private _target = _unit getVariable ["ODE_civPanicSystem_safePoint",
    (getPosATL _unit) findEmptyPosition [200,250]
];

_unit doMove _target;
_unit setSpeedMode "FULL";
_unit setBehaviour "CARELESS";
