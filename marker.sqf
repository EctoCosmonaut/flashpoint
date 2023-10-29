_grp = _this select 0;
_markerType =_this select 1;
_side = side _grp;
_pos = getPos leader _grp;
_markerName = format ["S%1",markerCount];
_wmarkerName = format ["W%1",markerCount];
markerCount = markerCount + 1;
_marker = createMarker[_markerName,_pos];
_marker setMarkerShape "ICON";
_markerName setMarkerType _markerType;
_markerName setMarkerSize [0.3,0.3];
_markerName setMarkerColor "COLORRED";
_markerName setMarkerAlpha 0.4;
_wmarker = createMarker[_wmarkerName,[0,0]];
_wmarker setMarkerShape "ICON";
_wmarkerName setMarkerType "MARKER";
_wmarkerName setMarkerSize [0.2,0.2];
_wmarkerName setMarkerColor "COLORRED";
_wmarkerName setMarkerAlpha 0.15;
if(_side == west)then{_markerName setMarkerColor "COLORBLUE"; _wmarkerName setMarkerColor "COLORBLUE"};
if(_side == civilian)then{_markerName setMarkerColor "COLORGREEN"; _wmarkerName setMarkerColor "COLORGREEN"};
while{_side countSide units _grp > 0}do{
	sleep MARKER_UPDATE_DELAY;
	_wmarkerName setMarkerPos (getWPPos [_grp,currentWaypoint _grp]);
	_markerName setMarkerPos [getPos leader _grp select 0,getPos leader _grp select 1];
	_markerName setMarkerDir getDir leader _grp;
	_markerName setMarkerText format["%1",_side countSide units _grp];
	if(vehicle leader _grp != leader _grp)then{_markerName setMarkerText (typeOf (vehicle (leader _grp)))};
	_wmarkerName setMarkerText (str (_side countSide units _grp)+" "+ waypointDescription [_grp,currentWaypoint _grp]);
};
deleteMarker _markerName;
deleteMarker _wmarkerName;