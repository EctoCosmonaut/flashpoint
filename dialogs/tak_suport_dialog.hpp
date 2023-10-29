class support{
	idd=-1;
	onLoad = "execVM ""supportList.sqf"""; 
	movingEnable = false;
	controlsBackground[] = {b1,b2,b3,b4,b5}; 
	objects[] = { }; 
	controls[] = {t1,t2,t3,t4,t5,t6,lb1,lb2,lb3,lb4,lb5,but1};

	class b1:rscTitle {
		text = "";
		x = 0.04;
		y = 0.4;
		w = 0.1;
		h = 0.35;
	};
	class b2:b1 {
		x = 0.245;
	};
	class b3:b1 {
		x = 0.45;
	};
	class b4:b1 {
		x = 0.655;
	};
	class b5:b1 {
		x = 0.86;
	};
	
	class t1:rscTitle {		
		text = "Support %";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class t2:rscTitle {		
		text = "Snipers";
		sizeEx = 0.03;
		x = 0.0;
		y = 0.325;
		w = 0.18;
		h = 0.05;
	};
	class t3:t2 {		
		text = "Light Vehicles";
		x = 0.205;
	};
	class t4:t2 {		
		text = "Armoured";
		x = 0.41;
	};
	class t5:t2 {		
		text = "Helicopters";
		x = 0.615;
	};
	class t6:t2 {		
		text = "Aeroplanes";
		x = 0.82;
	};
	class lb1:rscLB{
		idc = 10;
		x = 0.04;
		y = 0.4;
		w = 0.1;
		h = 0.35;
	};
	class lb2:lb1{
		idc = 11;
		x = 0.245;
	};
	class lb3:lb1{
		idc = 12;
		x = 0.45;
	};
	class lb4:lb1{
		idc = 13;
		x = 0.655;
	};
	class lb5:lb1{
		idc = 14;
		x = 0.86;
	};
	class but1:rscBut{
		text = "Continue";
		action = "SNIPER_PERCENT = SUPPORT_PERCENT_LIST select (lbCurSel 10); CAR_PERCENT = SUPPORT_PERCENT_LIST select (lbCurSel 11); ARM_PERCENT = SUPPORT_PERCENT_LIST select (lbCurSel 12); HELO_PERCENT = SUPPORT_PERCENT_LIST select (lbCurSel 13); AIR_PERCENT = SUPPORT_PERCENT_LIST select (lbCurSel 14); settingText = ""User Defined""; closeDialog 0; temp = execVM ""setup.sqf""";
		x = 0.85;
		y = 0.775;
		w = 0.25;
		h = 0.08;
	};
};