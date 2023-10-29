//takistan animals
_cows = ["Cow01_EP1"];
_sheep = ["Sheep01_EP1","Sheep02_EP1"];
_goats = ["Goat01_EP1","Goat02_EP1"];
ANIMAL_TYPES = [_cows,_sheep,_goats];
HERD_COUNTS = [1,2,3,4,5,6];
ANIMAL_COUNT_MAX = 10;
ANIMAL_HERD_RADIUS = 50;
animalCount = 0;
allAnimals = [];
animalScript ={
	_pos = [SPAWN_CENTER,500] call areaPos;
	_test = _pos isFlatEmpty [0,0,0.25,50,0,false,objNull];
	_i=0;
	while{count _test == 0 && _i < 1000}do{
		_pos = [SPAWN_CENTER,500] call areaPos;
		_test = _pos isFlatEmpty [0,0,0.25,50,0,false,objNull];
		_i=_i+1;
	};
	_animalVarients = ANIMAL_TYPES call pickRandom;
	_herdCount = HERD_COUNTS call pickRandom;
	for [{_i=0}, {_i<_herdCount}, {_i=_i+1}] do{
		_anType = _animalVarients call pickRandom;
		_animal = createAgent [_anType,_pos,[],random ANIMAL_HERD_RADIUS,"none"];
		_animal setDir (random 360);
		allAnimals = allAnimals + [_animal];
		animalCount = animalCount + 1;
	};
};