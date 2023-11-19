class comDialog{
	idd=-1;
	movingEnable=false;
	controlsBackground[] = { }; 
	objects[] = { };
	controls[] = {but1,but2,but3,but4,but5,but6,but7,but8,but9,but10,but11};

	class but1{
        		type = CT_BUTTON;
       		idc = -1;
        		style = ST_CENTER;
        		colorText[] = {0, 0, 0, 1};
		colorDisabled[] = {0, 0, 0, 1};
		colorBackground[] = FLASHPOINT_COL_GREEN;
		colorBackgroundActive[] = FLASHPOINT_COL_GREEN_DARK;
		colorBackgroundDisabled[] = {0, 0, 0, 1};
		colorFocused[] = FLASHPOINT_COL_GREEN_LIGHT;
		colorShadow[] = {0, 0, 0, 1};
		colorBorder[] = {0, 0, 0, 1};
		borderSize=0;
        		font = FontM;
        		sizeEx = 0.025;
        		soundPush[] = {, 0.2, 1};
        		soundClick[] = {"ui\ui_ok", 0.2, 1};
        		soundEscape[] = {"ui\ui_cc", 0.2, 1};
        		soundEnter[] = {"ui\ui_cc", 0.2, 1};
        		default = false;
		text = "Statisitics";
		action = "hint call stats; closeDialog 0";
		offsetX = 0;
		offsetY = 0;
		offsetPressedX = 0;
		offsetPressedY = 0;
		x = 0.995;
		y = 0.34;
		w = 0.2;
		h = 0.05;
	};
	class but2:but1{
		text = "Manage Team";
		action = "temp = execVM ""teamDialog.sqf""; closeDialog 0";
		y = 0.40;
	};
	class but3:but1{
		text = "Leave Group";
		action = "temp = execVM ""teamDialogRemoveAll.sqf""; closeDialog 0";
		y = 0.46;
	};
	class but4:but1{
		text = "Toggle Music";
		action = "temp = execVM ""musicSwitch.sqf""; closeDialog 0";
		y = 0.52;
	};
	class but5:but1{
		text = "Give me an Objective";
		action = "temp = execVM ""objective.sqf""; closeDialog 0";
		y = 0.58;
	};
	class but6:but1{
		text = "Weather forecast";
		action = "hint weatherText;closeDialog 0";
		y = 0.64;
	};
	class but7:but1{
		text = "Help! Where am I?";
		action = "temp = execVM ""whereAmI.sqf""; closeDialog 0";
		y = 0.70;
	};
	class but8:but1{
		text = "Save Game";
		action = "saveGame; closeDialog 0";
		y = 0.76;	
	};
	class but9:but1{
		text = "Respawn";
		action = "temp = execVM ""respawnAction.sqf""; closeDialog 0";
		y = 0.82;
	};
	class but10:but1{
		text = "GCam";
		action = "execVM ""gcam\gcam.sqf"";closeDialog 0";
		y = 0.88;
	};
	class but11:but1{
		text = "Close";
		action = "closeDialog 0";
		y = 0.94;
	};
};