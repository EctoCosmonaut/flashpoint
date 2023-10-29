_side = _this select 0;
_type = _this select 1;
_pilotCount = pilotCount;
pilotCount = pilotCount +1;
_sideString = str _side;
_tag = _sideString + _type;
_aircraftTypes = [];
switch _tag do {
	case "WESTHELI" : {_aircraftTypes = wHelis};
	case "WESTAIR" : {_aircraftTypes = wAir};
	case "EASTHELI" : {_aircraftTypes = eHelis};
	case "EASTAIR" : {_aircraftTypes = eAir};
};
if(count _aircraftTypes == 0) exitWith {};



_aircraftInfo = _aircraftTypes call pickRandom;
_aircraftType = _aircraftInfo select 0;
_pilotDetails = _aircraftInfo select 1;
_pilotTypes = _pilotDetails select 0;


_pos = [getPos player, random 360, AIR_SPAWN_DIST] call PBD;

_grp = createGroup _side;

_aircraft = createVehicle[_aircraftType,_pos,[],0,"FLY"];

call compile format ["(_pilotTypes call pickRandom) createUnit [_pos,_grp,""pilot%1 = this;removeAllWeapons this""]",_pilotCount];
call compile format ["(_pilotTypes call pickRandom) createUnit [_pos,_grp,""heliGunner%1 = this;removeAllWeapons this""]",_pilotCount];
call compile format ["(_pilotTypes call pickRandom) createUnit [_pos,_grp,""heli1Gunner%1 = this;removeAllWeapons this""]",_pilotCount];
call compile format ["(_pilotTypes call pickRandom) createUnit [_pos,_grp,""heli2Gunner%1 = this;removeAllWeapons this""]",_pilotCount];

_pilot = call compile format ["pilot%1",_pilotCount];
_gunner = call compile format ["heliGunner%1",_pilotCount];
_gunner1 = call compile format ["heli1Gunner%1",_pilotCount];
_gunner2 = call compile format ["heli2Gunner%1",_pilotCount];

_pilot moveindriver _aircraft;
_gunner moveInTurret [_aircraft,[0]];
_gunner1 moveInTurret [_aircraft,[1]];
_gunner2 moveInTurret [_aircraft,[2]];

call compile format ["_pilot addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
call compile format ["_gunner addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
call compile format ["_gunner1 addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
call compile format ["_gunner2 addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];

([_pilot]+_pilotDetails) spawn equip;
([_gunner]+_pilotDetails) spawn equip;
([_gunner1]+_pilotDetails) spawn equip;
([_gunner2]+_pilotDetails) spawn equip;

if(! (_gunner in _aircraft))then{deleteVehicle _gunner};
if(! (_gunner1 in _aircraft))then{deleteVehicle _gunner1};
if(! (_gunner2 in _aircraft))then{deleteVehicle _gunner2};

_wp = _grp addWaypoint [[getPos player,spawnMAX]call areaPos,0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "FULL";
_wp setWaypointDescription "airMove";
_departureWP = _grp addWaypoint [([getPos player,random 360,20000] call PBD),0];
_departureWP setWaypointDescription "airLeave";
airVehicles = airVehicles + [[_aircraft,_grp]];
if(debugMarkers)then{
	_mkr = "b_plane";
	if(_type == "HELI")then{_mkr = "b_air"};
	[_grp,_mkr] execVM "marker.sqf";
};