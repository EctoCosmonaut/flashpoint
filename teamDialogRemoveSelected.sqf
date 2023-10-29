_bloke = (units group player) select (lbCurSel 17);
if(_bloke != player)then{
	[_bloke] join (createGroup side player);
	previousTeamMembers = previousTeamMembers + [_bloke];
	teamMembers = units group player;
	refreshTeamList = true
}