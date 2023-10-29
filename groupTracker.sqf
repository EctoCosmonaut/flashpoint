_updateDelay = 0.3;
sleep 20;
while{true}do{
	_startTime = time;
	for [{_i=0}, {_i<count infantryUnits}, {_i=_i+1}] do{
		_e = infantryUnits select _i;
		_grp = _e select 0;
		_side = _e select 1;
		_respawn = _e select 2;
		_grpDead = _side countSide (units _grp) == 0;
		if(isNull _grp || _grpDead)then{
			infantryUnits set [_i,"EMPTY ELEMENT HERE"];
			if(_respawn)then{
				[_side]execVM "infantry.sqf";
			};
		}else{
			_grpFar = [getPos(leader _grp),SPAWN_CENTER] call xyPosDist > spawnMAX;
			if(_grpFar && !(_grp == group player))then{{deleteVehicle _x} forEach units _grp; deleteGroup _grp};
			sleep _updateDelay;
		};
	};
	infantryUnits =infantryUnits - ["EMPTY ELEMENT HERE"];

	for [{_i=0}, {_i<count groundVehicles}, {_i=_i+1}] do{
		_e = groundVehicles select _i;
		
		_car = _e select 0;
		_crewGrp = _e select 1;
	
		_wp = [_crewGrp,0];
		if(isNull _car && isNull _crewGrp)then{
			groundVehicles set [_i,"EMPTY ELEMENT HERE"];
		}else{
			_carFar = [getPos _car,SPAWN_CENTER] call xyPosDist > spawnMAX;
			_crewFar = [getPos(leader _crewGrp),SPAWN_CENTER] call xyPosDist > spawnMAX;
			_wpFar = [SPAWN_CENTER,(getWPPos _wp)]call xyPosDist > (spawnMAX*0.7);
			if(_wpFar)then{_wp setWPPos call wpPos};
			if(_carFar && ((getDammage _car) < 1 && !(_car == vehicle player)))then{deleteVehicle _car};
			if(_crewFar)then{{deleteVehicle _x} forEach units _crewGrp; deleteGroup _crewGrp};
			sleep _updateDelay;
		};
	};
	groundVehicles = groundVehicles - ["EMPTY ELEMENT HERE"];

	for [{_i=0}, {_i<count airVehicles}, {_i=_i+1}] do{
		_e = airVehicles select _i;
		_air = _e select 0;
		_crewGrp = _e select 1;
		if(isNull _air && isNull _crewGrp)then{
			airVehicles set [_i,"EMPTY ELEMENT HERE"];
		}else{			
			_airFar = [getPos _air,SPAWN_CENTER] call xyPosDist > 5000;
			_crewFar = [getPos(leader _crewGrp),SPAWN_CENTER] call xyPosDist > 5000;
			if(_airFar && ((getDammage _air) < 1))then{deleteVehicle _air};
			if(_crewFar)then{{deleteVehicle _x} forEach units _crewGrp; deleteGroup _crewGrp};
			sleep _updateDelay;
		};
	};
	airVehicles = airVehicles - ["EMPTY ELEMENT HERE"];

	if(count recycleBin > RECYCLE_MAX)then{
		for [{_i=0}, {_i < ((count recycleBin)/2)}, {_i=_i+1}] do{
			_body = recycleBin select _i;
			recycleBin set [_i,"EMPTY ELEMENT HERE"];
			deleteVehicle _body;
			sleep _updateDelay;
			recycleBin = recycleBin - ["EMPTY ELEMENT HERE"];
		};
	};

	if(count carList > CARS_MAX)then{
		for [{_i=0}, {_i < ((count carList)-CARS_MAX)}, {_i=_i+1}] do{
			_car = carList select _i;
			if(!(vehicle player == _car))then{
				carList set [_i,"EMPTY ELEMENT HERE"];
				deleteVehicle _car;
				sleep _updateDelay;
				carList =carList - ["EMPTY ELEMENT HERE"];
			};
		};
	};

	for [{_i=0}, {_i<count allAnimals}, {_i=_i+1}] do{
		_an = allAnimals select _i;
		if(isNull _an)then{
			allAnimals set [_i,"EMPTY ELEMENT HERE"];
		}else{	
			_tooFar = [getPos _an,SPAWN_CENTER] call xyPosDist > spawnMAX;
			if(_tooFar)then{
				deleteVehicle _an;
				animalCount =  animalCount - 1;
			};
			sleep _updateDelay;
		};
	};
	allAnimals = allAnimals - ["EMPTY ELEMENT HERE"];

	if(animalCount < ANIMAL_COUNT_MAX)then{
		call animalScript;
	};
	if(groupTrackDebug)then{
		_dbt = "loop time "+ str round(time - _startTime)+"\n";
		_dbt = _dbt + "inf grps " + str count infantryUnits+"\n";
		_dbt = _dbt + "veh " + str count groundVehicles+"\n";
		_dbt = _dbt + "air " + str count airVehicles+"\n";
		_dbt = _dbt + "bodies " + str count recycleBin+"\n";
		_dbt = _dbt + "civs " + str count civUnitsList+"\n";
		_dbt = _dbt + "cars " + str count carList+"\n";
		_dbt = _dbt + "animals " + str count allAnimals+"\n";
		hintSilent _dbt;
	};
};
