_title = "Taliban!  (US vs Taliban)";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Taliban!  (US vs Taliban)";  //title as seen in game briefing. edit this
	
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "You are a US Army soldier.  " + WORLD_STRING + " is swarming with Taliban fighters.  Freindly forces are severely outnumbered, how long can you survive?";

	// ( you can change any game variables to make your preset unique,
	//   anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	RANDOM_TIME_CODE = {(4+(random 14))}; // this code sets random time between 0400 and 1800
	// to set a fixed time e.g. 0900 -  RANDOM_TIME_CODE = {9}
	
	FRIENDLY_GROUPS = 4;
	ENEMY_GROUPS = 12;
	spawnMAX = 2000;
	spawnMIN = 1000;

	selectedPlayer = uaPLIST call pickRandom;

	bluforFactions = [USARMY_FACTION];
	opforFactions = [TALIBAN_FACTION];

	// dont edit the code below this line ;)
};
[_title,_code]