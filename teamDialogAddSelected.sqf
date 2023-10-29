_blokes = previousTeamMembers + nearbyUnits;
_i = lbCurSel 16;
if(_i != -1 && _i < count _blokes)then{
	_bloke = _blokes select _i;
	[_bloke] joinSilent group player;
	_bloke doMove (getPos _bloke);
	previousTeamMembers = previousTeamMembers - [_bloke];
	nearbyUnits = nearbyUnits - [_bloke];
	teamMembers = units group player;
	lbSetCurSel [16,_i-1];
	refreshTeamList = true
}