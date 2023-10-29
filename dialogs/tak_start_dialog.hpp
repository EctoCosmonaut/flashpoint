class start{
	idd=-1;
	onLoad = "execVM ""presets\presetsDialogInit.sqf""";
	movingEnable = false;
	controlsBackground[] = {t2,b1}; 
	objects[] = { }; 
	controls[] = {t1,but1,but2,but3,but4,lb1};
	class lb1:rscLB{
		sizeEx = 0.032;
		rowHeight = 0.04;
		idc = 22;
		x = 0.55;
		y = 0.49;
		w = 0.4;
		h = 0.28;
	};
	class b1:rscTitle{
		x = 0.55;
		y = 0.49;
		w = 0.4;
		h = 0.28;
	};
	class t2:rscTitle {	
		text = "Preset Modes:";
		x = 0.625;
		y = 0.4;
		w = 0.25;
		h = 0.06;
		sizeEx = 0.04;
	};
	class t1:rscBut {
		idc = 9;
		text = "How do you want to set up?";
		action = "if(NORMAL_FILM)then{NORMAL_FILM = false; ctrlSetText [9,""  How do you want to set up? *""]}else{NORMAL_FILM = true; ctrlSetText [9,""How do you want to set up?""]}";
		colorDisabled[] = FLASHPOINT_COL_GREEN;
		colorBackground[] = FLASHPOINT_COL_GREEN;
		colorBackgroundActive[] = FLASHPOINT_COL_GREEN;
		colorBackgroundDisabled[] = FLASHPOINT_COL_GREEN;
		colorFocused[] = FLASHPOINT_COL_GREEN;
		x = 0.25;
		y = 0.15;
		w = 0.5;
		h = 0.2;
	};
	class but1:rscBut{
       	text = "Everything Random";
		action = "closeDialog 0;temp = execVM ""setup.sqf""";
		x = 0.05;
		y = 0.45;
		w = 0.4;
		h = 0.1;
	};
	class but2:but1{
		y = 0.6;
		text = "Let me set it up";
		action = "closeDialog 0,temp=createDialog ""faction""";
	};
	class but3:but1{
		idc = 21;
		w = 0.2;
		h = 0.05;
		x = 0.15;
		y = 0.75;
		text = "debug info is OFF";
		action = "if(debugInfo)then{ctrlSetText [21,""debug info is OFF""]; debugInfo = false}else{ctrlSetText [21,""> debug mode ON <""]; debugInfo = true}";
		sizeEx = 0.025;
	};
	class but4:but1{
		x = 0.625;
		y = 0.8;
		w = 0.25;
		h = 0.075;
		text = "Go with Preset";
		action = "call presetButtonAction";
		sizeEx = 0.04;
	};
};