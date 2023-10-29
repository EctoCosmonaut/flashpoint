sleep random 5;

_side = _this select 0;
_sideString = format ["%1",_side];
_pos = call spawnPos;

_teamType = wSnipers call pickRandom;
if(_side == east)then{_teamType = (eSnipers call pickRandom)};


_sniperDetails = _teamType select 0;
_spotterDetails = _teamType select 1;
_sniperTypes = _sniperDetails select 0;
_spotterTypes = _spotterDetails select 0;


_grp = createGroup _side;

sleep 1;
_soldierCount = soldierCount;
soldierCount = soldierCount +1;
(_sniperTypes call pickRandom) createUnit [_pos,_grp,format["sniper%1 = this; removeAllWeapons this",_soldierCount],MAX_SKILL];
sleep 0.1;
_sniper = call compile format["sniper%1",_soldierCount];
call compile format ["_sniper addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
([_sniper]+_sniperDetails) execVM "equip.sqf";

if(random 100 < SNIPERS_HAVE_SPOTTERS_PERCENT)then{
	sleep 1;
	(_spotterTypes call pickRandom) createUnit [_pos,_grp,format["spotter%1 = this; removeAllWeapons this",_soldierCount],MAX_SKILL];
	sleep 0.1;
	_spotter = call compile format["spotter%1",_soldierCount];
	call compile format ["_spotter addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	([_spotter]+_spotterDetails) execVM "equip.sqf";
};

wp = _grp addWaypoint [_pos,0];
_wp setWaypointType "HOLD";
_grp setBehaviour "COMBAT";
_grp setFormation "DIAMOND";

infantryUnits = infantryUnits + [[_grp,_side,false,false]];

if(debugMarkers)then{
	//hint "sniperTeam";
	[_grp,"mil_triangle"] execVM "marker.sqf";
};