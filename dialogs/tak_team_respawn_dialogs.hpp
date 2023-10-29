class teamDialog{
	idd=-1;
	movingEnable = false;
	controlsBackground[] = {b1,b2}; 
	objects[] = { }; 
	controls[] = {t1,t2,t3,lb1,lb2,but1,but2,but3,but4,but5,but6,but7,but8};

	class b1:rscTitle {
		text = "";
		x = 0.0;
		y = 0.2;
		w = 0.39;
		h = 0.8;
	};
	class b2:b1 {
		text = "";
		x = 0.61;

	};
	class t1:rscTitle {	
		sizeEx = 0.04;	
		text = "Manage Team:";
		x = 0.3;
		y = 0.0;
		w = 0.4;
		h = 0.08;
	};
	class t2:rscTitle {		
		sizeEx = 0.03;
		text = "Nearby units:";
		x = 0.0;
		y = 0.125;
		w = 0.39;
		h = 0.05;
	};
	class t3:t2 {		
		text = "Your Team:";
		x = 0.61;
	};
	class lb1:rscLB{
		idc = 16;
		x = 0.0;
		y = 0.2;
		w = 0.39;
		h = 0.8;
	};
	class lb2:lb1{
		idc = 17;
		x = 0.61;
	};
	class but1:rscBut{
	        sizeEx = 0.03;
		text = "Set as Leader";
		action = "temp = execVM ""teamDialogSetLeader.sqf""";
		x = 0.41;
		y = 0.725;
		w = 0.2;
		h = 0.05;
	};
	class but2:but1{
		text = "Add Selected";
		action = "temp = execVM ""teamDialogAddSelected.sqf""";
		x = 0.39;
		y = 0.275;
	};
	class but3:but2{
		text = "Add All";
		action = "temp = execVM ""teamDialogAddAll.sqf""";
		y = 0.2;
	};
	class but4:but1{
		text = "Remove Selected";
		action = "temp = execVM ""teamDialogRemoveSelected.sqf""";
		y = 0.425;
	};
	class but5:but1{
		text = "Remove All";
		action = "temp = execVM ""teamDialogRemoveAll.sqf""";
		y = 0.35;
	};
	class but7:but1{
		text = "Set as Player";
		action = "temp = execVM ""teamDialogSetPlayer.sqf""";
		y = 0.65;
	};
	class but6:but1{
		text = "Finished";
		action = "closeDialog 0";
		x = 0.4;
		h = 0.1;
		y = 0.8;
	};
	class but8:but1{
		text = "Night Vision";
		action = "camNVG = ! camNVG; camUseNVG camNVG";
		x = 0.4;
		y = 0.925;
	};

};

class respawnDialog{
	idd=-1;
	movingEnable = false;
	controlsBackground[] = {b1}; 
	objects[] = { }; 
	controls[] = {t1,lb1,but1,but2,but3};

	class b1:rscTitle {
		text = "";
		x = 0.1;
		y = 0.6;
		w = 0.8;
		h = 0.2;
	};
	class t1:rscTitle {		
		text = "Select new player:";
		x = 0.3;
		y = 0.15;
		w = 0.4;
		h = 0.15;
	};
	class lb1:rscLB{
		idc = 15;
		x = 0.1;
		y = 0.6;
		w = 0.8;
		h = 0.2;
	};
	class but1:rscBut{
		text = "Respawn";
		action = "temp =[lbCurSel 15] execVM ""respawnButton.sqf""; closeDialog 0";
		x = 0.75;
		y = 0.85;
		w = 0.25;
		h = 0.09;
	};
	class but2:but1{
		text = "Cancel";
		action = "closeDialog 0";
		x = 0;
	};
	class but3:but1{
		text = "Night Vision";
		action = "camNVG = ! camNVG; camUseNVG camNVG";
		x = 0.385;
	};
};