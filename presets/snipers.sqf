_title = "Snipers  (play as a sniper)";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Snipers";//title as seen in game briefing. edit this
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "You are a Sniper.  There is a low intensity conflict in " + WORLD_STRING + ".  Find a good hide, and ambush the enemy.  This Preset Mode is slower and more tactical, use the terrain and concealment. Be careful, you are not the only sniper in the area!";
	
	//( you can change any game variables to make your preset unique,
	//  anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	FRIENDLY_GROUPS = 6;
	ENEMY_GROUPS = 8;
	spawnMAX = 1500;
	spawnMIN = 500;

	SNIPER_PERCENT = 35;
	CAR_PERCENT = 25;
	ARM_PERCENT = 5;
	HELO_PERCENT = 5;
	AIR_PERCENT = 5;

	_snPlist = [
		[west,[["US_Soldier_Sniper_EP1"],[WPN_M24DES],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M24"],
		[west,[["US_Soldier_Sniper_EP1"],[WPN_M110NV],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M110 NV Scope"],
		[west,[["US_Soldier_Sniper_EP1"],[WPN_M110TIS],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M110 Thermal Scope"],
		[west,[["US_Soldier_Sniper_EP1"],[WPN_M107],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M107"],
		[west,[["BAF_Soldier_Sniper_MTP"],[WPN_LRR_DES],[WPN_M9,WPN_M9SD,WPN_M1911],"SmokeShell",[10],[2],WPNS_NVG_RF],"British Army Sniper LRR"],
		[west,[["BAF_Soldier_Sniper_MTP"],[WPN_AS50],[WPN_M9,WPN_M9SD,WPN_M1911],"SmokeShell",[10],[2],WPNS_NVG_RF],"British Army Sniper AS50"],
		[west,[["BAF_Soldier_Sniper_MTP"],[WPN_AS50TIS],[WPN_M9,WPN_M9SD,WPN_M1911],"SmokeShell",[10],[2],WPNS_NVG_RF],"British Army Sniper AS50 Thermal Scope"],
		[west,[["CZ_Soldier_Sniper_EP1"],[WPN_SVD_CAMO_DES],CZ_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"Czech Sniper SVD"],
		[west,[PM_SOLDIERS,[WPN_SVD],PM_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_NVG_BINO],"Private Contractor SVD"],
		[west,[PM_SOLDIERS,[WPN_M107],PM_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_NVG_BINO],"Private Contractor M107"],
		[west,[PM_SOLDIERS,[WPN_M107TIS],PM_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_NVG_BINO],"Private Contractor M107 Thermal Scope"],
		[east,[["TK_Soldier_Sniper_EP1"],[WPN_SVD_CAMO_DES],TA_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_BINO],"Takistani Army Sniper SVD"],
		[east,[["TK_Soldier_Sniper_EP1"],[WPN_SVD_NPSU],TA_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_BINO],"Takistani Army Sniper SVD Night Scope"],
		[east,[TM_SOLDIERS+TG_SOLDIERS,[WPN_SVD],TM_PLAYER_PISTOLS,WPN_GRENADE_E,TM_AMMOS,TM_GRENS,WPNS_BINO],"Taliban Sniper SVD"]
	];

	selectedPlayer = _snPlist call pickrandom;
	
	// dont edit the code below this line ;)
};
[_title,_code]