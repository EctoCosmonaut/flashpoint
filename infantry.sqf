_side = _this select 0;

_grp = createGroup _side;
infantryUnits = infantryUnits + [[_grp,_side,true]];
_sideString = str _side;
_pos = call spawnPos;
_teamType = wTeams call pickRandom;
if(_side == east)then{_teamType = (eTeams call pickRandom)};
_min = _teamType select 0;
_max = _teamType select 1;
_teamType = _teamType - [_min];
_teamType = _teamType - [_max];
_unitCount = floor(_min + random (_max - _min +1));
for [{_i=0}, {_i<_unitCount}, {_i=_i+1}] do
{
	_unitDetails = _teamType call pickRandom;
	_unitType = (_unitDetails select 0) call pickRandom;
	_soldierCount = soldierCount;
	soldierCount = soldierCount +1;
	_unitType createUnit [[_pos,50] call areaPos,_grp,format["soldier%1 = this; removeAllWeapons this",_soldierCount],random MAX_SKILL];
	sleep 0.1;
	_bloke = call compile format["soldier%1",_soldierCount];
	call compile format ["_bloke addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	([_bloke]+_unitDetails) spawn equip;
	sleep 1;
};
_ldr = leader _grp;
((units _grp) - [_ldr]) doFollow (_ldr);
_gear = weapons _ldr;
if(!("Binocular" in _gear || "Binocular_Vector" in _gear))then{
	_ldr addWeapon "binocular";
};
_ldr setSkill MAX_SKILL;
if(debugMarkers)then{
	[_grp,"mil_arrow"] execVM "marker.sqf";
};
_destPos = call wpPos;
_towns = [SPAWN_CENTER,spawnMax] call nearTowns;
if(count _towns > 0)then{
	_destPos = [(_towns call pickRandom),random 360,random 100] call PBD;	
};
[_ldr,_destPos] spawn infantryWP;
[_grp,0] setWPPos _pos;

if((random 100) < CAR_PERCENT)then{[_side,false] execVM "vehicle.sqf"};
if((random 100) < ARM_PERCENT)then{[_side,true] execVM "vehicle.sqf"};
if((random 100) < SNIPER_PERCENT)then{[_side] execVM "sniperTeam.sqf"};
if((random 100) < HELO_PERCENT)then{[_side,"HELI"] call aircraft};
if((random 100) < AIR_PERCENT)then{[_side,"AIR"] call aircraft};
