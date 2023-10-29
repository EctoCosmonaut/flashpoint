_title = "Everything Random - infantry only";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Everything Random - infantry only";//title as seen in game briefing. edit this
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "This Preset Mode removes all support groups (snipers,vehicles,armor,aircraft), resulting in an infantry only battle.";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	SNIPER_PERCENT = 0;
	CAR_PERCENT = 0;
	ARM_PERCENT = 0;
	HELO_PERCENT = 0;
	AIR_PERCENT = 0;
	
	// dont edit the code below this line ;)
};
[_title,_code]