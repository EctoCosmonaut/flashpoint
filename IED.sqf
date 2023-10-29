_trig = _this select 0;
_ied = _this select 1;
_unlucky = _this select 2;
if(! (_unlucky isKindOf "air"))then{
	if(getDammage _ied < 0.1)then{
		_charge = IED_CHARGES call pickRandom;
		_speed = speed _unlucky;
		_delays = IED_FAST_DELAYS;
		if(_speed<IED_SPEED_THRESHOLD)then{
			_delays = IED_SLOW_DELAYS;
		};
		_maxDelay = _delays call pickRandom;
		_delay = random _maxDelay;
		sleep _delay;
		_charge createVehicle getPos _ied;
		deleteVehicle _ied;
	};
	deleteVehicle _trig;
};