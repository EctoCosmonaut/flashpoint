_killInfo = _this select 0;
_sideString = _this select 1;

_victim = _killInfo select 0;
_killer = _killInfo select 1;

if(_sideString == "EAST")then{eDead = eDead + 1};
if(_sideString == "WEST")then{wDead = wDead + 1};
if(_sideString == "GUER")then{rDead = rDead + 1};

recycleBin = recycleBin + [_victim];

if(_killer == vehicle player)then{
	_pKill = false;
	if((_sideString == "EAST")and((side player == west) or (side player == resistance)))then{_pKill = true};
	if((_sideString == "WEST" or _sideString == "GUER")and(side player == east))then{_pKill = true};
	if(_pKill)then{
		pKills = pKills + 1;
		if(pKills % 10 == 0)then{	
			sleep 0.5;
			hint format ["You Have %1 Kills",pKills];

		};
	};
};