fieldDressing = true;
deadBloke = _this select 0;
theKiller = _this select 1;
if(isNull theKiller)then{theKiller=deadBloke};
deadBloke removeAction comAct;
deadBloke removeAction dresAct;
_dir = [theKiller,deadBloke] call directionAfromB;
_an = "Rabbit";
_anString = "a Rabbit.";
setAccTime 1;
sleep 0.25;
if(!suicideBunnyUsed)then{cutText [DEATH_TEXT, "BLACK OUT", 0]};
sleep 3.25;
if(!suicideBunnyUsed)then{cutText ["", "BLACK IN", 5]}else{
	waitUntil{(abs (((velocity deadBloke) select 0) + ((velocity deadBloke) select 1) + ((velocity deadBloke) select 2))) < 0.01};
	cutText [DEATH_TEXT, "BLACK OUT", 0];
	sleep 1;
	cutText ["", "BLACK IN", 1];
};
selectPlayer createAgent [_an,[getPos player,_dir + 180,1] call PBD, [], 0, "none"];
player setDir _dir;
sleep 1;
Hint ("You are now " + _anString);
showRadio false;
player addWeapon "itemMap";
player addWeapon "itemCompass";
player addWeapon "itemGPS";
player addWeapon "nvGoggles";
sleep 1;
if(!(theKiller==deadBloke))then{player addAction ["Who got me?", "whoGotMe.sqf", [], 10, true]};
player addAction ["Statistics", "animalStats.sqf", [], 9, true];
player addAction ["Respawn", "respawnAction.sqf", [], 8, true];
player addAction ["Suicide", "suicideBunny.sqf", [], 7, true];
if(GCAM_ACTIVE)then{player addAction ["GCam", "gcam\gcam.sqf", [], 6, true]};
player addAction ["End Mission", "animalEnd.sqf", [], 5, true];
