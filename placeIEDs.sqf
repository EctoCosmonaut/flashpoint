_roads = IED_ROAD_CENTRE nearRoads IED_ROAD_RADIUS;
_iedCount = (IED_COUNT_MIN + (random(IED_COUNT_MAX - IED_COUNT_MIN)));
for[{_i=0},{_i<_iedCount},{_i=_i+1}]do{
	_road = _roads call pickRandom;
	_trgPos = getPos _road;
	_dir = (getDir _road);
	_minOff = IED_LATERAL_OFFSETS select 0;
	_maxOff = IED_LATERAL_OFFSETS select 1;
	_offset = _minOff + random (_maxOff-_minOff);
	_pos = [_trgPos, _dir + ([90,270] call pickRandom), _offset] call PBD;
	_ied = (IED_OBJECTS call pickRandom) createVehicle _pos;
	_ied setDir (random 360);
	iedText = "IED"+(str _i);
	call compile (iedText+" = _ied");
	_trg = createTrigger["EmptyDetector",_trgPos];
	_trg setTriggerArea[IED_TRIGGER_RADIUS,IED_TRIGGER_RADIUS,0,false];
	_trg setTriggerActivation["WEST","PRESENT",true];
	_trg setTriggerStatements ["this","temp = [this,"+iedText+"]+thisList execVM""IED.sqf""",""];
	if(debugMarkers)then{
		_markerName = "IED_MARKER_"+(str _i);
		_marker = createMarker[_markerName,[_pos select 0,_pos select 1]];
		_marker setMarkerShape "ICON";
		_markerName setMarkerType "MIL_OBJECTIVE";
		_markerName setMarkerSize [0.3,0.3];
		_markerName setMarkerColor "COLORRED";
		_markerName setMarkerAlpha 0.5;
	};
};