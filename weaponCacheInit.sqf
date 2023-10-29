WPN_CACHE_BOXES_PER_CACHE =  [1,2,3];
WPN_CACHE_AMMO_COUNTS = [4,5,6,7,8,9,10];
WPN_CACHE_WPNS_PER_CACHE = [1,2,3,4,5,6,7,8,9,10];
WPN_CACHE_ITEMS_PER_CACHE = [0,0,0,1,1,2];
WPN_CACHE_IEDS_PER_CACHE = [0,0,0,0,1,1,2,3];
WPN_CACHE_WPNS = CAR_AMMOS;
WPN_CACHE_ITEMS = ["nvgoggles","itemcompass","binocular","itemmap","itemgps"];
WPN_CACHE_IEDS = ["pmc_ied_v1","pmc_ied_v2","pmc_ied_v3","pmc_ied_v4"];
WPN_CACHE_BOX_TYPE = "GuerillaCacheBox_EP1";
WPN_CACHE_MARKERS = true;

_allWpnCaches = [];
_percentage = WPN_CACHE_DENSITY;
_activeWpnCaches = [];
for[{_i=1},{true},{_i=_i+1}]do{
	_markerName = "wpn_cache_"+ str _i;
	_pos = getMarkerPos _markerName;
 	if(((_pos select 0) + (_pos select 1) == 0))exitWith{};
	_allWpnCaches = _allWpnCaches + [_pos];
	if((random 100)<_percentage)then{
		_activeWpnCaches = _activeWpnCaches  + [_pos];	
		if(! WPN_CACHE_MARKERS)then{
			deleteMarker _markerName;
		}else{
			_markerName setMarkerSize [0.35,0.35];
			_markerName setMarkerAlpha 0.7;
			_markerName setMarkerType "hd_destroy";
			_markerName setMarkerDir 52;
		};
	}else{
		deleteMarker _markerName;
	};
};

_ammoBoxType = WPN_CACHE_BOX_TYPE;

{
	_pos = _x;
	_boxCount = WPN_CACHE_BOXES_PER_CACHE call pickRandom;
	for[{_a=0},{_a<_boxCount},{_a=_a+1}]do{
		_box = _ammoBoxType createVehicle _pos;
		_box setDir (random 360);
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		_wpnCount = WPN_CACHE_WPNS_PER_CACHE call pickRandom;
		for[{_w=0},{_w<_wpnCount},{_w=_w+1}]do{
			_item = WPN_CACHE_WPNS call pickRandom;
			if(count _item > 1)then{
				_gun = _item select 0;
				_ammo = _item select 1;
				_box addWeaponCargoGlobal [_gun,1];
				_box addMagazineCargoGlobal [_ammo,WPN_CACHE_AMMO_COUNTS call pickRandom];
			}else{
				_box addMagazineCargoGlobal [_item select 0,WPN_CACHE_AMMO_COUNTS call pickRandom];
			};	
		};
		_itemCount = WPN_CACHE_ITEMS_PER_CACHE call pickRandom;
		for[{_w=0},{_w<_itemCount},{_w=_w+1}]do{
			_item = WPN_CACHE_ITEMS call pickRandom;
			_box addWeaponCargoGlobal [_item,1];
		};
		_iedCount = WPN_CACHE_IEDS_PER_CACHE call pickRandom;
		for[{_w=0},{_w<_iedCount},{_w=_w+1}]do{
			_ied = WPN_CACHE_IEDS call pickRandom;
			_box addMagazineCargoGlobal [_ied,1];
		};
	};
}forEach _activeWpnCaches;