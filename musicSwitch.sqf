//v1
//added currentMusicName 10:25 21/12/2010

if(MUSIC_ON)then{
	hint "Music Deactivated";
	1 fadeMusic 0;
	MUSIC_ON = false;
	musicKey = random 1;
	currentMusicName=""
}else{
	hint "Music Activated";
	MUSIC_ON = true;
	_temp = []execVM "MusicBox.sqf"
}