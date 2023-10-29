class timeWX{
	idd=-1;
	onLoad = "execVM ""timeWxList.sqf"""; 
	movingEnable = false;
	controlsBackground[] = {b1,b2,b3}; 
	objects[] = { }; 
	controls[] = {t1,t2,t3,t4,lb1,lb2,lb3,but1};

	class b1:rscTitle {
		text = "";
		x = 0.2;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class b2:rscTitle {
		text = "";
		x = 0.45;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class b3:rscTitle {
		text = "";
		x = 0.7;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class t1:rscTitle {		
		text = "Time and Weather:";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class t2:rscTitle {		
		text = "Time";
		sizeEx = 0.03;
		x = 0.15;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class t3:rscTitle {		
		text = "Cloud Cover";
		sizeEx = 0.03;
		x = 0.4;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class t4:rscTitle{		
		text = "Fog";
		sizeEx = 0.03;
		x = 0.65;
		y = 0.325;
		w = 0.2;
		h = 0.05;
	};
	class lb1:rscLB{
		idc = 2;
		x = 0.2;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class lb2:rscLB{
		idc = 3;
		x = 0.45;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class lb3:rscLB{
		idc = 4;
		x = 0.7;
		y = 0.4;
		w = 0.1;
		h = 0.45;
	};
	class but1:rscBut{
		text = "Continue";
		action = "TIME_INDEX = lbCurSel 2; CLOUD_INDEX = lbCurSel 3, FOG_INDEX= lbCurSel 4; closeDialog 0; temp = createDialog ""groupSpawn""";
		x = 0.875;
		y = 0.76;
		w = 0.25;
		h = 0.09;
	};
};