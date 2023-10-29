call compile preprocessFileLineNumbers "takistanFactions.sqf";

WORLD_STRING = "Zargabad";
FILM_TITLE_STRING = "Z A R G A B A D";
KEY_TITLE_STRING = "thomsonb_flashpoint_zargabad";
SPAWN_LIMITS = [3500,4500,3600,4600];

// add the filename of new presets here
ALL_PRESET_FILENAMES = ["randomLow","randomHigh","taliban","snipers","night","foggyMorning","stormyEvening","randomInfantryOnly","randomLowSupports","randomHighSupports"];

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

spawnMIN = 200;
spawnMAX = 700;
SPAWN_MIN_LIST = [100,200,300,400,500,600,700,800,900,1000,1200];
SPAWN_MIN_DEFAULT = 1;
SPAWN_MAX_LIST = [400,500,600,700,800,900,1000,1200,1500,1800,2000];
SPAWN_MAX_DEFAULT = 3;

FRIENDLY_GROUPS = 5;
ENEMY_GROUPS = 5;
GROUP_COUNT_LIST = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
FRIEND_COUNT_DEFAULT = 5;
ENEMY_COUNT_DEFAULT = 5;

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
	"S1203_TK_CIV_EP1",
	"Old_bike_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	"hilux1_civil_3_open_EP1",
	"Volha_1_TK_CIV_EP1",
	"Volha_2_TK_CIV_EP1",
	"VolhaLimo_TK_CIV_EP1",
	"Lada1_TK_CIV_EP1",
	"Lada2_TK_CIV_EP1",
	"LandRover_TK_CIV_EP1",
	"V3S_TK_GUE_EP1",
	"V3S_Open_TK_CIV_EP1",
	"Ural_TK_CIV_EP1",
	"UAZ_Unarmed_TK_CIV_EP1",
	"V3S_Civ",
	"SkodaBlue",
	"SkodaGreen",
	"SkodaRed",
	"Skoda",
	"car_hatchback",
	"datsun1_civil_1_open",
	"datsun1_civil_3_open",
	"car_sedan",
	"Lada1",
	"Lada2",
	"Tractor",
	"tractorOld"
];

CAR_AMMOS = [
	["M16A2","30Rnd_556x45_Stanag"],
	["AK_47_M","30Rnd_762x39_AK47"],
	["AK_47_S","30Rnd_762x39_AK47"],
	["AK_74","30Rnd_545x39_AK"],
	["AKS_74","30Rnd_545x39_AK"],
	["FN_FAL","20Rnd_762x51_FNFAL"],
	["PK","100Rnd_762x54_PK"],
	["RPK_74","75Rnd_545x39_RPK"],
	["LeeEnfield","10x_303"],
	["SVD","10Rnd_762x54_SVD"],
	["huntingrifle","5x_22_LR_17_HMR"],
	["Sa61_EP1","20Rnd_B_765x17_Ball"],
	["Makarov","8Rnd_9x18_Makarov"],
	["Colt1911","7Rnd_45ACP_1911"],
	["RPG7V","PG7V"],
	["RPG7V","OG7"],
	["Handgrenade_East"],
	["pipebomb"],
	["minee"]
];

itemCargos = ["nvgoggles","itemcompass","binocular","itemmap","itemgps"];

WPN_CACHE_DENSITY = 8;

CIV_COUNT_MAX = 8;
CIV_SPAWN_RANGE = 600;
CIV_REMOVE_RANGE = 700;
CIV_PER_BUILDING = 0.2;
CIV_WP_DELAYS = [0,30,60];
CIV_ROAMING_DIST = 300;
CIV_STAY_HOME_PERCENTAGE = 30;
CIV_TYPES = [
	"TK_CIV_Takistani01_EP1",
	"TK_CIV_Takistani02_EP1",
	"TK_CIV_Takistani03_EP1",
	"TK_CIV_Takistani04_EP1",
	"TK_CIV_Takistani05_EP1",
	"TK_CIV_Takistani06_EP1",
	"TK_CIV_Worker01_EP1",
	"TK_CIV_Woman01_EP1",
	"TK_CIV_Woman02_EP1",
	"TK_CIV_Woman03_EP1"
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
	"SkyNet",
	"EP1_Track01",
	"EP1_Track01D",
	"EP1_Track02",
	"EP1_Track03",
	"EP1_Track03D",
	"EP1_Track04",
	"EP1_Track05",
	"EP1_Track06",
	"EP1_Track07",
	"EP1_Track07D",
	"EP1_Track08",
	"EP1_Track09",
	"EP1_Track10",
	"EP1_Track11",
	"EP1_Track12",
	"EP1_Track13",
	"EP1_Track13D1",
	"EP1_Track13D2",
	"EP1_Track13V",
	"EP1_Track14",
	"EP1_Track15",
	"PMC_Track01",
	"PMC_Track02",
	"PMC_Track03",
	"PMC_Track04",
	"PMC_Track05",
	"PMC_Track06",
	"BAF_Track01",
	"BAF_Track02",
	"BAF_Track03",
	"BAF_Track04",
	"BAF_Track05",
	"BAF_Track06"
];

//---- init modules ----
call compile preprocessFileLineNumbers "IEDsInit.sqf";
call compile preprocessFileLineNumbers "weaponCacheInit.sqf";
call compile preprocessFileLineNumbers "parkedCarsInit.sqf";
call compile preprocessFileLineNumbers "infantryInit.sqf";
call compile preprocessFileLineNumbers "takistanAmbientAnimalsInit.sqf";
call compile preprocessFileLineNumbers "civiliansInit.sqf";


