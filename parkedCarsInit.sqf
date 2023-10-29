CAR_ANGLE_RANDOM = 10;
CAR_SPAWN_FROM_HOUSE_DIST = 30;
CAR_SPAWN_DIST = 1500;
CAR_OFFSET_DISTANCES = [6,7,8,9,10,11,12,13,14,15];
CARS_MAX = 100;

CAR_TOWNS = [];
carList = [];
for[{_i=1},{true},{_i=_i+1}]do{  // starting index changed to 1, easeir for cuting and pasting markers in editor
	_marker = "carTown_"+ str _i;  // so now marker "carTown_0" will be ignored! (rename it)
	_pos = getMarkerPos _marker;
	if((_pos select 0) == 0 && (_pos select 1) == 0)exitWith{};
	_radius = (getMarkerSize _marker) select 0;
	CAR_TOWNS = CAR_TOWNS + [[_pos select 0, _pos select 1, _radius]];
	if(debugMarkers)then{
		_marker setMarkerAlpha 0.5;
		_marker setMarkerBrush "BORDER";
	}else{
		deleteMarker _marker;
	};
};
{
	_radius = _x select 2;
	_townPos = _x - [_radius];
	_trg = createTrigger["EmptyDetector",[_townPos select 0,_townPos select 1]];
	_trg setTriggerArea[CAR_SPAWN_DIST,CAR_SPAWN_DIST,0,false];
	_trg setTriggerActivation ["ANY","PRESENT",false];
	_trg setTriggerStatements ["vehicle player in thislist && setupCompleted","temp = "+(str _x)+" call carParkTown; deleteVehicle this", ""];
}
forEach CAR_TOWNS;

carParkTown = {
	_townPos = [_this select 0,_this select 1];
	_townRadius = _this select 2;
	_testRoads = _townPos nearRoads _townRadius;
	_houseCloseRoads = [];
	{if(count (nearestObjects [_x,["house"],CAR_SPAWN_FROM_HOUSE_DIST])>0)then{_houseCloseRoads = _houseCloseRoads + [_x]}}forEach _testRoads;
	_selectedRoads = [];
	{if(count (roadsConnectedTo _x)<=2)then{_selectedRoads = _selectedRoads + [_x]}}forEach _houseCloseRoads;
	if(count _selectedRoads > 0)then{
		CAR_DENSITY_FACTOR = 0.1;
		_carCount = ceil((count _selectedRoads) * CAR_DENSITY_FACTOR);
		if(_carCount < 1)then{_carCount = 1};
		if(_carCount > CAR_MAX_PER_TOWN)then{_carCount = CAR_MAX_PER_TOWN};
		for [{_i=0}, {_i<_carCount}, {_i=_i+1}] do{
			_road = _selectedRoads call pickRandom;
			_dir = (getDir _road);
			_pos = [getPos _road, _dir + ([90,270] call pickRandom), (CAR_OFFSET_DISTANCES call pickRandom)] call PBD;
			_car = (CARPARK_TYPES call pickRandom) createVehicle _pos;
			_relativeAngles = [0,0,0,0,180,180,180,180];
			_box = boundingBox _car;
			_length = ((_box select 1) select 1) - ((_box select 0) select 1);
			if(_length < 7)then{_relativeAngles = _relativeAngles + [90,270]};
			_car setDir _dir + (_relativeAngles call pickrandom) - CAR_ANGLE_RANDOM + (random (2*CAR_ANGLE_RANDOM));
			_car setVelocity [0,0,-1];
			_gunCount = [0,0,0,0,1,2,3,4] call pickRandom;
			_cargoCodes = [];
			for [{_j=0}, {_j<_gunCount}, {_j=_j+1}]do{
				_ammo = floor (random (count CAR_AMMOS));
				_ammoCount = [1,2,3,3,4,4,4,5,5,5,6,6,7,8,9,10] call pickRandom;
				_cargoCodes = _cargoCodes + [[_ammo,_ammoCount]];
			};
			_car setVehicleInit ("[this, "+str _cargoCodes+"] call parkedCarAmmo");
			carList = carList + [_car];
			_car setFuel (0.1 + random 0.9);
			if(debugMarkers)then{
				_markerName = ("car"+str markerCount);
				markerCount=markerCount+1;
				createMarker[_markerName,getPos _car];
				_markerName setMarkerShape "ICON";
				_markerName setMarkerType "mil_box";
				_markerName setMarkerSize [0.3,0.3];
				_markerName setMarkerColor "COLORBLACK";
				_markerName setMarkerAlpha 0.5;
				//_markerName setMarkerText (typeOf _car);
			};
		};
	};
	processInitCommands;
	true
};