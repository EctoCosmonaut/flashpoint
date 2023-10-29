cutText["","black",1];
if(debugInfo)then{
	call compile preprocessFileLineNumbers "debug.sqf";
};

createCenter west;
west setFriend [east , 0]; 
createCenter east;
east setFriend [west , 0];
createCenter civilian;

blueTags = [];
redTags = [];
bluforChosenFactions = [];
opforChosenFactions = [];

if(chosenFactions)then{
	_index = 0;
	{
		if(_x)then{bluforChosenFactions = bluforChosenFactions + [bluforFactions select _index]};
		_index = _index +1;
	}forEach bluforSelectedFactions;
	_index = 0;
	{
		if(_x)then{opforChosenFactions = opforChosenFactions + [opforFactions select _index]};
		_index = _index +1;
	}forEach opforSelectedFactions;
}else{
	call randomFactions;
};
_theFactions = bluforChosenFactions + opforChosenFactions;

{
	_side = _x select 0;
	_tag = _x select 1;
	_infantry = _x select 2;
	_snipers = _x select 3;
	_cars = _x select 4;
	_armor = _x select 5;
	_helis = _x select 6;
	_aircraft = _x select 7;
	_players = _x select 8;
	PLIST = PLIST + _players;
	switch(_side)do{
		case west : {
			blueTags = blueTags + [_tag];
			wTeams = wTeams + _infantry;
			wSnipers = wSnipers + _snipers;
			wCars = wCars + _cars;
			wArm = wArm + _armor;
			wHelis = wHelis + _helis;
			wAir = wAir + _aircraft;
		};
		case east : {
			redTags = redTags + [_tag];
			eTeams = eTeams + _infantry;
			eSnipers = eSnipers + _snipers;
			eCars = eCars + _cars;
			eArm = eArm + _armor;
			eHelis = eHelis + _helis;
			eAir = eAir + _aircraft;
		};
	};
}forEach _theFactions;





_i = SELECTED_PLAYER_INDEX;
if(_i>0)then{
	selectedPlayer = ALL_PLIST select (_i - 1);
};
_playerData = if(count selectedPlayer==0)then{PLIST call pickRandom}else{selectedPlayer};

_grp = createGroup (_playerData select 0);
_playerDetails = _playerData select 1;
soldierText = _playerData select 2;

_playerType = (_playerDetails select 0) call pickRandom;

_playerType createUnit [call islandPos,_grp,"P1=this;removeAllWeapons this",random MAX_SKILL];

selectPlayer P1;
addSwitchableUnit player;
player setDir (random 360);

if(count _playerDetails > 1)then{([player]+_playerDetails) call equip};//now conditional due civ players not having guns

deleteVehicle thomsonb;
PLAYER_INITIAL_SIDE = side player;

skipTime (if(TIME_INDEX==0)then{12 + call RANDOM_TIME_CODE}else{12+ ((TIMES_LIST select (TIME_INDEX-1)) select 1)});//random is from 3am to 8pm, mission starts 12pm the day before, for the dialog camera
startTime = time;
startDayTime = call tod;

SPAWN_CENTER = getPos player;
PLAYER_LAST = getPos player;

_bt = "";
{_bt = _bt + _x + ". "}forEach blueTags;
_rt = "";
{_rt = _rt + _x + ". "}forEach redTags;
sidesText = if(side player == east)then{_rt + "- vs - " + _bt}else{_bt + "- vs - " + _rt};

enableTeamSwitch false;

_savedSpawnMin = spawnMIN;
if(spawnMin > 200)then{spawnMIN = 200};

FRIENDS = if(side player == west)then{west}else{east};
ENEMYS =  if(side player == west)then{east}else{west};

for [{_i=0}, {_i< FRIENDLY_GROUPS}, {_i=_i+1}] do{
	_s = [FRIENDS]execVM "infantry.sqf";
};
for [{_i=0}, {_i< ENEMY_GROUPS}, {_i=_i+1}] do{
	_s = [ENEMYS]execVM "infantry.sqf";
};

_map = [true,true,false] call pickRandom;
_comp = [true,true,false] call pickRandom;
_bino = [true,true,false] call pickRandom;

if(_bino)then{
	_gear = weapons player;
	if(!("Binocular" in _gear || "Binocular_Vector" in _gear))then{
		player addWeapon "binocular";
	};
};
if(!_map)then{player removeWeapon "itemMap"};
if(!_comp)then{player removeWeapon "itemCompass"};

comAct = player addAction ["Commands","commands.sqf",[],0,false,true];
dresAct = player addAction ["Apply Field Dressing", "fieldDressing.sqf", [], 10, false, true, "", "(_target == player) && ((getDammage _target) > 0) && fieldDressing"];

_trigData = [];
_trigData = _trigData + [["ALPHA","player setDammage 1","Suicide"]];
_trigData = _trigData + [["BRAVO","temp = execVM ""respawnAction.sqf""","Respawn"]];
_trigData = _trigData + [["CHARLIE","savegame","Save Game"]];
_trigData = _trigData + [["DELTA","temp = execVM ""whereAmI.sqf""","Where am I?"]];
_trigData = _trigData + [["ECHO","hint weatherText","Weather Forecast"]];
_trigData = _trigData + [["FOXTROT","temp = execVM ""objective.sqf""","Give Objective"]];
_trigData = _trigData + [["GOLF","temp = execVM ""musicSwitch.sqf""","Toggle Music"]];
_trigData = _trigData + [["HOTEL","temp = execVM ""teamDialogRemoveAll.sqf""","Leave Group"]];
_trigData = _trigData + [["INDIA","temp = execVM ""teamDialog.sqf""","Manage Team"]];
_trigData = _trigData + [["JULIET","hint call stats","Stats"]];

{_code = _x select 0;
_act = _x select 1;
_txt = _x select 2;
_t=createTrigger["EmptyDetector",[0,0]];
_t setTriggerArea[0,0,0,false];
_t setTriggerActivation[_code,"PRESENT",true];
_t setTriggerStatements["this && film1end",_act,""];
_t setTriggerText _txt;
}forEach _trigData;

setupCompleted = true;

execVM "playerTracker.sqf";
execVM "groupTracker.sqf";
execVM "film1.sqf";
execVM "wx.sqf";
execVM "briefing1.sqf";

sleep 30;
spawnMIN = _savedSpawnMin;