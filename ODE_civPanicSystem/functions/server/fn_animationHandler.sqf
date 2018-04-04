params ["_unit"];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsIdle",
[
"",
"",
""
]];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsPanicRun",
[
"",
"",
""
]];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsPanicStatic",
[
"",
"",
""
]];

_unit addEventhandler ["AnimDone", {

    params ["_unit", "_animation"];


    if (!([_unit] call ODE_civPanicSystem_fnc_isInPanic) && (random 1 > 0.8)) then {
        // play random idle animation
        private _animations = missionNameSpace getVariable ["ODE_civPanicSystem_civAnimationsIdle",[]];
        _unit playMoveNow (selectRandom _animations);
    } else {
        // play running panic animation
        if (speed _unit > 1) then {
            private _animations = missionNameSpace getVariable ["ODE_civPanicSystem_civAnimationsPanicRun",[]];
            _unit playMoveNow (selectRandom _animations); // TODO INSERT PANIC ANIM
        } else {
            private _animations = missionNameSpace getVariable ["ODE_civPanicSystem_civAnimationsPanicStatic",[]];
            _unit playMoveNow (selectRandom _animations); // TODO INSERT PANIC ANIM
        };
    };
}];
