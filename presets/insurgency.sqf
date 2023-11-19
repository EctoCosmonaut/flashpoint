_title = "Insurgency  (CDF vs ChDKZ)";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Insurgency";  //title as seen in game briefing. edit this
	
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "You are a CDF soldier.  CDF forces are conducting Counter Insurgency operations in " + WORLD_STRING + ".  Your mission is to help them clear the area of Chedaki Insurgents, and keep the local population safe.  This Preset Mode is a low intensity battle, over a large area.  It focuses on longer range patrols, recon and tension, more than crazy action.";

	// ( you can change any game variables to make your preset unique,
	//   anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	RANDOM_TIME_CODE = {(4+(random 14.75))}; // this code sets random time between 0400 and 1845
	// to set a fixed time e.g. 0900 -  RANDOM_TIME_CODE = {9}
	
	FRIENDLY_GROUPS = 5;
	ENEMY_GROUPS = 5;
	spawnMAX = 1200;
	spawnMIN = 400;
	SNIPER_PERCENT = 5;
	CAR_PERCENT = 30;
	ARM_PERCENT = 5;
	HELO_PERCENT = 15;
	AIR_PERCENT = 1;

	bluforFactions = [CDF_FACTION];
	opforFactions = [CHDKZ_FACTION];

	cdPLIST = [];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_AK74],CD_PLAYER_PISTOLS,WPN_GRENADE_E,CD_AMMOS,CD_GRENS,[]],"CDF Soldier AK74"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_AK74GL],CD_PLAYER_PISTOLS,WPN_GRENADE_E,CD_AMMOS,CD_GRENS,[]],"CDF Soldier AK74 GP25"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_AKS74_PSO],CD_PLAYER_PISTOLS,WPN_GRENADE_E,CD_AMMOS,CD_GRENS,[]],"CDF Marksman AKS74 PSO"]];
	cdPLIST = cdPLIST + [[west,[["CDF_Soldier_Militia"],[WPN_AKM],CD_PLAYER_PISTOLS,WPN_GRENADE_E,CD_AMMOS,[0,1,2],[]],"CDF Militia AKM"]];
	cdPLIST = cdPLIST + [[west,[["CDF_Soldier_Militia"],[WPN_AKS],CD_PLAYER_PISTOLS,WPN_GRENADE_E,CD_AMMOS,[0,1,2],[]],"CDF Militia AKS"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_PK],CD_PLAYER_PISTOLS,WPN_GRENADE_E,[4,5],[0,1,2],[]],"CDF Machinegunner PK"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_RPK],CD_PLAYER_PISTOLS,WPN_GRENADE_E,[4,5],[0,1,2],[]],"CDF Machinegunner RPK"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_AK74],[WPN_RPGL],WPN_GRENADE_E,[4],[0,1,2],[]],"CDF AT Soldier RPG7VL"]];
	cdPLIST = cdPLIST + [[west,[CD_SOLDIERS,[WPN_AK74],[WPN_RPG18],WPN_GRENADE_E,[4],[0,1,2],[]],"CDF AT Soldier RPG18"]];

	selectedPlayer = cdPLIST call pickRandom;
	
	// dont edit the code below this line ;)
};
[_title,_code]