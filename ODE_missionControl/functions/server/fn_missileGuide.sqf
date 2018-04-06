/*

  guides guided missile which always hits – by commy2, adapted by nomisum

*/

params ["_missile", "_target"];

private _vdir = getPosWorld _missile vectorFromTo getPosWorld _target;
private _vlat = vectorNormalized (_vdir vectorCrossProduct [0,0,1]);
private _vup = _vlat vectorCrossProduct _vdir;
private _speed = vectorMagnitude velocity _missile;
private _vel = _vdir vectorMultiply _speed;
_missile setVectorDirAndUp [_vdir, _vup];
_missile setVelocity _vel;
