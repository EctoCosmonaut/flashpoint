infantryWP = compile preprocessFileLineNumbers "infantryWP.sqf"; 

//----infantry wp module
INFANTRY_WP_BOUND_DISTANCE = 300;
INFANTRY_DEST_RANGE_MULT = 1.5;
INFANTRY_WP_SEARCH_ANGLE = 30;
INFANTRY_WP_POINTS_SEARCH_POINTS = 4;
INFANTRY_WP_TEST_POS_SEPARATION = (INFANTRY_WP_BOUND_DISTANCE*(tan INFANTRY_WP_SEARCH_ANGLE)) / INFANTRY_WP_POINTS_SEARCH_POINTS;
theBall = "Baseball" createVehicle [0,0,0];

//---- scan town markers to get town postions list ----
ALL_TOWNS = [];
for[{_i=1},{true},{_i=_i+1}]do{
	_marker = "m_"+ str _i;
	_pos = getMarkerPos _marker;
	if((_pos select 0) == 0 && (_pos select 1) == 0)exitWith{};
	ALL_TOWNS = ALL_TOWNS + [[round (_pos select 0), round(_pos select 1)]];
	if(debugMarkers)then{
		_marker setMarkerAlpha 0.5;
		_marker setMarkerBrush "BORDER";
	}else{
		deleteMarker _marker;
	};
};

//---- returns nearest town to given pos ----
nearestTown = {
	_targetDistance = 999999;
	_winningIndex = -1;
	for[{_i=0},{_i<count ALL_TOWNS},{_i=_i+1}]do{
		_testPos = ALL_TOWNS select _i;
		_testDist = [_this,_testPos] call xyPosDist;
		if(_testDist < _targetDistance)then{
			_winningIndex = _i;
			_targetDistance = _testDist;
		};
	};
	ALL_TOWNS select _winningIndex
};

//---- returns list of any towns within given distance of given pos ----
nearTowns = {
	_pos =_this select 0;
	_maxRange = _this select 1;
	_return = [];
	for[{_i=0},{_i<count ALL_TOWNS},{_i=_i+1}]do{
		_testPos = ALL_TOWNS select _i;
		_testDist = [_pos,_testPos] call xyPosDist;
		if(_testDist <= _maxRange)then{
			_return = _return + [_testPos];
		};
	};
	_return
};