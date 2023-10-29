teamMembers = [player];
_dudes = (units group player - [player]) ;
if(count _dudes > 0)then{
	[player] join createGroup side player;
	previousTeamMembers = previousTeamMembers + _dudes;
	refreshTeamList = true;
	if(! dialog)then{
		hint "You have left the group.";
	};
};