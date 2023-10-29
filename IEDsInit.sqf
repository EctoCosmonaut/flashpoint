_IEDdensity = 500;//default 1 ied per 500 roads
_iedObjects =  ["pmc_ied_v1","pmc_ied_v2","pmc_ied_v3","pmc_ied_v4"];//the visible ied
_iedLateralOffsets = [4,10];//min,max distance from centre of road section
_iedTriggerRadius = 15;
IED_CHARGES = ["Sh_120_HE","Sh_81_HE"];
IED_SLOW_DELAYS = [1,5,5,5,10];//delays before explosion for slow car
IED_FAST_DELAYS = [0,0.5,0.5,0.5,1];//delays for fast
IED_SPEED_THRESHOLD = 20;

_xMin = SPAWN_LIMITS select 0;
_xMax = SPAWN_LIMITS select 1;
_yMin = SPAWN_LIMITS select 2;
_yMax = SPAWN_LIMITS select 3;
_xDimension = _xMax - _xMin;
_yDimension = _yMax - _yMin;
_roadsCentrePos = [_xMin + (_xDimension /2),_yMin + (_yDimension /2)];
_roads = _roadsCentrePos nearRoads 20000;
_iedCount = (count _roads) / _IEDdensity;
for[{_i=0},{_i<_iedCount},{_i=_i+1}]do{
	_road = _roads call pickRandom;
	_trgPos = getPos _road;
	_dir = (getDir _road);
	_minOff = _iedLateralOffsets select 0;
	_maxOff = _iedLateralOffsets select 1;
	_offset = _minOff + random (_maxOff-_minOff);
	_pos = [_trgPos, _dir + ([90,270] call pickRandom), _offset] call PBD;
	_ied = (_iedObjects call pickRandom) createVehicle _pos;
	_ied setDir (random 360);
	_ied addEventHandler ["hit",{hint "killed ied"}];
	iedText = "IED"+(str _i);
	call compile (iedText+" = _ied");
	_trg = createTrigger["EmptyDetector",_trgPos];
	_trg setTriggerArea[_iedTriggerRadius,_iedTriggerRadius,0,false];
	_trg setTriggerActivation["WEST","PRESENT",true];
	_trg setTriggerStatements ["this","temp = [this,"+iedText+"]+thisList execVM""IED.sqf""",""];
	if(debugMarkers)then{
		_markerName = "IED_MARKER_"+(str _i);
		_marker = createMarker[_markerName,[_pos select 0,_pos select 1]];
		_marker setMarkerShape "ICON";
		_markerName setMarkerType "MIL_OBJECTIVE";
		_markerName setMarkerSize [0.3,0.3];
		_markerName setMarkerColor "COLORRED";
		_markerName setMarkerAlpha 0.7;
	};
};