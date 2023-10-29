_i = lbCurSel 17;
_l = units group player select _i;
if(alive _l)then{
	group player selectLeader _l;
	teamMembers = units group player;
	refreshTeamList = true
}