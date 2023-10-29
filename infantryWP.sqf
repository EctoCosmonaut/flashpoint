_leader = _this select 0;
_destPos = _this select 1;

_grp = group _leader;
_side = side _leader;
_dir = [_destPos,getPos _leader] call directionPosAfromB;
_destDist = [_destPos,getPos _leader] call xyPosDist;

_pos = _destPos;

_wpString = "temp = this execVM ""infantryPatrol.sqf""";

if(_destDist > INFANTRY_DEST_RANGE_MULT * INFANTRY_WP_BOUND_DISTANCE )then{
	_wpString = "temp = [this,"+str _destPos+"] spawn infantryWP";
	_testResults = [];
	_testPosCentre = [getPos _leader, _dir, INFANTRY_WP_BOUND_DISTANCE] call PBD;
	_testResults = _testResults + [_testPosCentre];
	for[{_i = 1},{_i<=INFANTRY_WP_POINTS_SEARCH_POINTS},{_i=_i+1}]do{
		_testPos = [_testPosCentre,_dir +90,INFANTRY_WP_TEST_POS_SEPARATION * _i] call PBD;
		_testResults = _testResults +  [_testPos];
		_testPos = [_testPosCentre,_dir -90,INFANTRY_WP_TEST_POS_SEPARATION * _i] call PBD;
		_testResults = _testResults +  [_testPos];
	};
	_lowest = 999999;
	_lowestPos = [];
	_obj = theBall;
	{
		_obj setPos _x;
		_height = (getPosASL _obj) select 2;
		if((_height < _lowest)&& !(surfaceIsWater _x) && (_height > 4))then{
			_lowest = _height;
			_lowestPos = _x;
		};
	}forEach _testResults;
	if(count _lowestPos > 0)then{_pos = _lowestPos};//in case all test pos were in water (utes and podagorsk bug fix)
};

_wp = _grp addWaypoint [_pos,0];
_wp setWaypointStatements ["true",_wpString];
_wp setWaypointDescription "Move";