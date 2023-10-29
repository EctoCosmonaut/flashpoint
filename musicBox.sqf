musicKey = random 1;
_musicKey = musicKey;
while{_musicKey == musicKey}do{currentMusicName = call randomMusic; playMusic currentMusicName; 5 fadeMusic MAX_MUSIC; sleep 240 + (random 240)}