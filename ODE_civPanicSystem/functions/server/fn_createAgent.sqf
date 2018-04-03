params ["_type", "_position"];

private _agent = createAgent [_type, _position, [], 0, "NONE"];
_agent setVariable ["BIS_fnc_animalBehaviour_disable", true];
_agent joinSilent (createGroup east);

_agent disableAI "SUPPRESSION";
_agent disableAI "CHECKVISIBLE";

_agent addEventhandler ["Killed", {

      params ["_unit", "_killer"];
      [_unit, _killer] spawn ODE_civPanicSystem_fnc_spreadPanic;

}];

[_agent] call ODE_civPanicSystem_fnc_loopBehaviour;
