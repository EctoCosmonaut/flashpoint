call compile preprocessFileLineNumbers "chernarusFactions.sqf";

WORLD_STRING = "Utes";
FILM_TITLE_STRING = "U T E S";
KEY_TITLE_STRING = "thomsonb_flashpoint_utes_BAF";
SPAWN_LIMITS = [2500,4600,2700,4600];

// add the filename of new presets here
ALL_PRESET_FILENAMES = ["randomLow","randomHigh","ww3","sniper","insurgency","foggyMorning","stormyEvening","randomInfantryOnly","randomLowSupports","randomHighSupports"];

RESPAWN_SQUADS = true;
SPAWN_SHIFT_MULT = 1.5;
AIR_SPAWN_DIST = 3000;
MAX_SKILL = 1;
JOIN_DIST = 100;
MAX_FOG = [0.9,0.5,0,0] call pickRandom;
MAX_CLOUD = 1.0;
SNIPERS_HAVE_SPOTTERS_PERCENT = 75;
GCAM_ACTIVE = true;//(GCAM only works in ArmA2 Combined operations)
RANDOM_TIME_CODE = {(3+(random 17))};  //this default gives 0300 to 2000

spawnMIN = 300;
spawnMAX = 800;
SPAWN_MIN_LIST = [100,200,300,400,500,600,700,800,900,1000,1200];
SPAWN_MIN_DEFAULT = 2;
SPAWN_MAX_LIST = [400,500,600,700,800,900,1000,1200,1500,1800,2000];
SPAWN_MAX_DEFAULT = 4;

FRIENDLY_GROUPS = 7;
ENEMY_GROUPS = 7;
GROUP_COUNT_LIST = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
FRIEND_COUNT_DEFAULT = 7;
ENEMY_COUNT_DEFAULT = 7;

SNIPER_PERCENT =10;
CAR_PERCENT = 15;
ARM_PERCENT = 15;
HELO_PERCENT = 5;
AIR_PERCENT = 5;

SUPPORT_PERCENT_LIST = [0,1,2,3,4,5,10,15,20,25,30,35,40,45,50,60,70,80,90,100];
SNIPER_PERCENT_DEFAULT = 6;
CAR_PERCENT_DEFAULT = 7;
ARM_PERCENT_DEFAULT = 7;
HELI_PERCENT_DEFAULT = 5;
AIR_PERCENT_DEFAULT = 5;

CAR_DENSITY_FACTOR = 0.1;//probability that each suitable road will spawn a car - default 0.1
CAR_MAX_PER_TOWN = 10;
CARPARK_TYPES = [
	"SkodaBlue",
	"SkodaGreen",
	"SkodaRed",
	"Skoda",
	"VWGolf",
	"TT650_Civ",
	"hilux1_civil_2_covered",
	"hilux1_civil_1_open",
	"hilux1_civil_3_open",
	"car_hatchback",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"car_sedan",
	"Tractor",
	"tractorOld",
	"LadaLM",
	"Lada2",
	"Lada1",
	"UralCivil2",
	"UralCivil",
	"V3S_Civ"
];

CAR_AMMOS = [
	["M16A2","30Rnd_556x45_Stanag"],
	["AK_47_M","30Rnd_762x39_AK47"],
	["AK_47_S","30Rnd_762x39_AK47"],
	["AK_74","30Rnd_545x39_AK"],
	["PK","100Rnd_762x54_PK"],
	["RPK_74","75Rnd_545x39_RPK"],
	["SVD","10Rnd_762x54_SVD"],
	["huntingrifle","5x_22_LR_17_HMR"],
	["Makarov","8Rnd_9x18_Makarov"],
	["RPG7V","PG7V"],
	["RPG7V","OG7"],
	["Handgrenade_East"],
	["pipebomb"],
	["minee"]
];

itemCargos = ["nvgoggles","itemcompass","binocular","itemmap","itemgps"];

CIV_COUNT_MAX = 12;
CIV_SPAWN_RANGE = 600;
CIV_REMOVE_RANGE = 700;
CIV_PER_BUILDING = 0.2;
CIV_WP_DELAYS = [0,30,60];
CIV_ROAMING_DIST = 400;
CIV_STAY_HOME_PERCENTAGE = 30;
CIV_TYPES = [
	"Assistant",
	"Citizen2",
	"Citizen1",
	"Citizen3",
	"Citizen4",
	"Doctor",
	"Functionary1",
	"Functionary2",
	"Priest",
	"Profiteer2",
	"Profiteer3",
	"Profiteer1",
	"Profiteer4",
	"Rocker1",
	"Rocker3",
	"Rocker2",
	"Rocker4",
	"SchoolTeacher",
	"Villager1",
	"Villager4",
	"Villager2",
	"Villager3",
	"Woodlander1",
	"Woodlander2",
	"Woodlander3",
	"Woodlander4",
	"Worker3",
	"Worker4",
	"Worker1",
	"Worker2",
	"Damsel1",
	"Damsel3",
	"Damsel4",
	"Damsel2",
	"Damsel5",
	"Farmwife4",
	"Farmwife3",
	"Farmwife5",
	"Farmwife2",
	"Farmwife1",
	"HouseWife4",
	"HouseWife3",
	"HouseWife2",
	"HouseWife5",
	"HouseWife1",
	"Madam5",
	"Madam2",
	"Madam4",
	"Madam1",
	"Madam3",
	"Secretary3",
	"Secretary2",
	"Secretary1",
	"Secretary5",
	"Secretary4",
	"Sportswoman5",
	"Sportswoman2",
	"Sportswoman3",
	"Sportswoman4",
	"Sportswoman1",
	"Hooker4",
	"Hooker3",
	"Hooker2",
	"Hooker5",
	"Hooker1",
	"WorkWoman2",
	"WorkWoman5",
	"WorkWoman3",
	"WorkWoman4",
	"WorkWoman1"
];

MUSIC_TRACKS = [
	"Track01_Dead_Forest",
	"Track02_Insertion",
	"Track03_First_To_Fight",
	"Track04_Reinforcements",
	"Track05_Warpath",
	"Track06_Abandoned_Battlespace",
	"Track07_Last_Men_Standing",
	"Track08_Harvest_Red",
	"Track09_Movement_To_Contact",
	"Track10_Logistics",
	"Track11_Large_Scale_Assault",
	"Track13_Sharping_Knives",
	"Track14_Close_Quarter_Combat",
	"Track15_Morning_Sortie",
	"Track16_Valentine",
	"Track17_Marauder_Song",
	"Track18_Ghost_Waltz",
	"Track19_Debriefing",
	"Track20_Badlands",
	"Track21_Rise_Of_The_Fallen",
	"Track22_Chernarussian_Anthem",
	"Track26_Organ_Works",
	"Track27_Killing_Machines",
	"Ambient01_Cold_Wind",
	"Ambient02_Vague_Shapes",
	"Ambient03_Indian_Summer",
	"Ambient04_Electronic_Warfare",
	"Ambient05_Cobalt",
	"Ambient06_Khe_Sanh_Riff",
	"Ambient07_Manhattan",
	"Ambient08_Reforger",
	"Short01_Defcon_Three",
	"ToWar",
	"AllHelllBreaksLoose",
	"MAD","Fallout",
	"Defcon",
	"Wasteland",
	"SkyNet"
];
//---- init modules ----
call compile preprocessFileLineNumbers "parkedCarsInit.sqf";
call compile preprocessFileLineNumbers "infantryInit.sqf";
call compile preprocessFileLineNumbers "chernarusAmbientAnimalsInit.sqf";
call compile preprocessFileLineNumbers "civiliansInit.sqf";


