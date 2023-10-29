_title = "Everything Random - higher intensity";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Everything Random - higher intensity";//title as seen in game briefing. edit this
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "This Preset Mode increases the number of spawned units, resulting in a higher intensity battle. May reduce framerates, needs a good CPU!";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	FRIENDLY_GROUPS = FRIENDLY_GROUPS + 2;
	ENEMY_GROUPS = ENEMY_GROUPS  + 2;
	
	// dont edit the code below this line ;)
};
[_title,_code]