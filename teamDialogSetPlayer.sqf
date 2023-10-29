_i = lbCurSel 17;
_guy = units group player select _i;
if(alive _guy)then{
	player removeAction comAct;
	player removeAction dresAct;
	selectPlayer _guy;
	comAct = player addAction ["Commands","commands.sqf",[],0,false,true];
	dresAct = player addAction ["Apply Field Dressing", "fieldDressing.sqf", [], 10, true, true, "", "(_target == player) && ((getDammage _target) > 0) && fieldDressing"];
	SPAWN_CENTER = getPos player;
	PLAYER_LAST = getPos player;
	teamMembers = units group player;
	refreshTeamList = true
}