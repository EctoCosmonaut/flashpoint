civWaypoint = {
	_home = _this getVariable "THB_CIV_HOME";
	_destination = _home;
	if(random 100 > CIV_STAY_HOME_PERCENTAGE)then{
		_buildings = [getPos _home, CIV_ROAMING_DIST] call getNearBuildings;
		_destination = _buildings call pickRandom;
	};
	_destPos = _destination call buildingRandomPos;
	[group _this,2] setWaypointPosition [_destPos,0];
};

buildingRandomPos = {
	_bpc = _this getVariable "THB_BP_COUNT";
	_this buildingPos floor (random _bpc)
};

civSpawn = {
	_building = CURRENT_CIV_BUILDINGS call pickRandom;	_pos = _building call buildingRandomPos;
	_grp = createGroup civilian;
	_man = _grp createUnit  [CIV_TYPES call pickRandom, _pos, [], 0, "NONE"];
	_man setPos _pos;
 	_man spawn manDebug;
	_man setSkill 0;
	{_man removeWeapon _x}forEach ["itemMap","itemCompass","ItemRadio"];
	_man setVariable ["THB_CIV_HOME",_building];
	_grp setBehaviour "SAFE";
	_wp1 = _grp addWaypoint [_pos,0];
	_wp1 setWaypointTimeout CIV_WP_DELAYS;
	_wp1 setWaypointSpeed "LIMITED";
	_wp1 setWaypointStatements ["true","this call civWaypoint"];
	_wp2 = _grp addWaypoint [_pos,0];
	_wp2 setWaypointTimeout CIV_WP_DELAYS;
	_wp3 = _grp addWaypoint [_pos,0];
	_wp3 setWaypointType "CYCLE";
	civUnitsList = civUnitsList + [_man];
	if(debugMarkers)then{[_grp,"start"] execVM "marker.sqf"};
};

getNearBuildings = {
	_pos = _this select 0;
	_radius = _this select 1;
	_houses = _pos nearObjects ["house",_radius];
	_buildings = [];
	{
		_bp = _x buildingPos 0;
		if((_bp select 0) + (_bp select 1) + (_bp select 2) != 0)then{
			_buildings = _buildings + [_x];
			_bpc = _x getVariable "THB_BP_COUNT";
			if(typeName _bpc == "SCALAR")exitWith{};
			for[{_i=1},{true},{_i=_i+1}]do{
				_bp = _x buildingPos _i;
				if((_bp select 0) + (_bp select 1) + (_bp select 2) == 0)exitWith{_x setVariable ["THB_BP_COUNT",_i]};
			};
		};
	}forEach _houses;
	_buildings
};

civUnitsList = [];

[] spawn{
	waitUntil{setupCompleted};

	waitUntil{
		sleep 30;
		CURRENT_CIV_BUILDINGS = [getPos player, CIV_SPAWN_RANGE] call getNearBuildings;
		_in=0;
		{
			_man = _x;
			if(([getPos _man, getPos player] call xyPosDist) > CIV_REMOVE_RANGE)then{
				civUnitsList set [_in,"EMPTY_ELEMENT"];
				deleteVehicle _man;
			};
			_in=_in+1;
		}forEach civUnitsList;
		civUnitsList = civUnitsList - ["EMPTY_ELEMENT"];
		
		_civsAlreadySpawned = count civUnitsList;
		_spawnCount = CIV_COUNT_MAX - _civsAlreadySpawned;
		_buildingsCount = count CURRENT_CIV_BUILDINGS;
		_civsNeeded = (ceil (_buildingsCount * CIV_PER_BUILDING))-_civsAlreadySpawned;
		if(_civsNeeded < _spawnCount)then{_spawnCount = _civsNeeded};
		
		for[{_i=0},{_i<_spawnCount},{_i=_i+1}]do{
				sleep 0.5;
				[] spawn civSpawn;
			};
		//if(_spawnCount>0)then{hintSilent (str _spawnCount + " civilians have spawned\n"+ str _buildingsCount +" buildings available")};
		false
	};
};