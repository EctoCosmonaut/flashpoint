showCinemaBorder false;
camNVG = false;
camUseNVG false;
respawnCam = "camera" camcreate [0,0,0];
respawnCam cameraeffect ["internal", "back"];
_cam = respawnCam;
while{dialog}do{
	_teamIndex = lbCurSel 17;
	_tgt = teamMembers select _teamIndex;
	_pos = getPos _tgt;
	_dir = 180 + getDir _tgt;
	_x = _pos select 0;
	_y = _pos select 1;
	_z = (_pos select 2)+5;
	_dist = 10;
	_cam camPreparePos [_x + _dist * (sin _dir),_y + _dist * (cos _dir),_z];
	_cam camPrepareTarget _tgt;
	_cam camCommitPrepared 0;
	waitUntil{lbCurSel 17 != _teamIndex}
};
_cam cameraeffect ["terminate", "back"];
camDestroy _cam;