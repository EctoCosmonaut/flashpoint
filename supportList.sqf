_slist = SUPPORT_PERCENT_LIST;
for [{_i=0}, {_i< count _slist}, {_i=_i+1}] do{
	_s = _slist select _i;
	_t = (str _s)+"%";
	lbAdd[10,_t];
	lbAdd[11,_t];
	lbAdd[12,_t];
	lbAdd[13,_t];
	lbAdd[14,_t];
};
lbSetCurSel [10,SNIPER_PERCENT_DEFAULT];
lbSetCurSel [11,CAR_PERCENT_DEFAULT];
lbSetCurSel [12,ARM_PERCENT_DEFAULT];
lbSetCurSel [13,HELI_PERCENT_DEFAULT];
lbSetCurSel [14,AIR_PERCENT_DEFAULT];