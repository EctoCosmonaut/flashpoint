class faction{
	idd=-1;
	onLoad = "[] spawn setupFactionLists";
	movingEnable = false;
	objects[] = { }; 
	controls[] = {t1,f1,f2,but1,but2};
	class t1:rscTitle {
		text = "Factions:";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class f1:rscLB{
		idc = 20;
		x = 0.05;
		y = 0.35;
		w = 0.4;
		h = 0.44;
		style = ST_CENTER;
		color[] = {0,0,0,0};
		colorSelectBackground[] = {0,0,0,0};
		colorSelectBackground2[] = {0,0,0,0};
		sizeEx = 0.07;
		onLBSelChanged = "ctrlEnable[0,_this + [20] call factionChange]";
	};
	class f2:f1{
		idc = 21;
		x = 0.55;
		onLBSelChanged = "ctrlEnable[0,_this + [21] call factionChange]";
	};
	class but1:rscBut{
		idc=0;
		text = "Go with selected";
		action = "chosenFactions = true;closeDialog 0;temp=createDialog ""player""";
		x = 0.4;
		y = 0.8;
		w = 0.25;
		h = 0.085;
		sizeEx = 0.048;
	};
	class but2:but1{
		text = "Go with Random";
		action = "closeDialog 0;temp=createDialog ""player""";
		x = 0.75;
	};
};