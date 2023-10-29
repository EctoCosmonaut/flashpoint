_milDriver = milDriver;
milDriver = milDriver + 1;
_side = _this select 0;
_arm = _this select 1;

_carsArray = if(_arm)then{wArm}else{wCars};

if(_side == east)then{
	_carsArray = if(_arm)then{eArm}else{eCars};
};
if(count _carsArray == 0)exitWith{};

_startPos = call spawnPos;
_roads = SPAWN_CENTER nearRoads spawnMax;
_closeRoads = SPAWN_CENTER nearRoads spawnMin;
_startRoads = _roads - _closeRoads;
if(count _startRoads > 0)then{
	_p = getPos (_startRoads call pickrandom);
	_startPos = [_p select 0, _p select 1];
};

_crew = createGroup _side;
_sideString = format ["%1",_side];
_carDetails = _carsArray call pickRandom;

_carType = _carDetails select 0;
_crewDetails =  _carDetails select 1;
_cargoUnits = _carDetails select 2;
_extraGunners = _carDetails select 3;
_ammoTypes = _carDetails select 4;
_cargoUnits = _cargoUnits - [_cargoUnits select 0,_cargoUnits select 1];//trim off the unused squad sizes
_car = _carType createVehicle _startPos;
_car setDir random 360;
_car setFuel (0.1 + (random 0.9));
_soldierTypes = _crewDetails select 0;
if(_car emptyPositions "commander" > 0)then{
	call compile format ["(_soldierTypes call pickRandom) createUnit [_startPos,_crew,""milCmandr%1 = this; removeAllWeapons this"",random MAX_SKILL]",_milDriver];
	_cmandr = call compile format ["milCmandr%1",_milDriver];
	call compile format ["_cmandr addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	_cmandr moveInCommander _car;
	([_cmandr]+_crewDetails) spawn equip;
};
if(_car emptyPositions "gunner" > 0)then{
	call compile format ["(_soldierTypes call pickRandom) createUnit [_startPos,_crew,""milGunner%1 = this; removeAllWeapons this"",random MAX_SKILL]",_milDriver];
	_gunner = call compile format ["milGunner%1",_milDriver];
	call compile format ["_gunner addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	_gunner moveInGunner _car;
	([_gunner]+_crewDetails) spawn equip;
};
call compile format ["(_soldierTypes call pickRandom) createUnit [_startPos,_crew,""milDriver%1 = this; removeAllWeapons this"",random MAX_SKILL]",_milDriver];
_driver = call compile format ["milDriver%1",_milDriver];
call compile format ["_driver addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
_driver moveInDriver _car;
([_driver]+_crewDetails) spawn equip;
if(count _extraGunners >= 1)then{
	call compile format ["(_soldierTypes call pickRandom) createUnit [_startPos,_crew,""mil2Gunner%1 = this; removeAllWeapons this"",random MAX_SKILL]",_milDriver];
	_gunner2 = call compile format ["mil2Gunner%1",_milDriver];
	call compile format ["_gunner2 addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	_gunner2 moveInTurret [_car,(_extraGunners select 0)];
	([_gunner2]+_crewDetails) spawn equip;
};
if(count _extraGunners >= 2)then{
	call compile format ["(_soldierTypes call pickRandom) createUnit [_startPos,_crew,""mil3Gunner%1 = this; removeAllWeapons this"",random MAX_SKILL]",_milDriver];
	_gunner3 = call compile format ["mil3Gunner%1",_milDriver];
	call compile format ["_gunner3 addEventHandler [""KILLED"",{[_this,""%1""]spawn killed}];",_sideString];
	_gunner3 moveInTurret [_car,(_extraGunners select 1)];
	([_gunner2]+_crewDetails) spawn equip;
};
_free = _car emptyPositions "CARGO";
_pax = floor( random (_free + 1));
for [{_i=0}, {_i<_pax}, {_i=_i+1}] do
{
	sleep 0.5;
	_cargoDetails = _cargoUnits call pickRandom;
	_cargoTypes = _cargoDetails select 0;
	_ehString = format ["pax%2%3 = this;removeAllWeapons this;this addEventHandler [""killed"",{[_this,""%1""] spawn killed}]",_sideString,_milDriver,_i];
	(_cargoTypes call pickRandom) createUnit [_startPos,_crew,_ehString,random MAX_SKILL];
	_thisPax = call compile format ["pax%1%2",_milDriver,_i];
	_thisPax moveInCargo _car;
	([_thisPax]+_cargoDetails) spawn equip;
	if(_i==0)then{
		_gear = weapons _thisPax;
		if(!("Binocular" in _gear || "Binocular_Vector" in _gear))then{
			_thisPax addWeapon "binocular";
		};
		_thisPax setSkill MAX_SKILL;
	};
};
if(count _ammoTypes > 0)then{// some tanks have no ammo cargo
	_ammoCodes = [];
	{
		_ammoCodes = _ammoCodes + [[_x,round (4 + random 4)]];
	}forEach _ammoTypes;

	_car setVehicleInit ("[this, "+str _ammoCodes+"] call vehicleAmmo");
	processInitCommands;
};
_pos = call wpPos;
if(count _roads > 0)then{
	_p = getPos (_roads call pickRandom);
	_pos = [_p select 0, _p select 1];
};

_wp = _crew addWaypoint [_pos,0];
_wp setWaypointType "GUARD";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";
_wp setWaypointDescription "Vehicle Guard";

_element = [_car,_crew];
groundVehicles = groundVehicles + [_element];

if(debugMarkers)then{[_crew,"mil_start"] execVM "marker.sqf"};
