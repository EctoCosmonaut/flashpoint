if(! obj_added)then{

	hint "Objective added, check map";
	
	obj_added = true;

	sleep 1;

	if(!("itemmap" in (weapons player)))then{player addWeapon "itemmap"};

	_pos = call islandPos;

	while{[getPos player,_pos] call xyPosDist < OBJ_MIN_DIST}do{_pos = call islandPos};

	_marker = createMarker["OBJECTIVE",_pos];
	_marker setMarkerShape "ICON";
	"OBJECTIVE" setMarkerType "mil_flag";
	"OBJECTIVE" setMarkerText "Objective";
	"OBJECTIVE" setMarkerColor "colorRed";

	_trig = createTrigger ["EmptyDetector",_pos];
	_trig setTriggerArea [50,50,0,false];
	_trig setTriggerActivation ["ANY","PRESENT",true];
	_trig setTriggerStatements ["vehicle player in thislist","[objNull, ObjNull, obj1, ""Succeeded""] execVM ""CA\Modules\MP\data\scriptCommands\taskHint.sqf""; obj1 setTaskState ""Succeeded""; end_mission = true; hint ""Objective Completed!\n\nYou have reached your objective, good job soldier""; player addRating 5000",""];

	_endTrig = createTrigger ["EmptyDetector",_pos];
	_endTrig setTriggerTimeout [10,10,10,true];
	_endTrig setTriggerStatements ["end_mission","",""];
	_endTrig setTriggerType "END1";

	_s = player createDiaryRecord ["diary", ["Objective","Your objective now is to <marker name=""OBJECTIVE"">reach this position</marker> to complete the mission, good luck!"]];
	
	obj1 = player createSimpleTask ["Reach the objective"];
	obj1 setSimpleTaskDestination (getMarkerPos "OBJECTIVE");
	obj1 setSimpleTaskDescription ["Reach the objective", "Reach the objective", "Reach the objective"];
	player setCurrentTask obj1;

	sleep 2;

	[objNull, ObjNull, obj1, "CURRENT"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
}
else{
	hint "Objective already added, check map";
};