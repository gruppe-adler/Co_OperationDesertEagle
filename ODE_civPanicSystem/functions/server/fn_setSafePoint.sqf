params ["_enemy"];

private _enemyPosition = position _enemy;
private _oppositeDirection = (_unit getRelDir _enemy) - 180;

// give back position 250m away in opposite direction of nearest enemy
_unit setVariable ["ODE_civPanicSystem_safePoint", (_enemyPosition getPos [250, _oppositeDirection])];
