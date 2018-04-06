/*

  fires guided missile which always hits – by commy2, adapted by nomisum

  [_unit, _heli] call ODE_missionControl_fnc_missileFire;

*/

params [
    ["_origin", objNull, [objNull, []], 3],
    ["_target", objNull, [objNull]]
];

// give him launcher
_origin linkItem "rhs_weap_fim92";
_origin playMoveNow "AmovPercMstpSrasWlnrDnon";

_origin setVariable ["ODE_missileTarget", _target];

_origin addEventhandler ["AnimDone", {
    removeEventHandler ["AnimDone", _thisEventhandler];

    private _origin = (_this select 0);
    private _target = _origin getVariable ["ODE_missileTarget", objNull];

    private _type = "rhs_ammo_fim92_missile";

    if (_origin isEqualType objNull) then {
        private _size = sizeOf typeOf _origin;
        _origin = eyePos _origin;
        _origin = _origin vectorAdd ((_origin vectorFromTo getPosWorld _target) vectorMultiply _size);
    };

    private _missile = _type createVehicle ASLToAGL _origin;

    [{
        params ["_args", "_handle"];
        _args params ["_missile", "_target"];

        if (isNull _missile) exitWith {
            private _playersInVehicle = [];

            {
                if (objectParent _x isEqualTo _target) then {
                    _playersInVehicle pushBack _x;
                };
            } forEach allPlayers;

            // shake em up
            [_target] remoteExec ["ODE_missionControl_fnc_missileDamage", _target];
            [_target] remoteExec ["ODE_missionControl_fnc_missileImpactEffects", _playersInVehicle];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        [_missile, _target] call ODE_missionControl_fnc_missileGuide;

    }, 0, [_missile, _target]] call CBA_fnc_addPerFrameHandler;

}];
