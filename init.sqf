debugMarkers = false;
groupTrackDebug = false;
//debugMarkers = true;
//groupTrackDebug = true;

//---- Initalise variables  ----
currentMusicName="";
setupCompleted = false;
obj_added = false;
end_mission = false;
totalDistance = 0;
chosenFactions = false;
debugInfo = false;
selectedPlayer = [];
SELECTED_PLAYER_INDEX = 0;
respawnBlokes = [];
TIME_INDEX = 0;
CLOUD_INDEX = 0;
FOG_INDEX = 0;
NORMAL_FILM = true;
fieldDressing = true;
camNVG = false;
nearbyUnits = [];
teamMembers = [];
previousTeamMembers = [];
recycleBin = [];
suicideBunnyUsed = false;
soldierCount = 0;
settingText = "";
gameTypeText = "";
eDead = 0;
wDead = 0;
pKills = 0;
milDriver = 0;
pilotCount = 0;
markerCount = 0;
infantryUnits = [];
groundVehicles = [];
airVehicles = [];
wTeams = [];
eTeams = [];
wSnipers = [];
eSnipers = [];
wCars = [];
eCars = [];
wArm = [];
eArm = [];
wHelis = [];
eHelis = [];
wAir = [];
eAir = [];
PLIST = [];
bluforFactions = [];
opforFactions = [];
ALL_PLIST = [];
deadBloke = objNull;

//---- setup functions, and custom settings for the map ----
call compile preprocessFileLineNumbers "functionsInit.sqf";
call compile preprocessFileLineNumbers ("init_"+ toLower worldname + ".sqf");//the file init_worldNameInLowerCase.sqf must exist!

//---- Static variables ----
MAX_MUSIC = 0.5;
MUSIC_ON = false;
DEATH_TEXT = "You are Dead";
MARKER_UPDATE_DELAY = 5;
OBJ_MIN_DIST = 500;
RECYCLE_MAX = 80;
TIMES_LIST = [
	["00:00",0],
	["01:00",1],
	["02:00",2],
	["03:00",3],
	["04:00",4],
	["04:15",4.25],
	["04:30",4.5],
	["04:45",4.75],
	["05:00",5],
	["05:15",5.25],
	["06:00",6],
	["07:00",7],
	["08:00",8],
	["09:00",9],
	["10:00",10],
	["11:00",11],
	["12:00",12],
	["13:00",13],
	["14:00",14],
	["15:00",15],
	["16:00",16],
	["17:00",17],
	["18:00",18],
	["18:15",18.25],
	["18:30",18.5],
	["18:45",18.75],
	["19:00",19],
	["19:15",19.25],
	["20:00",20],
	["21:00",21],
	["22:00",22],
	["23:00",23]
];
CLOUD_LIST = [
	0,
	0.1,
	0.15,
	0.2,
	0.25,
	0.3,
	0.35,
	0.4,
	0.45,
	0.5,
	0.55,
	0.6,
	0.65,
	0.7,
	0.75,
	0.8,
	0.85,
	0.9,
	0.95,
	1
];
FOG_LIST = [
	0,
	0.1,
	0.15,
	0.2,
	0.25,
	0.3,
	0.35,
	0.4,
	0.45,
	0.5,
	0.55,
	0.6,
	0.65,
	0.7,
	0.75,
	0.8,
	0.85,
	0.9,
	0.95,
	1
];

//---- Start the setup camera and dialog ----
execVM "film0.sqf";
waitUntil {time > 0};
createDialog "start";