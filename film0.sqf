showCinemaBorder true;
camNVG = false;
camUseNVG false;
startCam = "camera" camcreate [0,0,0];
startCam cameraeffect ["internal", "back"];
CAM_TGT = "emptyDetector" createVehicle [0,0,0];
_pos = call islandPos;
_x = _pos select 0;
_y = _pos select 1;
CAM_TGT setPos _pos;
_z = getPos CAM_TGT select 2;
_z = _z + 10 + random 40;
CAM_TGT setPos([_pos, random 360,100 + random 900]call PBD);
startCam camPreparePos [_x,_y,_z];
startCam camPrepareTarget CAM_TGT;
startCam camCommitPrepared 0;
cutText["","black in",10];