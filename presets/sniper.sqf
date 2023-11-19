_title = "Sniper  (play as a sniper)";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Sniper";//title as seen in game briefing. edit this
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "You are a Sniper.  There is a low intensity conflict in " + WORLD_STRING + ".  Find a good hide, and ambush the enemy.  This Preset Mode is slower and more tactical, use the terrain and concealment. Be careful, you are not the only sniper in the area!";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	FRIENDLY_GROUPS = 6;
	ENEMY_GROUPS = 6;
	spawnMAX = 1500;
	spawnMIN = 400;

	SNIPER_PERCENT = 30;
	CAR_PERCENT = 25;
	ARM_PERCENT = 5;
	HELO_PERCENT = 5;
	AIR_PERCENT = 5;

	usPLIST = [];
	usPLIST = usPLIST + [[west,[["USMC_SoldierS_Sniper"],[WPN_M40],[WPN_M9],"SmokeShell",[8],US_GRENS,WPNS_NVG_BINO],"USMC Sniper M40"]];
	usPLIST = usPLIST + [[west,[["USMC_SoldierS_Sniper"],[WPN_M107],[WPN_M9],"SmokeShell",[8],US_GRENS,WPNS_NVG_BINO],"USMC Sniper M107"]];
	usPLIST = usPLIST + [[west,[["FR_GL"],[WPN_DMR],[WPN_M9],WPN_GRENADE_W,[8],[4],WPNS_NVG_BINO],"Force Recon Marksman DMR"]];
	cdPLIST = [];
	cdPLIST = cdPLIST + [[west,[["CDF_Soldier_Sniper"],[WPN_SVD],[WPN_MAKAROV],"SmokeShell",[8],CD_GRENS,WPNS_NVG_BINO],"CDF Sniper SVD"]];
	npPLIST = [];
	npPLIST = npPLIST + [[west,[NP_SOLDIERS,[WPN_SVD],NP_PLAYER_PISTOLS,WPN_GRENADE_E,NP_AMMOS,NP_GRENS,[]],"NAPA Guerilla SVD"]];
	npPLIST = npPLIST + [[west,[NP_SOLDIERS,[WPN_AKS74_PSO],NP_PLAYER_PISTOLS,WPN_GRENADE_E,NP_AMMOS,NP_GRENS,[]],"NAPA Guerilla AKS74 PSO"]];
	ruPLIST = [];
	ruPLIST = ruPLIST + [[east,[["RU_Soldier_Sniper"],[WPN_SVD_CAMO],[WPN_MAKAROV],"SmokeShell",[8],RU_GRENS,WPNS_NVG_BINO],"Russian Sniper SVD"]];
	ruPLIST = ruPLIST + [[east,[["RU_Soldier_Sniper"],[WPN_KSVK],[WPN_MAKAROV],"SmokeShell",[8],RU_GRENS,WPNS_NVG_BINO],"Russian Sniper KVSK"]];
	chPLIST = [];
	chPLIST = chPLIST + [[east,[CH_SOLDIERS,[WPN_AKS74_PSO],CH_PLAYER_PISTOLS,WPN_GRENADE_E,CH_AMMOS,CH_GRENS,[]],"ChDKZ Insurgent AKS74 PSO"]];
	chPLIST = chPLIST + [[east,[CH_SOLDIERS,[WPN_SVD],CH_PLAYER_PISTOLS,WPN_GRENADE_E,CH_AMMOS,CH_GRENS,WPNS_BINO],"ChDKZ Insurgent SVD"]];

	// dont edit the code below this line ;)
};
[_title,_code]