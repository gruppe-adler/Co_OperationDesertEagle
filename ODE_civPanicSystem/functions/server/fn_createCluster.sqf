/*

  [_pos, 1 + (ceil (random 3))] call ODE_civPanicSystem_fnc_createCluster;

  // creates group of agents
  // does not handle behaviour, this is done in createAgent

*/

params ["_pos", "_count"];

private ["_agentArray", "_agent", "_leader", "_allTheOthers", "_wholeGroup", "_existingGroups"];

_agentArray = [];

for "_i" from 0 to _count do {
	_agent = [_pos] call ODE_civPanicSystem_fnc_createAgent;
	_agentArray append [_agent];
};
_leader = _agentArray select 0;
_allTheOthers = _agentArray - [_leader];

{
	_x doWatch _leader;
	_x setDir (_x getRelDir _leader);
	_x setVariable ["ODE_civPanicSystem_groupleader", _leader, true];
} forEach _allTheOthers;

_leader doWatch (_allTheOthers select 0);
_leader setDir ((_allTheOthers select 0) getRelDir _leader);

// group leader
_leader setVariable ["ODE_civPanicSystem_groupmembers", _allTheOthers, true];

_allTheOthers pushBack _leader;

_existingGroups = missionNamespace getVariable ["ODE_civPanicSystem_allgroups", []];

// register group
missionNamespace setVariable ["ODE_civPanicSystem_allgroups", _existingGroups append [_allTheOthers]];
