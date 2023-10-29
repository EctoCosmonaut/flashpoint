for [{_i=0}, {_i < count GROUP_COUNT_LIST}, {_i=_i+1}] do{
	lbAdd[5,str (GROUP_COUNT_LIST select _i)];
	lbAdd[6,str (GROUP_COUNT_LIST select _i)];
};
lbSetCurSel [5,FRIEND_COUNT_DEFAULT];
lbSetCurSel [6,ENEMY_COUNT_DEFAULT];
for [{_i=0}, {_i < count SPAWN_MIN_LIST}, {_i=_i+1}] do{
	_m = SPAWN_MIN_LIST select _i;
	lbAdd[7,str _m];
};
for [{_i=0}, {_i < count SPAWN_MAX_LIST}, {_i=_i+1}] do{
	_m = SPAWN_MAX_LIST select _i;
	lbAdd[8,str _m];
};
lbSetCurSel [7,SPAWN_MIN_DEFAULT];
lbSetCurSel [8,SPAWN_MAX_DEFAULT];