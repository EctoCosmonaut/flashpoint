_bloke = _this select 0;
if(fieldDressing)then{
	fieldDressing = false;
	_bloke playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 1;
	_bloke say "fieldDressing";
	sleep 7;
	if(alive _bloke)then{_bloke setDamage 0};
	sleep 60;
	fieldDressing =true;
};