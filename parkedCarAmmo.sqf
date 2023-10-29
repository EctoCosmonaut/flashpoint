_car = _this select 0;
_ammoCodes = _this select 1;
clearMagazineCargo _car;
clearWeaponCargo _car;
{
	_ammoIndex = _x select 0;
	_ammoCount = _x select 1;
	_chosen = CAR_AMMOS select _ammoIndex;
	_ammo = _chosen select 0;
			if(count _chosen > 1)then{
				_weap = _chosen select 0;
				_car addWeaponCargo [_weap,1];
				_ammo = _chosen select 1;
			};
			_car addMagazineCargo [_ammo,_ammoCount];	
}forEach _ammoCodes;