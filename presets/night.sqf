_title = "Night";//title as seen in setup dialog. edit this
_code = {//keep this line
	settingText = "Night";  //title as seen in game briefing. edit this
	
	gameTypeTitle = "Game Type: " + settingText;//keep this line
	
	//description seen in briefing. edit this
	gameTypeText = "You are a Soldier with Night Vision equipment. Use it to help you survive!";

	// ( you can change any game variables to make your preset unique,
	//   anything you dont change will be the default random setting )
	
	// edit the code below this line to make your preset
	
	_nPLIST = [];
	_nPLIST = _nPLIST + [[west,[UA_SOLDIERS,[WPN_M249TIS],UA_PLAYER_PISTOLS,WPN_GRENADE_W,[4,5],[1,2],WPNS_NVG],"US Army Soldier M249 Thermal Sight"]];
	_nPLIST = _nPLIST + [[west,[["US_Delta_Force_EP1"],[WPN_M17TISSD],[WPN_M9SD],WPN_GRENADE_W,[8],[4],WPNS_NVG_RF],"Delta Operator Mk17 SD Thermal Sight"]];
	_nPLIST = _nPLIST + [[west,[["US_Soldier_Sniper_EP1"],[WPN_M110NV],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M110 NV Scope"]];
	_nPLIST = _nPLIST + [[west,[["US_Soldier_Sniper_EP1"],[WPN_M110TIS],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M110 Thermal Scope"]];
	_nPLIST = _nPLIST + [[west,[["US_Soldier_Sniper_EP1"],[WPN_M107TIS],[WPN_M9,WPN_PDW],"SmokeShell",[8],[2,3,4],WPNS_NVG_RF],"US Army Sniper M107 Thermal Scope"]];

	_nPLIST = _nPLIST + [[west,[BA_SOLDIERS,[WPN_SA80AWS],BA_PLAYER_PISTOLS,WPN_GRENADE_W,BA_AMMOS,BA_GRENS,WPNS_NVG],"British Army Soldier SA80 Thermal Scope"]];
	_nPLIST = _nPLIST + [[west,[["BAF_Soldier_Sniper_MTP"],[WPN_AS50TIS],[WPN_M9,WPN_M9SD,WPN_M1911],"SmokeShell",[10],[2],WPNS_NVG_RF],"British Army Sniper AS50 Thermal Scope"]];

	_nPLIST = _nPLIST + [[east,[TA_SOLDIERS,[WPN_AKS74_NSPU],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_AMMOS,TA_GRENS,[]],"Takistani Army Soldier AKS74 Night Scope"]];
	_nPLIST = _nPLIST + [[east,[TA_SOLDIERS,[WPN_AKS74_TIS],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_AMMOS,TA_GRENS,[]],"Takistani Army Soldier AKS74 Thermal Scope"]];
	_nPLIST = _nPLIST + [[east,[TA_SOLDIERS,[WPN_SVD_NPSU],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_AMMOS,TA_GRENS,WPNS_BINO],"Takistani Army Marksman SVD Night Scope"]];
	_nPLIST = _nPLIST + [[east,[["TK_Soldier_Sniper_EP1"],[WPN_SVD_NPSU],TA_PLAYER_PISTOLS,"SmokeShell",[8],[2,3,4],WPNS_BINO],"Takistani Army Sniper SVD Night Scope"]];
	_nPLIST = _nPLIST + [[east,[["TK_Special_Forces_EP1"],[WPN_AKS74_NSPU],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_SF_AMMOS,TA_SF_GRENS,WPNS_NVG_BINO],"Takistani Special Forces AKS74 Night Scope"]];
	_nPLIST = _nPLIST + [[east,[["TK_Special_Forces_EP1"],[WPN_AKS74_TIS],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_SF_AMMOS,TA_SF_GRENS,WPNS_NVG_BINO],"Takistani Special Forces AKS74 Thermal Scope"]];
	_nPLIST = _nPLIST + [[east,[["TK_Special_Forces_EP1"],[WPN_SVD_NPSU],TA_PLAYER_PISTOLS,WPN_GRENADE_E,TA_SF_AMMOS,TA_SF_GRENS,WPNS_NVG_BINO],"Takistani Special Forces SVD Night Scope"]];


	selectedPlayer = _nPLIST call pickrandom;

	TIME_INDEX = [1,2,3,4,5] call pickrandom;
	
	// dont edit the code below this line ;)
};
[_title,_code]