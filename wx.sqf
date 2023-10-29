_weatherCloud = random MAX_CLOUD;
_forecastCloud = random MAX_CLOUD;

if(CLOUD_INDEX > 0)then{
	_weatherCloud = CLOUD_LIST select (CLOUD_INDEX - 1);
	_forecastCloud = _weatherCloud;
};

_weatherFog = random MAX_FOG;
_forecastFog = random MAX_FOG;

if(FOG_INDEX > 0)then{
	_weatherFog = FOG_LIST select (FOG_INDEX - 1);
	_forecastFog = _weatherFog;
};

_wxChange = _forecastCloud - _weatherCloud;
_fogChange = _forecastFog - _weatherFog;
_wxText = "stay the same";
if(_wxChange > 0.1)then{_wxText = "get slightly worse"};
if(_wxChange < -0.1)then{_wxText = "improve slightly"};
if(_wxChange > 0.3)then{_wxText = "get worse"};
if(_wxChange < -0.3)then{_wxText = "improve"};
_fogText = "stay the same";
if(_fogChange > 0.1)then{_fogText = "get slightly worse"};
if(_fogChange < -0.1)then{_fogText = "improve slightly"};
if(_fogChange > 0.3)then{_fogText = "get worse"};
if(_fogChange < -0.3)then{_fogText = "improve"};
weatherText = "Met office report at "+ startDayTime +"\n\nCloud cover is " + (str (_weatherCloud call percentage)) + "%, forecast to "+ _wxText + ".\n\nFog is " + (str (_weatherFog call percentage)) + "%, forecast to "+ _fogText + ".";

0 setOvercast _weatherCloud;
0 setFog _weatherFog;
if(_forecastCloud == _weatherCloud && _forecastFog == _weatherFog)exitWith{};

_cloudChange = (_forecastCloud - _weatherCloud)/60;
_fogChange = (_forecastFog - _weatherFog)/60;
_latestCloud = _weatherCloud;
_latestFog = _weatherFog;
for[{_i=0},{_i<60},{_i=_i+1}]do{
	_latestCloud = _latestCloud + _cloudChange;
	_latestFog = _latestFog + _fogChange;
	30 setOvercast _latestCloud;
	sleep 30;
	30 setFog _latestFog;
	sleep 30;
};