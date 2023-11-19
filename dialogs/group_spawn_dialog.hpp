class groupSpawn{
	idd=-1;
	onLoad = "execVM ""groupSpawnList.sqf"""; 
	movingEnable = false;
	controlsBackground[] = {b1,b2,b3}; 
	objects[] = { }; 
	controls[] = {t1,t2,t3,t4,t5,but1,lb1,lb2,lb3,lb4};

	class b1:rscTitle {
		text = "";
		x = 0.15;
		y = 0.4;
		w = 0.1;
		h = 0.455;
	};
	class b2:b1 {
		x = 0.4;
	};
	class b3:b1 {
		x = 0.6;
		y = 0.435;
		w = 0.2;
		h = 0.385;
	};

	class t1:rscTitle {		
		text = "Infantry groups:";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class t2:rscTitle {		
		text = "Friendly";
		sizeEx = 0.03;
		x = 0.10;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class t3:rscTitle {		
		text = "Enemy";
		sizeEx = 0.03;
		x = 0.35;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class t4:rscTitle {		
		text = "Spawn Range";
		sizeEx = 0.03;
		x = 0.60;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class t5:t4 {		
		text = "Min / Max";
		sizeEx = 0.03;
		x = 0.60;
		y = 0.385;
		h = 0.04;
	};
	class but1:rscBut{
		idc=9;
		text = "Continue";
		action = "FRIENDLY_GROUPS = GROUP_COUNT_LIST select (lbCurSel 5); ENEMY_GROUPS = GROUP_COUNT_LIST select (lbCurSel 6); closeDialog 0; temp = createDialog ""support""";
		x = 0.875;
		y = 0.76;
		w = 0.25;
		h = 0.09;
	};
	class lb1:rscLB{
		idc = 5;
		x = 0.15;
		y = 0.4;
		w = 0.1;
		h = 0.455;
	};
	class lb2:lb1{
		idc = 6;
		x = 0.4;
	};
	class lb3:lb1{
		idc = 7;
		x = 0.6;
		y = 0.435;
		h = 0.385;
		onLBSelChanged = "ctrlEnable[9,[0]call spawnChange]";
	};
	class lb4:lb3{
		idc = 8;
		x = 0.7;
		onLBSelChanged = "ctrlEnable[9,[1]call spawnChange]";
	};
};