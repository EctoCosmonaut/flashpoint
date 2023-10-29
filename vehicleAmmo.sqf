_car = _this select 0;
_ammoCodes = _this select 1;
clearMagazineCargo _car;
clearWeaponCargo _car;
{
	_ammo = _x select 0;
	_count = _x select 1;
	_car addMagazineCargo [_ammo,_count];	
}forEach _ammoCodes;