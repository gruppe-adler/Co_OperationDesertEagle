["ace_placedInBodyBag", {
        diag_log format ["placedInBodyBag eh %1", _this];
        params ["_deadGuy", "_bodyBag"];

        private _dir = getDir _bodyBag;
        private _position = getPos _bodyBag;
        private _wasPlayer = _deadGuy getVariable ["ODE_bodyBagWasPlayer", false];
        // private _marker = missionNamespace getVariable ["GRAD_pilotTracking_markerObj", objNull];

        if (_wasPlayer) then {
              _bodyBag setVariable ["ODE_bodyBagWasPlayer", true, true];
        };

}] call CBA_fnc_addEventHandler;
