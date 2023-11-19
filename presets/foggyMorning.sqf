_title = "Foggy Morning";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Foggy Morning";  //title as seen in game briefing. edit this
	
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "This preset is the same as Everything Random, only the time and weather are fixed to a foggy sunrise.";

	// ( you can change any game variables to make your preset unique,
	//   anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	RANDOM_TIME_CODE = {4.75}; // this code sets random time between 0400 and 1845
	CLOUD_INDEX = 1;//these indexes start from 1 and refer to arrays in init.sqf
	FOG_INDEX = 17;//these indexes start from 1 and refer to arrays in init.sqf
	
	// dont edit the code below this line ;)
};
[_title,_code]