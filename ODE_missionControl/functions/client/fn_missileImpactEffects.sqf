params ["_heli"];

// pos - .1, vertcoef, horzcoef, bankcoef, interpolation - 10
setCamShakeParams [0.1, 9, 1, 3, true];
// strength, duration, frequency
addCamShake [5, 1, 5];
addCamShake [0.5, 5, 5];

// todo add soundfx
// todo add more fx
