//----  Any code put in this file will run before setup.sqf  if the debug info is turned on ----
debugMarkers = true;
groupTrackDebug = true;
onMapSingleClick {if(_alt)then{vehicle player setPos _pos; SPAWN_CENTER = _pos; PLAYER_LAST = _pos}};