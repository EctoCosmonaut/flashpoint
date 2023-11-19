_meadow = "(1+meadow)*(1-forest)*(1-houses)*(1-sea)";
_forest = "(1-meadow)*(1+forest)*(1-houses)*(1-sea)";
_village = "(1+meadow)*(1-forest)*(1+(houses*2))*(1-sea)";
_cows = [_meadow,["Cow01","Cow02","Cow03","Cow04"],[1,2,3,4,5],50];
_sheep = [_meadow,["Sheep"],[3,4,5],25];
_chickens = [_village,["Hen","Hen","Hen","Hen","Cock"],[1,2,3,4,5],5];
_goats = [_meadow,["Goat"],[2,3,4,5],25];
_dogs = [_village,["Pastor","Fin"],[1],5];
_boar = [_forest,["WildBoar"],[1,2,3,4,5],10];
animalTypes = [_cows,_cows,_sheep,_goats,_chickens,_dogs,_boar,_boar];
ANIMAL_COUNT_MAX = 20;
animalCount = 0;
allAnimals = [];
animalScript ={
	_pos = SPAWN_CENTER;
	_herdType = animalTypes call pickRandom;
	_expresion = _herdType select 0;
	_animalVarients = _herdType select 1;
	_herdCount = (_herdType select 2) call pickRandom;
	_herdRadius = _herdType select 3;
	_radius = spawnMAX;
	_precision = 50;
	_nPlaces = 100;
	_places = selectBestPlaces[_pos, _radius, _expresion, _precision, _nPlaces];
	_bestPlace = _places call pickRandom;
	_place = _bestPlace select 0;
	_score = _bestPlace select 1;
	if(_score>1.5)then{
		for [{_i=0}, {_i<_herdCount}, {_i=_i+1}] do{
			_thisAnimal = _animalVarients call pickRandom;
			_animal = createAgent [_thisAnimal,_place,[],_herdRadius,"none"];
			_animal setDir (random 360);
			allAnimals = allAnimals + [_animal];
			animalCount = animalCount + 1;
		};
	};
	true
};