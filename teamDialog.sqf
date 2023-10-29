_trg = createTrigger["EmptyDetector",getPos player];
_trg setTriggerArea[JOIN_DIST,JOIN_DIST,0,true];
_trg setTriggerActivation[str(side player),"PRESENT",true];
sleep 1;
_temp = createDialog "teamDialog";
_temp = execVM "teamDialogCamera.sqf";
refreshTeamList = true;
_blokes = (list _trg) - units group player;
_selectedBlokes = _blokes;

for [{_i=0}, {_i< count _blokes}, {_i=_i+1}] do{
	_bloke = _blokes select _i;
	if(_bloke isKindOf "air")then{
		_selectedBlokes = _selectedBlokes - [_bloke];
	};
};
nearbyUnits = _selectedBlokes;
teamMembers = units group player;
previousTeamMembers = [];
while{dialog}do{
	waitUntil {refreshTeamList};
	lbClear 17;
	for [{_i=0}, {_i< count teamMembers}, {_i=_i+1}] do{
		_bloke = teamMembers select _i;
		_s = (typeOf _bloke)+" ";
		if(_bloke == player)then{_s = _s + "*PLR "};
		if(leader _bloke == _bloke)then{_s = _s + "*LDR "};
		_s = _s +"- "+(name _bloke);
		lbAdd [17,_s];
	};
	if((lbCurSel 17 == -1) || (lbCurSel 17 > count teamMembers))then{lbSetCurSel [17,0]};
	lbClear 16;
	_nearBlokes = previousTeamMembers + nearbyUnits;
	for[{_i=0}, {_i< count _nearBlokes}, {_i=_i+1}] do{
		_bloke = _nearBlokes select _i;
		_s = (typeOf _bloke)+" - "+(name _bloke);
		lbAdd [16,_s];
	};
	if((lbCurSel 16 == -1) || (lbCurSel 16 > count _nearBlokes))then{lbSetCurSel [16,0]};
	refreshTeamList = false
};
nearbyUnits = [];
teamMembers = [];
previousTeamMembers = [];