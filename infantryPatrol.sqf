_grp = group _this;
_startPos = getPos leader _grp;
_wp = _grp addWaypoint [_startPos,0];
_wp setWaypointFormation "COLUMN";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
_tactics = ["patrol","patrol","guard"] call pickRandom;
switch _tactics do {
	case "patrol" : {
		_wp setWaypointTimeout [0,10,30];
		_dir = random 360;
		_patrolPointsCount = [1,2,3] call pickRandom;
		_wp setWaypointDescription ("Patrol 1of"+str (_patrolPointsCount+1));
		_lastWP = _wp;
		for[{_i=0},{_i<_patrolPointsCount},{_i=_i+1}]do{
			_newPos = [waypointPosition _lastWP,_dir + 90,100 + random 100] call PBD;
			_wp = _grp addWaypoint [_newPos,0];
			_wp setWaypointTimeout [0,10,30];
			_wp setWaypointDescription ("Patrol "+str (_i +2)+"of"+str (_patrolPointsCount+1));
			_dir = _dir + 90;
			_lastWP = _wp;
		};
		_returnWP = _grp addWaypoint [_startPos,0];
		_returnWP setWaypointType "CYCLE";
	};
	case "guard" : {
		_wp setWaypointType "guard";
		_wp setWaypointCombatMode "red";
		_wp setWaypointDescription "Guard";
	};
};