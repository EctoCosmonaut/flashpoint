_title = "Everything Random - fewer supports";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Everything Random - fewer supports";//title as seen in game briefing. edit this
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "This Preset Mode reduces the number of support groups (snipers,vehicles,armor,aircraft), resulting in a lower intensity battle. Good if you have a lower end PC!";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	SNIPER_PERCENT = SNIPER_PERCENT * 0.5;
	CAR_PERCENT = CAR_PERCENT * 0.5;
	ARM_PERCENT = ARM_PERCENT * 0.5;
	HELO_PERCENT = HELO_PERCENT * 0.5;
	AIR_PERCENT = AIR_PERCENT * 0.5;
	
	// dont edit the code below this line ;)
};
[_title,_code]