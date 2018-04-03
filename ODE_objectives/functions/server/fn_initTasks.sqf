// _x params ["_side", "_taskName", "_taskDescription", "_taskTitle", "_areaMarkerName", "_icon"];

// dont execute for jip/clients
if (!isServer) exitWith {};

private _infantry = missionNameSpace getVariable ["ODE_group_infantry", []];
private _cas = missionNameSpace getVariable ["ODE_group_cas", []];

// blufor tasks
[
	[
    [
  		_infantry,
  		"tsk_infantry_takeFOB",
  		"Mit Begleitschutz ins Zielgebiet verlegen, FOB einnehmen und sichern.",
  		"Ins Zielgebiet verlegen.",
  		"mrk_fob",
  		"attack"
  	],
    [
  		_cas,
  		"tsk_cas_takeFOB",
  		"Als Begleitschutz ins Zielgebiet verlegen, FOB sichern.",
  		"UH-60M schützen.",
  		"mrk_fob",
  		"defend"
  	]
  ]
] call ODE_objectives_fnc_createTasks;
