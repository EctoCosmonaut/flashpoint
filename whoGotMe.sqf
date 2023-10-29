hint "This is who got you!";
_dir = [deadBloke,theKiller] call directionAfromB;
player setDir _dir;
player setPos ([getPos theKiller,_dir + 180,2] call PBD);

