_blokes = previousTeamMembers + nearbyUnits + units group player;
if(count _blokes > 0)then{
	_ldr = leader player;//preserve players group leader
	_grp =  group (_blokes select 0); // preserve group waypoints by using an AI group
	_blokes joinSilent _grp;
	_grp selectLeader _ldr;
	teamMembers = units group player;
	{_x doMove (getPos  _x)}forEach (_blokes - [player]);
	previousTeamMembers = [];
	nearbyUnits = [];
	refreshTeamList = true;
}else{hint"cannot la!"}