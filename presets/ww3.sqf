_title = "World War 3  (USA vs Russia)"; //title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "World War 3"; //title as seen in game briefing. edit this
	
	gameTypeTitle = "Game Type: " + settingText; //keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "The USA and Russia are engaged in a full scale war in "+WORLD_STRING+".  You are an Anti Tank soldier; your mission is to ambush enemy tanks.  This Preset Mode is action packed with lots of armoured vehicles and aircraft.";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	FRIENDLY_GROUPS = 5;
	ENEMY_GROUPS = 5;
	spawnMAX = 600;
	spawnMIN = 200;
	SNIPER_PERCENT = 5;
	CAR_PERCENT = 20;
	ARM_PERCENT = 50;
	HELO_PERCENT = 20;
	AIR_PERCENT = 10;

	bluforFactions = [USMC_FACTION];
	opforFactions = [RUSSIA_FACTION];

	selectedPlayer = [[west,[US_SOLDIERS,[WPN_M16A4],[WPN_JAV],WPN_GRENADE_W,[5],[1],WPNS_NVG],"USMC AT Soldier Javelin"],[east,[RU_SOLDIERS,[WPN_AK107],[WPN_AT13],WPN_GRENADE_E,[5],[1],WPNS_NVG],"Russian AT Soldier AT13"]] call pickrandom;
	usHelis = [["AH64D",US_MAN_PILOT],["AH1Z",US_MAN_PILOT]];
	ruHelis = [["Ka52",RU_MAN_PILOT],["Ka52black",RU_MAN_PILOT],["Mi24_V",RU_MAN_PILOT]];
	
	// dont edit the code below this line ;)
};
[_title,_code]