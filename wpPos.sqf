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
