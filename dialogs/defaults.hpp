//---- This file defines constants and resource dialogs ----

#define FLASHPOINT_COL_GREEN_LIGHT	{0.64, 0.80, 0.53, 0.8}
#define FLASHPOINT_COL_GREEN		{0.44, 0.60, 0.33, 0.8}
#define FLASHPOINT_COL_GREEN_DARK	{0.24, 0.40, 0.13, 0.8}

#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c
#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176
#define FontM             "Zeppelin32"
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

class rscTitle {
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	font = FontM;
	sizeEx = 0.05;
    colorText[] = {0, 0, 0, 1};
	colorBackground[] = FLASHPOINT_COL_GREEN;
	text = "";
	x = 0.3;
	y = 0.15;
	w = 0.4;
	h = 0.15;
};
class rscBut {
    idc = -1;
	type = CT_BUTTON;
    style = ST_CENTER;
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = FLASHPOINT_COL_GREEN;
	colorBackgroundActive[] = FLASHPOINT_COL_GREEN_DARK;
	colorBackgroundDisabled[] = {0, 0, 0,0};
	colorFocused[] = FLASHPOINT_COL_GREEN_LIGHT;
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize=0;
	font = FontM;
   	sizeEx = 0.05;
  	soundPush[] = {, 0.2, 1};
	soundClick[] = {"ui\ui_ok", 0.2, 1};
   	soundEscape[] = {"ui\ui_cc", 0.2, 1};
	soundEnter[] = {"ui\ui_cc", 0.2, 1};
  	default = false;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
};
class rscCB {
	idc = -1;
	type = CT_CHECKBOXES;
	style = ST_CENTER;
  	colorText[] = {1,0,0,1};
	color[] = {0,0,0,0};
	colorTextSelect[] = {0,1,0,1};
	colorSelect[] = {0,1,0,1};
	colorTextDisable[] = {0,0,0,0};
	colorDisable[] = {0, 0, 0,0};
	coloSelectedBg[] = {0,0,0,0};
	font = "Zeppelin32";
	sizeEx = 0.05;
};

class rscLB{
	idc = -1;
	type = CT_LISTBOX;
	style = LB_TEXTURES;
	font = "Zeppelin32";
	sizeEx = 0.03;
    rowHeight = 0.035;
	color[] = FLASHPOINT_COL_GREEN_DARK;
	colorText[] = {0, 0, 0, 1};
	colorScrollbar[] = {0,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,0};
	colorSelectBackground[] = FLASHPOINT_COL_GREEN_DARK;
	colorSelectBackground2[] = FLASHPOINT_COL_GREEN_DARK;
	columns[] = {};
	period = 0;
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	class ScrollBar {
		color[] = {0, 0, 0, 0};
		colorActive[] = {0, 0, 0, 0};
		colorDisabled[] = {0, 0, 0, 0};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};