_ord = format ["You are %1 a %2.  You have been separated from your squad during a battle.  You are now lost somewhere in %4.  Your mission is to survive as long as possible.  The battle is between: %3.",name player,soldierText,sidesText,WORLD_STRING];
_com = "Use your action menu to open the commands menu.  You can join nearby friendly groups (range "+(str JOIN_DIST)+"m).  You can Leave your current group.  You can check the battle statisitics and weather forecast.  You can turn on dynamic music.  You can activate an objective to reach.  You can get a hint about you position.  These options also have Radio shortcuts.";
_nfo = "This is an instant action mission, 100% dynamic and 100% unique every time. Make your own objectives, go wherever you like; the battle will follow you. Most importantly, have fun!";
_tec = "If you are interested how this mission works....  There are friendly and enemy infantry squads in the area.  These spawn dynamically; if you move too far from one, it is deleted and replaced by a new squad.  A new squad is born when one is destroyed.  Each squad (randomly) can have suport from Vehicles, Helicopters, Aircraft and Snipers.  If you have any questions or feedback please send me a message on BIS forums, username thomsonb  :)";

_s4 = player createDiaryRecord ["diary", ["Tech",_tec]];
_s3 = player createDiaryRecord ["diary", ["Info",_nfo]];
_s2 = player createDiaryRecord ["diary", ["Commands",_com]];
if(gameTypeText != "")then{_s1 = player createDiaryRecord ["diary", [gameTypeTitle,gameTypeText]]};
_s0 = player createDiaryRecord ["diary", ["Mission",_ord]];