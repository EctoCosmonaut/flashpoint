_plist = [[west,"none","Random"]] + ALL_PLIST;
for [{_i=0}, {_i< count _plist}, {_i=_i+1}] do{
	_p = _plist select _i;
	lbAdd[1,_p select 2];
};
lbSetCurSel [1,0];