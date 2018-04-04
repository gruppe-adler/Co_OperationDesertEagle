params ["_unit"];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsIdle",
[
"Acts_StandingSpeakingUnarmed",
"Acts_ShieldFromSun_loop",
"Acts_listeningToRadio_Loop",
"Acts_Kore_Introducing"
]];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsPanicRun",
[
"",
"",
""
]];

missionNameSpace setVariable ["ODE_civPanicSystem_civAnimationsPanicStatic",
[
"ApanPercMstpSnonWnonDnon_G01",
"ApanPknlMstpSnonWnonDnon_G02",
"ApanPknlMstpSnonWnonDnon_G03",
"ApanPpneMstpSnonWnonDnon_G01",
"ApanPpneMstpSnonWnonDnon_G02",
"ApanPpneMstpSnonWnonDnon_G03",

"Acts_CivilHiding_1",
"Acts_CivilHiding_2",
"AinvPknlMstpSnonWnonDnon_1",
"AinvPknlMstpSnonWnonDnon_healed_1",
"AinvPknlMstpSnonWnonDnon_healed_2"
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
