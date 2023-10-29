_bloke = _this select 0;
_w1 = (_this select 2)call pickRandom;
_w2 = (_this select 3)call pickRandom;
_gren = _this select 4;
_ammoCount = (_this select 5)call pickRandom;
_grenCount = (_this select 6)call pickRandom;
_extraKit = _this select 7;
_gun = _w1 select 0;
_ammo = _w1 select 1;
_gun2 = _w2 select 0;
_ammo2 = _w2 select 1;
_secWidth = _w2 select 2;
_secCount = _w2 select 3;
_hasGrenadeLauncher = count _w1 == 3;
removeAllWeapons _bloke;
for[{_i=0}, {_i<_ammoCount}, {_i=_i+1}] do{
	_bloke addMagazine _ammo;
};
if(_hasGrenadeLauncher)then{
	_glammo = _w1 select 2;
	_glCount = [4,5,6,7,8] call pickRandom;
	for[{_i=0}, {_i<_glCount}, {_i=_i+1}] do{
		_bloke addMagazine _glammo;
	};
};
_bloke addWeapon _gun;
if(_gren != "")then{
	for[{_i=0}, {_i<_grenCount}, {_i=_i+1}] do{
		_bloke addMagazine _gren;
	};
};
if(_gun2 != "")then{
	for[{_i=0}, {_i<_secCount}, {_i=_i+1}] do{
		_bloke addMagazine _ammo2;
	};
	_bloke addWeapon _gun2;
};
{_bloke addWeapon _x}forEach _extraKit;

_bloke selectWeapon _gun;

_blokeHasSmoke = [true, false, false] call pickRandom;
if(_bloke == player)then{_blokeHasSmoke = true};
_space = _bloke call getCurrentAmmoSpace;
if(_space > 0 && _blokeHasSmoke)then{
	_smoke = _space;
	if(_smoke > 2)then{_smoke = 2};
	for[{_i=0},{_i<_smoke},{_i=_i+1}]do{
		_bloke addMagazine (SMOKE_TYPES call pickRandom);
	};
};