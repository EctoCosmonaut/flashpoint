lbAdd[2,"Random"];
lbAdd[3,"Random"];
lbAdd[4,"Random"];

_tlist = TIMES_LIST;
for [{_i=0}, {_i< count _tlist}, {_i=_i+1}] do{
	_t = _tlist select _i;
	lbAdd[2,_t select 0];
};
_clist = CLOUD_LIST;
for [{_i=0}, {_i< count _clist}, {_i=_i+1}] do{
	_c = _clist select _i;
	lbAdd[3,(str(_c*100))+"%"];
};
_flist = FOG_LIST;
for [{_i=0}, {_i< count _flist}, {_i=_i+1}] do{
	_f = _flist select _i;
	lbAdd[4,(str(_f*100))+"%"];
};

lbSetCurSel [2,0];
lbSetCurSel [3,0];
lbSetCurSel [4,0];