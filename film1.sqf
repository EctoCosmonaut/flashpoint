_cam = startCam;
savegame;
activateKey KEY_TITLE_STRING;
if(NORMAL_FILM)then{
	film1end=false;
	enableRadio false;
	setAccTime 1;

	0 fadeMusic 0;
	0 fadeSound 0;
	//playMusic "Track26_Organ_Works";
	playMusic call randomMusic;
	10 fadeMusic 0.5;
	
	sleep 0.5;
	cutText ["F L A S H P O I N T :   "+FILM_TITLE_STRING+"\n\n                        by thomsonb", "BLACK IN", 10];

	_cam camPreparePos [getPos player select 0,getPos player select 1,(getPos player select 2) + 400];
	_cam camPrepareTarget player;
	_cam camCommitPrepared 0;

	_cam camPreparePos [getPos player select 0,getPos player select 1,(getPos player select 2) + 2];
	_cam camPrepareTarget player;
	_cam camCommitPrepared 9;

	sleep 9;
};

_cam cameraeffect ["terminate", "back"];
camdestroy _cam;
enableRadio true;

cutText ["", "plain"];

film1end=true;

2 fadeSound 1;

20 fadeMusic 0;

sleep 2;

hintSilent ("You are "+name player+", a "+soldierText+"\n\nThe time is "+call tod+"\n\nCommands in action menu and Radio 0-0-n\n\nThe battle is between:\n"+sidesText);
