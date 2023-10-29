randomMusic = {
	MUSIC_TRACKS call pickRandom
};
setupFactionLists = {
	ctrlEnable [0,false];
	bluforSelectedFactions = [];
	opforSelectedFactions = [];
	{bluforSelectedFactions = bluforSelectedFactions + [true]}forEach bluforFactions;
	{opforSelectedFactions = opforSelectedFactions + [true]}forEach opforFactions;
	{
		_factions = _x select 0;
		_idc = _x select 1;
		for [{_i=0}, {_i< count _factions}, {_i=_i+1}] do{
			_f = _factions select _i;
			lbAdd[_idc,_f select 1];
			[0,_i,_idc] call factionChange;
		};
	} forEach [[bluforFactions,20],[opforFactions,21]];
};
randomFactions = {
	if(random 100 < 50)then{
		bluforChosenFactions = [bluforFactions call pickRandom];
	}else{
		while{count bluforChosenFactions < 1}do{
			{
				if(random 100 < 50)then{bluforChosenFactions = bluforChosenFactions + [_x]};
			}forEach bluforFactions;
		};
	};
	if(random 100 < 50)then{
		opforChosenFactions = [opforFactions call pickRandom];
	}else{
		while{count opforChosenFactions < 1}do{
			{
				if(random 100 < 50)then{opforChosenFactions = opforChosenFactions + [_x]};
			}forEach opforFactions;
		};
	};
};
factionChange = {
	COL_RED = [0.9,0,0,1];
	COL_GREEN = [0,0.9,0,1];
	_index = _this select 1;
	_idc = _this select 2;
	_selectedFactions = bluforSelectedFactions;
	if(_idc == 21)then{_selectedFactions = opforSelectedFactions};
	_factionState = ! (_selectedFactions select _index);
	_selectedFactions set [_index,_factionState];
	_col = COL_RED;
	if(_factionState)then{_col = COL_GREEN};
	lbSetColor [_idc,_index,_col];
	(true in bluforSelectedFactions)&&(true in opforSelectedFactions)
};
addFaction = {
	if(count _this != 9)exitWith{_e = "error in addFaction, faction must have 9 elements (use [] if no units)"; hint _e; diag_log text _e};
	switch (_this select 0) do {
		case west : {bluforFactions = bluforFactions + [_this]};
		case east : {opforFactions = opforFactions + [_this]};
		default {_e = "error in addFaction, faction must be west or east"; hint _e; diag_log text _e};
	};
	ALL_PLIST = ALL_PLIST + (_this select 8);
	_this
};
getAmmoSlots = {
	_total = getNumber (configFile >> "cfgVehicles" >> (typeOf _this) >> "weaponslots");
	_131072 = floor (_total / 131072);
	_total = _total - (_131072 * 131072);
	_4096 = floor (_total / 4096);
	_total = _total - (_4096 * 4096);
	_256 = floor (_total / 256);
	_256
};
getAmmoSize = {
	(getNumber (configFile >> "cfgMagazines" >> _this >> "type")) / 256
};
getCurrentAmmoSpace = {
	_total = _this call getAmmoSlots;
	_sum = 0;
	{
		_sum = _sum + (_x call getAmmoSize);
	} forEach (magazines _this);
	ceil (_total - _sum)
};
spawnPos = {
	_pos = SPAWN_CENTER;
	_offset1 = spawnMAX;
	_offset2 = spawnMIN;
	_maxX = (_pos select 0) + _offset1;
	_minX = (_pos select 0) - _offset1;
	_maxY = (_pos select 1) + _offset1;
	_minY = (_pos select 1) - _offset1;
	_newX=_minX + (random (_maxX - _minX));
	_newY=_minY + (random (_maxY - _minY));
	while{(surfaceIsWater [_newX,_newY])OR([_pos,[_newX,_newY]]call xyPosDist > _offset1)OR([SPAWN_CENTER,[_newX,_newY]]call xyPosDist < _offset2)}do{
		_newX=_minX + (random (_maxX - _minX));
		_newY=_minY + (random (_maxY - _minY));
	};
	[_newX,_newY]
};
wpPos = {
	_pos = SPAWN_CENTER;
	_offset1 = spawnMAX * 0.7;
	_maxX = (_pos select 0) + _offset1;
	_minX = (_pos select 0) - _offset1;
	_maxY = (_pos select 1) + _offset1;
	_minY = (_pos select 1) - _offset1;
	_newX=_minX + (random (_maxX - _minX));
	_newY=_minY + (random (_maxY - _minY));
	while{(surfaceIsWater [_newX,_newY])OR([SPAWN_CENTER,[_newX,_newY]]call xyPosDist > _offset1)}do{
		_newX=_minX + (random (_maxX - _minX));
		_newY=_minY + (random (_maxY - _minY));
	};
	[_newX,_newY]
};
areaPos = {
	_pos = _this select 0;
	_offset = _this select 1;
	_maxX = (_pos select 0) + _offset;
	_minX = (_pos select 0) - _offset;
	_maxY = (_pos select 1) + _offset;
	_minY = (_pos select 1) - _offset;
	_null = "emptydetector" createVehicle [0,0];
	_newX=_minX + (random (_maxX - _minX));
	_newY=_minY + (random (_maxY - _minY));
	_null setPos [_newX,_newY];
	while{((getPosASL _null) select 2) < 2}do{
		_newX=_minX + (random (_maxX - _minX));
		_newY=_minY + (random (_maxY - _minY));
		_null setPos [_newX,_newY];
	};
	deleteVehicle _null;
	[_newX,_newY]
};
islandPos = {
	_xmin =  SPAWN_LIMITS select 0;
	_xmax = ( SPAWN_LIMITS select 1) - _xmin;
	_ymin =  SPAWN_LIMITS select 2;
	_ymax = ( SPAWN_LIMITS select 3) - _ymin;

	_x = _xmin + random _xmax;
	_y = _ymin + random _ymax;

	while{surfaceIsWater[_x,_y]}do{
		_x = _xmin + random _xmax;
		_y = _ymin + random _ymax;
	};
	[_x,_y]
};
xyPosDist = {
	_a = _this select 0;
	_b = _this select 1;
	_ax = _a select 0;
	_bx = _b select 0;
	_ay = _a select 1;
	_by = _b select 1;
	_x = sqrt((_ax - _bx)*(_ax - _bx));
	_y = sqrt((_ay - _by)*(_ay - _by));
	sqrt ((_x * _x)+(_y * _y))
};
pickRandom = {
	_this select (floor (random (count _this)))
};
directionAfromB = {
	_posA = getPos (_this select 0);
	_posB = getPos (_this select 1);
	_ax =_posA select 0;
	_ay =_posA select 1;
	_bx =_posB select 0;
	_by =_posB select 1;
	_x = _ax - _bx;
	_y = _ay - _by;
	if(_y==0)then{_y=0.001};
	_result= sqrt((atan (_x/_y))*(atan (_x/_y)));
	if((_ax >= _bx)&&(_by >= _ay))
	then{
	_result=(90-_result)+ 90;
	};
	if((_bx >= _ax)&&(_by >= _ay))
	then{
	_result = _result + 180;
	};
	if((_bx >= _ax)&&(_ay >= _by))
	then{
	_result = (90-_result) + 270;
	};
	_result
};
directionPosAfromB = {
	_posA = _this select 0;
	_posB = _this select 1;
	_ax =_posA select 0;
	_ay =_posA select 1;
	_bx =_posB select 0;
	_by =_posB select 1;
	_x = _ax - _bx;
	_y = _ay - _by;
	if(_y==0)then{_y=0.001};
	_result= sqrt((atan (_x/_y))*(atan (_x/_y)));
	if((_ax >= _bx)&&(_by >= _ay))
	then{
	_result=(90-_result)+ 90;
	};
	if((_bx >= _ax)&&(_by >= _ay))
	then{
	_result = _result + 180;
	};
	if((_bx >= _ax)&&(_ay >= _by))
	then{
	_result = (90-_result) + 270;
	};
	_result
};
PBD = {
	_pos = _this select 0;
	_bearing = _this select 1;
	_distance = _this select 2;
	[(_pos select 0)+(_distance*(sin _bearing)),(_pos select 1)+(_distance*(cos _bearing))]
};
percentage = {floor(_this * 100)};
tod = {
	_hr = daytime - (daytime % 1);
	_min =  floor(60 * (daytime % 1));
	_zero="";
	if(_hr<10)then{_zero="0"};
	_zero2="";
	if(_min<10)then{_zero2="0"};
	_zero+str(_hr)+":"+_zero2+str(_min)
};
stats = {
	_t1 = "Time is " + (daytime call tod);
	_t2 = "\nElapsed time is "+(str (floor((time - startTime)/60)))+" minutes";
	_t3 = "\nDistance travelled "+(str (round totalDistance))+" meters";
	_t4 = "\nPlayer health is "+(str((1- damage player)call percentage))+"%";
	_t5 = "\nPlayer Kills "+(str pKills);
	_t6 = "\nPlayer Score "+(str (rating player));
	_t7 = "\nCasualties:\nBLUEFOR "+(str wDead)+" - "+(str eDead)+" OPFOR";
	_t8 = if(currentMusicName=="")then{""}else{"\nMusic: " + currentMusicName};
	_t9 = "\nThe Battle is between:\n"+ sidesText;
	(_t1 + _t2 + _t3 + _t4 + _t5 + _t6 + _t7 + _t8 + _t9)
};
spawnChange = {
	_i = _this select 0;
	if(_i == 0)then{spawnMIN = SPAWN_MIN_LIST select (lbCurSel 7);}else{spawnMAX = SPAWN_MAX_LIST select (lbCurSel 8);};
	spawnMAX > spawnMIN
};
spawnRoads = {((player nearRoads spawnMAX) - (player nearRoads spawnMIN))};
unitInfoString = {
	_sideString = switch(side _this) do{
		case west: {"BLUFOR"};
		case east: {"OPFOR"};
		default {"Civilian"};
	};
	_rifle = primaryWeapon _this;
	_launcher = secondaryWeapon _this;
	if(! (_launcher == ""))then{_rifle = _rifle +" + "+_launcher};
	if(! (driver vehicle _this == _this))then{_rifle = (typeOf vehicle _this)};
	(_sideString+" - "+(name _this)+" - "+_rifle)
};
equip = compile preprocessFileLineNumbers "equip.sqf";
aircraft = compile preprocessFileLineNumbers "aircraft.sqf"; 
vehicleAmmo  =  compile preprocessFileLineNumbers "vehicleAmmo.sqf";
parkedCarAmmo =  compile preprocessFileLineNumbers "parkedCarAmmo.sqf";
killed = compile preprocessFileLineNumbers "killed.sqf";