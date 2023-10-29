if((time - startTime) < 20)then{hint "Note: At mission start the units take about 30 seconds to all spawn, respawn may not show all units now."; sleep 5};
_trg = createTrigger["EmptyDetector",getPos player];
_trg setTriggerArea[spawnMAX,spawnMAX,0,true];
_trg setTriggerActivation["WEST","PRESENT",true];
_trg2 = createTrigger["EmptyDetector",getPos player];
_trg2 setTriggerArea[spawnMAX,spawnMAX,0,true];
_trg2 setTriggerActivation["EAST","PRESENT",true];

sleep 1.5;
_temp=createDialog "respawnDialog";
_blokes = if(PLAYER_INITIAL_SIDE == east)then{(list _trg2) + (list _trg) - [player]}else{(list _trg) + (list _trg2) - [player]};
_blokes = _blokes + civUnitsList;
_selectedBlokes=_blokes;
deleteVehicle _trg;
deleteVehicle _trg2;

if(count _blokes > 0)then{
	for [{_i=0}, {_i< count _blokes}, {_i=_i+1}] do{
		_bloke = _blokes select _i;
		if(! (_bloke isKindOf "air"))then{
			_d = round ([getPos player, getPos _bloke] call xyPosDist);
			//_s = ((str side _bloke)+" - "+(typeOf _bloke)+" - "+(name _bloke));
			_s = _bloke call unitInfoString;
			if(((count units group _bloke)>1)&&(leader _bloke == _bloke))then{_s = _s +" (Team Leader "+str(count units group _bloke)+" units)"};
			_s = _s + "   ("+(str _d)+"M)";
			lbAdd[15,_s];
		}else{
			_selectedBlokes = _selectedBlokes - [_bloke];
		};
	};
	lbSetCurSel [15,0];
	respawnBlokes = _selectedBlokes;

	showCinemaBorder false;
	camNVG = false;
	camUseNVG false;
	respawnCam = "camera" camcreate [0,0,0];
	respawnCam cameraeffect ["internal", "back"];
	_cam = respawnCam;
	while{dialog}do{
		_curSel = lbCurSel 15;
		_tgt = respawnBlokes select _curSel;
		_pos = getPos _tgt;
		_x = _pos select 0;
		_y = _pos select 1;
		_z = (_pos select 2)+5;
		_cam camPreparePos [_x,_y,_z];
		_cam camPrepareTarget _tgt;
		_cam camCommitPrepared 0;
		waitUntil{(lbCurSel 15) != _curSel};
	};
	_cam cameraeffect ["terminate", "back"];
	camdestroy _cam;
}else{
	hint "Respawn failed to find any units, please try again...";
};