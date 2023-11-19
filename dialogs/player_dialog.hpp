class player{
	idd=-1;
	onLoad = "execVM ""playerList.sqf"""; 
	movingEnable = false;
	controlsBackground[] = {b1}; 
	objects[] = { }; 
	controls[] = {t1,lb1,but1};

	class b1:rscTitle {
		text = "";
		x = 0.2;
		y = 0.35;
		w = 0.6;
		h = 0.45;
	};
	class t1:rscTitle {		
		text = "Player:";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class lb1:rscLB{
		idc = 1;
		x = 0.2;
		y = 0.35;
		w = 0.6;
		h = 0.45;
	};
	class but1:rscBut{
		text = "Continue";
		action = "SELECTED_PLAYER_INDEX = lbCurSel 1; closeDialog 0; temp=createDialog ""timeWX""";
		x = 0.875;
		y = 0.76;
		w = 0.25;
		h = 0.09;
	};
};