params [["_type", "LOP_Tak_Civ_Random"], "_position"];

private _agent = createAgent [_type, _position, [], 0, "NONE"];
_agent setVariable ["BIS_fnc_animalBehaviour_disable", true];
_agent joinSilent (createGroup east);

_agent disableAI "SUPPRESSION";
_agent disableAI "CHECKVISIBLE";
_agent disableAI "FSM";
_agent setBehaviour "CARELESS";

_agent addEventhandler ["Killed", {
      params ["_unit", "_killer"];
      [_unit, _killer] spawn ODE_civPanicSystem_fnc_spreadPanic;
}];

_agent addEventhandler ["FiredNear", {
      params ["_unit", "_shooter"];

      // todo check if this also applies to unit itself (through nearentities)
      [_unit, _shooter] spawn ODE_civPanicSystem_fnc_spreadPanic;
}];

[_agent] call ODE_civPanicSystem_fnc_loopBehaviour;
[_agent] call ODE_civPanicSystem_fnc_animationHandler;
