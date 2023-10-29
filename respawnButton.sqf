_index = _this select 0;;
_rab = player;
_b = (respawnBlokes select _index);
if(alive _b)then{
	selectPlayer _b;
	deleteVehicle _rab;
	comAct = player addAction ["Commands","commands.sqf",[],0,false,true];
	dresAct = player addAction ["Apply Field Dressing", "fieldDressing.sqf", [], 10, true, true, "", "(_target == player) && ((getDammage _target) > 0) && fieldDressing"];
	SPAWN_CENTER = getPos player;
	PLAYER_LAST = getPos player;
	if(leader player == player)then{
		{_x doMove (getPos  _x)}forEach (_blokes - [player]);
	};
}else{
	Hint "That unit has just been killed in action!";
	temp = execVM "respawnAction.sqf";
};