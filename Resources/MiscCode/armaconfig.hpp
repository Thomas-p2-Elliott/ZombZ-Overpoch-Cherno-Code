class CfgPatches
{
	class CAUI
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"CAFonts"
		};
	};
};
class RscControlsGroup
{
	type=15;
	idc=-1;
	x=0;
	y=0;
	w=1;
	h=1;
	shadow=0;
	style=16;
	class VScrollbar
	{
		width=0.021;
		autoScrollSpeed=-1;
		autoScrollDelay=5;
		autoScrollRewind=0;
		shadow=0;
	};
	class HScrollbar
	{
		height=0.028000001;
		shadow=0;
	};
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
		border="\ca\ui\data\ui_border_scroll_ca.paa";
	};
	class Controls
	{
	};
};
class RscListNBox
{
	style=16;
	shadow=2;
	color[]={1,1,1,1};
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorScrollbar[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect2[]={0.94999999,0.94999999,0.94999999,1};
	colorSelectBackground[]={0,0,0,1};
	colorSelectBackground2[]={0.87840003,0.84710002,0.65100002,1};
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
		border="\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class DefaultTextAttributes
{
	font="Zeppelin32";
	color="#ffffff";
	size=1;
	align="left";
	valign="middle";
	shadow="true";
	shadowOffset=0.07;
	shadowColor="#000000";
	underline="false";
};
class RscButtonImages
{
	class XBoxA
	{
		id="0x00050000 + 0";
		image="\ca\ui\data\ui_xbox_shortcut_a_ca.paa";
		size=1.3333;
	};
	class XBoxB
	{
		id="0x00050000 + 1";
		image="\ca\ui\data\ui_xbox_shortcut_b_ca.paa";
		size=1.3333;
	};
	class XBoxX
	{
		id="0x00050000 + 2";
		image="\ca\ui\data\ui_xbox_shortcut_x_ca.paa";
		size=1.3333;
	};
	class XBoxY
	{
		id="0x00050000 + 3";
		image="\ca\ui\data\ui_xbox_shortcut_y_ca.paa";
		size=1.3333;
	};
	class XBoxUp
	{
		id="0x00050000 + 4";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxDown
	{
		id="0x00050000 + 5";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxLeft
	{
		id="0x00050000 + 6";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRight
	{
		id="0x00050000 + 7";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxStart
	{
		id="0x00050000 + 8";
		image="\ca\ui\data\ui_xbox_shortcut_start_ca.paa";
		size=1.3333;
	};
	class XBoxBack
	{
		id="0x00050000 + 9";
		image="#(argb,8,8,3)color(0.3,0.3,0.3,1)";
		size=1.3333;
	};
	class XBoxBlack
	{
		id="0x00050000 + 10";
		image="#(argb,8,8,3)color(0,0,0,1)";
		size=1.3333;
	};
	class XBoxWhite
	{
		id="0x00050000 + 11";
		image="#(argb,8,8,3)color(1,1,1,1)";
		size=1.3333;
	};
	class XBoxLeftBumper
	{
		id="0x00050000 + 10";
		image="#(argb,8,8,3)color(0,0,1,1)";
		size=1.3333;
	};
	class XBoxRightBumper
	{
		id="0x00050000 + 11";
		image="#(argb,8,8,3)color(1,0,0,1)";
		size=1.3333;
	};
	class XBoxLeftTrigger
	{
		id="0x00050000 + 12";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRightTrigger
	{
		id="0x00050000 + 13";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxLeftThumb
	{
		id="0x00050000 + 14";
		image="\ca\ui\data\ui_xbox_shortcut_rightthumb_ca.paa";
		size=1.3333;
	};
	class XBoxRightThumb
	{
		id="0x00050000 + 15";
		image="";
		size=1.3333;
	};
	class XBoxLeftThumbXRight
	{
		id="0x00050000 + 16";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxLeftThumbYUp
	{
		id="0x00050000 + 17";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRightThumbXRight
	{
		id="0x00050000 + 16";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRightThumbYUp
	{
		id="0x00050000 + 19";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxLeftThumbXLeft
	{
		id="0x00050000 + 20";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxLeftThumbYDown
	{
		id="0x00050000 + 21";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRightThumbXLeft
	{
		id="0x00050000 + 22";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
	class XBoxRightThumbYDown
	{
		id="0x00050000 + 23";
		image="#(argb,8,8,3)color(0,1,0,1)";
		size=1.3333;
	};
};
class RscText
{
	x=0;
	y=0;
	h=0.037;
	w=0.30000001;
	style=0;
	shadow=2;
	font="Zeppelin32";
	SizeEx=0.039209999;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorBackground[]={0,0,0,0};
};
class RscLine: RscText
{
	idc=-1;
	style=176;
	x=0.17;
	y=0.47999999;
	w=0.66000003;
	h=0;
	text="";
	colorBackground[]={0,0,0,0};
	colorText[]={0.87840003,0.84710002,0.65100002,1};
};
class RscTextMainMenu: RscText
{
	style="0x02 + 0x100";
};
class RscTree
{
	font="Zeppelin32";
	sizeEx=0.02674;
};
class RscTitle: RscText
{
	shadow=2;
};
class RscPicture
{
	shadow=0;
	colorText[]={1,1,1,1};
	x=0;
	y=0;
	w=0.2;
	h=0.15000001;
};
class RscPictureKeepAspect: RscPicture
{
	style="0x30 + 0x800";
};
class RscStructuredText
{
	x=0;
	y=0;
	h=0.035;
	w=0.1;
	text="";
	size=0.039209999;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	shadow=2;
	class Attributes
	{
		font="Zeppelin32";
		color="#e0d8a6";
		align="center";
		shadow=1;
	};
};
class RscObject;
class RscActiveText
{
	idc=-1;
	x=0;
	y=0;
	h=0.035;
	w=0.035;
	font="Zeppelin32";
	shadow=2;
	sizeEx=0.039209999;
	color[]={0,0,0,1};
	colortext[]={0,0,0,1};
	colorActive[]={0.30000001,0.40000001,0,1};
};
class RscButton
{
	style=2;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	shadow=2;
	font="Zeppelin32";
	sizeEx=0.039209999;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorDisabled[]={0.40000001,0.40000001,0.40000001,1};
	colorBackground[]={1,0.537,0,0.5};
	colorBackgroundActive[]={1,0.537,0,1};
	colorBackgroundDisabled[]={0.94999999,0.94999999,0.94999999,1};
	offsetX=0.003;
	offsetY=0.003;
	offsetPressedX=0.0020000001;
	offsetPressedY=0.0020000001;
	colorFocused[]={1,0.537,0,1};
	colorShadow[]={0.023529001,0,0.031372499,1};
	colorBorder[]={0.023529001,0,0.031372499,1};
	borderSize=0;
	soundEnter[]=
	{
		"\ca\ui\data\sound\onover",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
	soundClick[]=
	{
		"\ca\ui\data\sound\onclick",
		0.07,
		1
	};
	soundEscape[]=
	{
		"\ca\ui\data\sound\onescape",
		0.090000004,
		1
	};
};
class RscGearButtonTest: RscButton
{
	colorText[]={1,0,1,1};
	colorDisabled[]={0,1,1,1};
	colorBackground[]={1,1,0,1};
	colorBackgroundActive[]={0,1,0,1};
	colorBackgroundDisabled[]={1,0,0,1};
	offsetX=0;
	offsetY=0;
	offsetPressedX=0;
	offsetPressedY=0;
	colorShadow[]={1,1,1,0};
};
class RscShortcutButton
{
	idc=-1;
	style=0;
	default=0;
	shadow=2;
	w=0.183825;
	h=0.1045752;
	color[]={0.87840003,0.84710002,0.65100002,1};
	color2[]={0.94999999,0.94999999,0.94999999,1};
	colorBackground[]={1,1,1,1};
	colorbackground2[]={1,1,1,0.40000001};
	colorDisabled[]={1,1,1,0.25};
	periodFocus=1.2;
	periodOver=0.80000001;
	class HitZone
	{
		left=0.0040000002;
		top=0.028999999;
		right=0.0040000002;
		bottom=0.028999999;
	};
	class ShortcutPos
	{
		left=0.0145;
		top=0.026000001;
		w=0.039215699;
		h=0.052287601;
	};
	class TextPos
	{
		left=0.050000001;
		top=0.034000002;
		right=0.0049999999;
		bottom=0.0049999999;
	};
	animTextureNormal="\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver="\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused="\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed="\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault="\ca\ui\data\ui_button_default_ca.paa";
	period=0.40000001;
	font="Zeppelin32";
	size=0.039209999;
	sizeEx=0.039209999;
	text="";
	soundEnter[]=
	{
		"\ca\ui\data\sound\onover",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
	soundClick[]=
	{
		"\ca\ui\data\sound\onclick",
		0.07,
		1
	};
	soundEscape[]=
	{
		"\ca\ui\data\sound\onescape",
		0.090000004,
		1
	};
	action="";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
		shadow="true";
	};
	class AttributesImage
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
	};
};
class RscIGUIShortcutButton: RscShortcutButton
{
	w=0.183825;
	h=0.052287601;
	style=2;
	color[]={1,1,1,1};
	color2[]={1,1,1,0.85000002};
	colorBackground[]={1,1,1,1};
	colorbackground2[]={1,1,1,0.85000002};
	colorDisabled[]={1,1,1,0.40000001};
	class HitZone
	{
		left=0.0020000001;
		top=0.003;
		right=0.0020000001;
		bottom=0.016000001;
	};
	class ShortcutPos
	{
		left=-0.0060000001;
		top=-0.0070000002;
		w=0;
		h=0.052287601;
	};
	class TextPos
	{
		left=0;
		top=0;
		right=0;
		bottom=0.016000001;
	};
	animTextureNormal="\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver="\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused="\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed="\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault="\ca\ui\data\igui_button_normal_ca.paa";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="center";
		shadow="true";
	};
};
class RscGearShortcutButton: RscShortcutButton
{
	w=0.039215699;
	h=0.052287601;
	style=2;
	color[]={1,1,1,1};
	color2[]={1,1,1,0.85000002};
	colorBackground[]={1,1,1,1};
	colorbackground2[]={1,1,1,0.85000002};
	colorDisabled[]={1,1,1,0.40000001};
	class HitZone
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=-0.0060000001;
		top=-0.0070000002;
		w=0.039215699;
		h=0.052287601;
	};
	class TextPos
	{
		left=0.003;
		top=0.001;
		right=0;
		bottom=0;
	};
	sizeEx=0.1;
	animTextureNormal="\ca\ui\data\igui_gear_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\igui_gear_disabled_ca.paa";
	animTextureOver="\ca\ui\data\igui_gear_over_ca.paa";
	animTextureFocused="\ca\ui\data\igui_gear_focus_ca.paa";
	animTexturePressed="\ca\ui\data\igui_gear_down_ca.paa";
	animTextureDefault="\ca\ui\data\igui_gear_normal_ca.paa";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="center";
		shadow="false";
	};
};
class RscShortcutButtonMainMenu: RscShortcutButton
{
	w=0.183825;
	h=0.1045752;
	color[]={0.87840003,0.84710002,0.65100002,1};
	colorDisabled[]={1,1,1,0.25};
	class HitZone
	{
		left=0.0040000002;
		top=0.028999999;
		right=0.0040000002;
		bottom=0.028999999;
	};
	class ShortcutPos
	{
		left=0.0040000002;
		top=0.026000001;
		w=0.039215699;
		h=0.052287601;
	};
	class TextPos
	{
		left=0.043000001;
		top=0.034000002;
		right=0.0049999999;
		bottom=0.0049999999;
	};
	animTextureNormal="\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver="\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused="\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed="\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault="\ca\ui\data\ui_button_default_ca.paa";
	soundEnter[]=
	{
		"\ca\ui\data\sound\onover",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
	soundClick[]=
	{
		"\ca\ui\data\sound\onclick",
		0.07,
		1
	};
	soundEscape[]=
	{
		"\ca\ui\data\sound\onescape",
		0.090000004,
		1
	};
	action="";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
		shadow="true";
	};
	class AttributesImagev
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
	};
};
class RscShortcutButtonMain: RscShortcutButton
{
	idc=-1;
	style=0;
	default=0;
	w=0.3137255;
	h=0.1045752;
	color[]={0.87840003,0.84710002,0.65100002,1};
	colorDisabled[]={1,1,1,0.25};
	class HitZone
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=0.020400001;
		top=0.026000001;
		w=0.039215699;
		h=0.052287601;
	};
	class TextPos
	{
		left=0.079999998;
		top=0.034000002;
		right=0.0049999999;
		bottom=0.0049999999;
	};
	animTextureNormal="\ca\ui\data\ui_button_main_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\ui_button_main_disabled_ca.paa";
	animTextureOver="\ca\ui\data\ui_button_main_over_ca.paa";
	animTextureFocused="\ca\ui\data\ui_button_main_focus_ca.paa";
	animTexturePressed="\ca\ui\data\ui_button_main_down_ca.paa";
	animTextureDefault="\ca\ui\data\ui_button_main_normal_ca.paa";
	period=0.5;
	font="Zeppelin32";
	size=0.039209999;
	sizeEx=0.039209999;
	text="";
	soundEnter[]=
	{
		"\ca\ui\data\sound\onover",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
	soundClick[]=
	{
		"\ca\ui\data\sound\onclick",
		0.07,
		1
	};
	soundEscape[]=
	{
		"\ca\ui\data\sound\onescape",
		0.090000004,
		1
	};
	action="";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class AttributesImage
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="false";
	};
};
class RscShortcutButtonDiaryMap: RscShortcutButton
{
	idc=-1;
	style=0;
	default=0;
	w=0.039215699;
	h=0.052287601;
	color[]={0.87840003,0.84710002,0.65100002,1};
	colorDisabled[]={1,1,1,0.25};
	class HitZone
	{
		left=0;
		top=0;
		right=0.075999998;
		bottom=0.090000004;
	};
	class ShortcutPos
	{
		left=0;
		top=0.026000001;
		w=0.039215699;
		h=0.052287601;
	};
	class TextPos
	{
		left=-0.1;
		top=-0.1;
		right=0.0049999999;
		bottom=0.0049999999;
	};
	animTextureNormal="\ca\ui\data\diary\ui_button_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\diary\ui_button_disabled_ca.paa";
	animTextureOver="\ca\ui\data\diary\ui_button_focus_ca.paa";
	animTextureFocused="\ca\ui\data\diary\ui_button_down_ca.paa";
	animTexturePressed="\ca\ui\data\diary\ui_button_down_ca.paa";
	animTextureDefault="\ca\ui\data\diary\ui_button_normal_ca.paa";
	period=0.40000001;
	font="Zeppelin32";
	size=0.034000002;
	sizeEx=0.034000002;
	text="";
	soundEnter[]=
	{
		"\ca\ui\data\sound\onover",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
	soundClick[]=
	{
		"\ca\ui\data\sound\onclick",
		0.07,
		1
	};
	soundEscape[]=
	{
		"\ca\ui\data\sound\onescape",
		0.090000004,
		1
	};
	action="";
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class AttributesImage
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="false";
	};
};
class RscShortcutButtonWizard: RscShortcutButtonMain
{
	class TextPos
	{
		left=0.079999998;
		top=0.024;
		right=0.0049999999;
		bottom=0.0049999999;
	};
	animTextureNormal="\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled="\ca\ui\data\ui_button_normal_ca.paa";
	animTextureOver="\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused="\ca\ui\data\ui_button_over_ca.paa";
	animTexturePressed="\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault="\ca\ui\data\ui_button_normal_ca.paa";
};
class RscXKeyShadow
{
	style=0;
	w=0.3137255;
	h=0.1045752;
	size=0.039209999;
	class Attributes
	{
		font="Zeppelin32";
		color="#E5E5E5";
		align="left";
	};
	class AttributesImage
	{
		color="#E5E5E5";
	};
};
class RscButton_small: RscButton
{
	w=0.095588997;
	h=0.039216001;
	sizeEx=0.02674;
};
class RscButtonTextOnly: RscButton
{
	SizeEx=0.02674;
	colorBackground[]={1,1,1,0};
	colorBackgroundActive[]={1,1,1,0};
	colorBackgroundDisabled[]={1,1,1,0};
	colorFocused[]={1,1,1,0};
	colorShadow[]={1,1,1,0};
	borderSize=0;
};
class RscProgress
{
	x=0.34400001;
	y=0.61900002;
	w=0.3137255;
	h=0.0261438;
	shadow=2;
	texture="\ca\ui\data\loadscreen_progressbar_ca.paa";
	colorFrame[]={0,0,0,0};
	colorBar[]={1,1,1,1};
};
class RscProgressBackground: RscPicture
{
	x=0;
	y=0.89216399;
	w=1;
	h=0.078432001;
	text="\ca\ui\data\ui_gradient_title_gs.paa";
	colorText[]={0,0,0,0.40000001};
};
class RscLoadingText: RscText
{
	style=2;
	x=0.29412001;
	y=0.66667199;
	w=0.41176799;
	h=0.039216001;
	sizeEx=0.039209999;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
};
class RscProgressNotFreeze
{
};
class RscListBox
{
	style=16;
	font="Zeppelin32";
	shadow=2;
	sizeEx=0.039209999;
	color[]={1,1,1,1};
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorScrollbar[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect2[]={0.94999999,0.94999999,0.94999999,1};
	colorSelectBackground[]={0,0,0,1};
	colorSelectBackground2[]={0.87840003,0.84710002,0.65100002,1};
	period=1.2;
	colorBackground[]={0,0,0,1};
	maxHistoryDelay=1;
	autoScrollSpeed=-1;
	autoScrollDelay=5;
	autoScrollRewind=0;
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
		border="\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class RscListBoxKeys: RscListBox
{
	collisionColor[]={1,0,0,1};
	disabledKeyColor[]={1,1,1,0.5};
};
class RscIGUIListBox: RscListBox
{
	shadow=2;
	color[]={1,1,1,1};
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorScrollbar[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect2[]={0.94999999,0.94999999,0.94999999,1};
	colorSelectBackground[]={0.87840003,0.84710002,0.65100002,1};
	colorSelectBackground2[]={0.023529001,0,0.031372499,1};
	period=0;
	colorBackground[]={0,0,0,1};
	sizeEx=0.034000002;
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\igui_arrow_top_ca.paa";
		border="\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class RscIGUIListNBox: RscListNBox
{
	style="0 + 0x10";
	shadow=2;
	color[]={1,1,1,1};
	colorText[]={1,1,1,0.75};
	colorScrollbar[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect2[]={0.94999999,0.94999999,0.94999999,1};
	colorSelectBackground[]={0.87840003,0.84710002,0.65100002,1};
	colorSelectBackground2[]={0.87840003,0.84710002,0.65100002,1};
	period=0;
	colorBackground[]={0,0,0,1};
	columns[]={0.1,0.69999999,0.1,0.1};
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\igui_arrow_top_ca.paa";
		border="\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class RscEdit
{
	style="0x00 + 0x40";
	font="Zeppelin32";
	shadow=2;
	sizeEx=0.039209999;
	colorBackground[]={0,0,0,1};
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	colorSelection[]={0.87840003,0.84710002,0.65100002,1};
};
class RscSlider
{
	h=0.025;
	color[]={1,1,1,0.80000001};
	colorActive[]={1,1,1,1};
};
class RscXSliderH
{
	style="0x400	+ 0x10";
	shadow=2;
	x=0;
	y=0;
	h=0.029412;
	w=0.40000001;
	color[]={1,1,1,0.40000001};
	colorActive[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.2};
	arrowEmpty="\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull="\ca\ui\data\ui_arrow_left_active_ca.paa";
	border="\ca\ui\data\ui_border_frame_ca.paa";
	thumb="\ca\ui\data\ui_slider_bar_ca.paa";
};
class RscXListBox
{
	style="0x400 + 0x02 +	0x10";
	shadow=2;
	arrowEmpty="\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull="\ca\ui\data\ui_arrow_left_active_ca.paa";
	border="\ca\ui\data\ui_border_frame_ca.paa";
	w=0.14706001;
	h=0.039216001;
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	font="Zeppelin32";
	sizeEx=0.039209999;
	soundSelect[]=
	{
		"\ca\ui\data\sound\new1",
		0,
		0
	};
};
class RscFrame
{
	type=0;
	idc=-1;
	style=64;
	shadow=2;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	font="Zeppelin32";
	sizeEx=0.02;
	text="";
};
class RscBackground: RscText
{
	type=0;
	IDC=-1;
	style=512;
	shadow=0;
	x=0;
	y=0;
	w=1;
	h=1;
	text="";
	ColorBackground[]={0.47999999,0.5,0.34999999,1};
	ColorText[]={0.1,0.1,0.1,1};
	font="Zeppelin32";
	SizeEx=1;
};
class RscHTML
{
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	colorLink[]={0.87840003,0.84710002,0.65100002,1};
	colorBold[]={0.87840003,0.84710002,0.65100002,1};
	colorLinkActive[]={1,0.537,0,1};
	sizeEx=0.039209999;
	prevPage="\ca\ui\data\arrow_left_ca.paa";
	nextPage="\ca\ui\data\arrow_right_ca.paa";
	shadow=2;
	class H1
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class H2
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class H3
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class H4
	{
		font="Zeppelin33Italic";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class H5
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class H6
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
	class P
	{
		font="Zeppelin32";
		fontBold="Zeppelin33";
		sizeEx=0.039209999;
		align="left";
	};
};
class RscMapControl
{
	moveOnEdges=1;
	x="SafeZoneXAbs";
	y="SafeZoneY";
	w="SafeZoneWAbs";
	h="SafeZoneH";
	shadow=0;
	ptsPerSquareSea=8;
	ptsPerSquareTxt=10;
	ptsPerSquareCLn=10;
	ptsPerSquareExp=10;
	ptsPerSquareCost=10;
	ptsPerSquareFor="6.0f";
	ptsPerSquareForEdge="15.0f";
	ptsPerSquareRoad="3f";
	ptsPerSquareObj=15;
	showCountourInterval="false";
	maxSatelliteAlpha=0.75;
	alphaFadeStartScale=0.15000001;
	alphaFadeEndScale=0.28999999;
	colorLevels[]={0.64999998,0.60000002,0.44999999,1};
	colorSea[]={0.46000001,0.64999998,0.74000001,0.5};
	colorForest[]={0.44999999,0.63999999,0.33000001,0.5};
	colorRocks[]={0,0,0,0.30000001};
	colorCountlines[]={0.85000002,0.80000001,0.64999998,1};
	colorMainCountlines[]={0.44999999,0.40000001,0.25,1};
	colorCountlinesWater[]={0.25,0.40000001,0.5,0.30000001};
	colorMainCountlinesWater[]={0.25,0.40000001,0.5,0.89999998};
	colorPowerLines[]={0.1,0.1,0.1,1};
	colorRailWay[]={0.80000001,0.2,0,1};
	colorForestBorder[]={0,0,0,0};
	colorRocksBorder[]={0,0,0,0};
	colorNames[]={0.1,0.1,0.1,0.89999998};
	colorInactive[]={1,1,1,0.5};
	colorOutside[]={0,0,0,1};
	fontLabel="Zeppelin32";
	sizeExLabel=0.034000002;
	fontGrid="Zeppelin32";
	sizeExGrid=0.029999999;
	fontUnits="Zeppelin32";
	sizeExUnits=0.034000002;
	fontNames="Zeppelin32";
	sizeExNames=0.056000002;
	fontInfo="Zeppelin32";
	sizeExInfo=0.034000002;
	fontLevel="Zeppelin32";
	sizeExLevel=0.024;
	text="\ca\ui\data\map_background2_co.paa";
	class Task
	{
		icon="\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated="\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled="#(argb,8,8,3)color(0,0,0,0)";
		iconDone="\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed="\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[]={0.86299998,0.58399999,0,1};
		colorCreated[]={0.94999999,0.94999999,0.94999999,1};
		colorCanceled[]={0.60600001,0.60600001,0.60600001,1};
		colorDone[]={0.42399999,0.65100002,0.24699999,1};
		colorFailed[]={0.70599997,0.074500002,0.0196,1};
		size=27;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class CustomMark
	{
		icon="\ca\ui\data\map_waypoint_ca.paa";
		color[]={0.64709997,0.6706,0.62349999,1};
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Legend
	{
		x="SafeZoneX";
		y="SafeZoneY";
		w=0.34;
		h=0.152;
		font="Zeppelin32";
		sizeEx=0.039209999;
		colorBackground[]={0.90600002,0.90100002,0.88,0};
		color[]={0,0,0,1};
	};
	class Bunker
	{
		icon="\ca\ui\data\map_bunker_ca.paa";
		size=14;
		importance="1.5 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Bush
	{
		icon="\ca\ui\data\map_bush_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size=14;
		importance="0.2 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class BusStop
	{
		icon="\ca\ui\data\map_busstop_ca.paa";
		color[]={0.15000001,0.25999999,0.87,1};
		size=12;
		importance="1 * 10 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Command
	{
		icon="\ca\ui\data\map_waypoint_ca.paa";
		color[]={0,0.89999998,0,1};
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Cross
	{
		icon="\ca\ui\data\map_cross_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="0.7 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fortress
	{
		icon="\ca\ui\data\map_bunker_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="2 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fuelstation
	{
		icon="\ca\ui\data\map_fuelstation_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="2 * 16 * 0.05";
		coefMin=0.75;
		coefMax=4;
	};
	class Fountain
	{
		icon="\ca\ui\data\map_fountain_ca.paa";
		color[]={0.2,0.44999999,0.69999999,1};
		size=11;
		importance="1 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Hospital
	{
		icon="\ca\ui\data\map_hospital_ca.paa";
		color[]={0.77999997,0,0.050000001,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Chapel
	{
		icon="\ca\ui\data\map_chapel_ca.paa";
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Church
	{
		icon="\ca\ui\data\map_church_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Lighthouse
	{
		icon="\ca\ui\data\map_lighthouse_ca.paa";
		size=14;
		color[]={0,0.89999998,0,1};
		importance="3 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Quay
	{
		icon="\ca\ui\data\map_quay_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="2 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Rock
	{
		icon="\ca\ui\data\map_rock_ca.paa";
		color[]={0.1,0.1,0.1,0.80000001};
		size=12;
		importance="0.5 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Ruin
	{
		icon="\ca\ui\data\map_ruin_ca.paa";
		size=16;
		color[]={0,0.89999998,0,1};
		importance="1.2 * 16 * 0.05";
		coefMin=1;
		coefMax=4;
	};
	class SmallTree
	{
		icon="\ca\ui\data\map_smalltree_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size=12;
		importance="0.6 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Stack
	{
		icon="\ca\ui\data\map_stack_ca.paa";
		size=20;
		color[]={0,0.89999998,0,1};
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Tree
	{
		icon="\ca\ui\data\map_tree_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size=12;
		importance="0.9 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Tourism
	{
		icon="\ca\ui\data\map_tourism_ca.paa";
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.69999999;
		coefMax=4;
	};
	class Transmitter
	{
		icon="\ca\ui\data\map_transmitter_ca.paa";
		color[]={0,0.89999998,0,1};
		size=20;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class ViewTower
	{
		icon="\ca\ui\data\map_viewtower_ca.paa";
		color[]={0,0.89999998,0,1};
		size=16;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Watertower
	{
		icon="\ca\ui\data\map_watertower_ca.paa";
		color[]={0.2,0.44999999,0.69999999,1};
		size=20;
		importance="1.2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Waypoint
	{
		icon="\ca\ui\data\map_waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		icon="\ca\ui\data\map_waypoint_completed_ca.paa";
	};
};
class RscMap
{
	access=0;
	class controls
	{
		class Map: RscMapControl
		{
			moveOnEdges=0;
			x="SafeZoneXAbs";
			y="SafeZoneY";
			w="SafeZoneWAbs";
			h="SafeZoneH";
		};
	};
};
class RscCompass: RscObject
{
	model="\ca\ui\compass.p3d";
	direction[]={0,0.5,0.5};
	up[]={0,1,0};
	positionBack[]={0,-0.02,0.075000003};
	scale=0.44;
};
class RscWatch: RscObject
{
	model="\ca\ui\watch.p3d";
};
class RscMiniMap
{
	onLoad="uinamespace setvariable ['BIS_RscMiniMap',_this select 0]; _this call compile preprocessfilelinenumbers 'ca\ui\scripts\MiniMap.sqf';";
	onUnload="uinamespace setvariable ['BIS_RscMiniMap',nil];";
	class controlsBackground
	{
		class CA_MiniMap: RscMapControl
		{
			IDC=101;
			ShowCountourInterval=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.625)";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.480)";
			w=0.34999999;
			h=0.301;
			moveOnEdges=1;
			maxSatelliteAlpha=0;
			alphaFadeStartScale=0.050000001;
			alphaFadeEndScale=0.15000001;
			colorLevels[]={0.57999998,0.64999998,0.44999999,0.89999998};
			colorSea[]={0.46000001,0.64999998,0.74000001,0.5};
			colorForest[]={0.58999997,0.72000003,0.23,0.5};
			colorRocks[]={0.5,0.44,0.30000001,0.5};
			colorCountlines[]={0.57999998,0.64999998,0.44999999,0.30000001};
			colorMainCountlines[]={0.38999999,0.44999999,0.27000001,0.89999998};
			colorCountlinesWater[]={0.44999999,0.64999998,0.69999999,0.30000001};
			colorMainCountlinesWater[]={0.30000001,0.62,0.74000001,0.89999998};
			colorPowerLines[]={0.34999999,0.46000001,0.52999997,1};
			colorRailWay[]={0.80000001,0.2,0,1};
			colorForestBorder[]={0,0,0,0};
			colorRocksBorder[]={0,0,0,0};
			colorNames[]={0.1,0.1,0.1,0.89999998};
			colorInactive[]={1,1,1,0.5};
			fontLabel="Zeppelin32";
			sizeExLabel=0.034000002;
			fontGrid="Zeppelin32";
			sizeExGrid=0.029999999;
			fontUnits="Zeppelin32";
			sizeExUnits=0.034000002;
			fontNames="Zeppelin32";
			sizeExNames=0.056000002;
			fontInfo="Zeppelin32";
			sizeExInfo=0.034000002;
			fontLevel="Zeppelin32";
			sizeExLevel=0.024;
			text="\ca\ui\data\map_background2_co.paa";
			class CustomMark
			{
				icon="\ca\ui\data\map_waypoint_ca.paa";
				color[]={0,0,1,1};
				size=18;
				importance=1;
				coefMin=1;
				coefMax=1;
			};
			class Legend
			{
				x="SafeZoneX";
				y="SafeZoneY";
				w=0.34;
				h=0.152;
				font="Zeppelin32";
				sizeEx=0.039209999;
				colorBackground[]={0.90600002,0.90100002,0.88,0};
				color[]={0,0,0,1};
			};
			class Bunker
			{
				icon="\ca\ui\data\map_bunker_ca.paa";
				color[]={0.5,0.5,0.5,1};
				size=14;
				importance="1.5 * 14 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Bush
			{
				icon="\ca\ui\data\map_bush_ca.paa";
				color[]={0.55000001,0.63999999,0.43000001,1};
				size=14;
				importance="0.2 * 14 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class BusStop
			{
				icon="\ca\ui\data\map_busstop_ca.paa";
				color[]={0,0,1,1};
				size=10;
				importance="1 * 10 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Command
			{
				icon="\ca\ui\data\map_waypoint_ca.paa";
				color[]={0,0.89999998,0,1};
				size=18;
				importance=1;
				coefMin=1;
				coefMax=1;
			};
			class Cross
			{
				icon="\ca\ui\data\map_cross_ca.paa";
				size=16;
				color[]={0,0.89999998,0,1};
				importance="0.7 * 16 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Fortress
			{
				icon="\ca\ui\data\map_bunker_ca.paa";
				size=16;
				color[]={0,0.89999998,0,1};
				importance="2 * 16 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Fuelstation
			{
				icon="\ca\ui\data\map_fuelstation_ca.paa";
				size=16;
				color[]={0,0.89999998,0,1};
				importance="2 * 16 * 0.05";
				coefMin=0.75;
				coefMax=4;
			};
			class Fountain
			{
				icon="\ca\ui\data\map_fountain_ca.paa";
				color[]={0,0.34999999,0.69999999,1};
				size=12;
				importance="1 * 12 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Hospital
			{
				icon="\ca\ui\data\map_hospital_ca.paa";
				color[]={0.77999997,0,0.050000001,1};
				size=16;
				importance="2 * 16 * 0.05";
				coefMin=0.5;
				coefMax=4;
			};
			class Chapel
			{
				icon="\ca\ui\data\map_chapel_ca.paa";
				color[]={0,0.89999998,0,1};
				size=16;
				importance="1 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class Church
			{
				icon="\ca\ui\data\map_church_ca.paa";
				size=16;
				color[]={0,0.89999998,0,1};
				importance="2 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class Lighthouse
			{
				icon="\ca\ui\data\map_lighthouse_ca.paa";
				color[]={0.77999997,0,0.050000001,1};
				size=20;
				importance="3 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class Quay
			{
				icon="\ca\ui\data\map_quay_ca.paa";
				size=16;
				color[]={0,0.89999998,0,1};
				importance="2 * 16 * 0.05";
				coefMin=0.5;
				coefMax=4;
			};
			class Rock
			{
				icon="\ca\ui\data\map_rock_ca.paa";
				size=12;
				color[]={0,0.89999998,0,1};
				importance="0.5 * 12 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Ruin
			{
				icon="\ca\ui\data\map_ruin_ca.paa";
				color[]={0.77999997,0,0.050000001,1};
				size=16;
				importance="1.2 * 16 * 0.05";
				coefMin=1;
				coefMax=4;
			};
			class SmallTree
			{
				icon="\ca\ui\data\map_smalltree_ca.paa";
				color[]={0.55000001,0.63999999,0.43000001,1};
				size=12;
				importance="0.6 * 12 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Stack
			{
				icon="\ca\ui\data\map_stack_ca.paa";
				color[]={0,0.89999998,0,1};
				size=20;
				importance="2 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class Tree
			{
				icon="\ca\ui\data\map_tree_ca.paa";
				color[]={0.55000001,0.63999999,0.43000001,1};
				size=12;
				importance="0.9 * 16 * 0.05";
				coefMin=0.25;
				coefMax=4;
			};
			class Tourism
			{
				icon="\ca\ui\data\map_tourism_ca.paa";
				color[]={0.77999997,0,0.050000001,1};
				size=16;
				importance="1 * 16 * 0.05";
				coefMin=0.69999999;
				coefMax=4;
			};
			class Transmitter
			{
				icon="\ca\ui\data\map_transmitter_ca.paa";
				color[]={0.5,0.5,0.5,1};
				size=20;
				importance="2 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class ViewTower
			{
				icon="\ca\ui\data\map_viewtower_ca.paa";
				size=16;
				color[]={0.5,0.5,0.5,1};
				importance="2.5 * 16 * 0.05";
				coefMin=0.5;
				coefMax=4;
			};
			class Watertower
			{
				icon="\ca\ui\data\map_watertower_ca.paa";
				color[]={0,0.34999999,0.69999999,1};
				size=32;
				importance="1.2 * 16 * 0.05";
				coefMin=0.89999998;
				coefMax=4;
			};
			class Waypoint
			{
				icon="\ca\ui\data\map_waypoint_ca.paa";
				size=16;
				color[]={0.5,0.5,0.5,1};
				importance="2.5 * 16 * 0.05";
				coefMin=0.5;
				coefMax=4;
			};
			class WaypointCompleted
			{
				icon="\ca\ui\data\map_waypoint_completed_ca.paa";
				size=16;
				color[]={0.5,0.5,0.5,1};
				importance="2.5 * 16 * 0.05";
				coefMin=0.5;
				coefMax=4;
			};
		};
	};
	class controls
	{
		delete MiniMap;
		class CA_MinimapFrame: RscPicture
		{
			idc=101000;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.705/1.25)";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.451/1.25)";
			w="0.3137255*1.5";
			h="0.4183007*1.5";
			text="\ca\ui\data\ui_gps_ca.paa";
		};
	};
};
class RscMiniMapSmall: RscMiniMap
{
	onLoad="uinamespace setvariable ['BIS_RscMiniMapSmall',_this select 0];";
	onUnload="uinamespace setvariable ['BIS_RscMiniMapSmall',nil];";
	class controlsBackground
	{
		class CA_MiniMap: RscMapControl
		{
			IDC=101;
			ShowCountourInterval=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.757)";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.466)";
			w=0.34999999;
			h=0.338;
		};
	};
	class controls
	{
		class CA_MinimapFrame: RscPicture
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.705)";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.451)";
			w=0.3137255;
			h=0.41830069;
			text="\ca\ui\data\ui_gps_ca.paa";
		};
	};
};
class RscObjectives
{
	done="\ca\ui\data\ui_task_done_ca.paa";
	failed="\ca\ui\data\ui_task_failed_ca.paa";
	active="\ca\ui\data\ui_task_assigned_ca.paa";
	cancled="\ca\ui\data\ui_task_cancelled_ca.paa";
};
class IGUIBack
{
	type=0;
	idc=124;
	style=128;
	text="";
	colorText[]={0,0,0,0};
	font="Zeppelin32";
	sizeEx=0;
	shadow=0;
	x=0.1;
	y=0.1;
	w=0.1;
	h=0.1;
	colorbackground[]={0,0,0,0};
};
class CA_Mainback: RscPicture
{
	x=0.34999999;
	y=0.80000001;
	w=0.30000001;
	h=0.2;
	text="\ca\ui\data\ui_gradient_start_gs.paa";
	colorText[]={0.42399999,0.65100002,0.24699999,1};
};
class CA_Mainback_2: CA_Mainback
{
	x=0.34999999;
	y=0.80000001;
	w=0.30000001;
	h=0.2;
	colorText[]={0.023529001,0,0.031372499,1};
	text="\ca\ui\data\ui_gradient_middle_gs.paa";
};
class CA_Mainback_3: CA_Mainback
{
	x=0.34999999;
	y=0.80000001;
	w=0.30000001;
	h=0.2;
	colorText[]={0.023529001,0,0.031372499,1};
	text="\ca\ui\data\ui_gradient_end_gs.paa";
};
class CA_Back: CA_Mainback
{
	x=0.28999999;
	y=0.38;
	w=0.56;
	h=0.56999999;
	colorText[]={0.42399999,0.65100002,0.24699999,1};
	text="\ca\ui\data\ui_gradient_reverse_gs.paa";
};
class CA_Title_Back: CA_Mainback
{
	x=0.014706;
	y=0;
	w=0.95074302;
	h=0.058823999;
	text="#(argb,8,8,3)color(0,0,0,0)";
	colorText[]={0.94999999,0.94999999,0.94999999,1};
};
class CA_Back1: CA_Back
{
	x=0.30000001;
	y=0.43000001;
	w=0.25999999;
	h=0.22;
	colorText[]={0.1,0.1,0.1,0.40000001};
};
class CA_Back2: CA_Back
{
	x=0.565;
	y=0.43000001;
	w=0.27000001;
	h=0.5;
	colorText[]={0.2,0.2,0.2,0.2};
};
class CA_Back3: CA_Back
{
	x=0.56999999;
	y=0.43000001;
	w=0.27000001;
	h=0.5;
	colorText[]={0.2,0.2,0.2,0.2};
};
class CA_Black_Back: CA_Mainback
{
	x="SafeZoneX - SafeZoneW";
	y="SafeZoneY - SafeZoneH";
	w="SafeZoneW * 4";
	h="SafeZoneH * 4";
	text="#(argb,8,8,3)color(0,0,0,1)";
	colorText[]={0.023529001,0,0.031372499,1};
	color[]={0.023529001,0,0.031372499,1};
	colorBackground[]={0.023529001,0,0.031372499,1};
};
class CA_Title: RscText
{
	x=0.014706;
	y=0.182;
	w=0.95074302;
	h=0.058823999;
	style="0x00 + 0x100";
	font="Zeppelin32";
	sizeEx=0.050653595;
	colorText[]={0.94999999,0.94999999,0.94999999,1};
};
class RscTextWIP: RscText
{
	x="SafeZoneX";
	y="0.099 + SafeZoneY";
	w=0.15686271;
	h=0.2091503;
	shadow=2;
	SizeEx=0.034000002;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	text="";
};
class CA_IGUI_Title: CA_Title
{
	sizeEx=0.039209999;
	style=0;
};
class CA_Logo: RscPictureKeepAspect
{
	idc=1220;
	x=0.63800001;
	y=0.333;
	w=0.25;
	h=0.079999998;
	text="\ca\ui\data\logo_white_all_ca.paa";
};
class CA_Logo_Small: CA_Logo
{
	w=0.2;
	h=0.066600002;
};
class CA_GameSpy_logo: RscPictureKeepAspect
{
	x=0.55000001;
	y=0.333;
	w=0.15000001;
	h=0.050000001;
	text="\ca\ui\data\gamespy_logo.paa";
};
class ArmA2_HintBackgroundTop: CA_Mainback
{
	x=-0.5;
	y=-0.26470801;
	w=1.9608001;
	h=0.326473;
	colorText[]={0.023529001,0,0.031372499,1};
};
class ArmA2_HintBackgroundBottom: CA_Mainback
{
	x=-0.5;
	y=0.843144;
	w=1.9608001;
	h=0.326473;
	colorText[]={0.023529001,0,0.031372499,1};
};
class RscStandardDisplay
{
	movingEnable=1;
	enableSimulation=1;
	enableDisplay=1;
};
class RscLineBreak
{
};
class CA_RscButton: RscButton
{
	idc=-1;
	default=0;
	x=0.843144;
	y=0.80000001;
	w=0.14706001;
	h=0.039216001;
	borderSize=0.0098040001;
	color[]={0,0,0,0};
	colorActive[]={0,0,0,0};
};
class CA_RscButton_dialog: CA_RscButton
{
	x=0.82353598;
	y=0.85000002;
	w=0.198531;
	borderSize=0;
};
class CA_Ok: RscActiveText
{
	idc=-1;
	style=48;
	default=0;
	x=0.85000002;
	y=0.80000001;
	w=0.15000001;
	h=0.035;
	text="#(argb,8,8,3)color(0,0,0,0)";
	color[]={0,0,0,0};
	colorActive[]={0,0,0,0};
};
class CA_Ok_image: RscText
{
	idc=-1;
	x=0.86000001;
	y=0.80000001;
	w=0.14;
	h=0.039999999;
	text="#(argb,8,8,3)color(1,1,1,0.9)";
	style=48;
	colortext[]={1,1,1,0.80000001};
};
class CA_Ok_image2: RscText
{
	idc=-1;
	x=0.85000002;
	y=0.80000001;
	w=0.0099999998;
	h=0.039999999;
	text="#(argb,8,8,3)color(1,1,1,0.9)";
	style=48;
	colortext[]={0,0,0,0.80000001};
};
class CA_Ok_text: RscText
{
	sizeEx=0.02674;
	idc=-1;
	x=0.86000001;
	y=0.80000001;
	w=0.14;
	h=0.039999999;
	style=0;
	colortext[]={0,0,0,0.80000001};
};
class RscCombo
{
	x=0;
	y=0;
	w=0.12;
	h=0.035;
	shadow=0;
	colorSelect[]={0.023529001,0,0.031372499,1};
	colorText[]={0.023529001,0,0.031372499,1};
	colorBackground[]={0.94999999,0.94999999,0.94999999,1};
	colorSelectBackground[]={0.87840003,0.84710002,0.65100002,1};
	colorScrollbar[]={0.023529001,0,0.031372499,1};
	arrowEmpty="\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull="\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight=0.44999999;
	color[]={0,0,0,0.60000002};
	colorActive[]={0,0,0,1};
	colorDisabled[]={0,0,0,0.30000001};
	font="Zeppelin32";
	sizeEx=0.039209999;
	class ScrollBar
	{
		color[]={1,1,1,0.60000002};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.30000001};
		thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
		border="\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class CA_Table_back: RscPicture
{
	x=0.2;
	y=0.25;
	w=0.40000001;
	h=0.68000001;
	text="\ca\ui\textures\g_black2grey.paa";
	colortext[]={1,1,1,0.80000001};
};
class CA_UpTitle: RscTitle
{
	x=0.0099999998;
	y=0.105;
	w=0.5;
	h=0.050000001;
	style="ST_LEFT";
	colortext[]={1,1,1,1};
};
class CA_BoxLeft: RscPicture
{
	x=0;
	y=0.1;
	w=1;
	h=0.079999998;
	text="\ca\ui\textures\white_basic.paa";
};
class BB_left: RscText
{
	x=0.050000001;
	y=0.255;
	w=0.0049999999;
	h=0.5;
	colorbackground[]={0,0,0,0.5};
};
class BB_right: BB_left
{
	x=0.94400001;
};
class BB_down: BB_left
{
	y=0.755;
	w=0.89999998;
	h=0.0049999999;
};
class BB_up: BB_down
{
	y=0.24950001;
	w=0.89999998;
};
class BB_Back: RscPicture
{
	x=0.055;
	y=0.255;
	w=0.88999999;
	h=0.5;
	colortext[]={1,1,1,0.5};
	text="\ca\ui\textures\white_basic.paa";
};
class Back_UserTitle: RscPicture
{
	x=0.050000001;
	y=0.2;
	w=0.27000001;
	h=0.064999998;
	colortext[]={1,1,1,0.80000001};
	text="\ca\ui\textures\title_up.paa";
};
class Table_back_black: RscPicture
{
	x=0.2;
	y=0.25;
	w=0.40000001;
	h=0.68000001;
	text="\ca\ui\textures\g_black2grey.paa";
	colortext[]={1,1,1,0.80000001};
};
class Table_back_white: CA_Ok_image
{
	x=0.20999999;
	y=0.25999999;
	w=0.38;
	h=0.66000003;
	colortext[]={1,1,1,0.89999998};
};
class RscBackgroundStripeTop: RscText
{
	access=0;
	x="safezoneX";
	y="safezoneY";
	w="safezoneW";
	h="0.125*safezoneH";
	text="";
	colorBackground[]={0.1,0.1,0.1,1};
};
class RscBackgroundStripeBottom: RscText
{
	x="safezoneX";
	y="safezoneY + safezoneH - 0.125*safezoneH";
	w="safezoneW";
	h="0.125*safezoneH";
	text="";
	colorBackground[]={0.1,0.1,0.1,1};
};
class RscDisplayBackgroundStripes
{
	class Background1: RscBackgroundStripeTop
	{
	};
	class Background2: RscBackgroundStripeBottom
	{
	};
};
class RscCinemaBorder: RscDisplayBackgroundStripes
{
	idd=-1;
	movingEnable=0;
	enableSimulation=1;
	class controlsBackground
	{
		class Background1: RscBackgroundStripeTop
		{
			colorBackground[]={0,0,0,1};
		};
		class Background2: RscBackgroundStripeBottom
		{
			colorBackground[]={0,0,0,1};
		};
	};
};
class RscToolbox
{
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	color[]={0.94999999,0.94999999,0.94999999,1};
	colorTextSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorSelect[]={0.94999999,0.94999999,0.94999999,1};
	colorTextDisable[]={0.40000001,0.40000001,0.40000001,1};
	colorDisable[]={0.40000001,0.40000001,0.40000001,1};
	colorSelectedBg[]={0,0,0,1};
	font="Zeppelin32";
	sizeEx=0.02674;
};
class RscIGUIText: RscText
{
	sizeEx=0.034000002;
	colorText[]={0.40000001,0.67449999,0.2784,1};
	style=0;
};
class RscOpticsText: RscText
{
	sizeEx=0.048;
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	style=0;
	h=0.048;
};
class RscOpticsValue: RscOpticsText
{
	fixedWidth=1;
};
class RscIGUIValue: RscIGUIText
{
	sizeEx=0.034000002;
	colorText[]={0.40000001,0.67449999,0.2784,1};
	font="Zeppelin32Mono";
	style=0;
	fixedWidth=1;
};
class RscIGProgress: RscProgress
{
	style=1;
	w=0.0089999996;
	h=0.178;
	colorFrame[]={0.70599997,0.097999997,0.92940003,0};
	colorBar[]={0.40000001,0.67449999,0.2784,1};
	texture="#(argb,8,8,3)color(1,1,1,1)";
};
class CfgLoadingTexts
{
	priority=1;
	titlesDefault[]=
	{
		""
	};
};
class RscSplashText: RscText
{
	sizeEx=0.034000002;
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	colorbackground[]={1,1,1,0};
	style="0x02 + 0x10	+ 0x200 + 0x100";
	lineSpacing=1;
};
class RscDisplayLoading
{
	class Variants
	{
		class LoadingOne
		{
			idd=-1;
			movingEnable=0;
			onload="_this call compile preprocessfilelinenumbers 'ca\ui\scripts\ui_loadingText.sqf';";
			class controls
			{
				delete TextLoad;
				delete Progress;
				delete Progress2;
				class CA_Black_Back3: CA_Black_Back
				{
				};
				class LoadingPic: RscPictureKeepAspect
				{
					idc=105;
					x="SafezoneX";
					y="SafezoneY+SafezoneH*0.075";
					w="SafezoneW";
					h="SafezoneH*0.85";
					text="\ca\ui\data\loadscreen_generic_co.paa";
					colortext[]={1,1,1,1};
				};
				class Name: RscText
				{
					style=0;
					colorText[]={0.87840003,0.84710002,0.65100002,1};
				};
				class Info: RscHTML
				{
					idc=106;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
				class Date;
				class CA_ProgressBackground: RscText
				{
					style=48;
					text="\ca\ui\data\loadscreen_progressbar_ca.paa";
					colorText[]={1,1,1,0.1};
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.5/2/4)*3*SafezoneH";
					y="SafezoneY+SafezoneH*0.95";
					w="0.5* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
					h=0.0261438;
				};
				class HintBackground: RscText
				{
					idc=8401;
					x="SafezoneX + (safezoneW - 	1.3) / 2";
					y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1";
					w=1.3;
					h="(	1.3 / 8) * 4/3";
					text="\ca\ui\data\ui_loading_text_ca.paa";
					style=48;
					shadow=0;
				};
				class Hint: RscText
				{
					idc=8400;
					x="SafezoneX + (safezoneW - 			1.3 * 0.7 * (0.98)) / 2";
					y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1 + (	(	1.3 / 8) * 4/3 - 						 0.03921 * 3)/2";
					w="1.3 * 0.7 * (0.98)";
					h="0.03921 * 3";
					text="";
					style="0x02 + 0x10 + 0x200";
					lineSpacing=1;
				};
				class CA_Progress: RscProgress
				{
					idc=104;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.5/2/4)*3*SafezoneH";
					y="SafezoneY+SafezoneH*0.95";
					w="0.5* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
					texture="\ca\ui\data\loadscreen_progressbar_ca.paa";
				};
			};
		};
	};
};
class RscDisplayNotFreezeBig: RscStandardDisplay
{
	class controlsBackground
	{
		class CA_Background: IGUIBack
		{
			x=0.2;
			y=0.17200001;
			w=0.60000002;
			h=0.078432001;
		};
	};
	class controls
	{
		delete Text;
		delete Progress;
		delete Progress2;
		class CA_Text: CA_Title
		{
			idc=101;
			text="$STR_DISP_ERROR";
			style="0x02 + 0x100";
			x=0;
			w=1;
		};
		class CA_Progress: RscProgress
		{
			idc=104;
		};
		class CA_Progress2: RscProgressNotFreeze
		{
			idc=103;
		};
	};
};
class RscDisplayNotFreeze: RscStandardDisplay
{
	class controlsBackground
	{
	};
	class controls
	{
		delete Text;
		delete Progress;
		delete Progress2;
		class CA_Text: RscLoadingText
		{
			idc=101;
			colorText[]={0.87840003,0.84710002,0.65100002,1};
		};
	};
};
class RscDisplayLoadMission: RscStandardDisplay
{
	onload="_this call compile preprocessfilelinenumbers 'ca\ui\scripts\ui_loadingText.sqf';";
	class controlsBackground
	{
		class CA_Black_Back3: CA_Black_Back
		{
		};
		class LoadingPic: RscPictureKeepAspect
		{
			x="SafeZoneX";
			y="SafezoneY+SafezoneH*0.075";
			w="SafezoneW";
			h="SafezoneH*0.85";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,1};
			idc=105;
		};
		class Info: RscHTML
		{
			idc=106;
			cycleLinks=0;
			cycleAllLinks=0;
			default=0;
			x="0.01*SafeZoneW";
			y=0;
			w="0.514*SafeZoneW";
			h=1.807;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			class H1
			{
				font="Zeppelin32";
				fontBold="Zeppelin32";
				sizeEx=0.034000002;
			};
			class P
			{
				font="Zeppelin32";
				fontBold="Zeppelin32";
				sizeEx=0.034000002;
			};
		};
	};
	class controls
	{
		delete Progress2;
		delete Name;
		delete Date;
		delete Title;
		delete Progress;
		delete Briefing;
		class Name2: RscText
		{
			idc=101;
			x="SafezoneX+0.025";
			y="SafezoneY";
			w="SafezoneW*0.95";
			h="SafezoneH*0.075";
			sizeEx=0.050000001;
			colorText[]={0.87840003,0.84710002,0.65100002,1};
		};
		class CA_ProgressBackground: RscText
		{
			style=48;
			text="\ca\ui\data\loadscreen_progressbar_ca.paa";
			colorText[]={1,1,1,0.1};
			x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.5/2/4)*3*SafezoneH";
			y="SafezoneY+SafezoneH*0.95";
			w="0.5* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
			h=0.0261438;
		};
		class HintBackground: RscText
		{
			idc=8401;
			x="SafezoneX + (safezoneW - 	1.3) / 2";
			y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1";
			w=1.3;
			h="(	1.3 / 8) * 4/3";
			text="\ca\ui\data\ui_loading_text_ca.paa";
			style=48;
			shadow=0;
		};
		class Hint: RscText
		{
			idc=8400;
			x="SafezoneX + (safezoneW - 			1.3 * 0.7 * (0.98)) / 2";
			y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1 + (	(	1.3 / 8) * 4/3 - 						 0.03921 * 3)/2";
			w="1.3 * 0.7 * (0.98)";
			h="0.03921 * 3";
			text="";
			style="0x02 + 0x10 + 0x200";
			lineSpacing=1;
		};
		class CA_Progress: RscProgress
		{
			idc=104;
			x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.5/2/4)*3*SafezoneH";
			y="SafezoneY+SafezoneH*0.95";
			w="0.5* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
			texture="\ca\ui\data\loadscreen_progressbar_ca.paa";
		};
		class CA_Progress2: RscProgressNotFreeze
		{
			idc=103;
		};
		class Date2: RscText
		{
			idc=102;
			text=" ";
			style=1;
			x="SafezoneX+0.025";
			y="SafezoneY+SafezoneH*0.925";
			w="SafezoneW*0.95";
			h="SafezoneH*0.075";
			colorText[]={0.87840003,0.84710002,0.65100002,1};
		};
	};
};
class RscDisplayStart: RscStandardDisplay
{
	onload="_this call compile preprocessfilelinenumbers 'ca\ui\scripts\ui_loadingText.sqf';";
	idd=-1;
	class controlsBackground
	{
		class CA_Black_Back3: CA_Black_Back
		{
		};
	};
	class controls
	{
		delete Text;
		delete Progress;
		delete Progress2;
		class LoadingPic: RscPictureKeepAspect
		{
			idc=105;
			x="SafezoneX";
			y="SafezoneY+SafezoneH*0.075";
			w="SafezoneW";
			h="SafezoneH*0.85";
			text="\ca\ui\data\loadscreen_generic_co.paa";
			colortext[]={1,1,1,1};
		};
		class CA_Text: RscLoadingText
		{
			idc=101;
			x="SafezoneX+0.025";
			y="SafezoneY+SafezoneH*0.925";
			w="SafezoneW*0.95";
			h="SafezoneH*0.075";
			sizeEx=0.050000001;
			colorText[]={0.87840003,0.84710002,0.65100002,1};
		};
		class CA_Progress: RscProgress
		{
			idc=104;
			x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.5/2/4)*3*SafezoneH";
			y="SafezoneY+SafezoneH*0.95";
			w="0.5* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
			h="SafezoneH*0.025";
			texture="\ca\ui\data\loadscreen_progressbar_ca.paa";
		};
		class HintBackground: RscText
		{
			idc=8401;
			x="SafezoneX + (safezoneW - 	1.3) / 2";
			y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1";
			w=1.3;
			h="(	1.3 / 8) * 4/3";
			text="\ca\ui\data\ui_loading_text_ca.paa";
			style=48;
			shadow=0;
		};
		class Hint: RscText
		{
			idc=8400;
			x="SafezoneX + (safezoneW - 			1.3 * 0.7 * (0.98)) / 2";
			y="SafezoneY + (safezoneH - 		((SafezoneW / 2) * (4/3))) / 2 + 		((SafezoneW / 2) * (4/3)) - 	(	1.3 / 8) * 4/3 * 1.1 + (	(	1.3 / 8) * 4/3 - 						 0.03921 * 3)/2";
			w="1.3 * 0.7 * (0.98)";
			h="0.03921 * 3";
			text="";
			style="0x02 + 0x10 + 0x200";
			lineSpacing=1;
		};
		class CA_Progress2: RscProgressNotFreeze
		{
			idc=103;
		};
	};
};
class RscDisplayLoadCustom: RscDisplayLoadMission
{
	enableSimulation=0;
	onload="_this call compile preprocessfilelinenumbers 'ca\ui\scripts\ui_loadingTextCustom.sqf';";
};
class RscDisplayHintC
{
	idd=57;
	class controls
	{
		delete Hint;
		class Background: RscText
		{
			x=0.34999999;
			y=0.40000001;
			w=0.5;
			h=0.11;
			colorBackground[]={0,0,0,0};
			colorText[]={0,0,0,0};
			font="EtelkaNarrowMediumPro";
			sizeEx=0.1;
		};
		class CA_Hint: RscIGUIText
		{
			idc=102;
			style=16;
			lineSpacing=1;
			sizeEx=0.034000002;
			x=0.36000001;
			y=0.41;
			w=0.47999999;
			h=0.035;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
		};
		class continue: RscActiveText
		{
			sizeEx=0.034000002;
			x=0.55000001;
			y=0.46000001;
			w=0.30000001;
			h=0.035;
			color[]={0.80000001,0.80000001,0.80000001,1};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorActive[]={0.94999999,0.94999999,0.94999999,1};
		};
	};
};
class RscDisplayHintCEx
{
	idd=72;
	indent="\ca\ui\data\ui_indent_gr.paa";
	class controls
	{
		class Background: RscText
		{
			x=0.15000001;
			y=0.40000001;
			w=0.69999999;
			h=0.155;
			text="";
			colorBackground[]={0,0,0,0};
			colorText[]={0,0,0,0};
			font="EtelkaNarrowMediumPro";
			sizeEx=0.1;
		};
		class Title: RscText
		{
			style=0;
			x=0.17;
			y=0.41999999;
			w=0.66000003;
			h=0.059999999;
			text="STR_DISP_ERROR";
			colorText[]={0.40000001,0.67449999,0.2784,1};
		};
		class Line1: RscText
		{
			style=176;
			x=0.17;
			y=0.47999999;
			w=0.66000003;
			h=0;
			text="";
		};
		class Hint: RscStructuredText
		{
			access=0;
			type=13;
			style=0;
			x=0.17;
			y=0.47999999;
			w=0.66000003;
			h=1;
			class Attributes
			{
				font="EtelkaNarrowMediumPro";
				color="#FFFFFF";
				shadow=0;
			};
		};
		class Line2: RscText
		{
			style=176;
			x=0.17;
			y=0.47999999;
			w=0.66000003;
			h=0;
			text="";
			colorText[]={0.40000001,0.67449999,0.2784,1};
			color[]={0.94999999,0.94999999,0.94999999,1};
		};
		class continue: RscActiveText
		{
			x=0.17;
			y=0.49000001;
			w=0.66000003;
			h=0.035;
			SizeEx=0.0234375;
			color[]={0.40000001,0.67449999,0.2784,1};
			colorActive[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DISP_HINTC_CONTINUE";
		};
	};
};
class RscDisplayEmpty
{
	movingEnable=0;
	class controls
	{
		class WIP: RscTextWIP
		{
		};
	};
};
class RscDisplayMission: RscDisplayEmpty
{
};
class RscInGameUI
{
	colorReady[]={0.40000001,0.67449999,0.2784,1};
	colorPrepare[]={0.86299998,0.58399999,0,1};
	colorUnload[]={0.70599997,0.074500002,0.0196,1};
	class RscWeaponEmpty
	{
		idd=300;
		controls[]={};
	};
	class RscWeaponRangeFinder
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.028*SafezoneH";
			colorText[]={0.40000001,0.67449999,0.2784,1};
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.665)";
			w=0.2;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponRangeFinderPAS13
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.038*SafezoneH";
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.8)";
			w=0.207;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponRangeFinderVector
	{
		idd=300;
		controls[]=
		{
			"CA_IGUI_elements_group"
		};
		class CA_IGUI_elements_group: RscControlsGroup
		{
			x="SafezoneX";
			y="SafezoneY";
			w="SafezoneW";
			h="SafezoneH";
			idc=170;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Distance: RscOpticsValue
				{
					idc=151;
					style=1;
					shadow=0;
					colorText[]={0.87059999,0.22750001,0.2,1};
					sizeEx="0.040*SafezoneH";
					x="(SafezoneX+(SafezoneW -SafezoneH)/2)+ 0.84*SafezoneH	 - SafezoneX";
					y="SafezoneY+SafezoneH*0.479 - SafezoneY";
					w="0.086* ((SafezoneW)/SafezoneW)/(1/SafezoneH)";
					h="0.040*SafezoneH";
				};
			};
		};
	};
	class RscWeaponRangeFinderSOFLAM
	{
		idd=300;
		controls[]=
		{
			"CA_IGUI_elements_group"
		};
		class CA_IGUI_elements_group: RscControlsGroup
		{
			x="SafezoneX";
			y="SafezoneY";
			w="SafezoneW";
			h="SafezoneH";
			idc=170;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_DistanceBackground: RscEdit
				{
					idc=-1;
					sizeEx=0.034000002;
					colorBackground[]={0,0,0,0};
					colorText[]={0.40000001,0.67449999,0.2784,1};
					colorSelection[]={0,0,0,0};
					style="0x01 + 0x40";
					shadow=0;
					type=0;
					x="(SafezoneX+(SafezoneW -SafezoneH)/2)+ (0.453)*SafezoneH - SafezoneX";
					y="SafezoneY+SafezoneH*0.816 - SafezoneY";
					w="0.094* ((SafezoneW)/SafezoneW)/(1/SafezoneH)";
					h="0.037*SafezoneH";
				};
				class CA_Distance: RscOpticsValue
				{
					idc=151;
					style=1;
					shadow=0;
					colorText[]={0.40000001,0.67449999,0.2784,1};
					sizeEx="0.038*SafezoneH";
					x="(SafezoneX+(SafezoneW -SafezoneH)/2)+ 0.444*SafezoneH	 - SafezoneX";
					y="SafezoneY+SafezoneH*0.813 - SafezoneY";
					w="0.115* ((SafezoneW)/SafezoneW)/(1/SafezoneH)";
					h="0.045*SafezoneH";
				};
			};
		};
	};
	class RscWeaponRangeFinderMAAWS
	{
		idd=300;
		controls[]=
		{
			"CA_IGUI_elements_group"
		};
		class CA_IGUI_elements_group: RscControlsGroup
		{
			x="SafezoneX";
			y="SafezoneY";
			w="SafezoneW";
			h="SafezoneH";
			idc=170;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Distance: RscOpticsValue
				{
					idc=151;
					style=2;
					shadow=0;
					colorText[]={0.81959999,0.14120001,0.14120001,1};
					sizeEx="0.038*SafezoneH";
					x="0.4-SafeZoneX";
					y="SafezoneH*0.8";
					w=0.207;
					h="0.05*SafezoneH";
				};
			};
		};
	};
	class RscWeaponRangeFinderAbramsCom
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.038*SafezoneH";
			colorText[]={0.87059999,0.22750001,0.2,1};
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.8)";
			w=0.207;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponRangeFinderAbramsGun
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.038*SafezoneH";
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.8)";
			w=0.207;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponRangeFinderStrykerMGSGun
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.038*SafezoneH";
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.8)";
			w=0.207;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponRangeFinderCROWSGun
	{
		idd=300;
		controls[]=
		{
			"CA_Distance"
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			sizeEx="0.038*SafezoneH";
			x=0.40000001;
			y="(SafezoneY+SafezoneH*0.8)";
			w=0.207;
			h="0.05*SafezoneH";
		};
	};
	class RscWeaponZeroing
	{
		idd=300;
		controls[]=
		{
			"CA_ZeroingText",
			"CA_Zeroing"
		};
		class CA_ZeroingText: RscIGUIText
		{
			idc=169;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			text="$STR_DISP_ZEROING";
		};
		class CA_Zeroing: RscIGUIValue
		{
			idc=168;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
	};
	class RscWeaponRangeZeroing
	{
		idd=300;
		controls[]=
		{
			"CA_ZeroingText",
			"CA_Zeroing",
			"CA_DistanceText",
			"CA_Distance"
		};
		class CA_DistanceText: RscOpticsText
		{
			idc=-1;
			style=2;
			x=0;
			y="(SafezoneY+SafezoneH) - 0.05";
			w=1;
			h=0.050000001;
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			style=2;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			x=0;
			y="(SafezoneY+SafezoneH) - 0.195";
			w=1;
			h=0.050000001;
		};
		class CA_ZeroingText: RscIGUIText
		{
			idc=169;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			text="$STR_DISP_ZEROING";
		};
		class CA_Zeroing: RscIGUIValue
		{
			idc=168;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
	};
	class RscWeaponInfoJavelin
	{
		idd=300;
		controls[]=
		{
			"CA_javelin_elements_group"
		};
		class CA_javelin_elements_group: RscControlsGroup
		{
			x="SafezoneX";
			y="SafezoneY";
			w="SafezoneW";
			h="SafezoneH";
			idc=170;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Javelin_Day_mode_off: RscPicture
				{
					idc=1001;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.03/4)*3*SafezoneH	- SafezoneX";
					y="SafezoneY+SafezoneH*0.031 - SafezoneY";
					w="0.1045752* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
					h="SafezoneH*0.1045752";
					colorText[]={0.29409999,0.29409999,0.29409999,1};
					text="\ca\ui\data\igui_javelin_day_co.paa";
				};
				class CA_Javelin_Day_mode: CA_Javelin_Day_mode_off
				{
					idc=160;
					colorText[]={0.29409999,0.87449998,0.2157,1};
				};
				class CA_Javelin_WFOV_mode_off: CA_Javelin_Day_mode_off
				{
					idc=1004;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
					text="\ca\ui\data\igui_javelin_wfov_co.paa";
				};
				class CA_Javelin_WFOV_mode_group: RscControlsGroup
				{
					x="SafezoneX";
					y="SafezoneY";
					w="SafezoneW";
					h="SafezoneH";
					idc=163;
					class VScrollbar
					{
						autoScrollSpeed=-1;
						autoScrollDelay=5;
						autoScrollRewind=0;
						color[]={1,1,1,0};
						width=0.001;
					};
					class HScrollbar
					{
						color[]={1,1,1,0};
						height=0.001;
					};
					class Controls
					{
						class CA_Javelin_WFOV_mode: CA_Javelin_WFOV_mode_off
						{
							idc=-1;
							y="0.031*SafeZoneH - SafezoneY";
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class StadiaL: RscLine
						{
							x="0.4899*SafezoneW - SafezoneX";
							y="0.171*SafezoneH - SafezoneY";
							w=0;
							h="0.049*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class StadiaR: RscLine
						{
							x="0.5109*SafezoneW- SafezoneX";
							y="0.171*SafezoneH - SafezoneY";
							w=0;
							h="0.049*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class BracketL: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.293/4)*3*SafezoneH - SafezoneX";
							y="0.4677*SafezoneH - SafezoneY";
							w=0;
							h="0.0646*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class BracketR: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.70/4)*3*SafezoneH - SafezoneX";
							y="0.4677*SafezoneH - SafezoneY";
							w=0;
							h="0.0646*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class BracketT: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.467/4)*3*SafezoneH - SafezoneX";
							y="0.3535*SafezoneH - SafezoneY";
							w="0.065* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
							h=0;
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class BracketB: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.467/4)*3*SafezoneH - SafezoneX";
							y="0.6465*SafezoneH - SafezoneY";
							w="0.065* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
							h=0;
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
					};
				};
				class CA_Javelin_NFOV_mode_off: CA_Javelin_Day_mode_off
				{
					idc=1003;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
					text="\ca\ui\data\igui_javelin_nfov_co.paa";
				};
				class CA_Javelin_NFOV_mode_group: RscControlsGroup
				{
					x="SafezoneX";
					y="SafezoneY";
					w="SafezoneW-SafezoneX";
					h="SafezoneH-SafezoneY";
					idc=162;
					class VScrollbar
					{
						autoScrollSpeed=-1;
						autoScrollDelay=5;
						autoScrollRewind=0;
						color[]={1,1,1,0};
						width=0.001;
					};
					class HScrollbar
					{
						color[]={1,1,1,0};
						height=0.001;
					};
					class Controls
					{
						class CA_Javelin_NFOV_mode: CA_Javelin_NFOV_mode_off
						{
							idc=-1;
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
							y="0.031*SafeZoneH - SafezoneY";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class StadiaL: RscLine
						{
							x="0.4788*SafezoneW - SafezoneX";
							y="0.171*SafezoneH - SafezoneY";
							w=0;
							h="0.049*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class StadiaR: RscLine
						{
							x="0.5212*SafezoneW - SafezoneX";
							y="0.171*SafezoneH - SafezoneY";
							w=0;
							h="0.049*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class LineHL: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.01/4)*3*SafezoneH - SafezoneX";
							y="SafezoneH*0.5 - SafezoneY";
							w="0.29* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
							h="SafezoneH*0.0";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class LineHR: RscLine
						{
							x="((SafezoneW -SafezoneH*3/4)/2)+ (0.695/4)*3*SafezoneH - SafezoneX";
							y="SafezoneH*0.5 - SafezoneY";
							w="0.29* (((SafezoneW*3)/4)/SafezoneW)/(1/SafezoneH)";
							h="SafezoneH*0.0";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class LineVT: RscLine
						{
							x="0.5*SafezoneW - SafezoneX";
							y="0.171*SafezoneH - SafezoneY";
							w=0;
							h="0.1825*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
						class LineVB: RscLine
						{
							x="0.5*SafezoneW - SafezoneX";
							y="0.6465*SafezoneH - SafezoneY";
							w=0;
							h="0.1895*SafezoneH";
							colorText[]={0.29409999,0.87449998,0.2157,1};
						};
					};
				};
				class CA_Javelin_SEEK_off: CA_Javelin_Day_mode_off
				{
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (0.863/4)*3*SafezoneH - SafezoneX";
					text="\ca\ui\data\igui_javelin_seek_co.paa";
				};
				class CA_Javelin_SEEK: CA_Javelin_SEEK_off
				{
					idc=166;
					colorText[]={0.29409999,0.87449998,0.2157,1};
				};
				class CA_Javelin_Missle_off: CA_Javelin_Day_mode_off
				{
					idc=1032;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (-0.134/4)*3*SafezoneH - SafezoneX";
					y="(SafezoneY + 0.208*SafezoneH) - SafezoneY";
					colorText[]={0.29409999,0.29409999,0.29409999,1};
					text="\ca\ui\data\igui_javelin_missle_co.paa";
				};
				class CA_Javelin_Missle: CA_Javelin_Missle_off
				{
					idc=167;
					colorText[]={0.92549998,0.52160001,0.1216,1};
				};
				class CA_Javelin_CLU_off: CA_Javelin_Missle_off
				{
					idc=1027;
					y="(SafezoneY + 0.436*SafezoneH) - SafezoneY";
					text="\ca\ui\data\igui_javelin_clu_co.paa";
				};
				class CA_Javelin_HangFire_off: CA_Javelin_Missle_off
				{
					idc=1028;
					y="(SafezoneY + 0.669*SafezoneH) - SafezoneY";
					text="\ca\ui\data\igui_javelin_hangfire_co.paa";
				};
				class CA_Javelin_TOP_off: CA_Javelin_Day_mode_off
				{
					idc=1006;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
					y="(SafezoneY + 0.208*SafezoneH) - SafezoneY";
					text="\ca\ui\data\igui_javelin_top_co.paa";
				};
				class CA_Javelin_DIR: CA_Javelin_Day_mode
				{
					idc=1007;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
					y="(SafezoneY + 0.436*SafezoneH)	- SafezoneY";
					text="\ca\ui\data\igui_javelin_dir_co.paa";
				};
				class CA_Javelin_FLTR_mode_off: CA_Javelin_Day_mode_off
				{
					idc=1002;
					x="(SafezoneX+(SafezoneW -SafezoneH*3/4)/2)+ (1.023/4)*3*SafezoneH - SafezoneX";
					y="(SafezoneY + 0.669*SafezoneH)	- SafezoneY";
					text="\ca\ui\data\igui_javelin_fltr_co.paa";
				};
				class CA_Javelin_FLTR_mode: CA_Javelin_FLTR_mode_off
				{
					idc=161;
					colorText[]={0.29409999,0.87449998,0.2157,1};
				};
			};
		};
	};
	class RscUnitInfo_AH64D_gunner
	{
		idd=300;
		controls[]=
		{
			"CA_Distance",
			"CA_VisionMode",
			"CA_FlirMode",
			"CA_FOVMode",
			"CA_Compass",
			"CA_Heading",
			"CA_Autohover",
			"CA_BalisticComputer",
			"CA_BallRange",
			"CA_LaserMarker",
			"CA_WeaponZeroingText",
			"CA_WeaponZeroing"
		};
		class CA_WeaponZeroingText: RscIGUIText
		{
			idc=169;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
			text="$STR_DISP_ZEROING";
		};
		class CA_WeaponZeroing: RscIGUIText
		{
			idc=168;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.095 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_Distance: RscOpticsValue
		{
			idc=151;
			x=0.43799999;
			y=0.90799999;
			w=0.123;
			style=2;
		};
		class CA_LaserMarker: RscOpticsText
		{
			idc=158;
			x=0.27000001;
			y=0.90799999;
			w=0.154;
			text="LASE TRGT";
		};
		class CA_BallRange: RscOpticsValue
		{
			idc=164;
			x=0.62599999;
			y=0.90799999;
			w=0.30000001;
		};
		class CA_BalisticComputer: RscOpticsText
		{
			idc=165;
			x=0.59399998;
			y=0.90799999;
			text="*";
			sizeEx=0.059999999;
		};
		class CA_FOVMode: RscOpticsText
		{
			idc=154;
			x=0.052000001;
			y=0.248;
		};
		class CA_VisionMode: RscOpticsText
		{
			idc=152;
			x=0.052000001;
			y=0.296;
		};
		class CA_Autohover: RscOpticsText
		{
			idc=157;
			x=0.66399997;
			y=0.248;
			style=1;
			text="HOV";
		};
		class CA_FlirMode: RscOpticsText
		{
			idc=153;
			x=0.66399997;
			y=0.296;
			style=1;
		};
		class CA_Compass: RscOpticsText
		{
			idc=155;
			x=0;
			y=0.69999999;
			w=0.30000001;
			h=0.050000001;
		};
		class CA_Heading: RscOpticsText
		{
			idc=156;
			x=0;
			y=0.75;
			w=0.30000001;
			h=0.050000001;
		};
	};
	class RscUnitInfoNoHUD
	{
		idd=300;
		movingEnable=0;
	};
	class RscUnitInfoSoldier
	{
		idd=300;
		controls[]=
		{
			"CA_Ammo",
			"CA_Weapon",
			"CA_Mode"
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
	};
	class RscUnitInfoTank
	{
		idd=300;
		updateWidthByWeapon=0;
		updateHeightByCrew=0;
		updateWidthByCrew=0;
		controls[]=
		{
			"CA_Weapon",
			"CA_Mode",
			"CA_Ammo",
			"CA_ValueFuelBackground",
			"CA_ValueFuel",
			"CA_GunnerWeapon",
			"CA_SpeedBackground",
			"CA_TextSpeed",
			"CA_Speed",
			"CA_HeadingBackground",
			"CA_Heading",
			"CA_ValueArmor",
			"CA_TextFlares",
			"CA_TextFlaresMode"
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_GunnerWeapon: RscIGUIText
		{
			idc=150;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.132 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_SpeedBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			shadow=2;
			type=0;
			x=0.31400001;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextSpeed: RscIGUIText
		{
			style=0;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="SPD";
		};
		class CA_Speed: RscIGUIValue
		{
			idc=121;
			style=1;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_HeadingBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			type=0;
			x=0.46900001;
			y="0.017 + SafeZoneY";
			w=0.061000001;
			h=0.033;
		};
		class CA_Heading: RscIGUIValue
		{
			idc=148;
			style=2;
			x=0.44999999;
			y="0.015 + SafeZoneY";
			w=0.1;
		};
		class CA_ValueFuelBackground: RscPicture
		{
			idc=-1;
			shadow=2;
			x="0.018 + SafeZoneX";
			y="0.01 + SafeZoneY";
			w=0.019607799;
			h=0.2091503;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			text="\ca\ui\data\ui_fuel_background.paa";
		};
		class CA_ValueFuel: RscIGProgress
		{
			idc=113;
			x="0.02 + SafeZoneX";
			y="0.036 + SafeZoneY";
			w=0.0099999998;
			h=0.18000001;
			texture="\ca\ui\data\igui_fuel_progress.paa";
		};
		class CA_ValueArmor: RscListBox
		{
			idc=111;
			sizeEx=0.035250001;
			x="0.040 + SafeZoneX";
			y="0.016 + SafeZoneY";
			w=0.035700001;
			h=0.75999999;
		};
		class CA_TextFlaresMode: RscIGUIText
		{
			idc=152;
			style=0;
			sizeEx=0.02674;
			x="0.078 + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_TextFlares: RscIGUIValue
		{
			idc=151;
			style=1;
			sizeEx=0.02674;
			x="0.078  + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
	};
	class RscUnitVehicle
	{
		idd=300;
		updateWidthByWeapon=0;
		updateHeightByCrew=0;
		updateWidthByCrew=0;
		controls[]=
		{
			"CA_Weapon",
			"CA_Mode",
			"CA_Ammo",
			"CA_ValueFuelBackground",
			"CA_ValueFuel",
			"CA_GunnerWeapon",
			"CA_TextSpeed",
			"CA_Speed",
			"CA_ValueArmor",
			"CA_TextFlares",
			"CA_TextFlaresMode"
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_GunnerWeapon: RscIGUIText
		{
			idc=150;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.132 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_SpeedBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			shadow=2;
			type=0;
			x=0.31400001;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextSpeed: RscIGUIText
		{
			style=0;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="SPD";
		};
		class CA_Speed: RscIGUIValue
		{
			idc=121;
			style=1;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_ValueFuelBackground: RscPicture
		{
			idc=-1;
			shadow=2;
			x="0.018 + SafeZoneX";
			y="0.01 + SafeZoneY";
			w=0.019607799;
			h=0.2091503;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			text="\ca\ui\data\ui_fuel_background.paa";
		};
		class CA_ValueFuel: RscIGProgress
		{
			idc=113;
			x="0.02 + SafeZoneX";
			y="0.036 + SafeZoneY";
			w=0.0099999998;
			h=0.18000001;
			texture="\ca\ui\data\igui_fuel_progress.paa";
		};
		class CA_TextFlaresMode: RscIGUIText
		{
			idc=152;
			style=0;
			sizeEx=0.02674;
			x="0.078 + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_TextFlares: RscIGUIValue
		{
			idc=151;
			style=1;
			sizeEx=0.02674;
			x="0.078  + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_ValueArmor: RscListBox
		{
			idc=111;
			sizeEx=0.035250001;
			x="0.040 + SafeZoneX";
			y="0.016 + SafeZoneY";
			w=0.035700001;
			h=0.75999999;
		};
	};
	class RscUnitInfo
	{
		idd=300;
		updateWidthByWeapon=0;
		updateHeightByCrew=0;
		updateWidthByCrew=0;
		controls[]=
		{
			"CA_Weapon",
			"CA_Mode",
			"CA_Ammo",
			"CA_ValueFuelBackground",
			"CA_ValueFuel",
			"CA_GunnerWeapon",
			"CA_SpeedBackground",
			"CA_TextSpeed",
			"CA_Speed",
			"CA_ValueArmor",
			"CA_TextFlares",
			"CA_TextFlaresMode"
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_GunnerWeapon: RscIGUIText
		{
			idc=150;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.132 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_SpeedBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			shadow=2;
			type=0;
			x=0.31400001;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextSpeed: RscIGUIText
		{
			style=0;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="SPD";
		};
		class CA_Speed: RscIGUIValue
		{
			idc=121;
			style=1;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_ValueFuelBackground: RscPicture
		{
			idc=-1;
			shadow=2;
			x="0.018 + SafeZoneX";
			y="0.01 + SafeZoneY";
			w=0.019607799;
			h=0.2091503;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			text="\ca\ui\data\ui_fuel_background.paa";
		};
		class CA_ValueFuel: RscIGProgress
		{
			idc=113;
			x="0.02 + SafeZoneX";
			y="0.036 + SafeZoneY";
			w=0.0099999998;
			h=0.18000001;
			texture="\ca\ui\data\igui_fuel_progress.paa";
		};
		class CA_ValueArmor: RscListBox
		{
			idc=111;
			sizeEx=0.035250001;
			x="0.040 + SafeZoneX";
			y="0.016 + SafeZoneY";
			w=0.035700001;
			h=0.75999999;
		};
		class CA_TextFlaresMode: RscIGUIText
		{
			idc=152;
			style=0;
			sizeEx=0.02674;
			x="0.078 + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_TextFlares: RscIGUIValue
		{
			idc=151;
			style=1;
			sizeEx=0.02674;
			x="0.078  + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
	};
	class RscUnitInfoAir: RscUnitInfo
	{
		idd=300;
		updateWidthByWeapon=0;
		updateHeightByCrew=0;
		updateWidthByCrew=0;
		controls[]=
		{
			"CA_Weapon",
			"CA_Mode",
			"CA_Ammo",
			"CA_ValueFuelBackground",
			"CA_ValueFuel",
			"CA_GunnerWeapon",
			"CA_SpeedBackground",
			"CA_TextSpeed",
			"CA_Speed",
			"CA_AltBackground",
			"CA_TextAlt",
			"CA_Alt",
			"CA_HeadingBackground",
			"CA_Heading",
			"CA_ValueArmor",
			"CA_TextFlares",
			"CA_TextFlaresMode"
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_GunnerWeapon: RscIGUIText
		{
			idc=150;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.132 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_SpeedBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			shadow=2;
			type=0;
			x=0.31400001;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextSpeed: RscIGUIText
		{
			style=0;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="SPD";
		};
		class CA_Speed: RscIGUIValue
		{
			idc=121;
			style=1;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_AltBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			type=0;
			x=0.625;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextAlt: RscIGUIText
		{
			style=1;
			x=0.625;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="ALT";
		};
		class CA_Alt: RscIGUIValue
		{
			idc=122;
			style=0;
			x=0.625;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_HeadingBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			type=0;
			x=0.46900001;
			y="0.017 + SafeZoneY";
			w=0.061000001;
			h=0.033;
		};
		class CA_Heading: RscIGUIValue
		{
			idc=148;
			style=2;
			x=0.44999999;
			y="0.015 + SafeZoneY";
			w=0.1;
		};
		class CA_ValueFuelBackground: RscPicture
		{
			idc=-1;
			shadow=2;
			x="0.018 + SafeZoneX";
			y="0.01 + SafeZoneY";
			w=0.019607799;
			h=0.2091503;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			text="\ca\ui\data\ui_fuel_background.paa";
		};
		class CA_ValueFuel: RscIGProgress
		{
			idc=113;
			x="0.02 + SafeZoneX";
			y="0.036 + SafeZoneY";
			w=0.0099999998;
			h=0.18000001;
			texture="\ca\ui\data\igui_fuel_progress.paa";
		};
		class CA_ValueArmor: RscListBox
		{
			idc=111;
			sizeEx=0.035250001;
			x="0.040 + SafeZoneX";
			y="0.016 + SafeZoneY";
			w=0.035700001;
			h=0.75999999;
		};
		class CA_TextFlaresMode: RscIGUIText
		{
			idc=152;
			style=0;
			sizeEx=0.02674;
			x="0.078 + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_TextFlares: RscIGUIValue
		{
			idc=151;
			style=1;
			sizeEx=0.02674;
			x="0.078  + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
	};
	class RscUnitInfoUAV
	{
		idd=300;
		controls[]=
		{
			"CA_Weapon",
			"CA_Mode",
			"CA_Ammo",
			"CA_ValueFuelBackground",
			"CA_ValueFuel",
			"CA_GunnerWeapon",
			"CA_SpeedBackground",
			"CA_TextSpeed",
			"CA_Speed",
			"CA_AltBackground",
			"CA_TextAlt",
			"CA_Alt",
			"CA_HeadingBackground",
			"CA_Heading",
			"CA_ValueArmor",
			"CA_TextFlares",
			"CA_TextFlaresMode",
			"RscTextUAV",
			"TextPosition",
			"Position",
			"TextZoom",
			"Zoom",
			"Time",
			"Date"
		};
		class CA_Mode: RscIGUIText
		{
			idc=149;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Ammo: RscIGUIValue
		{
			idc=119;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.054 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_Weapon: RscIGUIText
		{
			idc=118;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.015 + SafeZoneY";
			w=0.214;
			h=0.039000001;
		};
		class CA_GunnerWeapon: RscIGUIText
		{
			idc=150;
			style=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y="0.132 + SafeZoneY";
			w=0.214;
			h=0.039000001;
			SizeEx=0.034000002;
		};
		class CA_SpeedBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			shadow=2;
			type=0;
			x=0.31400001;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextSpeed: RscIGUIText
		{
			style=0;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="SPD";
		};
		class CA_Speed: RscIGUIValue
		{
			idc=121;
			style=1;
			x=0.257;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_AltBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			type=0;
			x=0.625;
			y="0.017 + SafeZoneY";
			w=0.059999999;
			h=0.033;
		};
		class CA_TextAlt: RscIGUIText
		{
			style=1;
			x=0.625;
			y="0.015 + SafeZoneY";
			w=0.12;
			text="ALT";
		};
		class CA_Alt: RscIGUIValue
		{
			idc=122;
			style=0;
			x=0.625;
			y="0.015 + SafeZoneY";
			w=0.12;
		};
		class CA_HeadingBackground: RscEdit
		{
			idc=-1;
			sizeEx=0.034000002;
			colorBackground[]={0,0,0,0};
			colorText[]={0.40000001,0.67449999,0.2784,1};
			colorSelection[]={0,0,0,0};
			style="0x02 + 0x40";
			type=0;
			x=0.46900001;
			y="0.017 + SafeZoneY";
			w=0.061000001;
			h=0.033;
		};
		class CA_Heading: RscIGUIValue
		{
			idc=148;
			style=2;
			x=0.44999999;
			y="0.015 + SafeZoneY";
			w=0.1;
		};
		class CA_ValueFuelBackground: RscPicture
		{
			idc=-1;
			shadow=2;
			x="0.018 + SafeZoneX";
			y="0.01 + SafeZoneY";
			w=0.019607799;
			h=0.2091503;
			colorText[]={0.40000001,0.67449999,0.2784,1};
			text="\ca\ui\data\ui_fuel_background.paa";
		};
		class CA_ValueFuel: RscIGProgress
		{
			idc=113;
			x="0.02 + SafeZoneX";
			y="0.036 + SafeZoneY";
			w=0.0099999998;
			h=0.18000001;
			texture="\ca\ui\data\igui_fuel_progress.paa";
		};
		class CA_ValueArmor: RscListBox
		{
			idc=111;
			sizeEx=0.035250001;
			x="0.040 + SafeZoneX";
			y="0.016 + SafeZoneY";
			w=0.035700001;
			h=0.75999999;
		};
		class CA_TextFlaresMode: RscIGUIText
		{
			idc=152;
			style=0;
			sizeEx=0.02674;
			x="0.078 + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class CA_TextFlares: RscIGUIValue
		{
			idc=151;
			style=1;
			sizeEx=0.02674;
			x="0.078  + SafeZoneX";
			y="0.012 + SafeZoneY";
			w="0.161*SafezoneW";
		};
		class RscTextUAV: RscText
		{
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
			colorbackground[]={0,0,0,0};
			type=0;
			IDC=1004;
			linespacing=1;
			text="";
			style="0x00 + 0x10 + 0x200";
		};
		class TextPosition: RscTextUAV
		{
			text="GRID";
			x="0.5 + 	0.13 * safezoneW * 2 + 	0.05 / 2";
			y="SafeZoneY + SafezoneH - 0.12";
			h=0.050000001;
			w="safezoneW - ((safezoneW - 1) / 2 + (0.5 + 	0.13 * safezoneW * 2 + 	0.05 / 2))";
			style="0x00 + 0x100 + 0x200";
			colortext[]={1,1,1,1};
			font="EtelkaMonospaceProBold";
			sizeEx="0.034*1";
		};
		class Position: TextPosition
		{
			idc=130;
			x="0.5 + 	0.13 * safezoneW * 2 + 	0.05 / 2";
			y="SafeZoneY + SafezoneH - 0.12";
			style="0x01 + 0x100";
		};
		class TextZoom: TextPosition
		{
			text="ZOOM";
			y="SafeZoneY + SafezoneH - 0.08";
		};
		class Zoom: Position
		{
			idc=131;
			y="SafeZoneY + SafezoneH - 0.08";
		};
		class Time: TextPosition
		{
			idc=101;
			style="0x02 + 0x100 + 0x200";
			x="0.5 - 0.2";
			y="SafeZoneY + SafezoneH - 0.12";
			w=0.40000001;
			sizeEx="0.034*1 * 1.5";
		};
		class Date: Time
		{
			idc=102;
			y="SafeZoneY + SafezoneH - 0.09";
			sizeEx="0.024*1.2";
		};
	};
	class RscUnitInfoUAV_gunner
	{
		idd=300;
		class controls
		{
			class RscTextUAV: RscText
			{
				x="safezoneX";
				y="safezoneY";
				w="safezoneW";
				h="safezoneH";
				colorbackground[]={0,0,0,0};
				type=0;
				IDC=1004;
				linespacing=1;
				text="";
				style="0x00 + 0x10 + 0x200";
			};
			class GV00: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW";
				y="0.5 -2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH00: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV01: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW";
				y="0.5 -1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH01: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV02: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW";
				y="0.5 +0*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH02: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +0*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV03: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW";
				y="0.5 +1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH03: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV04: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW";
				y="0.5 +2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH04: RscTextUAV
			{
				x="0.5 + -2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV05: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW";
				y="0.5 -2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH05: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV06: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW";
				y="0.5 -1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH06: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV07: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW";
				y="0.5 +0*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH07: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +0*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV08: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW";
				y="0.5 +1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH08: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV09: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW";
				y="0.5 +2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH09: RscTextUAV
			{
				x="0.5 + -1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV10: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW";
				y="0.5 -2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH10: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV11: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW";
				y="0.5 -1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH11: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV13: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW";
				y="0.5 +1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH13: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV14: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW";
				y="0.5 +2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH14: RscTextUAV
			{
				x="0.5 + +0*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV15: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW";
				y="0.5 -2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH15: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV16: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW";
				y="0.5 -1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH16: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV17: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW";
				y="0.5 +0*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH17: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +0*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV18: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW";
				y="0.5 +1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH18: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV19: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW";
				y="0.5 +2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH19: RscTextUAV
			{
				x="0.5 + +1*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV20: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW";
				y="0.5 -2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH20: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV21: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW";
				y="0.5 -1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH21: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + -1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV22: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW";
				y="0.5 +0*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH22: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +0*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV23: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW";
				y="0.5 +1*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH23: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +1*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class GV24: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW";
				y="0.5 +2*	0.13 * safezoneW - (	0.05)/2";
				w="0.001 * safezoneH";
				h=0.050000001;
				colorBackground[]={0,0,0,0.40000001};
			};
			class GH24: RscTextUAV
			{
				x="0.5 + +2*	0.13 * safezoneW - (	0.05 * 3/4)/2";
				y="0.5 + +2*	0.13 * safezoneW";
				w="0.05 * 3/4";
				h="0.001 * safezoneH";
				colorBackground[]={0,0,0,0.40000001};
			};
			class LineTLH: RscTextUAV
			{
				x="0.5 - 	0.13 * safezoneW * 2";
				y="0.5 - 	0.13 * safezoneW * 2";
				w=0.1;
				h=0.0020000001;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineTLV: RscTextUAV
			{
				x="0.5 - 	0.13 * safezoneW * 2";
				y="0.5 - 	0.13 * safezoneW * 2";
				w=0.0020000001;
				h=0.1;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineTRH: RscTextUAV
			{
				x="0.5 + 	0.13 * safezoneW * 2 - 0.1";
				y="0.5 - 	0.13 * safezoneW * 2";
				w=0.1;
				h=0.0020000001;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineTRV: RscTextUAV
			{
				x="0.5 + 	0.13 * safezoneW * 2 - 0.002";
				y="0.5 - 	0.13 * safezoneW * 2";
				w=0.0020000001;
				h=0.1;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineBLH: RscTextUAV
			{
				x="0.5 - 	0.13 * safezoneW * 2";
				y="0.5 + 	0.13 * safezoneW * 2 - 0.002";
				w=0.1;
				h=0.0020000001;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineBLV: RscTextUAV
			{
				x="0.5 - 	0.13 * safezoneW * 2";
				y="0.5 + 	0.13 * safezoneW * 2 - 0.1";
				w=0.0020000001;
				h=0.1;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineBRH: RscTextUAV
			{
				x="0.5 + 	0.13 * safezoneW * 2 - 0.1";
				y="0.5 + 	0.13 * safezoneW * 2 - 0.002";
				w=0.1;
				h=0.0020000001;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class LineBRV: RscTextUAV
			{
				x="0.5 + 	0.13 * safezoneW * 2 - 0.002";
				y="0.5 + 	0.13 * safezoneW * 2 - 0.1";
				w=0.0020000001;
				h=0.1;
				text="";
				colorBackground[]={1,1,1,1};
			};
			class UAV_Cross: RscPictureKeepAspect
			{
				x="0.5 - (0.08 * safezoneH)";
				y="0.5 - (0.08 * safezoneH)";
				w="0.16 * safezoneH";
				h="0.16 * safezoneH";
				text="ca\ui\data\cursor_uav_gs.paa";
				colorText[]={1,1,1,1};
				idc=1001;
				type=0;
				colorbackground[]={0,0,0,0};
				font="EtelkaMonospaceProBold";
				sizeEx=0;
			};
			class UAV_Laser: UAV_Cross
			{
				idc=158;
				text="ca\ui\data\cursor_w_target_gs.paa";
			};
			class TextVision: RscTextUAV
			{
				style="0x00 + 0x100 + 0x200";
				text="VISION";
				colortext[]={1,1,1,1};
				font="EtelkaMonospaceProBold";
				sizeEx="0.034*1";
				x="safezoneX";
				y="SafeZoneY + SafezoneH - 0.12";
				h=0.050000001;
				w="safezoneW - ((safezoneW - 1) / 2 + (0.5 + 	0.13 * safezoneW * 2 + 	0.05 / 2))";
			};
			class Vision: TextVision
			{
				idc=152;
				style="0x01 + 0x100";
				colortext[]={1,1,1,1};
				color[]={1,1,1,1};
				text="123";
			};
			class TextFlir: TextVision
			{
				text="FLIR";
				y="SafeZoneY + SafezoneH - 0.08";
			};
			class Flir: Vision
			{
				idc=153;
				y="SafeZoneY + SafezoneH - 0.08";
			};
		};
	};
	class RscHint
	{
		idd=301;
		movingEnable=0;
		controls[]=
		{
			"Background",
			"Hint"
		};
		class Background: RscText
		{
			idc=101;
			style=128;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
			y=0.23;
			w=0.28;
			h=0.059999999;
			text="";
		};
		class Hint: RscStructuredText
		{
			idc=102;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.701)";
			y=0.241;
			w=0.27500001;
			h=0.039999999;
			style=16;
			shadow=2;
			class Attributes: Attributes
			{
			};
		};
	};
	class RscTaskHint
	{
		idd=302;
		movingEnable=0;
		class controlsBackground
		{
			class Background: RscText
			{
				type=0;
				idc=103;
				x=0.30000001;
				y="0.22 + SafeZoneY";
				w=0.40000001;
				h=0.059999999;
				text="";
				colorBackground[]={0,0,0,0};
			};
		};
		class Controls
		{
			class Hint: RscStructuredText
			{
				idc=104;
				x=0.354;
				y="0.231 + SafeZoneY";
				w=0.34;
				h=0.039999999;
				style=16;
				lineSpacing=1;
				sizeEx=0.039209999;
				colorText[]={1,1,1,1};
				colorBackground[]={0,0,0,0};
				font="Zeppelin32";
				size=0.039209999;
				text="$STR_DISP_ERROR";
				class Attributes: Attributes
				{
					color="#ffffff";
					align="left";
					shadow=1;
				};
			};
		};
		class TaskIcon
		{
			x=0.31;
			y="0.235 + SafeZoneY";
			w=0.039215699;
			h=0.052287601;
		};
	};
};
class RscDisplayChannel
{
	idd=63;
	class controls
	{
		delete Channel;
		class CA_Channel: RscText
		{
			idc=101;
			style=0;
			x="0.015 + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - 0.034";
			w=0.25999999;
			colorBackground[]={0,0,0,0};
			sizeEx=0.034000002;
		};
		class Background: RscText
		{
			x=-10;
			y=0.80000001;
			w=0.25;
			h=0.050000001;
		};
		class Picture: RscPicture
		{
			idc=102;
			x=-10.01;
			y=0.72000003;
			w=0.029999999;
			h=0.050000001;
		};
	};
};
class RscDisplayVoiceChat
{
	class controls
	{
		class Background;
		class Picture: RscPicture
		{
			text="\ca\ui\textures\mikrak.paa";
		};
	};
};
class RscDisplayChat
{
	class controls
	{
		delete Line;
		delete Background;
		class CA_Background: RscText
		{
			x="SafeZoneX + 0.26";
			y="(SafeZoneH + SafeZoneY) - 0.034";
			w="SafeZoneW - 0.26 - 0.015";
			h=0.034000002;
			colorBackground[]={0.6275,0.6275,0.6275,0.33000001};
			colorText[]={0,0,0,1};
		};
		class CA_Line: RscEdit
		{
			idc=101;
			x="SafeZoneX + 0.26";
			y="(SafeZoneH + SafeZoneY) - 0.034";
			w="SafeZoneW - 0.26 - 0.015";
			h=0.034000002;
			sizeEx=0.034000002;
			text="";
			colorBackground[]={0.6275,0.6275,0.6275,0.33000001};
			colorText[]={1,1,1,1};
			autocomplete="general";
		};
	};
};
class RscChatListDefault
{
	style="0x00 + 0x40";
	shadow=2;
	x="(02/100)	* SafeZoneW + SafeZoneX";
	y=0.60000002;
	w="SafeZoneW - 0.3";
	h=0.034000002;
	font="EtelkaNarrowMediumPro";
	size=0.034000002;
	rows="6*SafezoneH*SafezoneH";
	iconNormalMessage="#(argb,8,8,3)color(0,0,0,0)";
	iconPlayerMessage="ca\ui\data\ui_icon_player_message_ca.paa";
	colorBackground[]={0.63,0.63,0.63,0.33000001};
	colorPlayerBackground[]={0.19,0.25999999,0.15000001,0};
	colorGlobalChannel[]={0.69999999,0.89999998,1,1};
	colorSideChannel[]={0.27000001,0.82999998,0.99000001,1};
	colorCommandChannel[]={1,1,0.5,1};
	colorGroupChannel[]={0.85000002,1,0.64999998,1};
	colorVehicleChannel[]={1,0.80000001,0,1};
	colorDirectChannel[]={0.94999999,0.94999999,0.94999999,1};
	colorPlayerChannel[]={0.80000001,0.69999999,1,1};
	colorSystemChannel[]={0.69999999,0.69999999,0.69999999,1};
};
class RscChatListMission: RscChatListDefault
{
	colorBackground[]={0,0,0,0};
	x="0.015 + SafeZoneX";
	y="0.60 + 0.039*2";
	w="(50/100)	* SafeZoneW";
	rows="5*SafezoneH*SafezoneH";
};
class RscChatListBriefing: RscChatListDefault
{
	colorBackground[]={0.6275,0.6275,0.6275,0.33000001};
	x="0.015 + SafeZoneX";
	y=0.60000002;
	w="SafeZoneW - 0.3";
	rows="6*SafezoneH*SafezoneH";
};
class RscChatListMap: RscChatListDefault
{
	colorBackground[]={0.6275,0.6275,0.6275,0.33000001};
	x="0.015 + SafeZoneX";
	y="0.60 + 0.039*2";
	w="SafeZoneW - 0.3";
	rows="5*SafezoneH*SafezoneH";
};
class RscTitlesText
{
	fontBasic="EtelkaNarrowMediumPro";
	sizeExBasic=0.034000002;
	fontDown="EtelkaNarrowMediumPro";
	sizeExDown=0.034000002;
	offsetDown=0.38;
};
class RscTitles
{
	class Default;
	class TownCaptureProgress
	{
		idd=5800;
		duration=15000;
		name="TownCaptureProgress";
		onLoad="UInamespace SetVariable ['currentTitleDisplay',_this Select 0];";
		onUnload="UInamespace SetVariable ['currentTitleDisplay',displayNull];";
		class controlsBackground
		{
			class ProgressBarBackground: IGUIBack
			{
				idc=3600;
				x=0.26300001;
				y="0.170 + SafeZoneY";
				w=0.47299999;
				h=0.050000001;
				colorBackground[]={0,0,0,0};
			};
			class ProgressBar: IGUIBack
			{
				idc=3800;
				x=0.273;
				y="0.180  + SafeZoneY";
				w=0.45300001;
				h=0.029999999;
				colorBackground[]={0,0,0,0};
			};
		};
	};
	class CampCaptureProgress: TownCaptureProgress
	{
		class controlsBackground: controlsBackground
		{
			class ProgressBarBackground: ProgressBarBackground
			{
			};
			class ProgressBar: ProgressBar
			{
			};
			class InfoLabel
			{
				type=0;
				idc=510;
				style=2;
				font="EtelkaNarrowMediumPro";
				sizeEx=0.029999999;
				x=0.273;
				y="0.170  + SafeZoneY";
				w=0.45300001;
				h=0.039999999;
				colorText[]={1,1,1,1};
				colorBackground[]={0,0,0,0};
				text="$STRWFCAPTURINGCAMP";
			};
		};
	};
	class OptionsAvailable
	{
		idd=5000;
		movingEnable=0;
		objects[]={};
		duration=15000;
		name="OptionsAvailable";
		onLoad="UInamespace SetVariable ['currentCutDisplay',_this Select 0];";
		onUnload="UInamespace SetVariable ['currentCutDisplay',displayNull];";
		controls[]=
		{
			"OptionsIcon0",
			"OptionsIcon1",
			"OptionsIcon2",
			"OptionsIcon3",
			"OptionsIcon4",
			"OptionsIcon5",
			"OptionsIcon6",
			"OptionsIcon7",
			"OptionsIcon8",
			"OptionsIcon9",
			"OptionsIcon10",
			"OptionsIcon11",
			"OptionsIcon12",
			"OptionsIcon13",
			"OptionsIcon14",
			"OptionsIcon15",
			"OptionsIcon16",
			"OptionsIcon17"
		};
		controlsBackground[]={};
		class OptionsImageAspectRatio: RscPicture
		{
			w=0.078431398;
			h=0.1045752;
			style="0x30+0x800";
		};
		class OptionsIcon0: OptionsImageAspectRatio
		{
			IDC=3500;
			x="(SafeZoneW + SafeZoneX) - (0.0392157)";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))";
			w=0.039215699;
			h=0.052287601;
			colortext[]={1,1,1,0.40000001};
			text="";
		};
		class OptionsIcon1: OptionsIcon0
		{
			IDC="3500 + 1";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*1)";
		};
		class OptionsIcon2: OptionsIcon0
		{
			IDC="3500 + 2";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*2)";
		};
		class OptionsIcon3: OptionsIcon0
		{
			IDC="3500 + 3";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*3)";
		};
		class OptionsIcon4: OptionsIcon0
		{
			IDC="3500 + 4";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*4)";
		};
		class OptionsIcon5: OptionsIcon0
		{
			IDC="3500 + 5";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*5)";
		};
		class OptionsIcon6: OptionsIcon0
		{
			IDC="3500 + 6";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*6)";
		};
		class OptionsIcon7: OptionsIcon0
		{
			IDC="3500 + 7";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*7)";
		};
		class OptionsIcon8: OptionsIcon0
		{
			IDC="3500 + 8";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*8)";
		};
		class OptionsIcon9: OptionsIcon0
		{
			IDC="3500 + 9";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*9)";
		};
		class OptionsIcon10: OptionsIcon0
		{
			IDC="3500 + 10";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*10)";
		};
		class OptionsIcon11: OptionsIcon0
		{
			IDC="3500 + 11";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*11)";
		};
		class OptionsIcon12: OptionsIcon0
		{
			IDC="3500 + 12";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*12)";
		};
		class OptionsIcon13: OptionsIcon0
		{
			IDC="3500 + 13";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*13)";
		};
		class OptionsIcon14: OptionsIcon0
		{
			IDC="3500 + 14";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*14)";
		};
		class OptionsIcon15: OptionsIcon0
		{
			IDC="3500 + 15";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*15)";
		};
		class OptionsIcon16: OptionsIcon0
		{
			IDC="3500 + 16";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*16)";
		};
		class OptionsIcon17: OptionsIcon0
		{
			IDC="3500 + 17";
			y="((SafeZoneH + SafeZoneY) - (1 - 0.851)+(-0.0522876*1))+(-0.0522876*17)";
		};
	};
	class EndOfGameStats
	{
		idd=5000;
		movingEnable=1;
		class BackgroundWindow
		{
			style=128;
			colorBackground[]={0.1,0.1,0.1,1};
			text="";
			x=0.32499999;
			y=0.075000003;
			w=0.40000001;
			h=0.85000002;
		};
		class BackgroundWindowLight: BackgroundWindow
		{
			colorBackground[]={0.40000001,0.40000001,0.40000001,1};
		};
		duration=30000;
		name="EndOfGameStats";
		onLoad="UInamespace SetVariable ['currentTitleDisplay',_this Select 0];";
		onUnload="UInamespace SetVariable ['currentTitleDisplay',displayNull];";
		controls[]=
		{
			"SideWinsText"
		};
		controlsBackground[]=
		{
			"MainBackground"
		};
		class MainBackground
		{
			type=0;
			idc=-1;
			style=48;
			colorBackground[]={0,0,0,0};
			font="EtelkaNarrowMediumPro";
			sizeEx=0.025;
			color[]={0,0,0,1};
			colorText[]={0.24699999,0.31400001,0.177,1};
			text="\ca\ui\data\ui_gradient_start_gs.paa";
			x=-10;
			y=0;
			w=30;
			h=1;
		};
		class SideWinsText
		{
			type=0;
			idc=500;
			style=2;
			font="EtelkaNarrowMediumPro";
			sizeEx=0.050000001;
			x=0.30000001;
			y=0.1;
			w=0.30000001;
			h=0.079999998;
			colorText[]={1,1,1,1};
			colorBackground[]={0.40000001,0.40000001,0.40000001,1};
			text="";
		};
	};
	class SplashBohemia
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen Bohemia";
		controls[]=
		{
			"Picture",
			"Text_BIS"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +  SafeZoneH / 2 - 0.4183007 / 2 - 0.1";
			w=0.627451;
			h=0.41830069;
			text="\ca\ui\data\startup_logo_bi_ca";
		};
		class Text_BIS: RscSplashText
		{
			x=0;
			y=0.60000002;
			w=1;
			h=0.050000001;
			sizeEx=0.0286458;
			text="$STR_ARMA_SPLASH_1";
		};
	};
	class SplashESRB
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="ESRB content rating notice";
		controls[]=
		{
			"Picture",
			"Text_ESRB"
		};
		class Picture: RscPicture
		{
			x=0;
			y=0;
			w=1;
			h=1;
			text="\ca\miscus\data\ui_splash_esrb_co.paa";
		};
		class Text_ESRB: RscSplashText
		{
			x=0;
			y=0.80000001;
			w=1;
			h=0.1;
			sizeEx=0.0286458;
			text="";
		};
	};
	class SplashArmA2
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen ArmA 2";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\startup_logo_arma2_ca.paa";
		};
	};
	class SplashOAH
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen ArmA 2 OA";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=0.627451;
			h=0.83660132;
			text="\CA\ui\data\startup_logo_arma_all_ca.paa";
		};
	};
	class SplashRFT
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen ArmA 2 REINFORCEMENTS";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=0.627451;
			h=0.83660132;
			text="\CA\ui\data\startup_logo_arma2_RFT_ca.paa";
		};
	};
	class SplashO2TV
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen O2 TV";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\startup_logo_O2TV.paa";
		};
	};
	class SplashGGE
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen GGE";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.4183007 / 2";
			w=0.627451;
			h=0.41830069;
			text="\ca\ui\data\startup_logo_GGE.paa";
		};
	};
	class SplashFighterTV
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen Fighter TV";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.6274510 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\startup_logo_fighterTV.paa";
		};
	};
	class SplashHarvestRed
	{
		idd=-1;
		movingEnable=0;
		duration=3;
		name="Splashscreen Harvest Red";
		controls[]=
		{
			"Picture"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 1.2549020 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.8366013 / 2";
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\startup_harvest_red_logo_ca.paa";
		};
	};
	class SplashCopyright
	{
		idd=-1;
		movingEnable=0;
		duration=5;
		name="Splashscreen Copyright";
		controls[]=
		{
			"Picture",
			"Text_WWW",
			"Text_Copyright"
		};
		class Picture: RscPicture
		{
			x="SafeZoneX + SafeZoneW / 2 - 0.3137255 / 2";
			y="SafeZoneY +	SafeZoneH / 2 - 0.2091503 / 2 - 0.3";
			w=0.3137255;
			h=0.2091503;
			text="\ca\ui\data\startup_logo_bi_ca";
		};
		class Text_WWW: RscSplashText
		{
			x=0;
			y=0.47999999;
			w=1;
			h=0.30000001;
			sizeEx=0.0286458;
			text="www.arma2.com";
		};
		class Text_Copyright: RscSplashText
		{
			x=0;
			y=0.64999998;
			w=1;
			h=0.34999999;
			sizeEx=0.02674;
			text="$STR_ARMA_SPLASH_4b";
		};
	};
	class ConstructionInterface
	{
		idd=1122;
		movingEnable=0;
		duration=9.9999998e+010;
		name="Construction Interface";
		onload="if !(isnil {missionnamespace getvariable 'BIS_CONTROL_CAM'}) then {uinamespace setvariable ['BIS_CONTROL_CAM_DISPLAY',_this select 0]};";
		class controls
		{
			class center: RscPictureKeepAspect
			{
				idc=112201;
				x=0.40000001;
				y=0.40000001;
				w=0.2;
				h=0.2;
				colorText[]={1,1,1,0.1};
				text="\ca\ui\data\cursor_w_laserlock_gs.paa";
			};
			class descBackLeft: IGUIBack
			{
				idc=112211;
				x="SafezoneX + 0.01";
				y="SafezoneY + SafezoneH - 0.13 + 0.01";
				w=0.30000001;
				h=0.12;
			};
			class descBackCenter: descBackLeft
			{
				idc=112212;
				x="SafezoneX + 0.01 + 	0.3";
				w="SafeZoneW - 0.02 - 	0.3*2";
			};
			class descBackRight: descBackLeft
			{
				idc=112213;
				x="SafezoneX + SafeZoneW - 0.01 - 	0.3";
				w=0.30000001;
			};
			class descText: RscStructuredText
			{
				idc=112214;
				x="SafezoneX + 0.01 + 	0.3";
				y="SafezoneY + SafezoneH - 0.13 + 0.021";
				w="SafeZoneW - 0.02 - 	0.3*2";
				h=0.11;
				size=0.035;
				class Attributes
				{
					font="Zeppelin32";
					color="#B6F862";
					align="left";
					shadow=1;
				};
			};
			class cashText: descText
			{
				idc=112224;
				x="SafezoneX + 0.012*2";
				y="SafezoneY + SafezoneH - 0.13 + 0.02";
				w=0.2;
				h=0.1;
			};
			class controlsText: descText
			{
				idc=112215;
				x="SafezoneX + SafeZoneW - 0.01 - 	0.3";
				y="SafezoneY + SafezoneH - 0.13 + 0.015";
				w=0.30000001;
				h=0.11;
			};
		};
	};
	class RscTime
	{
		idd=1123;
		duration=10000;
		fadein=0;
		movingEnable=1;
		enableSimulation=1;
		enableDisplay=1;
		onload="uinamespace setvariable ['BIS_InfoTime',_this select 0]";
		onunload="uinamespace setvariable ['BIS_InfoTime',nil]";
		class controls
		{
			class text0: RscStructuredText
			{
				idc=112301;
				x=0;
				y=0.40000001;
				w=1;
				h=1;
				size=0.035;
				class Attributes
				{
					font="EtelkaMonospaceProBold";
					color="#B6F862";
					align="center";
					shadow=1;
					valign="top";
				};
			};
		};
	};
	class RscUnitInfoUAV
	{
		idd=1125;
		duration=10000;
		fadein=0;
		movingEnable=1;
		enableSimulation=1;
		enableDisplay=1;
		onload="uinamespace setvariable ['BIS_UAV_DISPLAY',_this select 0]";
		onunload="uinamespace setvariable ['BIS_UAV_DISPLAY',nil]";
		class controls
		{
			class CA_MiniMap: RscMapControl
			{
				IDC=112410;
				ShowCountourInterval=0;
				x="0.012 + SafeZoneX + 0.01";
				y="0.016 + SafeZoneY + 0.01";
				w="0.33 - 0.02";
				h="0.33 - 0.02";
				colorbackground[]={1,1,1,1};
				alphaFadeStartScale=0;
				alphaFadeEndScale=0;
			};
			class Locked_text_L: RscText
			{
				idc=112401;
				style="0x02 + 0x10";
				text="\nL\n\nO\n\nC\n\nK\n\nE\n\nD";
				x="SafeZoneX + 0.025";
				y="SafeZoneY + 0.200";
				w=0.07;
				h=0.69999999;
				linespacing=1.8;
				sizeEx="0.024*1.3";
				font="EtelkaMonospaceProBold";
				colortext[]={1,1,1,1};
				colorbackground[]={0,0,0,0};
			};
			class Locked_frame_L: Locked_text_L
			{
				idc=112402;
				style=64;
			};
			class Locked_text_R: Locked_text_L
			{
				idc=112403;
				x="SafeZoneX + SafeZoneW - 0.025 - 0.07";
			};
			class Locked_frame_R: Locked_text_R
			{
				idc=112404;
				style=64;
			};
			class Speed: RscIGUIText
			{
				idc=112411;
				style="0x01 + 0x100";
				x="SafeZoneX + SafeZoneW - 0.45";
				y="SafeZoneY + SafezoneH - 0.26";
				h=0.050000001;
				w=0.30000001;
				sizeEx="0.024*1.3";
				font="EtelkaMonospaceProBold";
				colortext[]={1,1,1,1};
				color[]={1,1,1,1};
			};
			class SpeedWanted: Speed
			{
				idc=112412;
				y="SafeZoneY + SafezoneH - 0.23";
				sizeEx="0.024*1.2";
			};
			class AltWanted: Speed
			{
				idc=112413;
				y="SafeZoneY + SafezoneH - 0.16";
				sizeEx="0.024*1.2";
			};
			class Hint_brightness: Locked_text_L
			{
				idc=112414;
				style="0x00 + 0x10 + 0x200 + 0x100";
				x="SafeZoneX + 0.012";
				y="SafeZoneY + 0.4";
				h=0.15000001;
				w=0.34999999;
				text="";
				linespacing=1;
			};
		};
	};
	class RscUnitInfoUAVHeli
	{
		idd=-1;
		duration=9.9999998e+010;
		fadein=0;
		name="UAV Heli";
		movingEnable=1;
		onload="uinamespace setvariable ['BIS_UAV_HELI_DISPLAY',_this select 0]";
		onunload="uinamespace setvariable ['BIS_UAV_HELI_DISPLAY',nil]";
		class controls
		{
			class RscTextUAV: RscText
			{
				x=-10;
				y=-10;
				w=30;
				h=30;
				colorbackground[]={0,1,0,0.050000001};
				type=0;
				IDC=1004;
				linespacing=1;
				text="";
				style="0x00 + 0x10 + 0x200";
			};
			class GV1: RscTextUAV
			{
				x="safezoneX + safezoneW * 0.1";
				y="safezoneY";
				w="0.001 * safezoneH";
				h="safezoneH";
				colorBackground[]={0,0,0,0.1};
			};
			class GV3: GV1
			{
				x="safezoneX + safezoneW * 0.3";
			};
			class GV5: GV1
			{
				x="safezoneX + safezoneW * 0.5";
			};
			class GV7: GV1
			{
				x="safezoneX + safezoneW * 0.7";
			};
			class GV9: GV1
			{
				x="safezoneX + safezoneW * 0.9";
			};
			class GH1: GV1
			{
				x="safezoneX";
				y="safezoneY + safezoneH * 0.1";
				w="safezoneW";
				h="0.001 * safezoneH";
			};
			class GH3: GH1
			{
				y="safezoneY + safezoneH * 0.3";
			};
			class GH5: GH1
			{
				y="safezoneY + safezoneH * 0.5";
			};
			class GH7: GH1
			{
				y="safezoneY + safezoneH * 0.7";
			};
			class GH9: GH1
			{
				y="safezoneY + safezoneH * 0.9";
			};
			class UAV_Cross: RscPictureKeepAspect
			{
				x="0.5 - (0.08 * safezoneH)";
				y="0.5 - (0.08 * safezoneH)";
				w="0.16 * safezoneH";
				h="0.16 * safezoneH";
				text="ca\ui\data\cursor_uav_heli_gs.paa";
				colorText[]={0.40000001,0.67449999,0.2784,1};
				idc=1001;
				type=0;
				colorbackground[]={0,0,0,0};
				font="EtelkaMonospaceProBold";
				sizeEx=0;
			};
			class UAV_Laser: UAV_Cross
			{
				idc=1002;
				text="ca\ui\data\cursor_w_view_gs.paa";
			};
			class UAV_Target: UAV_Cross
			{
				idc=1003;
				x=0.20999999;
				y=0.20999999;
				w="0.08 * safezoneH";
				h="0.08 * safezoneH";
				text="ca\ui\data\cursor_w_target_gs.paa";
			};
			class UAV_Heli: UAV_Cross
			{
				idc=1006;
				text="ca\ui\data\cursor_w_grenade_gs.paa";
				w=0;
				h=0;
			};
			class UAV_Missile: UAV_Cross
			{
				idc=1007;
				text="ca\ui\data\cursor_uav_heli_lock_gs.paa";
			};
			class UAV_Missile_Red: UAV_Missile
			{
				idc=1008;
				colorText[]={0.70599997,0.074500002,0.0196,1};
			};
			class UAV_Info_Left_0: RscText
			{
				x="safezoneX + 	(0.015)";
				y="(0.55) + 0.001";
				w="0.3 * 						 0.034*1*30";
				h=0.5;
				idc=1010;
				text="";
				type=0;
				style="0x00 + 0x10 + 0x200";
				linespacing=1;
				font="EtelkaMonospaceProBold";
				SizeEx="0.034*1";
				colorText[]={0.40000001,0.67449999,0.2784,1};
				colorbackground[]={0,0,0,0};
				shadow=2;
			};
			class UAV_Info_Left_1: UAV_Info_Left_0
			{
				idc=1011;
				y="safezoneY + safezoneH - 0.1";
				h=0.1;
				w=0.5;
			};
			class UAV_Info_Right: UAV_Info_Left_0
			{
				idc=1020;
				x="safezoneX + SafezoneW - 	(0.015) - 0.3 * 						 0.034*1*30";
				h=0.5;
				style="0x01 + 0x10 + 0x200";
			};
			class UAV_Frame_0_1: RscText
			{
				type=0;
				IDC="1030 + (0 * 4)";
				x="safezoneX + 	(0.015)";
				y="(0.55)";
				w="0.15 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_0_2: UAV_Frame_0_1
			{
				IDC="1031 + (0 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_0_3: UAV_Frame_0_1
			{
				IDC="1032 + (0 * 4)";
				y="(0.55) + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_0_4: UAV_Frame_0_1
			{
				IDC="1033 + (0 * 4)";
				x="safezoneX + 	(0.015) + 0.15 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_1_1: RscText
			{
				type=0;
				IDC="1030 + (1 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.15 * 						 0.034*1*30";
				y="(0.55)";
				w="0.15 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_1_2: UAV_Frame_1_1
			{
				IDC="1031 + (1 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_1_3: UAV_Frame_1_1
			{
				IDC="1032 + (1 * 4)";
				y="(0.55) + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_1_4: UAV_Frame_1_1
			{
				IDC="1033 + (1 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.15 * 						 0.034*1*30 + 0.15 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_2_1: RscText
			{
				type=0;
				IDC="1030 + (2 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.068 * 						 0.034*1*30";
				y="(0.55) + 					 0.034*1 * 2";
				w="0.068 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_2_2: UAV_Frame_2_1
			{
				IDC="1031 + (2 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_2_3: UAV_Frame_2_1
			{
				IDC="1032 + (2 * 4)";
				y="(0.55) + 					 0.034*1 * 2 + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_2_4: UAV_Frame_2_1
			{
				IDC="1033 + (2 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.068 * 						 0.034*1*30 + 0.068 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_3_1: RscText
			{
				type=0;
				IDC="1030 + (3 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.068 * 						 0.034*1*30";
				y="(0.55) + 					 0.034*1 * 5";
				w="0.068 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_3_2: UAV_Frame_3_1
			{
				IDC="1031 + (3 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_3_3: UAV_Frame_3_1
			{
				IDC="1032 + (3 * 4)";
				y="(0.55) + 					 0.034*1 * 5 + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_3_4: UAV_Frame_3_1
			{
				IDC="1033 + (3 * 4)";
				x="safezoneX + SafezoneW - 	(0.015) - 0.068 * 						 0.034*1*30 + 0.068 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_4_1: RscText
			{
				type=0;
				IDC="1030 + (4 * 4)";
				x="safezoneX + 	(0.015)";
				y="(0.55) + 					 0.034*1 * 2";
				w="0.06 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_4_2: UAV_Frame_4_1
			{
				IDC="1031 + (4 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_4_3: UAV_Frame_4_1
			{
				IDC="1032 + (4 * 4)";
				y="(0.55) + 					 0.034*1 * 2 + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_4_4: UAV_Frame_4_1
			{
				IDC="1033 + (4 * 4)";
				x="safezoneX + 	(0.015) + 0.06 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_5_1: RscText
			{
				type=0;
				IDC="1030 + (5 * 4)";
				x="safezoneX + 	(0.015)";
				y="(0.55) + 					 0.034*1 * 8";
				w="0.06 * 						 0.034*1*30 + 	0.003 * 3/4";
				h="0.003 * safezoneH";
				linespacing=1;
				text="";
				colorBackground[]={0.40000001,0.67449999,0.2784,1};
				style="0x00 + 0x10 + 0x200";
			};
			class UAV_Frame_5_2: UAV_Frame_5_1
			{
				IDC="1031 + (5 * 4)";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
			class UAV_Frame_5_3: UAV_Frame_5_1
			{
				IDC="1032 + (5 * 4)";
				y="(0.55) + 					 0.034*1 * 8 + 					 0.034*1 - 	0.003";
			};
			class UAV_Frame_5_4: UAV_Frame_5_1
			{
				IDC="1033 + (5 * 4)";
				x="safezoneX + 	(0.015) + 0.06 * 						 0.034*1*30";
				w="0.003 * safezoneH * 3/4";
				h="0.034*1";
			};
		};
	};
	class rscAAN
	{
		idd=3000;
		fadein=0;
		fadeout=0;
		duration=9.9999998e+010;
		onLoad="uinamespace setvariable ['BIS_AAN',_this select 0]";
		onUnLoad="uinamespace setvariable ['BIS_AAN',nil]";
		class ControlsBackground
		{
			class BackgroundBarWhite: RscText
			{
				x="safezoneX";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH";
				w="safezoneW";
				h="0.0425 * safezoneH";
				colorBackground[]={1,1,1,1};
			};
			class BackgroundBarRed: BackgroundBarWhite
			{
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
				h="0.1275 * safezoneH";
				colorBackground[]=
				{
					0.28999999,
					0,
					0,
					"0.6*2"
				};
			};
		};
		class Controls
		{
			class AANlogo_corner: RscPicture
			{
				x="safezoneX + safezoneW - (	0.1275 * safezoneH * 6/4)";
				y="safezoneY";
				w="0.1275 * safezoneH * 6/4";
				h="0.1275 * safezoneH";
				colorText[]={1,1,1,0.30000001};
				text="\ca\ui\data\ui_rsctitle_AAN_logo_corner_ca.paa";
			};
			class AANlogo: RscPicture
			{
				x="safezoneX";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
				w="0.1275 * safezoneH * 3";
				h="0.1275 * safezoneH";
				colorText[]={1,1,1,1};
				text="\ca\ui\data\ui_rsctitle_AAN_logo_ca.paa";
			};
			class TextHeader: RscStructuredText
			{
				idc=3001;
				x="safezoneX + (	0.1275 * safezoneH * 2.5)";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH + 	0.1275 * safezoneH * 0.1";
				w="safezoneW - (	0.1275 * safezoneH * 2.5)";
				h="0.1275 * safezoneH - 	0.1275 * safezoneH * 0.2";
				colorText[]={1,1,1,1};
				style="0x00 + 0x10";
				shadow=0;
				size="(				 0.03921 / 1.17647) * safezoneH";
				class Attributes
				{
					font="Zeppelin32";
					color="#ffffff";
					align="left";
					shadow=0;
					valign="top";
				};
			};
			class TextLine: TextHeader
			{
				idc=3002;
				x="safezoneX";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH + 0.005";
				w=1000;
				h="0.0425 * safezoneH";
				colorText[]={0,0,0,1};
				shadow=0;
				class Attributes
				{
					color="#000000";
					align="left";
					shadow=0;
					valign="top";
				};
			};
			class TextClock: RscText
			{
				idc=3003;
				style=2;
				x="safezoneX + safezoneW - 0.15";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH";
				w=0.15000001;
				h="0.0425 * safezoneH";
				colorText[]={1,1,1,1};
				colorBackground[]={0.1,0.1,0.1,1};
				sizeEx="0.0425 * safezoneH";
				shadow=0;
			};
			class BackgroundBlackLeft: RscText
			{
				x="safezoneXAbs";
				y="safezoneY";
				w="(safezoneWAbs - safezoneW) / 2";
				h="safezoneH";
				colorBackground[]={0,0,0,1};
			};
			class BackgroundBlackRight: BackgroundBlackLeft
			{
				x="safezoneX + safezoneW";
			};
		};
	};
	class rscAANnews
	{
		idd=3001;
		fadein=0;
		fadeout=0;
		duration=9.9999998e+010;
		onLoad="uinamespace setvariable ['BIS_AAN_news',_this select 0]";
		onUnLoad="uinamespace setvariable ['BIS_AAN_news',nil]";
		class ControlsBackground
		{
			class BackgroundLeftRed: RscText
			{
				idc=300110;
				x="safezoneX";
				y="safezoneY";
				h="safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
				w="safezoneW * 0.5";
				colorbackground[]={0.28999999,0,0,0.5};
			};
			class BackgroundLeftRedGradient: RscPicture
			{
				idc=300111;
				x="safezoneX";
				y="safezoneY";
				h="safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
				w="safezoneW * 0.5";
				colortext[]={0.28999999,0,0,0.5};
				text="ca\ui\data\ui_gradient_right_gs.paa";
			};
			class BackgroundRightRed: RscText
			{
				idc=300112;
				x="safezoneX + safezoneW - 	(	(0.22 * safezoneH) * 3/4)";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - 		(	(0.22 * safezoneH) + 0.08 * safezoneH)";
				h="(	(0.22 * safezoneH) + 0.08 * safezoneH)";
				w="(	(0.22 * safezoneH) * 3/4)";
				colorbackground[]={0.28999999,0,0,0.5};
			};
			class BackgroundRightRedGradient: RscPicture
			{
				idc=300113;
				x="safezoneX + safezoneW - 	(	(0.22 * safezoneH) * 3/4)";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - 		(	(0.22 * safezoneH) + 0.08 * safezoneH)";
				h="(	(0.22 * safezoneH) + 0.08 * safezoneH)";
				w="(	(0.22 * safezoneH) * 3/4)";
				colortext[]={0.28999999,0,0,0.5};
				text="ca\ui\data\ui_gradient_left_gs.paa";
			};
		};
		class controls
		{
			class PictureL1: RscPicture
			{
				idc=300101;
				x="safezoneX + safezoneW * 0.02";
				y="safezoneY + (safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - (safezoneW * 0.46 * 4/3))/2";
				w="safezoneW * 0.46";
				h="safezoneW * 0.46 * 4/3";
				text="";
			};
			class PictureL2: PictureL1
			{
				idc=300102;
			};
			class PictureL3: PictureL1
			{
				idc=300103;
			};
			class PictureL4: PictureL1
			{
				idc=300104;
			};
			class PictureL5: PictureL1
			{
				idc=300105;
			};
			class PictureL6: PictureL1
			{
				idc=300106;
			};
			class PictureR1: RscPicture
			{
				idc=300107;
				x="safezoneX + safezoneW - 	(	(0.22 * safezoneH) * 3/4)";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - 	(0.22 * safezoneH)";
				w="(	(0.22 * safezoneH) * 3/4)";
				h="(0.22 * safezoneH)";
				text="";
			};
			class TextL1: RscStructuredText
			{
				idc=300108;
				x="safezoneX + safezoneW * 0.02";
				y="safezoneY + (safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - (safezoneW * 0.46 * 4/3))/2";
				w="safezoneW * 0.46";
				h="safezoneW * 0.46 * 4/3";
				colorText[]={1,1,1,1};
				style="0x00 + 0x10";
				shadow=0;
				class Attributes
				{
					font="Zeppelin32";
					color="#ffffff";
					align="left";
					shadow=0;
					valign="top";
				};
			};
			class TextR1: RscStructuredText
			{
				idc=300109;
				x="safezoneX + safezoneW - (	(	(0.22 * safezoneH) * 3/4)) * 0.95";
				y="safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH - (		(	(0.22 * safezoneH) + 0.08 * safezoneH)) + 0.01";
				w="(	(0.22 * safezoneH) * 3/4) * 0.9";
				h="(	(0.22 * safezoneH) + 0.08 * safezoneH) - 	(0.22 * safezoneH)";
				colorText[]={1,1,1,1};
				style="0x00 + 0x10";
				shadow=0;
				size="(0.025) * safezoneH";
				class Attributes
				{
					font="Zeppelin32";
					color="#ffffff";
					align="left";
					shadow=0;
					valign="top";
				};
			};
		};
	};
	class rscInfoText
	{
		idd=3100;
		fadein=0;
		fadeout=0;
		duration=9.9999998e+010;
		onLoad="uinamespace setvariable ['BIS_InfoText',_this select 0]";
		onUnLoad="uinamespace setvariable ['BIS_InfoText',nil]";
		class Controls
		{
			class InfoText: RscText
			{
				idc=3101;
				style="0x01 + 0x10 + 0x200 + 0x100";
				font="EtelkaMonospaceProBold";
				x="safezoneX + safezoneW - 0.7";
				y="safezoneY + safezoneH - 0.33";
				w=0.60000002;
				h=0.15000001;
				colorText[]={1,1,1,1};
				colorBackground[]={0,0,0,0};
				text="";
				lineSpacing=1;
				sizeEx=0.045000002;
				fixedWidth=1;
			};
		};
	};
	class rscDynamicText
	{
		idd=-1;
		movingEnable=1;
		duration=9.9999998e+010;
		fadein=0;
		fadeout=0;
		name="Info";
		onload="uinamespace setvariable ['BIS_dynamicText',_this select 0];";
		class controls
		{
			class Text: RscStructuredText
			{
				idc=9999;
				style="1 + 16";
				text="";
				x=0;
				y=0.44999999;
				w=1;
				h=10000;
				colorText[]={1,1,1,1};
				colorBackground[]={0,0,0,0};
				size="(0.05 / 1.17647) * safezoneH";
				sizeEx=0.40000001;
				class Attributes
				{
					font="TahomaB";
					color="#ffffff";
					align="center";
					shadow=0;
					valign="top";
				};
			};
		};
	};
	class RscCinemaBorder: RscDisplayBackgroundStripes
	{
		idd=-1;
		movingEnable=0;
		enableSimulation=1;
		duration=9.9999998e+010;
		fadein=0;
		fadeout=0;
		name="Cinema Border";
		class controlsBackground
		{
			class Background1: RscBackgroundStripeTop
			{
				colorBackground[]={0,0,0,1};
			};
			class Background2: RscBackgroundStripeBottom
			{
				colorBackground[]={0,0,0,1};
			};
		};
	};
	class RscMissionScreen
	{
		idd=-1;
		movingEnable=1;
		duration=9.9999998e+010;
		fadein=0;
		fadeout=1;
		name="Screen";
		onload="uinamespace setvariable ['BIS_RscMissionScreen',_this select 0];";
		class controls
		{
			class Picture_0: RscPicture
			{
				idc=1100;
				text="";
				x="safezoneX";
				y="safezoneY";
				w="safezoneW";
				h="safezoneH";
				autoplay=1;
				loops=1;
			};
			class Picture_1: Picture_0
			{
				idc=1101;
			};
			class Picture_2: Picture_0
			{
				idc=1102;
			};
			class Picture_3: Picture_0
			{
				idc=1103;
			};
			class Picture_4: Picture_0
			{
				idc=1104;
			};
			class Picture_5: Picture_0
			{
				idc=1105;
			};
			class Picture_6: Picture_0
			{
				idc=1106;
			};
			class Picture_7: Picture_0
			{
				idc=1107;
			};
			class Picture_8: Picture_0
			{
				idc=1108;
			};
			class Picture_9: Picture_0
			{
				idc=1109;
			};
			class Picture_10: Picture_0
			{
				idc=1110;
			};
			class Picture_11: Picture_0
			{
				idc=1111;
			};
			class Picture_12: Picture_0
			{
				idc=1112;
			};
			class Picture_13: Picture_0
			{
				idc=1113;
			};
			class Picture_14: Picture_0
			{
				idc=1114;
			};
			class Picture_15: Picture_0
			{
				idc=1115;
			};
			class Picture_16: Picture_0
			{
				idc=1116;
			};
			class Picture_17: Picture_0
			{
				idc=1117;
			};
			class Picture_18: Picture_0
			{
				idc=1118;
			};
			class Picture_19: Picture_0
			{
				idc=1119;
			};
			class Picture_20: Picture_0
			{
				idc=1120;
			};
			class Picture_21: Picture_0
			{
				idc=1121;
			};
			class Picture_22: Picture_0
			{
				idc=1122;
			};
			class Picture_23: Picture_0
			{
				idc=1123;
			};
			class Picture_24: Picture_0
			{
				idc=1124;
			};
			class Picture_25: Picture_0
			{
				idc=1125;
			};
			class Picture_26: Picture_0
			{
				idc=1126;
			};
			class Picture_27: Picture_0
			{
				idc=1127;
			};
			class Picture_28: Picture_0
			{
				idc=1128;
			};
			class Picture_29: Picture_0
			{
				idc=1129;
			};
			class Picture_30: Picture_0
			{
				idc=1130;
			};
			class Picture_31: Picture_0
			{
				idc=1131;
			};
			class Picture_32: Picture_0
			{
				idc=1132;
			};
			class Picture_33: Picture_0
			{
				idc=1133;
			};
			class Picture_34: Picture_0
			{
				idc=1134;
			};
			class Picture_35: Picture_0
			{
				idc=1135;
			};
			class Picture_36: Picture_0
			{
				idc=1136;
			};
			class Picture_37: Picture_0
			{
				idc=1137;
			};
			class Picture_38: Picture_0
			{
				idc=1138;
			};
			class Picture_39: Picture_0
			{
				idc=1139;
			};
			class Picture_40: Picture_0
			{
				idc=1140;
			};
			class Picture_41: Picture_0
			{
				idc=1141;
			};
			class Picture_42: Picture_0
			{
				idc=1142;
			};
			class Picture_43: Picture_0
			{
				idc=1143;
			};
			class Picture_44: Picture_0
			{
				idc=1144;
			};
			class Picture_45: Picture_0
			{
				idc=1145;
			};
			class Picture_46: Picture_0
			{
				idc=1146;
			};
			class Picture_47: Picture_0
			{
				idc=1147;
			};
			class Picture_48: Picture_0
			{
				idc=1148;
			};
			class Picture_49: Picture_0
			{
				idc=1149;
			};
			class Picture_50: Picture_0
			{
				idc=1150;
			};
			class PictureShadow_0: Picture_0
			{
				idc=1200;
				shadow=2;
			};
			class PictureShadow_1: PictureShadow_0
			{
				idc=1201;
			};
			class PictureShadow_2: PictureShadow_0
			{
				idc=1202;
			};
			class PictureShadow_3: PictureShadow_0
			{
				idc=1203;
			};
			class PictureShadow_4: PictureShadow_0
			{
				idc=1204;
			};
			class PictureShadow_5: PictureShadow_0
			{
				idc=1205;
			};
			class PictureShadow_6: PictureShadow_0
			{
				idc=1206;
			};
			class PictureShadow_7: PictureShadow_0
			{
				idc=1207;
			};
			class PictureShadow_8: PictureShadow_0
			{
				idc=1208;
			};
			class PictureShadow_9: PictureShadow_0
			{
				idc=1209;
			};
			class Text_0: RscStructuredText
			{
				idc=1300;
				text="";
				x="safezoneX";
				y="safezoneY";
				w="safezoneW";
				h="safezoneH";
			};
			class Text_1: Text_0
			{
				idc=1301;
			};
			class Text_2: Text_0
			{
				idc=1302;
			};
			class Text_3: Text_0
			{
				idc=1303;
			};
			class Text_4: Text_0
			{
				idc=1304;
			};
			class Text_5: Text_0
			{
				idc=1305;
			};
			class Text_6: Text_0
			{
				idc=1306;
			};
			class Text_7: Text_0
			{
				idc=1307;
			};
			class Text_8: Text_0
			{
				idc=1308;
			};
			class Text_9: Text_0
			{
				idc=1309;
			};
		};
	};
	class RscUnitInfoKa137
	{
		idd=-1;
		duration=9.9999998e+010;
		fadein=0;
		name="UAV Heli";
		movingEnable=1;
		onload="uinamespace setvariable ['BIS_UAV_HELI_DISPLAY',_this select 0]";
		onunload="uinamespace setvariable ['BIS_UAV_HELI_DISPLAY',nil]";
		class controls
		{
			class RscTextUAV: RscText
			{
				x=-10;
				y=-10;
				w=30;
				h=30;
				colorbackground[]={0.82749999,0.81959999,0.1961,0.07};
				type=0;
				IDC=1004;
				linespacing=1;
				text="";
				style="0x00 + 0x10 + 0x200";
			};
			class GV1: RscTextUAV
			{
				x="safezoneX + safezoneW * 0.1";
				y="safezoneY";
				w="0.001 * safezoneH * (3/4)";
				h="safezoneH";
				colorbackground[]={0.82749999,0.81959999,0.1961,0.07};
			};
			class GV2: GV1
			{
				x="safezoneX + safezoneW * 0.2";
			};
			class GV3: GV1
			{
				x="safezoneX + safezoneW * 0.3";
			};
			class GV4: GV1
			{
				x="safezoneX + safezoneW * 0.4";
			};
			class GV5: GV1
			{
				x="safezoneX + safezoneW * 0.5";
			};
			class GV6: GV1
			{
				x="safezoneX + safezoneW * 0.6";
			};
			class GV7: GV1
			{
				x="safezoneX + safezoneW * 0.7";
			};
			class GV8: GV1
			{
				x="safezoneX + safezoneW * 0.8";
			};
			class GV9: GV1
			{
				x="safezoneX + safezoneW * 0.9";
			};
			class GH1: GV1
			{
				x="safezoneX";
				y="safezoneY + safezoneH * 0.1";
				w="safezoneW";
				h="0.001 * safezoneH";
			};
			class GH2: GH1
			{
				y="safezoneY + safezoneH * 0.2";
			};
			class GH3: GH1
			{
				y="safezoneY + safezoneH * 0.3";
			};
			class GH4: GH1
			{
				y="safezoneY + safezoneH * 0.4";
			};
			class GH5: GH1
			{
				y="safezoneY + safezoneH * 0.5";
			};
			class GH6: GH1
			{
				y="safezoneY + safezoneH * 0.6";
			};
			class GH7: GH1
			{
				y="safezoneY + safezoneH * 0.7";
			};
			class GH8: GH1
			{
				y="safezoneY + safezoneH * 0.8";
			};
			class GH9: GH1
			{
				y="safezoneY + safezoneH * 0.9";
			};
			class UAV_Cross: RscPictureKeepAspect
			{
				x="0.5 - (0.08 * safezoneH)";
				y="0.5 - (0.08 * safezoneH)";
				w="0.16 * safezoneH * 0";
				h="0.16 * safezoneH * 0";
				text="ca\ui\data\cursor_uav_heli_gs.paa";
				colorText[]={0.82749999,0.81959999,0.1961,1};
				idc=1001;
				type=0;
				colorbackground[]={0,0,0,0};
				font="EtelkaMonospaceProBold";
				sizeEx=0;
			};
			class UAV_Laser: UAV_Cross
			{
				idc=1002;
				text="ca\ui\data\cursor_w_view_gs.paa";
			};
			class UAV_Target: UAV_Cross
			{
				idc=1003;
				x=0.20999999;
				y=0.20999999;
				w="0.08 * safezoneH";
				h="0.08 * safezoneH";
				text="ca\ui\data\cursor_w_target_gs.paa";
			};
			class UAV_Heli: UAV_Cross
			{
				idc=1006;
				text="ca\ui\data\cursor_w_grenade_gs.paa";
				w=0;
				h=0;
			};
			class UAV_Missile: UAV_Cross
			{
				idc=1007;
				text="ca\ui\data\cursor_uav_heli_lock_gs.paa";
			};
			class UAV_Missile_Red: UAV_Missile
			{
				idc=1008;
				colorText[]={0.70599997,0.074500002,0.0196,1};
			};
		};
	};
};
class RscGroupRootMenu;
class RscDisplayMainMap
{
	saveParams=1;
	class controlsBackground
	{
		delete Map;
		class CA_Black: CA_Black_Back
		{
		};
		class CA_Map: RscMapControl
		{
			x="SafeZoneXAbs";
			y="SafeZoneY";
			w="SafeZoneWAbs";
			h="SafeZoneH";
		};
	};
	class controls
	{
		delete DiaryIndex;
		delete DiaryAdd;
		delete DiarySort;
		delete DiaryFilter;
		delete Diary;
		class CA_MainBackground: IGUIBack
		{
			idc=1020;
			x="SafeZoneX + 0.010 * SafeZoneW";
			y="SafeZoneY + 0.031";
			w="0.98*SafeZoneW";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_TopicsBackground: IGUIBack
		{
			idc=1021;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.146*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_SubTopicsBackground: IGUIBack
		{
			idc=1022;
			x="0.16*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.283*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_ContentBackground: IGUIBack
		{
			idc=1023;
			x="0.446*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="SafeZoneW * 0.544";
			h=0.83200002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_PlayerName: RscIGUIText
		{
			idc=111;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_PLAYER_NAME";
		};
		class CA_PlayerRank: RscIGUIText
		{
			idc=116;
			style=2;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class CA_MissionName: RscText
		{
			idc=112;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_MISSION_NAME";
		};
		class CA_CurrentTaskLabel: RscText
		{
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			text="$STR_DIARY_CURRENT_TASK";
		};
		class CA_CurrentTask: RscText
		{
			idc=113;
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="0.96*SafeZoneW";
			h=0.041000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class DiaryList: RscIGUIListBox
		{
			idc=1001;
			onLBSelChanged="[_this select 0, _this select 1, 'List'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';       private ['_dummy']; _dummy = [_this,'onLBSelChanged'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
			default=1;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.146*SafeZoneW";
			h=0.60000002;
		};
		class CA_DiaryIndex: RscIGUIListBox
		{
			idc=1002;
			onLBSelChanged="[_this select 0, _this select 1, 'Index'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';";
			default=0;
			x="0.16*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.283*SafeZoneW";
			h=0.60000002;
			sizeEx=0.034000002;
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc=1013;
			x="0.446*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.534*SafeZoneW";
			h=0.71799999;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.0099999998;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Diary: RscHTML
				{
					idc=1003;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
			};
		};
		class HC_tooltip_back: IGUIBack
		{
			idc=1124;
			x=0;
			y=0;
			w=0;
			h=0;
			colorBackground[]={0.2,0.15000001,0.1,0.80000001};
		};
		class HC_tooltip_text: RscStructuredText
		{
			idc=1125;
			x=0;
			y=0;
			w=0;
			h=0;
			size=0.035;
			class Attributes
			{
				font="Zeppelin32";
				color="#B6F862";
				align="left";
				shadow=1;
			};
		};
	};
	class objects
	{
		class Watch: RscObject
		{
			model="\ca\ui\Watch.p3d";
			x=0.079999998;
			xBack=0.40000001;
			y=0.92500001;
			yBack=0.5;
			z=0.20999999;
			zBack=0.11;
			enableZoom=1;
			direction[]={0,1,7.1999998};
			up[]={0,0,-1};
			scale=0.40000001;
		};
		class Compass: RscObject
		{
			model="\ca\ui\Compass.p3d";
			selectionArrow="";
			x=0.16;
			xBack=0.60000002;
			y=0.92500001;
			yBack=0.5;
			z=0.2;
			zBack=0.1;
			enableZoom=1;
			direction[]={1,0,0};
			up[]={0,1,0};
			scale=0.34999999;
		};
		class GPS: RscObject
		{
			model="\ca\ui\gps.p3d";
			x=0.36000001;
			xBack=0.69999999;
			y=0.92500001;
			yBack=0.5;
			z=0.22;
			zBack=0.12;
			scale=0.30000001;
			class Areas
			{
				class Display
				{
					class controls
					{
						class GPSSquare: RscText
						{
							idc=75;
							x=0;
							y=0.56;
							w=1;
							h=0.5;
							colorText[]={0.2314,0.2588,0.1373,1};
							sizeEx=0.40000001;
						};
						class GPS_ALT: RscText
						{
							idc=77;
							x=0.25;
							y=0.31;
							w=1;
							h=0.30000001;
							colorText[]={0.2314,0.2588,0.1373,1};
							sizeEx=0.23;
						};
						class GPS_Heading: RscText
						{
							idc=78;
							x=0.25;
							y=0.072999999;
							w=1;
							h=0.30000001;
							colorText[]={0.2314,0.2588,0.1373,1};
							sizeEx=0.23;
						};
					};
				};
			};
		};
		class WalkieTalkie: RscObject
		{
			model="\ca\ui\radio.p3d";
			x=0.56;
			xBack=0.80000001;
			y=0.92500001;
			yBack=0.5;
			z=0.22;
			zBack=0.12;
			scale=0.15000001;
			class Areas
			{
				class Papir
				{
					class controls
					{
						class RscRadioText: RscActiveText
						{
							sizeEx=0.17;
							x=0.0049999999;
							y=0.02;
							h=0.1;
						};
						class RadioAlpha: RscRadioText
						{
							y=0.050000001;
						};
						class RadioBravo: RscRadioText
						{
							y=0.17;
						};
						class RadioCharlie: RscRadioText
						{
							y=0.28999999;
						};
						class RadioDelta: RscRadioText
						{
							y=0.41;
						};
						class RadioEcho: RscRadioText
						{
							y=0.52999997;
						};
						class RadioFoxtrot: RscRadioText
						{
							y=0.64999998;
						};
						class RadioGolf: RscRadioText
						{
							y=0.76999998;
						};
						class RadioHotel: RscRadioText
						{
							y=0.88999999;
						};
						class RadioIndia: RscRadioText
						{
							y=1.01;
						};
						class RadioJuliet: RscRadioText
						{
							y=1.13;
						};
					};
				};
			};
		};
	};
};
class RscDisplayDiary
{
	idd=129;
	movingEnable=0;
	class Controls
	{
		delete Diary;
		delete DiaryIndex;
		delete B_Quit;
		delete B_Add;
		delete DiaryPage;
		delete DiaryTitle;
		delete DiaryBackground;
		class CA_MainBackground: IGUIBack
		{
			idc=1020;
			x="SafeZoneX + 0.010 * SafeZoneW";
			y="SafeZoneY + 0.031";
			w="0.98*SafeZoneW";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_TopicsBackground: IGUIBack
		{
			idc=1021;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.146*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_SubTopicsBackground: IGUIBack
		{
			idc=1022;
			x="0.16*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.283*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_ContentBackground: IGUIBack
		{
			idc=1023;
			x="0.446*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="SafeZoneW * 0.544";
			h=0.83200002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_PlayerName: RscIGUIText
		{
			idc=111;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_PLAYER_NAME";
		};
		class CA_PlayerRank: RscIGUIText
		{
			idc=116;
			style=2;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class CA_MissionName: RscText
		{
			idc=112;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_MISSION_NAME";
		};
		class CA_CurrentTaskLabel: RscText
		{
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			text="$STR_DIARY_CURRENT_TASK";
		};
		class CA_CurrentTask: RscText
		{
			idc=113;
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="0.96*SafeZoneW";
			h=0.041000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class DiaryList: RscIGUIListBox
		{
			idc=1001;
			onLBSelChanged="[_this select 0, _this select 1, 'List'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';       private ['_dummy']; _dummy = [_this,'onLBSelChanged'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
			default=1;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.146*SafeZoneW";
			h=0.60000002;
		};
		class CA_DiaryIndex: RscIGUIListBox
		{
			idc=1002;
			onLBSelChanged="[_this select 0, _this select 1, 'Index'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';";
			default=0;
			x="0.16*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.283*SafeZoneW";
			h=0.60000002;
			sizeEx=0.034000002;
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc=1013;
			x="0.446*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.534*SafeZoneW";
			h=0.71799999;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.0099999998;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Diary: RscHTML
				{
					idc=1003;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
			};
		};
	};
};
class RscDisplayEditDiaryRecord
{
	idd=125;
	movingEnable=1;
	class controlsBackground
	{
		class CA_Background: CA_Mainback
		{
			moving=1;
			x=0.456;
			y=0.101;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\igui_background_addrecord_ca.paa";
			colorText[]={1,1,1,1};
		};
	};
	class Controls
	{
		delete RecordBackground;
		delete RecordTitle;
		delete Record;
		delete Title;
		delete B_Cancel;
		delete B_OK;
		class CA_EditTitle: RscEdit
		{
			idc=102;
			style="0x00 + 0x200";
			x=0.48100001;
			y=0.12899999;
			w=0.419;
			h=0.028999999;
		};
		class CA_Record: RscEdit
		{
			idc=101;
			style="0x10 + 0x200";
			x=0.48100001;
			y=0.186;
			w=0.419;
			h=0.23899999;
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			x=0.71424901;
			y=0.435;
			w=0.2;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			x=0.474444;
			y=0.435;
			w=0.2;
			default=0;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplaySingleplayer
{
	idd=140;
	movingEnable=1;
	enableSimulation=1;
	enableDisplay=1;
	onLoad="private [""_handle""]; _handle = [_this] call compile preprocessFile	""\ca\ui\scripts\armory\enableArmory.sqf"";";
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete B_Back;
		delete B_Training;
		delete B_MissionEditor;
		delete B_SingleMission;
		delete B_Campaign;
		class CA_EditProfileTitle: CA_Title
		{
			x=0.134;
			y=0.192;
			text="$STR_DISP_MAIN_SINGLE_PLAYER";
		};
		class CA_Campaign: RscShortcutButtonMain
		{
			idc=104;
			default=0;
			x=0.097999997;
			y=0.25369999;
			action="";
			text="$STR_DISP_MAIN_XBOX_CAMPAIGN";
			toolTip="$STR_TOOLTIP_SINGLEPLAYER_CAMPAIGN";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Missions: CA_Campaign
		{
			idc=103;
			x=0.097999997;
			y=0.35451901;
			action="";
			default=0;
			text="$STR_DISP_MAIN_SINGLE";
			toolTip="$STR_TOOLTIP_SINGLEPLAYER_MISSIONS";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Training: CA_Campaign
		{
			idc=101;
			x=0.097999997;
			y=0.455421;
			action="_displayParent = findDisplay 140; _displayMission = _displayParent createMissionDisplay ["""",""tutorial""]; ";
			default=1;
			text="$STR_DISP_MAIN_TRAINING";
			toolTip="$STR_TOOLTIP_SINGLEPLAYER_TRAINING";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Library: CA_Campaign
		{
			idc=1108;
			x=0.097999997;
			y=0.55732399;
			default=0;
			onButtonClick="_dummy = _this execVM ""\ca\ui\scripts\armory\launchArmory.sqf"" ";
			action="";
			text="$STR_CA_MAIN_LIBRARY";
			toolTip="$STR_TOOLTIP_SINGLEPLAYER_LIBRARY";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Editor: CA_Campaign
		{
			idc=102;
			default=0;
			x=0.097999997;
			y=0.65799999;
			action="";
			text="$STR_CA_MAIN_CUSTOM";
			toolTip="$STR_TOOLTIP_SINGLEPLAYER_EDITOR";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class HintX_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.26499999;
			y=0.78399998;
			w=0.22059;
			h=0.1045752;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.236;
			y=0.76249999;
			w=0.16176599;
			h=0.1045752;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayLogin: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_background_profile_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete B_Delete;
		delete B_Edit;
		delete B_New;
		delete TextUser;
		delete ValueUser;
		delete Title;
		class Title1: CA_Title
		{
			text="$STR_CA_LOGIN_TITLE";
			x=0.134;
			y=0.192;
		};
		class ValueUser2: RscListBox
		{
			idc=101;
			x=0.107;
			y=0.271;
			w=0.361;
			h=0.49000001;
			rows=10;
			Style=16;
		};
		class BX_New: RscShortcutButton
		{
			idc=102;
			x=0.48100001;
			y=0.55000001;
			text="$STR_CA_NEW";
		};
		class BX_Edit: RscShortcutButton
		{
			default=0;
			x=0.48100001;
			y=0.61000001;
			idc=104;
			text="$STR_CA_EDIT";
		};
		class BX_Delete: RscShortcutButton
		{
			default=0;
			x=0.48100001;
			y=0.67000002;
			idc=103;
			text="$STR_CA_DELETE";
		};
		class BX_Ok: RscShortcutButton
		{
			default=1;
			idc=1;
			x=0.48100001;
			y=0.76249999;
			text="$STR_DISP_OK";
		};
		class BX_Cancel: RscShortcutButton
		{
			default=0;
			x=0.28099999;
			y=0.76249999;
			idc=2;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayModLauncher: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_modlauncher_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete B_Up;
		delete B_Down;
		delete B_DisableEnable;
		delete B_ModAction;
		delete Title;
		delete ModPicture;
		delete ValueMods;
		class CA__Title: CA_Title
		{
			text="$STR_DISP_EXPANSIONS";
			x=0.134;
			y=0.192;
		};
		class CA_ValueMods: RscListBox
		{
			idc=101;
			x=0.107;
			y=0.271;
			w=0.58200002;
			h=0.49000001;
			rows=10;
			Style=16;
			active="ca\ui\data\ui_mission_done.paa";
			enabled="ca\ui\data\ui_mission_current.paa";
			disabled="ca\ui\data\ui_mission_created_ca.paa";
		};
		class CA_ModPicture: RscPicture
		{
			idc=102;
			x=0.705621;
			y=0.27998;
			w=0.175;
			h=0.233;
			text="#(argb,8,8,3)color(1,1,1,1)";
		};
		class CA_B_Up: RscShortcutButton
		{
			idc=103;
			x=0.70599997;
			y=0.55000001;
			text="$STR_MOD_LAUNCHER_UP";
		};
		class CA_B_Down: RscShortcutButton
		{
			default=0;
			x=0.70599997;
			y=0.61000001;
			idc=104;
			text="$STR_MOD_LAUNCHER_DOWN";
		};
		class CA_B_DisableEnable: RscShortcutButton
		{
			default=0;
			x=0.70599997;
			y=0.67000002;
			idc=105;
			text="$STR_ENABLE_CONTROLLER";
		};
		class CA_Cancel: RscShortcutButton
		{
			default=0;
			x=0.26416999;
			y=0.76249999;
			idc=2;
			text="$STR_CA_CANCEL";
		};
		class CA_Ok: RscShortcutButton
		{
			default=1;
			idc=1;
			x=0.70599997;
			y=0.76249999;
			text="$STR_DISP_OK";
		};
		class CA_ModAction: RscShortcutButton
		{
			idc=106;
			default=0;
			x=0.46417001;
			y=0.76249999;
			w=0.23;
			text="$STR_MOD_LAUNCHER_ACTION";
		};
	};
};
class RscDisplayNewUser: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_newprofile_background_ca.paa";
		};
	};
	class objects
	{
		class Head: RscObject
		{
			model="\ca\ui\face_preview";
			modelWoman="\ca\ui\face_preview";
			idc=106;
			type=80;
			x=0.75;
			y=0.47999999;
			z=0.25;
			xBack=0.40000001;
			yBack=0.25;
			zBack=0.30000001;
			scale=0.20999999;
			direction[]={0,0,1};
			up[]={0,1,0};
			faceType="man";
			selectionLBrow="lBrow";
			selectionMBrow="mBrow";
			selectionRBrow="rBrow";
			selectionLMouth="lMouth";
			selectionMMouth="mMouth";
			selectionRMouth="rMouth";
			selectionEyelid="eyelids";
			selectionLip="LLip";
			boneHead="head";
			boneLEye="l_eye";
			boneREye="r_eye";
			boneLEyelidUp="eye_upl";
			boneREyelidUp="eye_upr";
			boneLEyelidDown="eye_lwl";
			boneREyelidDown="eye_lwr";
			boneLPupil="l_pupila";
			boneRPupil="r_pupila";
			selectionPersonality="osobnost";
			selectionGlasses="eyelids";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete TextName;
		delete ValueName;
		delete ValueId;
		delete TextFace;
		delete ValueFace;
		delete TextGlasses;
		delete ValueGlasses;
		delete TextSpeaker;
		delete ValueSpeaker;
		delete TextPitch;
		delete ValuePitch;
		delete TextSquad;
		delete ValueSquad;
		delete Title;
		class CA_Title2: CA_Title
		{
			idc=1002;
			x=0.165948;
			y=0.19;
			text="$STR_CA_NEWUSER_TITLE2";
		};
		class CA_TextPlayer2: RscText
		{
			x=0.159803;
			y="(0.420549 + -2*0.069854)";
			text="$STR_DISP_NEW_USER_NAME";
		};
		class CA_NameValue: RscEdit
		{
			idc=101;
			x=0.35968399;
			y="(0.420549 + -2*0.069854)";
			w=0.25;
		};
		class CA_FaceText: RscText
		{
			idc=1003;
			x=0.159803;
			y="(0.420549 + -1*0.069854)";
			text="$STR_DISP_NEW_USER_FACE";
		};
		class CA_FaceValue: RscCombo
		{
			idc=102;
			x=0.35968399;
			y="(0.420549 + -1*0.069854)";
			w=0.25;
			rows=3;
		};
		class CA_GlassText: CA_FaceText
		{
			idc=1004;
			x=0.159803;
			y="(0.420549 + 0*0.069854)";
			w=0.25;
			text="$STR_DISP_NEW_USER_GLASSES";
		};
		class CA_ValueGlasses2: RscCombo
		{
			idc=107;
			x=0.35968399;
			y="(0.420549 + 0*0.069854)";
			w=0.25;
		};
		class CA_SpeakerText: CA_FaceText
		{
			idc=1005;
			x=0.159803;
			y="(0.420549 + 1*0.069854)";
			text="$STR_DISP_NEW_USER_SPEAKER";
		};
		class CA_ValueSpeaker2: RscCombo
		{
			idc=103;
			x=0.35968399;
			y="(0.420549 + 1*0.069854)";
			w=0.25;
		};
		class CA_TextPitch2: CA_FaceText
		{
			x=0.159803;
			y="(0.420549 + 2*0.069854)";
			text="$STR_DISP_NEW_USER_PITCH";
		};
		class CA_ValuePitch2: RscXSliderH
		{
			idc=104;
			x=0.35968399;
			y="(0.420549 + 2*0.069854)";
			w=0.25;
		};
		class CA_SquadText: CA_FaceText
		{
			idc=112;
			x=0.159803;
			y="(0.420549 + 3*0.069854)";
			text="$STR_DISP_NEW_USER_SQUAD";
		};
		class CA_SquadValue: CA_NameValue
		{
			idc=111;
			y="(0.420549 + 3*0.069854)";
		};
		class CA_ValueID: CA_SquadText
		{
			idc=110;
			y="(0.420549 + 4*0.069854)";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.69493502;
			y=0.76249999;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.15099999;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplaySingleMission: RscStandardDisplay
{
	none="ca\ui\data\ui_mission_empty.paa";
	done="ca\ui\data\ui_mission_done.paa";
	locked="ca\ui\data\ui_mission_locked.paa";
	package="";
	onLoad="private [""_dummy""]; _dummy = [_this,""onload""] execVM ""\ca\ui\scripts\singleMissionTopic.sqf"";";
	class controlsBackground
	{
		class SingleMissionsTitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class MissionOverviewBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class MissionOverviewBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
		};
		class MissionsListBack: RscText
		{
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class MissionsListBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete Missions;
		delete Overview;
		delete B_Cancel;
		delete B_Start;
		delete B_Continue;
		delete B_Difficulty;
		delete Title;
		class CA_SingleMissionsTitle: CA_Title
		{
			idc=106;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
		};
		class MissionsList: RscIGUIListBox
		{
			idc=101;
			style=16;
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15.5/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
			rowHeight=0.043909099;
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
		};
		class MissionOverview: RscHTML
		{
			idc=102;
			x="(4/100)	* SafeZoneW + SafeZoneX";
			y="(30/100)	* SafeZoneH + SafeZoneY";
			w="(43/100)	* SafeZoneW";
			h="(60/100)	* SafeZoneH";
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class CA_B_Difficulty: RscShortcutButton
		{
			idc=104;
			x="(5/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
		};
		class CA_B_EDIT: RscShortcutButton
		{
			idc=109;
			shortcuts[]=
			{
				"0x00050000 + 10"
			};
			x="(18/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_CA_EDIT";
		};
		class CA_B_COPY: RscShortcutButton
		{
			idc=108;
			shortcuts[]=
			{
				"0x00050000 + 11"
			};
			x="(31/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_CA_COPY";
		};
		class CA_B_DELETE: RscShortcutButton
		{
			idc=107;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x="(44/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_CA_DELETE";
		};
		class ButtonLoad: RscShortcutButton
		{
			idc=105;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x="(57/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayOptions
{
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete Audio;
		delete Configure;
		delete GameOptions;
		delete Video;
		delete B_Close;
		delete B_Credits;
		delete B_OK;
		delete Title;
		class CA_EditProfileTitle: CA_Title
		{
			x=0.134;
			y=0.192;
			text="$STR_CA_MAIN_OPTIONS";
		};
		class BVideo: RscShortcutButtonMain
		{
			idc=301;
			default=1;
			x=0.097999997;
			y=0.25369999;
			text="$STR_DISP_OPTIONS_VIDEO";
			toolTip="$STR_TOOLTIP_OPTIONS_VIDEO";
		};
		class BAudio: BVideo
		{
			idc=302;
			default=0;
			x=0.097999997;
			y=0.35451901;
			text="$STR_DISP_OPTIONS_AUDIO";
			toolTip="$STR_TOOLTIP_OPTIONS_AUDIO";
		};
		class BConfigure: BVideo
		{
			idc=303;
			default=0;
			x=0.097999997;
			y=0.455421;
			text="$STR_DISP_OPTIONS_CONFIGURE";
			toolTip="$STR_TOOLTIP_OPTIONS_CONFIGURE";
		};
		class BGameOptions: BVideo
		{
			idc=307;
			default=0;
			x=0.097999997;
			y=0.55732399;
			text="$STR_DISP_OPTIONS_GAME_OPTIONS";
			toolTip="$STR_TOOLTIP_OPTIONS_GAMEOPTIONS";
		};
		class BCredits: BVideo
		{
			idc=-1;
			default=0;
			x=0.097999997;
			y=0.65922701;
			onButtonClick="private [""_dummy""]; _dummy = [false] execVM ""\ca\ui\scripts\startCredits.sqf"";";
			action="";
			text="$STR_DISP_MAIN_CREDITS";
			toolTip="";
		};
		class HintX_Select: RscXKeyShadow
		{
			idc=1012;
			key="0x00050000 + 0";
			x=0.26499999;
			y=0.78399998;
			w=0.22059;
			h=0.1045752;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.236;
			y=0.76249999;
			w=0.16176599;
			h=0.1045752;
			text="$STR_DISP_BACK";
		};
	};
	class KeyHints
	{
		class KeyA
		{
			key="0x00050000 + 0";
			hint="";
		};
	};
};
class RscDisplayCampaignSelect: RscStandardDisplay
{
	idd=74;
	class controlsBackground
	{
		class Campaign_TitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class DescriptionBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class DescriptionBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
		};
		class CampaignsBack: RscText
		{
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class CampaignsBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete Campaigns;
		delete Campaign;
		delete Description;
		delete B_Host;
		delete B_OK;
		delete B_Cancel;
		delete Title;
		class CA_Campaign_Title: CA_Title
		{
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
			text="$STR_DISP_MAIN_XBOX_CAMPAIGN";
		};
		class CA_Campaigns: RscIGUIListBox
		{
			idc=101;
			style=16;
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
			rowHeight=0.043909099;
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
		};
		class CA_Description: RscHTML
		{
			idc=103;
			x="(4/100)	* SafeZoneW + SafeZoneX";
			y="(30/100)	* SafeZoneH + SafeZoneY";
			w="(43/100)	* SafeZoneW";
			h="(60/100)	* SafeZoneH";
			sizeEx=0.0099999998;
			colorBackground[]={1,1,1,0};
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class CA_B_Host: RscShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x="(57/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_XBOX_MP_HOST";
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayCampaignLoad: RscStandardDisplay
{
	class controlsBackground
	{
		class Camp_MissionBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class Camp_DescriptionBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class Camp_DescriptionBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
		};
		class Camp_HistoryBack: RscText
		{
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
			colorBackground[]=
			{
				"58/255",
				"53/255",
				"25/255",
				"156/255"
			};
		};
		class Camp_HistoryBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete Title;
		delete B_Next;
		delete B_Prev;
		delete Contents;
		delete History;
		delete Mission;
		delete Description;
		delete Date;
		delete Score;
		delete Duration;
		delete Casualties;
		delete Camp_BookTableItem;
		delete KillsTitle;
		delete EnemyRow;
		delete FriendlyRow;
		delete CivilianRow;
		delete InfantryColumn;
		delete SoftColumn;
		delete ArmoredColumn;
		delete AircraftColumn;
		delete TotalColumn;
		delete EInf;
		delete ESoft;
		delete EArm;
		delete EAir;
		delete ETot;
		delete FInf;
		delete FSoft;
		delete FArm;
		delete FAir;
		delete FTot;
		delete CInf;
		delete CSoft;
		delete CArm;
		delete CAir;
		delete CTot;
		delete BookTableItem;
		delete BookText;
		delete B_OK;
		delete B_Replay;
		delete B_Cancel;
		delete B_Difficulty;
		class Camp_Mission: CA_Title
		{
			idc=111;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(07/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
		};
		class Camp_History: RscIGUIListBox
		{
			idc=101;
			style=16;
			x="(51/100)	* SafeZoneW + SafeZoneX";
			y="(15.5/100)	* SafeZoneH + SafeZoneY";
			w="(47/100)	* SafeZoneW";
			h="(75/100)	* SafeZoneH";
			rowHeight=0.043909099;
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
		};
		class Camp_Description: RscHTML
		{
			idc=108;
			x="(4/100)	* SafeZoneW + SafeZoneX";
			y="(30/100)	* SafeZoneH + SafeZoneY";
			w="(43/100)	* SafeZoneW";
			h="(60/100)	* SafeZoneH";
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class Revert_Text: RscShortcutButton
		{
			idc=109;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x="(57/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
		};
		class OK_Text: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			default=1;
		};
		class Camp_B_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			default=0;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayGetReady: RscDisplayMainMap
{
	class controlsBackground
	{
		delete Background4;
		delete Background3;
		delete Background2;
		delete Background1;
		delete Map;
		class CA_Black: CA_Black_Back
		{
		};
		class CA_Map: RscMapControl
		{
		};
	};
	class controls
	{
		delete B_Cancel;
		delete B_Continue;
		delete Title;
		class CA_MainBackground: IGUIBack
		{
			idc=1020;
			x="SafeZoneX + 0.010 * SafeZoneW";
			y="SafeZoneY + 0.031";
			w="0.98*SafeZoneW";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_TopicsBackground: IGUIBack
		{
			idc=1021;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.146*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_SubTopicsBackground: IGUIBack
		{
			idc=1022;
			x="0.16*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.283*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_ContentBackground: IGUIBack
		{
			idc=1023;
			x="0.446*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="SafeZoneW * 0.544";
			h=0.83200002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_PlayerName: RscIGUIText
		{
			idc=111;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_PLAYER_NAME";
		};
		class CA_PlayerRank: RscIGUIText
		{
			idc=116;
			style=2;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class CA_MissionName: RscText
		{
			idc=112;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_MISSION_NAME";
		};
		class CA_CurrentTaskLabel: RscText
		{
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			text="$STR_DIARY_CURRENT_TASK";
		};
		class CA_CurrentTask: RscText
		{
			idc=113;
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="0.96*SafeZoneW";
			h=0.041000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class DiaryList: RscIGUIListBox
		{
			idc=1001;
			onLBSelChanged="[_this select 0, _this select 1, 'List'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';       private ['_dummy']; _dummy = [_this,'onLBSelChanged'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
			default=1;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.146*SafeZoneW";
			h=0.60000002;
		};
		class CA_DiaryIndex: RscIGUIListBox
		{
			idc=1002;
			onLBSelChanged="[_this select 0, _this select 1, 'Index'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';";
			default=0;
			x="0.16*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.283*SafeZoneW";
			h=0.60000002;
			sizeEx=0.034000002;
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc=1013;
			x="0.446*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.534*SafeZoneW";
			h=0.71799999;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.0099999998;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Diary: RscHTML
				{
					idc=1003;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
			};
		};
		class CA_ButtonsBackground: IGUIBack
		{
			idc=1026;
			x="0.010*SafeZoneW + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.887)";
			w="SafeZoneW * 0.98";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class ButtonCancel: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="0.031 + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			text="$STR_DISP_CANCEL";
		};
		class ButtonContinue: ButtonCancel
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 8"
			};
			x="((SafeZoneW + SafeZoneX) - (1 - 0.788))";
			text="$STR_DISP_CONTINUE";
		};
	};
	class KeyHints
	{
	};
};
class RscDisplayGear
{
	movingEnable=1;
	emptyGun="\ca\ui\data\ui_gear_gun_gs.paa";
	emptySec="\ca\ui\data\ui_gear_sec_gs.paa";
	emptyEq="\ca\ui\data\ui_gear_eq_gs.paa";
	emptyMag="\ca\ui\data\ui_gear_mag_gs.paa";
	emptyMag2="\ca\ui\data\ui_gear_mag2_gs.paa";
	emptyHGun="\ca\ui\data\ui_gear_hgun_gs.paa";
	emptyHGunMag="\ca\ui\data\ui_gear_hgunmag_gs.paa";
	onLoad="if (isNil('IGUI_GEAR_activeFilter')) then { IGUI_GEAR_activeFilter = 0;}; private ['_dummy']; _dummy = [_this,'initDialog'] call compile preprocessFile	'\ca\ui\scripts\handleGear.sqf'; _dummy = [_this,'onLoad'] execVM	'\ca\ui\scripts\handleGear.sqf'; _dummy;";
	class Filters
	{
		class All
		{
			name="All";
			mask=-1;
			image="\ca\ui\data\igui_gear_filter_1_ca.paa";
		};
		class Primary
		{
			name="Primary";
			mask=769;
			image="\ca\ui\data\igui_gear_filter_2_ca.paa";
		};
		class Secondary
		{
			name="Secondary";
			mask=516;
			image="\ca\ui\data\igui_gear_filter_3_ca.paa";
		};
		class HandGun
		{
			name="HandGun";
			mask=18;
			image="\ca\ui\data\igui_gear_filter_4_ca.paa";
		};
		class Items
		{
			name="Items";
			mask=135168;
			image="\ca\ui\data\igui_gear_filter_5_ca.paa";
		};
	};
	class ControlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1005;
			x=0.039999999;
			y=0.0099999998;
			w=1.254902;
			h=1.6732026;
			moving=1;
			text="\ca\ui\data\igui_background_gear_ca.paa";
		};
	};
	class controls
	{
		delete B_Close;
		delete B_Rearm;
		delete B_OpenBag;
		delete B_CloseBag;
		delete Title;
		delete SoldiersValue;
		delete Pool;
		delete Skill;
		delete Vehicle;
		delete Weapons;
		delete B_Remove;
		delete B_Add;
		class CA_Filter_Icon: RscPicture
		{
			idc=148;
			style="0x30 + 0x800";
			x=0.039999999;
			y=0.54409802;
			w=0.458;
			h=0.075000003;
			text="\ca\ui\data\igui_gear_filter_1_ca.paa";
		};
		class CA_Filter_Left_Icon: RscPicture
		{
			idc=1301;
			style="0x30 + 0x800";
			x=0.050000001;
			y=0.54509801;
			w=0.035999998;
			h=0.075000003;
			text="\ca\ui\data\arrow_left_ca.paa";
		};
		class CA_Filter_Right_Icon: RscPicture
		{
			idc=1302;
			style="0x30 + 0x800";
			x=0.45300001;
			y=0.54509801;
			w=0.035999998;
			h=0.075000003;
			text="\ca\ui\data\arrow_right_ca.paa";
		};
		class CA_Filter_Arrow_Left: RscButton
		{
			idc=150;
			colorText[]={1,1,1,0};
			colorDisabled[]={1,1,1,0};
			colorBackground[]={1,1,1,0};
			colorBackgroundDisabled[]={1,1,1,0};
			colorBackgroundActive[]={1,1,1,0};
			colorShadow[]={1,1,1,0};
			colorFocused[]={1,1,1,0};
			x=0.041000001;
			y=0.54509801;
			w=0.056000002;
			h=0.075000003;
			text="";
		};
		class CA_Filter_Arrow_Right: RscButton
		{
			idc=151;
			colorText[]={1,1,1,0};
			colorDisabled[]={1,1,1,0};
			colorBackground[]={1,1,1,0};
			colorBackgroundDisabled[]={1,1,1,0};
			colorBackgroundActive[]={1,1,1,0};
			colorShadow[]={1,1,1,0};
			colorFocused[]={1,1,1,0};
			x=0.44299999;
			y=0.54509801;
			w=0.056000002;
			h=0.075000003;
			text="";
		};
		class CA_Filter_Icon1: RscButton
		{
			idc=149;
			colorText[]={1,1,1,0};
			colorDisabled[]={1,1,1,0};
			colorBackground[]={1,1,1,0};
			colorBackgroundDisabled[]={1,1,1,0};
			colorBackgroundActive[]={1,1,1,0};
			colorShadow[]={1,1,1,0};
			colorFocused[]={1,1,1,0};
			x=0.098999999;
			y=0.54509801;
			w=0.34099999;
			h=0.075000003;
			text="";
		};
		class Gear_Title: CA_IGUI_Title
		{
			idc=1001;
			x=0.047634002;
			y=-0.0010294101;
			text="$STR_MAP_GEAR";
		};
		class Unit_Title: RscText
		{
			idc=101;
			style=2;
			x=0.50241899;
			y=0.0492156;
			w=0.456;
		};
		class Available_items_Text: RscText
		{
			idc=156;
			x=0.0433014;
			y=0.052696601;
			w=0.389709;
			h=0.029412;
		};
		class CA_ItemName: Available_items_Text
		{
			idc=1101;
			x=0.041670401;
			y=0.627451;
			text="$STR_GEAR_UNIT";
		};
		class CA_Money: RscText
		{
			idc=1102;
			style=1;
			show=0;
			x=-2.504086;
			y=-2.8578441;
			w=0.228;
			text="$STR_GEAR_MONEY";
		};
		class CA_Money_Value: RscText
		{
			idc=1103;
			x=-2.727942;
			y=-2.8578441;
			w=0.228;
			text="0";
		};
		class ListboxArrows: RscControlsGroup
		{
			x=0.039999999;
			y=0.089244701;
			w=0.47999999;
			h=0.449;
			idc=155;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_B_Add: RscGearShortcutButton
				{
					idc=146;
					x=-2;
					style=2048;
					onSetFocus="private [""_dummy""]; _dummy = [_this,""onFocus""] execVM	""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					onButtonClick="private [""_dummy""]; _dummy = [_this,""onLBListSelChanged""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					text="&lt;";
				};
				class Available_items: RscIGUIListNBox
				{
					idc=105;
					columns[]={0.075000003,0.175,0.81,0.67000002};
					drawSideArrows=1;
					idcRight=147;
					idcLeft=146;
					colorPlayerItem[]={0.87840003,0.84710002,0.65100002,1};
					onKeyDown="private [""_dummy""]; _dummy = [_this,""onKeyDown"",0,107,0,107] execVM	""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					onLBSelChanged="private [""_dummy""]; _dummy = [_this,""onLBSelChanged""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					onLBListSelChanged="private [""_dummy""]; _dummy = [_this,""onLBListSelChanged""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					onKillFocus="private [""_dummy""]; _dummy = [_this,""onKillFocus""] execVM	""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					x=0;
					y=0;
					w=0.46000001;
					h=0.449;
					canDrag=1;
				};
				class CA_B_Remove: CA_B_Add
				{
					idc=147;
					x=-2;
					onSetFocus="private [""_dummy""]; _dummy = [_this,""onFocus""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					onButtonClick="private [""_dummy""]; _dummy = [_this,""onLBListSelChanged""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
					text=">";
				};
			};
		};
		class CA_CustomDescription: RscStructuredText
		{
			idc=1106;
			x=0.041496899;
			y=0.66364098;
			w=0.458;
			h=0.152;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			class Attributes
			{
				font="Zeppelin32";
				color="#F2F2F2";
				align="left";
				shadow=1;
			};
		};
		class CA_Item_Picture: RscPicture
		{
			idc=1104;
			style="0x30 + 0x800";
			x=0.330883;
			y=0.785541;
			w=0.15686271;
			h=0.1045752;
			text="";
		};
		class G_GearItems: RscControlsGroup
		{
			idc=160;
			x=0.50199997;
			y=0.090000004;
			w=0.463;
			h=0.77600002;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Gear_slot_primary: RscActiveText
				{
					idc=107;
					x="0.502 - 0.502";
					y="0.244 - 0.09";
					w=0.28600001;
					h=0.15000001;
					style="0x30 + 0x800";
					soundDoubleClick[]=
					{
						"",
						0.1,
						1
					};
					color[]={1,1,1,1};
					colorBackground[]={0.87840003,0.84710002,0.65100002,1};
					colorBackgroundSelected[]={0.87840003,0.84710002,0.65100002,1};
					colorFocused[]={0,0,0,0};
					canDrag=1;
				};
				class CA_Gear_slot_secondary: CA_Gear_slot_primary
				{
					idc=108;
					y="0.398 -0.09";
				};
				class CA_Gear_slot_item1: CA_Gear_slot_primary
				{
					idc=109;
					x="0.790 - 0.502";
					y="0.244 - 0.09";
					w=0.055;
					h=0.074000001;
				};
				class CA_Gear_slot_item2: CA_Gear_slot_item1
				{
					idc=110;
					x="0.847 - 0.502";
					y="0.244 - 0.09";
				};
				class CA_Gear_slot_item3: CA_Gear_slot_item1
				{
					idc=111;
					x="0.904366 - 0.502";
					y="0.244 - 0.09";
				};
				class CA_Gear_slot_item4: CA_Gear_slot_item1
				{
					idc=112;
					x="0.790 - 0.502";
					y="0.321 - 0.09";
				};
				class CA_Gear_slot_item5: CA_Gear_slot_item1
				{
					idc=113;
					x="0.847 - 0.502";
					y="0.321 - 0.09";
				};
				class CA_Gear_slot_item6: CA_Gear_slot_item1
				{
					idc=114;
					x="0.904366 - 0.502";
					y="0.321 - 0.09";
				};
				class CA_Gear_slot_item7: CA_Gear_slot_item1
				{
					idc=115;
					x="0.790 - 0.502";
					y="0.398 - 0.09";
				};
				class CA_Gear_slot_item8: CA_Gear_slot_item7
				{
					idc=116;
					x="0.847 - 0.502";
					y="0.398 - 0.09";
				};
				class CA_Gear_slot_item9: CA_Gear_slot_item7
				{
					idc=117;
					x="0.904366 - 0.502";
					y="0.398 - 0.09";
				};
				class CA_Gear_slot_item10: CA_Gear_slot_item7
				{
					idc=118;
					x="0.790 - 0.502";
					y="0.474 - 0.09";
				};
				class CA_Gear_slot_item11: CA_Gear_slot_item7
				{
					idc=119;
					x="0.847 - 0.502";
					y="0.474 - 0.09";
				};
				class CA_Gear_slot_item12: CA_Gear_slot_item7
				{
					idc=120;
					x="0.904366 - 0.502";
					y="0.474 - 0.09";
				};
				class CA_Gear_slot_handgun: CA_Gear_slot_primary
				{
					idc=121;
					x="0.560 - 0.502";
					y="0.551 - 0.09";
					w=0.113;
					h=0.15000001;
				};
				class CA_Gear_slot_handgun_item1: CA_Gear_slot_item1
				{
					idc=122;
					x="0.674 - 0.502";
					y="0.551 - 0.09";
					w=0.055;
					h=0.074000001;
				};
				class CA_Gear_slot_handgun_item2: CA_Gear_slot_handgun_item1
				{
					idc=123;
					x="0.733 - 0.502";
					y="0.551 - 0.09";
				};
				class CA_Gear_slot_handgun_item3: CA_Gear_slot_handgun_item1
				{
					idc=124;
					x="0.790 - 0.502";
				};
				class CA_Gear_slot_handgun_item4: CA_Gear_slot_handgun_item1
				{
					idc=125;
					x="0.847 - 0.502";
				};
				class CA_Gear_slot_handgun_item5: CA_Gear_slot_handgun_item1
				{
					idc=126;
					x="0.674 - 0.502";
					y="0.628 - 0.09";
				};
				class CA_Gear_slot_handgun_item6: CA_Gear_slot_handgun_item5
				{
					idc=127;
					x="0.733 - 0.502";
					y="0.628 - 0.09";
				};
				class CA_Gear_slot_handgun_item7: CA_Gear_slot_handgun_item5
				{
					idc=128;
					x="0.790 - 0.502";
					y="0.628 - 0.09";
				};
				class CA_Gear_slot_handgun_item8: CA_Gear_slot_handgun_item5
				{
					idc=129;
					x="0.847 - 0.502";
					y="0.628 - 0.09";
				};
				class CA_Gear_slot_special1: CA_Gear_slot_item1
				{
					idc=130;
					x="0.502 - 0.502";
					y="0.09 - 0.09";
					w=0.113;
					h=0.15000001;
				};
				class CA_Gear_slot_special2: CA_Gear_slot_special1
				{
					idc=131;
					x="0.847 - 0.502";
					y="0.09 - 0.09";
					w=0.113;
					h=0.15000001;
				};
				class CA_Gear_slot_inventory1: CA_Gear_slot_special1
				{
					idc=134;
					x="0.560 - 0.502";
					y="0.705 - 0.09";
					w=0.055;
					h=0.074000001;
				};
				class CA_Gear_slot_inventory2: CA_Gear_slot_inventory1
				{
					idc=135;
					x="0.617 - 0.502";
					y="0.705 - 0.09";
				};
				class CA_Gear_slot_inventory3: CA_Gear_slot_inventory1
				{
					idc=136;
					x="0.674 - 0.502";
					y="0.705 - 0.09";
				};
				class CA_Gear_slot_inventory4: CA_Gear_slot_inventory1
				{
					idc=137;
					x="0.733 - 0.502";
					y="0.705 - 0.09";
				};
				class CA_Gear_slot_inventory5: CA_Gear_slot_inventory1
				{
					idc=138;
					x="0.790 - 0.502";
					y="0.705 - 0.09";
				};
				class CA_Gear_slot_inventory6: CA_Gear_slot_inventory1
				{
					idc=139;
					x="0.847 - 0.502";
					y="0.705 - 0.09";
				};
				class CA_Gear_slot_inventory7: CA_Gear_slot_inventory1
				{
					idc=140;
					x="0.560 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory8: CA_Gear_slot_inventory7
				{
					idc=141;
					x="0.617 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory9: CA_Gear_slot_inventory7
				{
					idc=142;
					x="0.674 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory10: CA_Gear_slot_inventory7
				{
					idc=143;
					x="0.733 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory11: CA_Gear_slot_inventory7
				{
					idc=144;
					x="0.790 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory12: CA_Gear_slot_inventory7
				{
					idc=145;
					x="0.847 - 0.502";
					y="0.782 - 0.09";
				};
				class CA_Gear_slot_inventory13: CA_Gear_slot_inventory7
				{
					idc=1122;
					x=10.1;
					y=10.1;
				};
			};
		};
		class BagItemsGroup: RscControlsGroup
		{
			x=0.50199997;
			y=0.090000004;
			w=0.463;
			h=0.77600002;
			idc=159;
			magW=0.055;
			magH=0.074000001;
			weaponW=0.226;
			weaponH=0.15000001;
			gunW=0.113;
			gunH=0.15000001;
			spacing=0.0020000001;
			text="";
			color[]={1,1,1,1};
			colorBackground[]={1,1,1,1};
			colorBackgroundSelected[]={1,1,1,1};
			colorFocused[]={1,1,1,1};
			soundPush[]=
			{
				"",
				0.1,
				1
			};
			soundClick[]=
			{
				"",
				0.1,
				1
			};
			soundDoubleClick[]=
			{
				"",
				0.1,
				1
			};
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class ScrollBar
			{
				color[]={1,1,1,0.60000002};
				colorActive[]={1,1,1,1};
				colorDisabled[]={1,1,1,0.30000001};
				thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
				border="\ca\ui\data\ui_border_scroll_ca.paa";
			};
			class Controls
			{
			};
		};
		class Break_7: RscLineBreak
		{
		};
		class ButtonFilters: RscIGUIShortcutButton
		{
			idc=148;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.333336;
			y=0.89706701;
			text="$STR_GEAR_FILTER";
		};
		class ButtonRearm: RscIGUIShortcutButton
		{
			idc=132;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.55474299;
			y=0.89706701;
			text="$STR_GEAR_REARM";
		};
		class ButtonOpenBag: RscIGUIShortcutButton
		{
			idc=157;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.55474299;
			y=0.89706701;
			text="$STR_GEAR_OPENBAG";
		};
		class ButtonCloseBag: RscIGUIShortcutButton
		{
			idc=158;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.55474299;
			y=0.89706701;
			text="$STR_GEAR_CLOSEBAG";
		};
		class ButtonContinue: RscIGUIShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.77614999;
			y=0.897066;
			default=1;
		};
		class ButtonClose: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.0392216;
			y=0.897066;
			text="$STR_DISP_CLOSE";
		};
	};
};
class RscDisplayBuyGear: RscDisplayGear
{
	onLoad="IGUI_GEAR_activeFilter = 0;[findDisplay 106, _buyType] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyGearMenu.sqf'";
	class ControlsBackground: ControlsBackground
	{
		class Mainback: Mainback
		{
		};
	};
	class Controls: controls
	{
		class CA_Filter_Arrow_Left_L: CA_Filter_Arrow_Left
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filter_left""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class CA_Filter_Arrow_Left_R: CA_Filter_Arrow_Right
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filterNotSet""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class CA_Filter_Left_Icont_L: CA_Filter_Left_Icon
		{
		};
		class CA_Filter_Right_Icon_R: CA_Filter_Right_Icon
		{
		};
		class Gear_Title: Gear_Title
		{
			text="$STR_client_playerrespawn.sqf0";
		};
		class Unit_Title: Unit_Title
		{
		};
		class Available_items_Text: Available_items_Text
		{
		};
		class CA_Filter_Icon: CA_Filter_Icon
		{
		};
		class CA_Filter_Icon1: CA_Filter_Icon1
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filterNotSet""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class CA_ItemName: CA_ItemName
		{
		};
		class CA_Money: CA_Money
		{
			x=0.50408602;
			y=0.857844;
		};
		class CA_Money_Value: CA_Money_Value
		{
			x=0.72794199;
			y=0.857844;
		};
		class ListboxArrows: ListboxArrows
		{
			class VScrollbar: VScrollbar
			{
			};
			class HScrollbar: HScrollbar
			{
			};
			class Controls: Controls
			{
				class CA_B_Add: CA_B_Add
				{
					idc=1027;
					onButtonClick="[_this, 'add'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
					text="&gt;";
				};
				class Available_items_pool: Available_items
				{
					idc=105;
					x=-2;
					y=-2;
				};
				class Available_items_buy: Available_items
				{
					columns[]={0,0.16,0.81,0.67000002};
					idc=1026;
					idcRight=1027;
					idcLeft=1025;
					onMouseButtonDblClick="[_this, 'add'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
					onKillFocus="";
				};
				class CA_B_Remove: CA_B_Remove
				{
					idc=1025;
					text="&lt;";
					onButtonClick="[_this, 'remove'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
				};
			};
		};
		class CA_CustomDescription: CA_CustomDescription
		{
			class Attributes
			{
			};
		};
		class CA_Item_Picture: CA_Item_Picture
		{
		};
		class G_GearItems: G_GearItems
		{
			idc=160;
			x=0.50199997;
			y=0.244;
			w="SafeZoneW + 1";
			h="SafeZoneH + 1";
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls: Controls
			{
				class CA_Gear_slot_primary: CA_Gear_slot_primary
				{
					onButtonDblClick="[_this, 'clickGearPrimary'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_secondary: CA_Gear_slot_secondary
				{
					onButtonDblClick="[_this, 'clickGearSecondary'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item1: CA_Gear_slot_item1
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item2: CA_Gear_slot_item2
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item3: CA_Gear_slot_item3
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item4: CA_Gear_slot_item4
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item5: CA_Gear_slot_item5
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item6: CA_Gear_slot_item6
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item7: CA_Gear_slot_item7
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item8: CA_Gear_slot_item8
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item9: CA_Gear_slot_item9
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item10: CA_Gear_slot_item10
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item11: CA_Gear_slot_item11
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_item12: CA_Gear_slot_item12
				{
					onButtonDblClick="[_this, 'clickGearItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun: CA_Gear_slot_handgun
				{
					onButtonDblClick="[_this, 'clickGearHandgun'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item1: CA_Gear_slot_handgun_item1
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item2: CA_Gear_slot_handgun_item2
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item3: CA_Gear_slot_handgun_item3
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item4: CA_Gear_slot_handgun_item4
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item5: CA_Gear_slot_handgun_item5
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item6: CA_Gear_slot_handgun_item6
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item7: CA_Gear_slot_handgun_item7
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_handgun_item8: CA_Gear_slot_handgun_item8
				{
					onButtonDblClick="[_this, 'clickGearHandgunItem'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_special1: CA_Gear_slot_special1
				{
					onButtonDblClick="[_this, 'clickGearSpecial'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_special2: CA_Gear_slot_special2
				{
					onButtonDblClick="[_this, 'clickGearSpecial'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory1: CA_Gear_slot_inventory1
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory2: CA_Gear_slot_inventory2
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory3: CA_Gear_slot_inventory3
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory4: CA_Gear_slot_inventory4
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory5: CA_Gear_slot_inventory5
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory6: CA_Gear_slot_inventory6
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory7: CA_Gear_slot_inventory7
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory8: CA_Gear_slot_inventory8
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory9: CA_Gear_slot_inventory9
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory10: CA_Gear_slot_inventory10
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory11: CA_Gear_slot_inventory11
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory12: CA_Gear_slot_inventory12
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
				class CA_Gear_slot_inventory13: CA_Gear_slot_inventory13
				{
					onButtonDblClick="[_this, 'clickGearInv'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'; true";
				};
			};
		};
		class Break_7: Break_7
		{
		};
		class ButtonFilters: ButtonFilters
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1]; private [""_dummy""]; _dummy = [_this,""filterNotSet""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class ButtonRearm: ButtonRearm
		{
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_BUY_GEAR_RESET";
			onButtonClick="[_this, 'reset'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
		};
		class ButtonContinue: ButtonContinue
		{
			shortcuts[]=
			{
				"0x00050000 + 0",
				28
			};
			text="$STR_BUY_GEAR_BUY";
			onButtonClick="[_this, 'buy'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
		};
		class ButtonClose: ButtonClose
		{
			shortcuts[]=
			{
				"0x00050000 + 1",
				57
			};
			onButtonClick="[_this, 'close'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
		};
	};
};
class RscDisplayBuyUnits: RscDisplayGear
{
	onLoad="[findDisplay 106, _buyType] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_buyUnitsMenu.sqf'";
	idd=1024;
	class Filters
	{
		class All
		{
			name="All";
			mask=-1;
			image="\ca\ui\data\igui_buyUnit_filter_1_ca.paa";
		};
		class Primary
		{
			name="Primary";
			mask=257;
			image="\ca\ui\data\igui_buyUnit_filter_2_ca.paa";
		};
		class Secondary
		{
			name="Secondary";
			mask=260;
			image="\ca\ui\data\igui_buyUnit_filter_3_ca.paa";
		};
		class HandGun
		{
			name="HandGun";
			mask=8128;
			image="\ca\ui\data\igui_buyUnit_filter_4_ca.paa";
		};
		class Items
		{
			name="Items";
			mask=1023;
			image="\ca\ui\data\igui_buyUnit_filter_5_ca.paa";
		};
	};
	class ControlsBackground: ControlsBackground
	{
		class Mainback: Mainback
		{
			text="\ca\ui\data\igui_background_buy_units_ca.paa";
		};
	};
	class Controls: controls
	{
		class CA_Filter_Arrow_Left_L: CA_Filter_Arrow_Left
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filter_left""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class CA_Filter_Arrow_Left_R: CA_Filter_Arrow_Right
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filterNotSet""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class CA_Filter_Left_Icont_L: CA_Filter_Left_Icon
		{
		};
		class CA_Filter_Right_Icon_R: CA_Filter_Right_Icon
		{
		};
		class Gear_Title: Gear_Title
		{
			idc=1523;
			text="$STR_client_playerrespawn.sqf1";
		};
		class Unit_Title: Unit_Title
		{
		};
		class Available_items_Text: Available_items_Text
		{
		};
		class CA_Filter_IconUnits: CA_Filter_Icon
		{
			text="\ca\ui\data\igui_buyUnit_filter_1_ca.paa";
		};
		class CA_Filter_Icon1Units: CA_Filter_Icon1
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1];	private [""_dummy""]; _dummy = [_this,""filterNotSet""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
			text="";
		};
		class CA_ItemName: CA_ItemName
		{
		};
		class CA_Money: CA_Money
		{
			x=0.50408602;
			y=0.857844;
		};
		class CA_Money_Value: CA_Money_Value
		{
			x=0.72794199;
			y=0.857844;
		};
		class ListboxArrows: ListboxArrows
		{
			x=0.039999999;
			y=0.167676;
			w=1;
			h=0.449;
			class VScrollbar: VScrollbar
			{
			};
			class HScrollbar: HScrollbar
			{
			};
			class Controls: Controls
			{
				class Available_units: Available_items
				{
					idc=1026;
					columns[]={0.07,0.345,0.81,0.67000002};
					drawSideArrows=1;
					idcRight=11025;
					idcLeft=11027;
					onKeyDown="";
					onLBSelChanged="";
					onLBListSelChanged="";
					canDrag=0;
					onMouseButtonDblClick="[_this, 'add'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
					onKillFocus="";
				};
				class Queued_units: Available_units
				{
					idc=1027;
					columns[]={0,0.75999999,0.81,0.67000002};
					drawSideArrows=0;
					onKeyDown="";
					onLBSelChanged="";
					onLBListSelChanged="";
					x=0.461;
					w=0.458;
					canDrag=0;
					onMouseButtonDblClick="[_this, 'add'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
				};
				class CA_B_Add: CA_B_Add
				{
					idc=11025;
					text="&gt;";
					onButtonClick="[_this, 'add'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
				};
			};
		};
		class ButtonFilters: ButtonFilters
		{
			OnButtonClick="lnbClear 1026; lnbAddRow [1026,[localize 'str_network_receive']]; lnbSetValue [1026,[0,0],-1]; private [""_dummy""]; _dummy = [_this,""filter""] execVM ""\ca\ui\scripts\handleGear.sqf""; _dummy;";
		};
		class ButtonContinue: ButtonContinue
		{
			shortcuts[]=
			{
				"0x00050000 + 0",
				28
			};
			x=-2;
			y=-2;
			text="$STR_BUY_GEAR_BUY";
			onButtonClick="[_this, 'buy'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
		};
		class ButtonClose: ButtonClose
		{
			shortcuts[]=
			{
				"0x00050000 + 1",
				57
			};
			onButtonClick="[_this, 'close'] execVM 'ca\Warfare2\Scripts\Client\GUI\GUI_BuyEH.sqf'";
		};
	};
};
class RscDisplayOptionsVideo
{
	idd=843;
	movingEnable=0;
	enableDisplay=1;
	onLoad="_dummy = [_this, 'CA_VO_Init'] call compile preprocessFile '\ca\ui\scripts\HideVideoOptions.sqf'; 'dynamicBlur' ppEffectAdjust [0];'dynamicBlur' ppEffectCommit 0.0;'dynamicBlur' ppEffectEnable false; _dummy = [_this, 'onMouseButtonDown'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
	onUnload="if !(isNull player) then {'dynamicBlur' ppEffectEnable true; 'dynamicBlur' ppEffectAdjust [1.6];'dynamicBlur' ppEffectCommit 0;};";
	class ControlsBackground
	{
		class VideoOptionsBackgroundGoup: RscControlsGroup
		{
			idc=1025;
			x=0;
			y=0;
			w="SafeZoneW + 1";
			h="SafeZoneH + 1";
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class Mainback: RscPicture
				{
					idc=1104;
					x=0;
					y="(SafeZoneH + SafeZoneY) - (1 - (0.384 - -0.23))";
					w=1.254902;
					h=0.83660132;
					colorText[]={1,1,1,1};
					text="\ca\ui\data\ui_background_video_ca.paa";
				};
				class ButtonsBack: RscPicture
				{
					idc=1106;
					x=0;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.675 ) - -0.23))";
					w=1.254902;
					h=0.2091503;
					text="\ca\ui\data\ui_background_video_buttons_ca.paa";
				};
			};
		};
	};
	class Controls
	{
		delete B_OK;
		delete B_Cancel;
		delete B_Default;
		delete TextRefresh;
		delete ValueRefresh;
		delete TextTextureDetail;
		delete ValueTextureDetail;
		delete TextQualityPreference;
		delete ValueQualityPreference;
		delete TextShadingDetail;
		delete ValueShadingDetail;
		delete TextShadowDetail;
		delete ValueShadowDetail;
		delete TextTerrain;
		delete ValueTerrain;
		delete TextObjectShadows;
		delete ValueObjectShadows;
		delete TextHDRDetail;
		delete ValueHDRDetail;
		delete TextVsync;
		delete ValueVsync;
		delete TextAnisotropicDetail;
		delete ValueAnisotropicDetail;
		delete TextPostprocessEffects;
		delete ValuePostprocessEffects;
		delete TextAntialiasing;
		delete ValueAntialiasing;
		delete TextWBuffer;
		delete ValueWBuffer;
		delete TextAspectRatio;
		delete ValueAspectRatio;
		delete TextResolution;
		delete ValueResolution;
		delete TextObjectsDetail;
		delete ValueObjectsDetail;
		delete TextLanguage;
		delete ValueLanguage;
		delete ValueIGUISize;
		delete TextIGUISize;
		delete Title;
		delete TextBrightness;
		delete ValueBrightness;
		delete SliderBrightness;
		delete TextGamma;
		delete ValueGamma;
		delete SliderGamma;
		delete SliderVisibility;
		delete ValueVisibility;
		delete TextVisibility;
		delete TextPPAADetail;
		delete ValuePPAADetail;
		delete TextAToCDetail;
		delete ValueAToCDetail;
		class G_VideoOptionsControls: RscControlsGroup
		{
			idc=1024;
			x=0;
			y=0;
			w="SafeZoneW + 1";
			h="SafeZoneH + 1";
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,0};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_TextBrightness: RscText
				{
					idc=217;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.53922) - -0.23))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_BRIGHT";
				};
				class CA_ValueBrightness: RscText
				{
					idc=111;
					style="0x01 + 0x100";
					x=0.426474;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.53922) - -0.23))";
					w=0.066177003;
					sizeEx=0.02674;
				};
				class CA_SliderBrightness: RscXSliderH
				{
					idc=112;
					x=0.19117799;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.53922) - -0.23))";
					w=0.227943;
				};
				class CA_TextGamma: CA_TextBrightness
				{
					idc=220;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.58824) - -0.23))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_GAMMA";
				};
				class CA_ValueGamma: CA_ValueBrightness
				{
					idc=109;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.58824) - -0.23))";
					sizeEx=0.02674;
				};
				class CA_SliderGamma: CA_SliderBrightness
				{
					idc=110;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.58824) - -0.23))";
				};
				class CA_TextVisibility: CA_TextBrightness
				{
					idc=223;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4902) - -0.23))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_VISIBILITY";
				};
				class CA_ValueVisibility: CA_ValueBrightness
				{
					idc=103;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4902) - -0.23))";
					sizeEx=0.02674;
				};
				class CA_SliderVisibility: CA_SliderBrightness
				{
					idc=104;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4902) - -0.23))";
				};
				class CA_TextQualityPreference: RscText
				{
					idc=232;
					x=0.65441698;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4902) - -0.23))";
					w=0.198531;
					h=0.029412;
					sizeEx=0.02674;
					text="$STR_DISP_OPT_QUALITY_PREFERENCE";
				};
				class CA_ValueQualityPreference: RscCombo
				{
					idc=126;
					x=0.83824199;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4902) - -0.23))";
					sizeEx=0.02674;
				};
				class CA_TextResolution: CA_TextQualityPreference
				{
					idc=219;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.53922) - -0.23))";
					text="$STR_DISP_OPT_RESOLUTION";
				};
				class CA_ValueResolution: CA_ValueQualityPreference
				{
					idc=113;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.53922) - -0.23))";
				};
				class CA_TextFillRate: CA_TextQualityPreference
				{
					idc=213;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.58824) - -0.23))";
					text="$STR_DISP_OPT_FILLRATE";
				};
				class CA_ValueFillRate: CA_ValueQualityPreference
				{
					idc=1234;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.58824) - -0.23))";
					sizeEx=0.02674;
				};
				class CA_PictureAspectRatio: RscPicture
				{
					idc=218;
					x=0.49265099;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.4622) - -0.23))";
					w=0.15686271;
					h=0.2091503;
					text="\ca\ui\data\ui_aspect_circle_gr.paa";
				};
				class CA_TextTextureDetail: RscText
				{
					idc=251;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_TEXTURE_DETAIL";
				};
				class CA_ValueTextureDetail: RscCombo
				{
					idc=125;
					x=0.213237;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextVideoMemory: RscText
				{
					idc=230;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
					sizeEx=0.02674;
					text="$STR_OPT_VIDEO_VRAM";
				};
				class CA_ValueVideoMemory: RscCombo
				{
					idc=139;
					x=0.213237;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextAnisotropicDetail: RscText
				{
					idc=239;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.83334)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_ANISO_DETAIL";
				};
				class CA_ValueAnisotropicDetail: RscCombo
				{
					idc=130;
					x=0.213237;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.83334)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextAADetail: RscText
				{
					idc=242;
					sizeEx=0.02674;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 -((0.88236)- 0.09))";
					text="$STR_DISP_OPT_FSAA_DETAIL";
				};
				class CA_ValueAADetail: RscCombo
				{
					idc=133;
					sizeEx=0.02674;
					x=0.213237;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.88236)- 0.09))";
				};
				class CA_TextHDRDetail: RscText
				{
					idc=300;
					x=0.35294399;
					y="(SafeZoneH + SafeZoneY) - (1 -((0.88236)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_HDR_DETAIL";
				};
				class CA_ValueHDRDetail: RscCombo
				{
					idc=131;
					x=0.507357;
					y="(SafeZoneH + SafeZoneY) - (1 -((0.88236)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextVsync: RscText
				{
					idc=243;
					x=0.65441698;
					y="(SafeZoneH + SafeZoneY) - (1 -((0.88236)- 0.09))";
					sizeEx=0.02674;
					text="Vsync:";
				};
				class CA_ValueVsync: RscCombo
				{
					idc=140;
					x=0.83824199;
					y="(SafeZoneH + SafeZoneY) - (1 -((0.88236)- 0.09))";
					sizeEx=0.02674;
				};
				class TextTerrain1: RscText
				{
					idc=227;
					x=0.35294399;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_TERRAIN";
				};
				class ValueTerrain1: RscCombo
				{
					idc=123;
					x=0.507357;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
					rows=4;
				};
				class CA_TextObjectsDetail: RscText
				{
					idc=228;
					x=0.35294399;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_OBJECTS_DETAIL";
				};
				class CA_ValueObjectsDetail: RscCombo
				{
					idc=124;
					sizeEx=0.02674;
					x=0.507357;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
				};
				class CA_TextShadowDetail: RscText
				{
					idc=235;
					x=0.35294399;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.83334)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_SHADOW_DETAIL";
				};
				class CA_ValueShadowDetail: RscCombo
				{
					idc=128;
					x=0.507357;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.83334)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextPostprocessEffects: RscText
				{
					idc=241;
					x=0.65441698;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_POSTPROCESS_EFFECTS";
				};
				class CA_ValuePostprocessEffects: RscCombo
				{
					idc=132;
					x=0.83824199;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.7353)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextIGUISize: RscText
				{
					idc=256;
					x=0.65441698;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
					sizeEx=0.02674;
					text="$STR_OPT_VIDEO_UISIZE";
				};
				class CA_ValueIGUISize: RscCombo
				{
					idc=136;
					onLBSelChanged="private ['_dummy']; _dummy = [_this, 'onLBSelChanged'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					onMouseButtonDown="private ['_dummy']; _dummy = [_this, 'onMouseButtonDown'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					x=0.83824199;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.78432)- 0.09))";
					sizeEx=0.02674;
				};
				class CA_TextAspectRatio: RscText
				{
					idc=214;
					x=0.65441698;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.83334)- 0.09))";
					sizeEx=0.02674;
					text="$STR_DISP_OPT_ASPECT_RATIO";
				};
				class CA_ValueAspectRatio: RscCombo
				{
					idc=134;
					onLBSelChanged="private ['_dummy']; _dummy = [_this, 'onLBSelChanged'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					onMouseButtonDown="private ['_dummy']; _dummy = [_this, 'onMouseButtonDown'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					x=0.83824199;
					y="((SafeZoneH + SafeZoneY) - (1 - 0.83334)- 0.09)";
					sizeEx=0.02674;
				};
				class HideAdvanced: RscShortcutButton
				{
					idc=345;
					x=0.028000001;
					y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
					text="$STR_CA_ADV_SHOW";
					OnButtonClick="private ['_dummy']; _dummy = [_this, ""CA_VO_ToggleAdvanced""] call compile preprocessfilelinenumbers	""\ca\ui\scripts\HideVideoOptions.sqf""; _dummy;";
				};
				class HideDialog: HideAdvanced
				{
					idc=344;
					x=0.221;
					text="$STR_CA_HIDE";
					OnButtonClick="private ['_dummy']; _dummy = [_this, ""CA_VO_ToggleAll""] call compile preprocessfilelinenumbers	""\ca\ui\scripts\HideVideoOptions.sqf""; _dummy; ";
				};
				class VideoDefault: HideAdvanced
				{
					idc=129;
					x=0.414;
					text="$STR_DISP_DEFAULT";
					onMouseEnter="private ['_dummy']; _dummy = [_this, 'onMouseButtonDown']	execVM	'\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					OnButtonClick="private ['_dummy']; _dummy = [_this, 'onLBSelChanged'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
				};
				class Video_OK: HideAdvanced
				{
					idc=1;
					default=1;
					x=0.60699999;
					text="$STR_DISP_OK";
					OnButtonClick="";
				};
				class Video_Cancel: HideAdvanced
				{
					idc=2;
					default=0;
					x=0.80000001;
					text="$STR_CA_CANCEL";
					OnButtonClick="";
				};
				class CA_TextATOC: RscText
				{
					idc=215;
					x=0.029412;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.93138)- 0.09))";
					sizeEx=0.02674;
					text="$STR_ATOC";
				};
				class CA_ValueATOC: RscCombo
				{
					idc=1300;
					onLBSelChanged="private ['_dummy']; _dummy = [_this, 'onLBSelChanged'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					onMouseButtonDown="private ['_dummy']; _dummy = [_this, 'onMouseButtonDown'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					x=0.213237;
					y="((SafeZoneH + SafeZoneY) - (1 - 0.93138)- 0.09)";
					sizeEx=0.02674;
				};
				class CA_TextPPAA: RscText
				{
					idc=216;
					x=0.35294399;
					y="(SafeZoneH + SafeZoneY) - (1 - ((0.93138)- 0.09))";
					sizeEx=0.02674;
					text="$STR_PPAA";
				};
				class CA_ValuePPAA: RscCombo
				{
					idc=1301;
					onLBSelChanged="private ['_dummy']; _dummy = [_this, 'onLBSelChanged'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					onMouseButtonDown="private ['_dummy']; _dummy = [_this, 'onMouseButtonDown'] execVM '\ca\ui\scripts\UISizeVideoOptions.sqf'; _dummy;";
					x=0.507357;
					y="((SafeZoneH + SafeZoneY) - (1 - 0.93138)- 0.09)";
					sizeEx=0.02674;
				};
			};
		};
	};
};
class RscDisplayOptionsAudio
{
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete B_Default;
		delete B_OK;
		delete B_Cancel;
		delete TextEffects;
		delete TextVoices;
		delete TextMusic;
		delete TextPlayerVoice;
		delete TextEAX;
		delete TextHWAcc;
		delete SliderMusic;
		delete SliderEffects;
		delete SliderVoices;
		delete ValueMusic;
		delete ValueVoices;
		delete ValueEffects;
		delete ValueEAX;
		delete ValuePlayerVoice;
		delete ValueHWAcc;
		delete ValueVON;
		delete SliderVON;
		delete ValueSamplesCount;
		delete SliderSamplesCount;
		delete TextMicSensitivity;
		delete SliderMicSensitivity;
		delete AutoAdjustMicSensitivity;
		class CA_Audio_Title: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_DISP_OPTIONS_AUDIO";
		};
		class CA_TextVoices: RscText
		{
			idc=1006;
			x=0.159803;
			y="(0.420549 + -2*0.069854)";
			text="$STR_DISP_OPT_VOICES";
		};
		class CA_SliderVoices: RscXSliderH
		{
			idc=106;
			x=0.30053401;
			y="(0.420549 + -2*0.069854)";
			w=0.40000001;
		};
		class CA_TextEffects: RscText
		{
			idc=1005;
			x=0.159803;
			y="(0.420549 + -1*0.069854)";
			text="$STR_DISP_OPT_EFFECTS";
		};
		class CA_SliderEffects: RscXSliderH
		{
			idc=104;
			x=0.30053401;
			y="(0.420549 + -1*0.069854)";
			w=0.40000001;
		};
		class CA_TextMusic: RscText
		{
			idc=1007;
			x=0.159803;
			y="(0.420549 + 0*0.069854)";
			text="$STR_DISP_OPT_MUSIC";
		};
		class CA_SliderMusic: RscXSliderH
		{
			idc=102;
			x=0.30053401;
			y="(0.420549 + 0*0.069854)";
			w=0.40000001;
		};
		class CA_TextVON: RscText
		{
			idc=1009;
			x=0.159803;
			y="(0.420549 + 1*0.069854)";
			text="VON:";
		};
		class CA_SliderVON: RscXSliderH
		{
			idc=114;
			x=0.30053401;
			y="(0.420549 + 1*0.069854)";
			w=0.40000001;
		};
		class CA_TextMicVolume: RscText
		{
			idc=1009;
			x=0.159803;
			y="(0.420549 + 2*0.069854)";
			text="$STR_DISP_MICROPHONE";
		};
		class CA_SliderMicVolume: RscXSliderH
		{
			idc=117;
			x=0.30053401;
			y="(0.420549 + 2*0.069854)";
			w=0.40000001;
		};
		class CA_AutoAdjustMicSensitivity: RscShortcutButton
		{
			idc=118;
			x=0.30053401;
			y=0.59702301;
			w=0.30000001;
			text="$STR_DISP_AUTO_ADJUST";
		};
		class CA_TextSamplesCount: RscText
		{
			idc=1011;
			x=0.159803;
			y="(0.420549 + 4*0.069854)";
			text="$STR_AUDIO_SAMPLES";
		};
		class CA_SliderSamplesCount: RscXListBox
		{
			idc=116;
			x=0.30053401;
			y="(0.420549 + 4*0.069854)";
			w=0.40000001;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.15099999;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
		class CA_ButtonDefault: RscShortcutButton
		{
			idc=111;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.338;
			y=0.76249999;
			text="$STR_DISP_DEFAULT";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.52499998;
			y=0.76249999;
			text="$STR_DISP_OK";
			default=1;
		};
	};
};
class RscDisplayMicSensitivityOptions
{
	idd=262;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1106;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1107;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback4: RscPicture
		{
			idc=1104;
			x=0.185;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete B_OK;
		delete B_Cancel;
		delete B_Start;
		delete TextProgress;
		class CA_Title: CA_Title
		{
			x=0.227;
			y=0.192;
			text="$STR_DISP_MIC_SENS";
		};
		class CA_TextProgress: RscText
		{
			x=0.20680299;
			y="(0.420549 + -2*0.069854)";
			text="$STR_DISP_DONE";
		};
		class TextProgressVal: RscText
		{
			x=0.347534;
			y="(0.420549 + -2*0.069854)";
			text=" 0%";
			idc=1002;
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			x=0.198;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
		class CA_B_Start: RscShortcutButton
		{
			idc=1001;
			x=0.38499999;
			y=0.76249999;
			w=0.15000001;
			text="$STR_MPROLE_START";
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			text="$STR_DISP_OK";
			x=0.57200003;
			y=0.76249999;
			default=1;
		};
	};
};
class RscDisplayDifficultySelect
{
	idd=152;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1103;
			x=0.185;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_difficulty_background_ca.paa";
		};
	};
	class controls
	{
		delete Difficulty;
		delete Description;
		class CA_SelectDiffTitle: CA_Title
		{
			x=0.23;
			y=0.192;
			text="$STR_DISP_OPTIONS_DIFFICULTY";
		};
		class CA_Difficulty: RscListBox
		{
			idc=101;
			x=0.2;
			y=0.27103001;
			w=0.33199999;
			h=0.48300001;
			rowHeight=0.043909099;
		};
		class CA_Description: RscHTML
		{
			idc=102;
			x=0.55782402;
			y=0.23407;
			w=0.38999999;
			h=0.48699999;
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class CA_OK_Text: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.70599997;
			y=0.76249999;
			text="$STR_DISP_EDIT";
		};
		class CA_Diff_B_Back: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			default=0;
			x=0.50599998;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayDifficulty
{
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback4: RscPicture
		{
			idc=1103;
			x=0.185;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_difficulty_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1103;
			x=0.23199999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_difficulty_background_ca.paa";
		};
	};
	class controls
	{
		delete B_Cancel;
		delete B_OK;
		delete B_Default;
		delete Title;
		delete ValueVeteranFriendlySkill;
		delete ValueVeteranEnemySkill;
		delete ValueCadetFriendlySkill;
		delete ValueCadetEnemySkill;
		delete EchoVeteranFriendlySkill;
		delete EchoVeteranEnemySkill;
		delete EchoCadetFriendlySkill;
		delete EchoCadetEnemySkill;
		delete ValueVeteranFriendlyLevel;
		delete ValueVeteranEnemyLevel;
		delete ValueCadetFriendlyLevel;
		delete ValueCadetEnemyLevel;
		delete TextFriendlySkill;
		delete TextEnemySkill;
		delete TextFriendlyLevel;
		delete TextEnemyLevel;
		delete ValueDifficulties;
		delete TextVeteran;
		delete TextCadet;
		delete TextName;
		class CA_Title1: CA_Title
		{
			idc=1001;
			text="$STR_DISP_OPTIONS_DIFFICULTY";
			x=0.26470599;
			y=0.189353;
		};
		class CA_ValueDifficulties: RscListBox
		{
			idc=101;
			x=0.23728099;
			y=0.267598;
			w=0.71100003;
			h=0.347;
			rows=6;
		};
		class CA_TextEnemyLevel: RscText
		{
			idc=1003;
			x=0.238915;
			y=0.70289201;
			text="$STR_DISP_DIFF_ENEMY_LEVEL";
		};
		class CA_ValueCadetEnemyLevel: RscCombo
		{
			idc=105;
			x=0.44830099;
			y=0.70289201;
			text="$STR_DISP_DIFF_FRIENDLY_LEVEL";
		};
		class CA_SliderCadetEnemySkill: RscXSliderH
		{
			idc=109;
			x=0.60026097;
			y=0.70289201;
			w=0.245;
		};
		class CA_ValueCadetEnemySkill: RscText
		{
			idc=115;
			x=0.86823601;
			y=0.70289201;
			w=0.12;
		};
		class CA_TextFriendlyLevel: RscText
		{
			idc=1004;
			x=0.238915;
			y=0.64985299;
			w=0.5;
			text="$STR_DISP_DIFF_FRIENDLY_LEVEL";
		};
		class CA_ValueCadetFriendlyLevel: RscCombo
		{
			idc=106;
			x=0.44830099;
			y=0.64985299;
		};
		class CA_SliderCadetFriendlySkill: RscXSliderH
		{
			idc=110;
			x=0.60026097;
			y=0.64985299;
			w=0.245;
		};
		class CA_ValueCadetFriendlySkill: RscText
		{
			idc=116;
			x=0.86823601;
			y=0.64985299;
			w=0.12;
		};
		class Diff_B_Back: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.34;
			y=0.76249999;
			text="$STR_CA_CANCEL";
		};
		class Default: RscShortcutButton
		{
			idc=104;
			x=0.54000002;
			y=0.76249999;
			text="$STR_DISP_DEFAULT";
		};
		class OK_Text: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.74000001;
			y=0.76249999;
			default=1;
			text="$STR_DISP_OK";
		};
	};
};
class RscDisplayConfigure
{
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.013;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_controls_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete B_Default;
		delete ControlsPage;
		delete TextName;
		delete TextKeys;
		delete TextMouseSens;
		delete Title;
		delete TextFloatingzone;
		delete TextReserved;
		delete TextButtons;
		delete ValueButtons;
		delete ValueYReversed;
		delete ValueKeys;
		delete ValueJoystick;
		delete ValueFloatingZone;
		delete ValueXAxis;
		delete ValueYAxis;
		delete TextMouseSmoothing;
		delete ValueMouseSmoothing;
		class Title1: CA_Title
		{
			idc=1001;
			x=0.0535;
			y=0.1407;
			text="$STR_DISP_OPTIONS_CONFIGURE";
		};
		class CA_ControlsPageText: RscText
		{
			x=0.031399999;
			y=0.22;
			w=0.25;
			h=0.037999999;
			text="$STR_DISP_CONF_SHOW";
		};
		class CA_ControlsPage: RscCombo
		{
			idc=108;
			x=0.29660001;
			y=0.22;
			w=0.40000001;
			h=0.037999999;
		};
		class CA_TextMouseSens: RscText
		{
			idc=1004;
			x=0.708;
			y=0.22;
			w=0.34999999;
			text="$STR_DISP_CONF_SENS";
			colorText[]={1,1,1,1};
		};
		class CA_ValueKeys: RscListBoxKeys
		{
			idc=102;
			x=0.0363;
			y=0.26899999;
			w=0.66000003;
			h=0.55000001;
			mainCollumW=0.38999999;
			secndCollumW=0.61000001;
		};
		class TextYReversed: RscText
		{
			idc=1007;
			x=0.708;
			y=0.26899999;
			w=0.36300001;
			text="$STR_CA_YAXIS";
		};
		class CA_ValueYReversed: RscXListBox
		{
			idc=105;
			x=0.71649998;
			y=0.32508799;
			w=0.25;
		};
		class TextXAxis: RscText
		{
			idc=1009;
			x=0.708;
			y=0.38100001;
			w=0.25;
		};
		class CA_ValueXAxis: RscXSliderH
		{
			idc=103;
			x=0.71799999;
			y=0.4364;
			w=0.25;
		};
		class TextYAxis: RscText
		{
			idc=1010;
			x=0.708;
			y=0.48100001;
			w=0.25;
		};
		class CA_ValueYAxis: RscXSliderH
		{
			idc=104;
			x=0.71799999;
			y=0.53640002;
			w=0.25;
		};
		class CA_TextMouseSmoothing: RscText
		{
			idc=1011;
			x=0.708;
			y=0.58099997;
			w=0.25;
			text="$STR_DISP_CONF_MOUSE_FILTERING";
		};
		class CA_MouseFiltering: RscXSliderH
		{
			idc=110;
			x=0.71799999;
			y=0.63639998;
			w=0.25;
		};
		class CA_ValueJoystick: RscShortcutButton
		{
			idc=106;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.391;
			y=0.83999997;
			text="$STR_DISP_CONF_CONTROLLERS";
			style=1;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.191;
			y=0.83999997;
			text="$STR_DISP_CANCEL";
		};
		class CA_ButtonDefault: RscShortcutButton
		{
			idc=101;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.59100002;
			y=0.83999997;
			text="$STR_DISP_DEFAULT";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.79100001;
			y=0.83999997;
			text="$STR_DISP_OK";
			default=1;
		};
	};
};
class RscDisplayConfigureControllers
{
	class controlsBackground
	{
		class Mainback_faded: RscPicture
		{
			idc=1105;
			x=0.013;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_background_controls_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.059999999;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_controlers_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete TextControllerList;
		delete ControllerList;
		delete TextXInputList;
		delete XInputList;
		delete Customize;
		delete EnableDisable;
		delete RscControllersListBox;
		delete B_OK;
		delete RscConfJoysticksButton;
		class CA_Title: CA_Title
		{
			text="$STR_OPT_CONFIGURE_CONTROLLERS";
			x=0.103;
			y=0.14;
		};
		class CA_RscConfJoysticksButton: RscButton
		{
			w=0.2;
			h=0.050000001;
		};
		class CA_TextControllerList: RscText
		{
			x=0.078000002;
			y=0.22;
			w=0.34999999;
			text="$STR_OPT_CUSTOMIZABLE_CONTROLLERS";
		};
		class CA_ControllerList: RscListBox
		{
			idc=104;
			x=0.078000002;
			y=0.28;
			w=0.89600003;
			h=0.30000001;
			rowHeight=0.050000001;
			rows="0.7 / 0.05";
			disabledCtrlColor[]={1,1,1,0.5};
		};
		class CA_TextXInputList: RscText
		{
			x=0.078000002;
			y=0.51999998;
			w=0.34999999;
			text="$STR_OPT_CONTROLLERS_SCHEME";
		};
		class CA_XInputList: RscListBox
		{
			idc=103;
			x=0.078000002;
			y=0.58200002;
			w=0.89600003;
			h=0.2;
			rowHeight=0.050000001;
			rows="0.7 / 0.05";
			disabledCtrlColor[]={1,1,1,0.5};
		};
		class CA_Back: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.191;
			y=0.83999997;
			text="$STR_DISP_BACK";
		};
		class CA_EnableDisable: RscShortcutButton
		{
			idc=102;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.391;
			y=0.83999997;
			text="$STR_OPT_ENABLE";
		};
		class CA_Customize: RscShortcutButton
		{
			idc=101;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.59100002;
			y=0.83999997;
			text="$STR_OPT_CUSTOMIZE";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.79100001;
			y=0.83999997;
			text="$STR_DISP_OK";
			default=1;
		};
	};
};
class RscDisplayCustomizeController
{
	class controlsBackground
	{
		class Mainback_faded2: RscPicture
		{
			idc=1105;
			x=0.013;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_background_controls_ca.paa";
		};
		class Mainback_faded: RscPicture
		{
			idc=1105;
			x=0.059999999;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.107;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_joysticks_ca.paa";
		};
	};
	class Controls
	{
		delete T_Background;
		delete T_Title;
		delete B_Cancel;
		delete B_Default;
		delete B_Unmap;
		delete B_OK;
		class CA_Customize_Title: CA_Title
		{
			x=0.148;
			y=0.14;
			idc=104;
		};
		class G_ControlsGroup: RscControlsGroup
		{
			idc=101;
			x=-0.0121078;
			y=0.211124;
			w=0.97000003;
			h=0.57999998;
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
			};
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.79100001;
			y=0.83999997;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_B_Unmap: RscShortcutButton
		{
			idc=102;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.391;
			y=0.83999997;
			text="$STR_OPT_CONTROLLERS_UNMAP";
			default=0;
		};
		class CA_B_Default: RscShortcutButton
		{
			idc=103;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.59100002;
			y=0.83999997;
			text="$STR_DISP_DEFAULT";
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.191;
			y=0.83999997;
			text="$STR_DISP_CANCEL";
		};
	};
	class Title: RscText
	{
		x=0.1393594;
		y=0;
		w=0.23;
		h=0.025;
		text="";
		style=256;
		font="Zeppelin32";
		SizeEx=0.039209999;
		colorText[]={0.94999999,0.94999999,0.94999999,1};
	};
	class Slider: RscXSliderH
	{
		type=43;
		style="0x400	+ 0x10";
		x=0.38810501;
		y=0;
		w=0.55000001;
		h=0.029412;
		vspacing=0.050000001;
	};
};
class RscDisplayConfigureAction
{
	movingEnable=0;
	enableDisplay=1;
	class ControlsBackground
	{
		delete Background;
		class Mainback_faded: RscPicture
		{
			idc=1105;
			x=0.013;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_background_controls_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.059999999;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_controlers_ca.paa";
		};
	};
	class Controls
	{
		delete Title;
		delete TextHelp;
		delete TextReserved;
		delete ValueCurrentKeys;
		delete ValueSpecialKeys;
		delete B_Delete;
		delete B_Default;
		delete B_Clear;
		delete B_Cancel;
		delete B_Next;
		delete B_Prev;
		delete B_OK;
		delete RscConfActionButton;
		class CA_Controls_Title: CA_Title
		{
			idc=101;
			x=0.089447699;
			y=0.1407;
			text="$STR_DISP_CONFACT_TITLE";
		};
		class CA_TextHelp: RscText
		{
			idc=1010;
			x=0.090588197;
			y=0.76220697;
			w=0.70999998;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DISP_CONF_HELP";
		};
		class CA_TextReserved: CA_TextHelp
		{
			x=0.090588197;
			y=0.798971;
			text="$STR_DISP_CONF_RES";
		};
		class CA_ValueCurrentKeys: RscListBox
		{
			idc=102;
			x=0.118;
			y=0.22093099;
			w=0.43625;
			h=0.35600001;
			canDrag=1;
			rowHeight=0.019608;
			rows="0.4 / 0.03";
		};
		class CA_ValueSpecialKeys: CA_ValueCurrentKeys
		{
			idc=103;
			x=0.57318801;
			y=0.22093099;
			w=0.40000001;
			h=0.35600001;
		};
		class CA_B_Prev: RscShortcutButton
		{
			idc=108;
			x=0.091856197;
			y=0.678541;
			text="$STR_USRACT_MENU_DOWN";
		};
		class CA_B_Delete: RscShortcutButton
		{
			idc=104;
			x=0.091856197;
			y=0.62584502;
			text="$STR_DISP_DELETE";
		};
		class CA_B_Clear: RscShortcutButton
		{
			idc=106;
			x=0.36813;
			y=0.62584502;
			text="$STR_DISP_CONFACT_UNDO";
		};
		class CA_B_Next: RscShortcutButton
		{
			idc=109;
			x=0.36813;
			y=0.678541;
			text="$STR_USRACT_MENU_UP";
		};
		class CA_ButtonDefault: RscShortcutButton
		{
			idc=105;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.59100002;
			y=0.83999997;
			text="$STR_DISP_DEFAULT";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.79100001;
			y=0.83999997;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=107;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.081333302;
			y=0.83999997;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayGameOptions
{
	movingEnable=1;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_gameoptions_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete RadioSubtitles;
		delete TextGore;
		delete TextLanguage;
		delete TextFloatingZone;
		delete TextSubtitles;
		delete ValueBlood;
		delete Radio;
		delete ValueLanguage;
		delete ValueFloatingZone;
		delete Subtitles;
		delete TextHeadBob;
		delete ValueHeadBob;
		delete B_Cancel;
		delete B_OK;
		delete B_Difficulty;
		class CA_Title: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_DISP_OPTIONS_GAME_OPTIONS";
		};
		class CA_TextLanguage: RscText
		{
			x=0.159803;
			y="(0.420549 + -2*0.069854)";
			text="$STR_DISP_OPT_LANGUAGE";
		};
		class CA_ValueLanguage: RscXListBox
		{
			idc=135;
			x=0.400534;
			y="(0.420549 + -2*0.069854)";
			w=0.30000001;
		};
		class CA_TextSubtitles: CA_TextLanguage
		{
			x=0.159803;
			y="(0.420549 + -1*0.069854)";
			text="$STR_OPT_SUBTITLES";
		};
		class CA_ValueSubtitles: CA_ValueLanguage
		{
			idc=102;
			x=0.400534;
			y="(0.420549 + -1*0.069854)";
			w=0.30000001;
		};
		class CA_RadioSubtitles: CA_TextLanguage
		{
			x=0.159803;
			y="(0.420549 + 0*0.069854)";
			text="$STR_OPT_RADIO_SUBTITLES";
		};
		class CA_ValueRadio: CA_ValueLanguage
		{
			idc=103;
			y="(0.420549 + 0*0.069854)";
		};
		class CA_TextGore: CA_TextLanguage
		{
			idc=122;
			x=0.159803;
			y="(0.420549 + 1*0.069854)";
			text="$STR_DISP_OPT_BLOOD";
		};
		class CA_ValueBlood: CA_ValueLanguage
		{
			idc=119;
			y="(0.420549 + 1*0.069854)";
		};
		class CA_TextFloatingZone: CA_TextLanguage
		{
			x=0.159803;
			y="(0.420549 + 2*0.069854)";
			text="$STR_DISP_CONF_FLOATING_ZONE";
		};
		class CA_ValueFloatingZone: RscXSliderH
		{
			idc=109;
			x=0.400534;
			y="(0.420549 + 2*0.069854)";
			w=0.30000001;
		};
		class CA_TextHeadBob: CA_TextLanguage
		{
			x=0.159803;
			y="(0.420549 + 3*0.069854)";
			text="$STR_DISP_OPT_HEADBOB";
		};
		class CA_ValueHeadBob: RscXSliderH
		{
			idc=138;
			x=0.400534;
			y="(0.420549 + 3*0.069854)";
			w=0.30000001;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.15099999;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
		class CA_ButtonDefault: RscShortcutButton
		{
			idc=304;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.338;
			y=0.76249999;
			text="$STR_DISP_OPTIONS_DIFFICULTY";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.52499998;
			y=0.76249999;
			text="$STR_DISP_OK";
			default=1;
		};
	};
};
class RscDisplayMissionEnd: RscStandardDisplay
{
	onLoad="private [""_dummy""]; _dummy = [""Init"", _this] execVM ""\ca\ui\scripts\pauseLoadinit.sqf""; 	_dummy = [] execVM '\ca\ui\scripts\uiPostEffectBlur.sqf';";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.60799998;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete B_Retry;
		delete B_Restart;
		delete B_Abort;
		delete B_TeamSwitch;
		delete B_Load;
		delete Quotation;
		delete Author;
		delete Title;
		class CA_Title: CA_Title
		{
			idc=523;
			x=0.65499997;
			y=0.192;
			text="$STR_DISP_DEATH";
		};
		class CA_LoadAuto: RscShortcutButtonMain
		{
			idc=104;
			x=0.61430001;
			y=0.25369999;
			default=1;
			text="$STR_CA_LOADAUTO";
			toolTip="$STR_CA_LOADAUTO";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_TeamSwitch: CA_LoadAuto
		{
			idc=107;
			y=0.35451901;
			default=0;
			text="$STR_DISP_ME_TEAM_SWITCH";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class HintX_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.77999997;
			y=0.78399998;
			w=0.22059;
			h=0.1045752;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.75199997;
			y=0.76249999;
			w=0.16176599;
			h=0.1045752;
			text="$STR_DISP_ME_ABORT";
		};
	};
};
class RscDisplayInterrupt: RscStandardDisplay
{
	movingEnable=0;
	enableSimulation=0;
	onLoad="private ['_dummy']; _dummy = _this call compile preprocessFile 'pauseOnload.sqf'; 			private ['_dummy']; _dummy = [_this,'onload'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf'; 			_dummy = ['Init', _this] execVM '\ca\ui\scripts\pauseLoadinit.sqf'; 			_dummy = [] call compile preprocessFile '\ca\ui\scripts\uiPostEffectBlur.sqf';";
	onUnload=" private [""_dummy""]; _dummy = [""Unload"", _this] call compile preprocessFile ""\ca\ui\scripts\pauseOnUnload.sqf""; 			_dummy = [_this,'unload'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf';";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_background_paused_ca.paa";
		};
	};
	class controls
	{
		delete B_Abort;
		delete B_Options;
		delete B_Retry;
		delete B_Load;
		delete B_Revert;
		delete B_Save;
		delete B_Continue;
		delete B_Diary;
		delete Title;
		class MissionTitle: RscText
		{
			idc=120;
			x=0.050000001;
			y=0.71799999;
			text="";
		};
		class DifficultyTitle: RscText
		{
			idc=121;
			x=0.050000001;
			y=0.67199999;
			text="";
		};
		class CA_PGTitle: CA_Title
		{
			idc=523;
			x=0.082000002;
			y=0.192;
			text="$STR_DISP_INT_TITLE";
		};
		class PG_Save: RscShortcutButtonMain
		{
			idc=103;
			default=0;
			borderSize=0;
			x=0.044500001;
			y=0.25369999;
			text="$STR_DISP_INT_SAVE";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class PG_Skip: PG_Save
		{
			idc=1002;
			y=0.25369999;
			text="$STR_DISP_INT_SKIP";
			onButtonClick="private ['_dummy']; _dummy = [_this,'skip'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf';";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class PG_Revert: PG_Save
		{
			idc=119;
			y=0.35451901;
			text="$str_disp_revert";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class PG_Again: PG_Save
		{
			idc=1003;
			y=0.35451901;
			text="$STR_DISP_INT_AGAIN";
			onButtonClick="private ['_dummy']; _dummy = [_this,'again'] call compile preprocessFile '\ca\ui\scripts\pauseCutScene.sqf';";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class PG_Options: PG_Save
		{
			idc=101;
			default=0;
			shortcuts[]={};
			y=0.455421;
			text="$STR_DISP_INT_OPTIONS";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class PG_Abort: PG_Save
		{
			idc=104;
			default=0;
			shortcuts[]={};
			y=0.55732399;
			text="$STR_DISP_INT_ABORT";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class HintA_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.229;
			y=0.78200001;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1",
				"0x00050000 + 8"
			};
			x=0.1605;
			y=0.76249999;
			text="$STR_DISP_INT_CONTINUE";
		};
	};
	class KeyHints
	{
	};
};
class RscDisplayInterruptRevert: RscStandardDisplay
{
	enableSimulation=0;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			x=0.037999999;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_revert_background_ca.paa";
		};
	};
	class Controls
	{
		delete Background;
		delete RevertTypes;
		delete ButtonCancel;
		delete ButtonOK;
		class CA_RevertTitle: CA_Title
		{
			x=0.104;
			y=0.192;
			text="$STR_DISP_REVERT";
		};
		class CA_RevertTypes: RscListBox
		{
			idc=101;
			x=0.112;
			y=0.26058;
			w=0.45100001;
			h=0.48300001;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.105;
			y=0.76249999;
			w=0.16176599;
			text="$STR_DISP_BACK";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.40892199;
			y=0.76249999;
			w=0.16176599;
			text="$STR_DISP_OK";
		};
	};
};
class RscDisplaySelectSave: RscStandardDisplay
{
	idd=154;
	enableSimulation=0;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			x=0.037999999;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_revert_background_ca.paa";
		};
	};
	class Controls
	{
		delete Background;
		delete SaveTypes;
		delete ButtonCancel;
		delete ButtonOK;
		class CA_RevertTitle: CA_Title
		{
			x=0.11;
			y=0.192;
			text="$STR_DISP_INT_SAVE";
		};
		class CA_SaveSlots: RscListBox
		{
			idc=101;
			x=0.112;
			y=0.26058;
			w=0.45100001;
			h=0.48300001;
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.105;
			y=0.76249999;
			w=0.16176599;
			text="$STR_DISP_BACK";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.40892199;
			y=0.76249999;
			w=0.16176599;
			text="$STR_DISP_OK";
		};
	};
};
class RscDisplayMovieInterrupt: RscStandardDisplay
{
	idd=49;
	movingEnable=0;
	enableSimulation=0;
	onLoad="_dummy = ['Init', _this] execVM '\ca\ui\scripts\pauseLoadinit.sqf'";
	onUnload="private ['_dummy']; _dummy = ['Unload', _this] execVM '\ca\ui\scripts\pauseOnUnload.sqf';";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete ButtonAbort;
		delete ButtonOptions;
		delete ButtonAgain;
		delete ButtonResume;
		delete ButtonSkip;
		class CA_MITitle: CA_Title
		{
			idc=523;
			x=0.057;
			y=0.192;
			text="$STR_DISP_INT_TITLE";
		};
		class MI_Skip: RscShortcutButtonMain
		{
			idc=1;
			x=0.050000001;
			y=0.271;
			default=1;
			text="$STR_DISP_INT_SKIP";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class MI_Resume: MI_Skip
		{
			idc=2;
			default=0;
			x=0.050000001;
			y=0.368;
			text="$STR_DISP_INT_RESUME";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class MI_Again: MI_Skip
		{
			idc=105;
			default=0;
			x=0.050000001;
			y=0.46399999;
			text="$STR_DISP_INT_AGAIN";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class MI_Options: MI_Skip
		{
			idc=101;
			default=0;
			y=0.56;
			text="$STR_DISP_INT_OPTIONS";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class MI_Abort: MI_Skip
		{
			idc=4;
			default=0;
			y=0.65600002;
			text="$STR_DISP_INT_ABORT";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class HintX_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.229;
			y=0.78200001;
			text="$STR_DISP_CONTINUE";
		};
	};
	class KeyHints
	{
		class KeyB
		{
			key="0x00050000 + 1";
			hint="";
		};
	};
};
class RscDisplayDebriefing: RscStandardDisplay
{
	statisticsLinks=1;
	enableSimulation=1;
	movingEnable=0;
	class ControlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.02;
			y=0.101;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\igui_background_debriefing_ca.paa";
		};
	};
	class controls
	{
		delete B_Continue;
		delete B_Restart;
		delete Title;
		delete MissionTitle;
		delete MissionResult;
		delete DebriefingInfo;
		delete DebriefingText;
		delete DebriefingObjectives;
		delete Right;
		delete Left;
		delete PlayersTitle;
		delete Players;
		class Debriefing_MissionTitle: CA_IGUI_Title
		{
			idc=1010;
			text="$STR_DISP_DEBRIEFING";
			x=0.0253857;
			y=0.091313802;
			w=0.88999999;
		};
		class CA_MissionTitle: CA_IGUI_Title
		{
			idc=112;
			style=1;
			x=0.089111201;
			y=0.091313802;
			w=0.88999999;
		};
		class CA_TextVotingTimeLeft: RscText
		{
			idc=110;
			style=1;
			x=0.0253857;
			y=0.091313802;
			w=0.41176799;
			colorText[]={0.89999998,0.2,0.2,1};
		};
		class CA_MissionResult: CA_Title
		{
			idc=111;
			x=0.47636801;
			y=0.093764797;
			w=0.40000001;
		};
		class CA_DebriefingInfo: RscHTML
		{
			idc=115;
			x=0.0272895;
			y=0.14706001;
			w=0.433;
			h=0.147;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			colorBackground[]={1,1,1,0};
			class H1: H1
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H2: H2
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H3: H3
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H4: H4
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H5: H5
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H6: H6
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class P: P
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
		};
		class CA_DebriefingTextGroup: RscControlsGroup
		{
			idc=122;
			x=0.0272895;
			y=0.30245101;
			w=0.435;
			h=0.56;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.02;
			};
			class HScrollbar
			{
				color[]={1,1,1,1};
				height=0.001;
			};
			class Controls
			{
				class CA_DebriefingText: CA_DebriefingInfo
				{
					idc=113;
					x=0;
					y=0;
					w=0.43000001;
					h=10.53922;
				};
			};
		};
		class CA_DebriefingObjectivesGroup: RscControlsGroup
		{
			idc=123;
			x=0.46608201;
			y=0.145835;
			w=0.50999999;
			h=0.699;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.02;
			};
			class HScrollbar
			{
				color[]={1,1,1,1};
				height=0.001;
			};
			class Controls
			{
				class CA_DebriefingObjectives: CA_DebriefingInfo
				{
					idc=114;
					onHTMLLink="_dummy = [_this] execVM ""\ca\ui\scripts\debriefing.sqf""";
					x=0;
					y=0;
					w=0.50999999;
					h=10.53922;
				};
			};
		};
		class CA_DebriefingStatsGroup: RscControlsGroup
		{
			idc=124;
			x=0.46608201;
			y=0.145835;
			w=0.50999999;
			h=0.699;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.02;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Left: CA_DebriefingInfo
				{
					idc=103;
					onHTMLLink="_dummy = [_this] execVM ""\ca\ui\scripts\debriefing.sqf""";
					x=0;
					y=0;
					w=0.50999999;
					h=10.53922;
				};
			};
		};
		class ButtonStatistics: RscIGUIShortcutButton
		{
			idc=1001;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.38765001;
			y=0.86397702;
			onButtonClick="_dummy = [_this] execVM ""\ca\ui\scripts\debriefing.sqf""";
			text="$STR_BRIEF_STAT_OPEN";
		};
		class ButtonRetry: RscIGUIShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.58944899;
			y=0.86397702;
			text="$STR_DISP_DEBRIEFING_RESTART";
		};
		class ButtonContinue: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.79124802;
			y=0.86397702;
			text="$STR_DISP_CONTINUE";
		};
	};
};
class RscDisplayMissionFail: RscStandardDisplay
{
	statisticsLinks=1;
	enableSimulation=1;
	movingEnable=0;
	class ControlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.02;
			y=0.101;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\igui_background_debriefing_ca.paa";
		};
	};
	class controls
	{
		delete B_Load;
		delete B_Retry;
		delete B_Restart;
		delete B_Abort;
		delete Title;
		delete MissionTitle;
		delete MissionResult;
		delete DebriefingInfo;
		delete DebriefingText;
		delete DebriefingObjectives;
		delete Right;
		delete Left;
		delete PlayersTitle;
		delete Players;
		class Debriefing_MissionTitle: CA_IGUI_Title
		{
			idc=1010;
			text="$STR_DISP_DEBRIEFING";
			x=0.0253857;
			y=0.091313802;
			w=0.88999999;
		};
		class CA_MissionTitle: CA_IGUI_Title
		{
			idc=112;
			style=1;
			x=0.089111201;
			y=0.091313802;
			w=0.88999999;
		};
		class CA_TextVotingTimeLeft: RscText
		{
			idc=110;
			style=1;
			x=0.0253857;
			y=0.091313802;
			w=0.41176799;
			colorText[]={0.89999998,0.2,0.2,1};
		};
		class CA_MissionResult: CA_Title
		{
			idc=111;
			x=0.47636801;
			y=0.093764797;
			w=0.40000001;
		};
		class CA_DebriefingInfo: RscHTML
		{
			idc=115;
			x=0.0272895;
			y=0.14706001;
			w=0.433;
			h=0.147;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			colorBackground[]={1,1,1,0};
			class H1: H1
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H2: H2
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H3: H3
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H4: H4
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H5: H5
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class H6: H6
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
			class P: P
			{
				sizeEx=0.039209999;
				color[]={0.023529001,0,0.031372499,1};
				colorText[]={0.94999999,0.94999999,0.94999999,1};
			};
		};
		class CA_DebriefingTextGroup: RscControlsGroup
		{
			idc=122;
			x=0.0272895;
			y=0.30245101;
			w=0.43000001;
			h=0.53921998;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_DebriefingText: CA_DebriefingInfo
				{
					idc=113;
					x=0;
					y=0;
					w=0.43000001;
					h=10.53922;
				};
			};
		};
		class CA_DebriefingObjectivesGroup: RscControlsGroup
		{
			idc=123;
			x=0.46608201;
			y=0.145835;
			w=0.50999999;
			h=0.699;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_DebriefingObjectives: CA_DebriefingInfo
				{
					idc=114;
					onHTMLLink="_dummy = [_this] execVM ""\ca\ui\scripts\debriefing.sqf""";
					x=0;
					y=0;
					w=0.50999999;
					h=10.53922;
				};
			};
		};
		class CA_DebriefingStatsGroup: RscControlsGroup
		{
			idc=124;
			x=0.46608201;
			y=0.145835;
			w=0.50999999;
			h=0.699;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.001;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Left: CA_DebriefingInfo
				{
					idc=103;
					onHTMLLink="_dummy = [_this] execVM ""\ca\ui\scripts\debriefing.sqf""";
					x=0;
					y=0;
					w=0.50999999;
					h=10.53922;
				};
			};
		};
		class BRetry: RscIGUIShortcutButton
		{
			idc=104;
			x=0.191248;
			y=0.86397702;
			text="$STR_CA_LOADAUTO";
		};
		class BAbort: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.39124799;
			y=0.86397702;
			text="$STR_DISP_ME_ABORT";
		};
	};
};
class RscDisplayTeamSwitch: RscStandardDisplay
{
	idd=632;
	enableSimulation=1;
	colorPlayer[]={0.94999999,0.94999999,0.94999999,1};
	colorPlayerSelected[]={0.94999999,0.94999999,0.94999999,1};
	onLoad="_dummy = [_this, ""CA_TS_Pause""]	call compile preprocessFile ""\ca\ui\scripts\TeamSwitch.sqf"";";
	onUnload="_dummy = [_this, ""CA_TS_Resume""]	call compile preprocessFile ""\ca\ui\scripts\TeamSwitch.sqf"";";
	class controlsBackground
	{
		delete Background1;
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.040899999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_teamswitch_background_ca.paa";
		};
	};
	class Controls
	{
		delete Background;
		delete Roles;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_TSTitle: CA_IGUI_Title
		{
			idc=1001;
			x=0.047889002;
			y=0.16239201;
			text="$STR_USRACT_TEAM_SWITCH";
		};
		class CA_TSRoles: RscIGUIListBox
		{
			IDC=101;
			x=0.039719;
			y=0.208335;
			w=0.55299997;
			h=0.25999999;
			onLBSelChanged="_dummy = [_this, ""CA_TS_UnitSelected""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"" ";
			onLBDblClick="_dummy = [_this, ""CA_TS_ListDoubleClick""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"" ";
		};
		class CA_TSMap: RscMapControl
		{
			idc=561;
			x=0.59609699;
			y=0.208335;
			w=0.35699999;
			h=0.40000001;
			type=101;
			ShowCountourInterval=0;
			scaleDefault=0.1;
			colorbackground[]={1,1,1,1};
			onMouseButtonClick="_dummy = [_this, ""CA_TS_MapClick""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"";";
			onMouseButtonDblClick="_dummy = [_this, ""CA_TS_ListDoubleClick""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"";";
		};
		class CA_TSUnitIcon: RscPicture
		{
			IDC=493;
			style="0x30 + 0x800";
			x=0.38449401;
			y=0.47549501;
			w=0.15686271;
			h=0.1045752;
			text="#(argb,8,8,3)color(1,1,1,1)";
		};
		class CA_TSUnit: RscText
		{
			IDC=501;
			style=1;
			x=0.078936003;
			y=0.51838797;
			w=0.19117799;
			h=0.039216001;
			text="$STR_PLAYER";
		};
		class CA_ButtonViewUnit: RscIGUIShortcutButton
		{
			idc=32;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.41472399;
			y=0.60907602;
			text="$STR_TEAM_SWITCH_VIEW_UNIT";
			onButtonClick="_dummy = [_this, ""CA_TS_ViewUnit""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"" ";
		};
		class CA_ButtonContinue: RscIGUIShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.77093399;
			y=0.60907602;
			default=1;
			text="$STR_DISP_SWITCH";
		};
		class CA_ButtonCancel: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.041358098;
			y=0.60907602;
			text="$STR_DISP_BACK";
		};
	};
};
class RscArmorySelectIsland: RscStandardDisplay
{
	idd=1111;
	enableSimulation=1;
	onLoad="private [""_handle""]; _handle = _this call compile preprocessFile	""\ca\ui\scripts\armory\selectWorldArmory.sqf""; private [""_dummy""]; _dummy = [_this, ""CA_SI_IslandSelected""] call compile preprocessFile ""\ca\ui\scripts\islandPicture.sqf"";";
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_selectisland_background_ca.paa";
		};
	};
	class controls
	{
		class Title1: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_LIB_TITLE";
		};
		class IslandPanorama: RscPicture
		{
			idc=1005;
			x=0.161;
			y=0.26800001;
			w=0.627451;
			h=0.2091503;
			text="\ca\ui\data\island_picture_dummy_ca.paa";
		};
		class IslandsBox: RscListBox
		{
			idc=101;
			x=0.16150001;
			y=0.5;
			w=0.627451;
			h=0.23899999;
			onLBDblClick="private [""_handle""]; _handle = _this execVM ""\ca\ui\scripts\armory\startArmory.sqf""";
			onLBSelChanged="private [""_dummy""]; _dummy = [_this, ""CA_SI_IslandSelected""] call compile preprocessFile ""\ca\ui\scripts\islandPicture.sqf""; _dummy = _this call (compile (preprocessFile ""\ca\ui\scripts\armory\hostButtonVisibility.sqf""))";
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=-1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.61000001;
			y=0.76249999;
			text="$STR_DISP_CONTINUE";
			onButtonClick="private [""_handle""]; _handle = _this execVM ""\ca\ui\scripts\armory\startArmory.sqf""";
		};
		class ButtonCancel: RscShortcutButton
		{
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.41;
			y=0.76249999;
			text="$STR_DISP_BACK";
			onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class ButtonHost: RscShortcutButton
		{
			idc=19831;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.20999999;
			y=0.76249999;
			text="$STR_XBOX_MP_HOST";
			onButtonClick="private [""_handle""]; _handle = _this execVM ""\ca\ui\scripts\armory\hostArmory.sqf""";
		};
	};
};
class RscCameraControl
{
	idd=1122;
	moveOnEdges=0;
	movingEnable=1;
	enableSimulation=1;
	class Controls
	{
		class center: RscPicture
		{
			idc=112203;
			style="0x30 + 0x800";
			x=0.40000001;
			y=0.40000001;
			w=0.2;
			h=0.2;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\cursor_w_laserlock_gs.paa";
		};
		class axisX: RscText
		{
			idc=112202;
			x=0;
			y=0;
			w=0;
			h=0;
			colorBackground[]={1,0,0,1};
		};
		class axisY: axisX
		{
			idc=112203;
			colorBackground[]={1,0,0,1};
		};
		class mousearea: RscText
		{
			idc=112201;
			style="2 + 16";
			x=-1;
			y=-1;
			w=3;
			h=3;
			text="";
			linespacing=1;
		};
		class god_debug: RscText
		{
			idc=112299;
			style="2 + 16";
			x=0.80000001;
			y=0.1;
			w="0.2 h=0.3";
			text=" ";
			colorText[]={0,0,0,1};
			sizeEx=0.02;
			linespacing=1;
		};
	};
};
class RscFunctionsViewer
{
	idd=2929;
	movingEnable=0;
	onload="BIS_functions_mainscope setvariable ['help',true];";
	onunload="BIS_functions_mainscope setvariable ['help',nil];";
	class controls
	{
		class Background
		{
			x=0;
			y=0;
			w=1;
			h=1;
			style=0;
			type=0;
			idc=-1;
			font="Zeppelin32";
			sizeEx=0.023;
			text="";
			colorBackground[]={0,0,0,0.75};
			colorText[]={0,0,0,1};
			shadow=0;
		};
		class Caption
		{
			x=0;
			y=0.0099999998;
			w=1;
			h=0.029999999;
			style=2;
			type=0;
			idc=-1;
			font="Zeppelin32";
			sizeEx=0.023;
			text="Functions viewer";
			colorBackground[]={0.30000001,0,0,1};
			colorText[]={1,1,1,1};
			shadow=0;
		};
		class TreeFunctions
		{
			style=0;
			maxHistoryDelay=0;
			idc=292901;
			type=5;
			x=0.0099999998;
			y="0.144+0.094*4";
			w=0.40000001;
			h="0.851-0.094*4";
			font="Zeppelin32";
			sizeEx=0.028000001;
			text="";
			rowHeight=0;
			color[]={1,1,1,1};
			colorText[]={1,1,1,1};
			colorScrollbar[]={1,1,1,1};
			colorSelect[]={0,0,0,1};
			colorSelect2[]={0,0,0,1};
			colorSelectBackground[]={0.40000001,0.40000001,0.40000001,1};
			colorSelectBackground2[]={0.40000001,0.40000001,0.40000001,1};
			period=0;
			colorBackground[]={0,0,0,1};
			soundSelect[]=
			{
				"",
				0.1,
				1
			};
			class ScrollBar
			{
				color[]={1,1,1,0.60000002};
				colorActive[]={1,1,1,1};
				colorDisabled[]={1,1,1,0.30000001};
				thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
				border="\ca\ui\data\ui_border_scroll_ca.paa";
			};
			autoScrollRewind=0;
			autoScrollDelay=0;
			autoScrollSpeed=0;
			shadow=0;
		};
		class TreeSources: TreeFunctions
		{
			idc=292902;
			x=0.0099999998;
			y=0.050000001;
			w=0.40000001;
			h=0.083999999;
			wholeHeight=0.20999999;
		};
		class TreeTags: TreeFunctions
		{
			idc=292903;
			x=0.0099999998;
			y=0.14399999;
			w=0.40000001;
			h=0.083999999;
			wholeHeight=0.20999999;
		};
		class TreeCats: TreeFunctions
		{
			idc=292904;
			x=0.0099999998;
			y="0.144+0.094";
			w=0.40000001;
			h="0.084+0.094*2";
			wholeHeight=0.20999999;
		};
		class fncTitle: RscText
		{
			idc=292905;
			style="0x00 + 16";
			linespacing=1;
			type=0;
			x=0.41999999;
			y=0.050000001;
			w=0.56999999;
			h=0.07;
			text="";
			font="Zeppelin32";
			sizeEx=0.050000001;
			colorBackground[]={0,0,0,0};
			colorText[]={1,1,1,1};
			shadow=0;
		};
		class fncPath: RscText
		{
			idc=292906;
			y=0.11;
			h=0.014;
			sizeEx=0.024;
			colorText[]={1,1,1,0.69999999};
			x=0.41999999;
			w=0.56999999;
			type=0;
			style=0;
		};
		class fncDescription: fncTitle
		{
			idc=292907;
			type=0;
			x=0.41999999;
			y=0.14399999;
			w=0.56999999;
			h=0.30000001;
			text="";
			sizeEx=0.028000001;
		};
		class fncCode: RscEdit
		{
			idc=292908;
			x=0.41999999;
			y=0.454;
			w=0.56999999;
			h=0.5;
			font="EtelkaMonospaceProBold";
			style="0x00 + 16";
			linespacing=1;
			text="";
			sizeEx=0.02;
			colorBackground[]={0,0,0,0};
			colorText[]={1,1,1,1};
		};
		class btnCopy: RscButton
		{
			type=1;
			idc=292909;
			y=0.95999998;
			x="0.43+0.19";
			w=0.18000001;
			h=0.035;
			style=0;
			text="Copy to Clipboard";
			colorBackground[]={0.60000002,0.30000001,0,1};
			action="copytoclipboard ctrltext ((findDisplay 2929) displayctrl 292908); (bis_functions_mainscope getvariable 'help_code');";
			sizeEx=0.028000001;
			colortext[]={1,1,1,1};
		};
		class btnRefresh: btnCopy
		{
			idc=292910;
			x=0.43000001;
			text="Refresh";
			action="BIS_functions_mainscope setvariable ['help_refresh',true];";
		};
		class btnRecompileFile: btnCopy
		{
			idc=292911;
			x="0.43+2*0.19";
			text="Recompile File";
			action="_list = (findDisplay 2929) displayctrl 292901; _fncname = _list lbtext (lbcursel _list); call compile format ['%1 = compile preprocessfilelinenumbers ''%2''',_fncname,call compile format ['%1_path',_fncname]]";
		};
	};
};
class RscConfigEditor_Main
{
	idd=3030;
	movingEnable=0;
	onload="uinamespace setvariable ['BIS_configviewer_display',_this select 0];";
	onunload="_nil = [] spawn BIS_configviewer_unload";
	class Controls
	{
		class MainBackground
		{
			x="safezoneXAbs";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
			style=0;
			type=0;
			idc=-1;
			font="Zeppelin32";
			sizeEx=0.023;
			text="";
			colorBackground[]={0,0,0,0.69999999};
			colorText[]={0,0,0,1};
			shadow=0;
		};
		class MainCaption
		{
			x="safezoneXAbs";
			y="safezoneY + 0.01";
			w="safezoneW";
			h=0.029999999;
			style=2;
			type=0;
			idc=-1;
			font="Zeppelin32";
			sizeEx=0.023;
			text="Config viewer";
			colorBackground[]={0.30000001,0,0,1};
			colorText[]={1,1,1,1};
			shadow=2;
		};
		class PathLine: MainCaption
		{
			y="safezoneY + 0.04";
			idc=3;
			style=0;
			text="Configfile";
			colorBackground[]={0,0,0,0};
			shadow=2;
		};
		class MainTree
		{
			style=0;
			maxHistoryDelay=0;
			idc=1;
			type=5;
			x="safezoneXAbs + 0.01";
			y="safezoneY + 0.07";
			w=0.48500001;
			h="safezoneH - 0.07 - 0.03";
			font="Zeppelin32";
			sizeEx=0.023;
			text="";
			rowHeight=0;
			color[]={0.94999999,0.94999999,0.94999999,1};
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			colorScrollbar[]={0.94999999,0.94999999,0.94999999,1};
			colorSelect[]={0.023529001,0,0.031372499,1};
			colorSelect2[]={0.023529001,0,0.031372499,1};
			colorSelectBackground[]={0.40000001,0.40000001,0.40000001,1};
			colorSelectBackground2[]={0.40000001,0.40000001,0.40000001,1};
			period=0;
			colorBackground[]={0.023529001,0,0.031372499,1};
			soundSelect[]=
			{
				"",
				0.1,
				1
			};
			onLBSelChanged="_this spawn BIS_configviewer_show;";
			onLBDblClick="_this spawn BIS_configviewer_open;";
			onMouseButtonDown="_this spawn BIS_configviewer_return;";
			onKeyDown="_this spawn BIS_configviewer_keydown;";
			class ScrollBar
			{
				color[]={1,1,1,0.60000002};
				colorActive[]={1,1,1,1};
				colorDisabled[]={1,1,1,0.30000001};
				thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull="\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty="\ca\ui\data\ui_arrow_top_ca.paa";
				border="\ca\ui\data\ui_border_scroll_ca.paa";
			};
			autoScrollRewind=0;
			autoScrollDelay=0;
			autoScrollSpeed=0;
			shadow=0;
		};
		class MainList: MainTree
		{
			idc=2;
			x="safezoneXAbs + 0.485 + 0.02";
			w="safezoneWAbs - 0.485 - 0.03";
			onLBSelChanged="";
			onLBDblClick="";
			onMouseButtonDown="";
			onKeyDown="_this spawn BIS_configviewer_keydown_list;";
			shadow=0;
		};
	};
};
class RscDisplayWFVoting: RscStandardDisplay
{
	idd=1001;
	onLoad="_this call BIS_WF_UpdateCommanderVoteMenu";
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			idc=1002;
			x=0.273;
			y=0.134;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\igui_wf_vote_background_ca.paa";
			colorText[]={1,1,1,1};
		};
	};
	class controls
	{
		class VotingTitle: RscText
		{
			idc=1003;
			x=0.28299999;
			y=0.133549;
			w=0.44;
			h=0.039209999;
			text="$STR_WF_VOTE_COMMANDER";
		};
		class VotesText: RscText
		{
			idc=1004;
			x=0.28299999;
			y=0.17399999;
			w=0.13500001;
			h=0.039209999;
			text="$STR_WF_VOTES";
		};
		class PlayersText: RscText
		{
			idc=1005;
			x=0.414;
			y=0.17399999;
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_PLAYERS";
		};
		class Players: RscIGUIListNBox
		{
			columns[]={0,0.30000001};
			idc=1006;
			x=0.273;
			y=0.211;
			w=0.45500001;
			h=0.528;
			rows=10;
			rowHeight=0.025;
			lineSpacing=1;
			text=" ";
		};
		class MostVotesText: RscText
		{
			idc=1007;
			x=0.28299999;
			y=0.78500003;
			w=0.43399999;
			h=0.039209999;
			text="";
		};
		class ButtonClose: RscIGUIShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				"0x00050000 + 1",
				28,
				57,
				156
			};
			x=0.54575801;
			y=0.828439;
			text="$STR_DISP_CLOSE";
			onButtonClick="(ctrlParent (_this select 0)) closeDisplay 2;";
		};
	};
};
class MapArea: RscMapControl
{
	style=48;
	font="EtelkaNarrowMediumPro";
	sizeEx=0.025;
	type=101;
	idc=515;
	colorBackground[]={0.80000001,0.80000001,0.80000001,1};
	colorText[]={0,0,0,1};
	colorRailway[]={0.5,0.5,0.5,0.5};
	colorSea[]={0.56,0.80000001,0.98000002,0.5};
	colorForest[]={0.60000002,0.80000001,0.2,0.5};
	colorRocks[]={0.5,0.5,0.5,0.5};
	colorCountlines[]={0.64999998,0.44999999,0.27000001,0.5};
	colorMainCountlines[]={0.64999998,0.44999999,0.27000001,1};
	colorCountlinesWater[]={0,0.52999997,1,0.5};
	colorMainCountlinesWater[]={0,0.52999997,1,1};
	colorForestBorder[]={0.40000001,0.80000001,0,1};
	colorRocksBorder[]={0.5,0.5,0.5,1};
	colorPowerLines[]={0,0,0,1};
	colorNames[]={0,0,0,1};
	colorInactive[]={1,1,1,0.5};
	colorLevels[]={0,0,0,1};
	fontLabel="TahomaB";
	sizeExLabel=0.039999999;
	fontGrid="TahomaB";
	sizeExGrid=0.039999999;
	fontUnits="TahomaB";
	sizeExUnits=0.039999999;
	fontNames="TahomaB";
	sizeExNames=0.039999999;
	fontInfo="TahomaB";
	sizeExInfo=0.039999999;
	fontLevel="TahomaB";
	sizeExLevel=0.039999999;
	text="#(argb,8,8,3)color(1,1,1,1)";
	stickX[]=
	{
		0.2,
		
		{
			"Gamma",
			1,
			1.5
		}
	};
	stickY[]=
	{
		0.2,
		
		{
			"Gamma",
			1,
			1.5
		}
	};
	ptsPerSquareSea=6;
	ptsPerSquareTxt=8;
	ptsPerSquareCLn=8;
	ptsPerSquareExp=8;
	ptsPerSquareCost=8;
	ptsPerSquareFor="4.0f";
	ptsPerSquareForEdge="10.0f";
	ptsPerSquareRoad=2;
	ptsPerSquareObj=10;
	showCountourInterval="true";
	x=0;
	y=0.050000001;
	w=1;
	h=0.80000001;
	onMouseMoving="mouseX = (_this Select 1);mouseY = (_this Select 2)";
	onMouseButtonDown="mouseButtonDown = _this Select 1";
	onMouseButtonUp="mouseButtonUp = _this Select 1";
	class task
	{
		icon="\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated="\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled="#(argb,8,8,3)color(0,0,0,0)";
		iconDone="\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed="\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[]={0.86299998,0.58399999,0,1};
		colorCreated[]={0.94999999,0.94999999,0.94999999,1};
		colorCanceled[]={0.60600001,0.60600001,0.60600001,1};
		colorDone[]={0.42399999,0.65100002,0.24699999,1};
		colorFailed[]={0.70599997,0.074500002,0.0196,1};
		size=10;
		coefMin=1;
		coefMax=4;
		importance=1;
	};
	class CustomMark
	{
		icon="\ca\ui\data\map_waypoint_ca.paa";
		color[]={0,0,1,1};
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Bunker
	{
		icon="\ca\ui\data\map_bunker_ca.paa";
		color[]={0,0,1,1};
		size=14;
		importance="1.5 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Bush
	{
		icon="\ca\ui\data\map_bush_ca.paa";
		color[]={0.55000001,0.63999999,0.43000001,1};
		size=14;
		importance="0.2 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class BusStop
	{
		icon="\ca\ui\data\map_busstop_ca.paa";
		color[]={0,0,1,1};
		size=10;
		importance="1 * 10 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Command
	{
		icon="#(argb,8,8,3)color(1,1,1,1)";
		color[]={0,0.89999998,0,1};
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Cross
	{
		icon="\ca\ui\data\map_cross_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="0.7 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fortress
	{
		icon="\ca\ui\data\map_bunker_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fuelstation
	{
		icon="#(argb,8,8,3)color(0,0,0,1)";
		color[]={0,0,0,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.75;
		coefMax=4;
	};
	class Fountain
	{
		icon="\ca\ui\data\map_fountain_ca.paa";
		color[]={0,0.34999999,0.69999999,1};
		size=12;
		importance="1 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Hospital
	{
		icon="\ca\ui\data\map_hospital_ca.paa";
		color[]={0.77999997,0,0.050000001,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Chapel
	{
		icon="\ca\ui\data\map_chapel_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Church
	{
		icon="\ca\ui\data\map_church_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Lighthouse
	{
		icon="\ca\ui\data\map_lighthouse_ca.paa";
		color[]={0.77999997,0,0.050000001,1};
		size=20;
		importance="3 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Quay
	{
		icon="\ca\ui\data\map_quay_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Rock
	{
		icon="\ca\ui\data\map_rock_ca.paa";
		color[]={0,0,1,1};
		size=12;
		importance="0.5 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Ruin
	{
		icon="\ca\ui\data\map_ruin_ca.paa";
		color[]={0.77999997,0,0.050000001,1};
		size=16;
		importance="1.2 * 16 * 0.05";
		coefMin=1;
		coefMax=4;
	};
	class SmallTree
	{
		icon="\ca\ui\data\map_smalltree_ca.paa";
		color[]={0.55000001,0.63999999,0.43000001,1};
		size=12;
		importance="0.6 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Stack
	{
		icon="\ca\ui\data\map_stack_ca.paa";
		color[]={0,0,1,1};
		size=20;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Tree
	{
		icon="\ca\ui\data\map_tree_ca.paa";
		color[]={0.55000001,0.63999999,0.43000001,1};
		size=12;
		importance="0.9 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Tourism
	{
		icon="\ca\ui\data\map_tourism_ca.paa";
		color[]={0.77999997,0,0.050000001,1};
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.69999999;
		coefMax=4;
	};
	class Transmitter
	{
		icon="\ca\ui\data\map_transmitter_ca.paa";
		color[]={0,0,1,1};
		size=20;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class ViewTower
	{
		icon="\ca\ui\data\map_viewtower_ca.paa";
		color[]={0,0,1,1};
		size=16;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Watertower
	{
		icon="\ca\ui\data\map_watertower_ca.paa";
		color[]={0,0.34999999,0.69999999,1};
		size=32;
		importance="1.2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Waypoint
	{
		icon="\ca\ui\data\map_waypoint_ca.paa";
		color[]={0,0,1,1};
		size=14;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class WaypointCompleted
	{
		icon="\ca\ui\data\map_waypoint_completed_ca.paa";
		color[]={0,0,1,1};
		size=14;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class ActiveMarker
	{
		icon="";
		color[]={0,0,1,1};
		size=14;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
};
class RespawnMap
{
	idd=5000;
	movingEnable=1;
	objects[]={};
	controls[]=
	{
		"RespawnTimerBar",
		"RespawnMapArea",
		"RespawnLocationLabel",
		"MessageBar"
	};
	controlsBackground[]=
	{
		"MenuBackground"
	};
	onLoad="_this Exec (corePath + ""Client\GUI\GUI_UpdateRespawnMap.sqs"")";
	class MenuBackground
	{
		type=0;
		idc=-1;
		style=0;
		colorText[]={0.75,0.75,0.75,1};
		font="EtelkaNarrowMediumPro";
		sizeEx=0.025;
		colorBackground[]={0.40000001,0.40000001,0.40000001,1};
		text="";
		x=0;
		y=0.15000001;
		w=1;
		h=0.69999999;
	};
	class RespawnTimerBar
	{
		type=0;
		idc=510;
		style=0;
		colorText[]={0.75,0.75,0.75,1};
		colorBackground[]={0,0,0,0};
		font="EtelkaNarrowMediumPro";
		sizeEx=0.025;
		text="";
		x=0.0099999998;
		y=0.02;
		w=0.98000002;
		h=0.059999999;
	};
	class RespawnMapArea: MapArea
	{
		x=-0.5;
		y=0.12;
		w=2;
		h=0.75999999;
	};
	class RespawnLocationLabel
	{
		type=0;
		style=0;
		colorBackground[]={0,0,0,0};
		text="";
		idc=500;
		font="EtelkaNarrowMediumPro";
		sizeEx=0.050000001;
		x=0.64999998;
		y=0.89999998;
		w=1;
		h=0.039999999;
		colorText[]={1,1,1,1};
	};
	class MessageBar
	{
		type=0;
		idc=-1;
		style=0;
		colorBackground[]={0,0,0,0};
		font="EtelkaNarrowMediumPro";
		sizeEx=0.025;
		x=0.050000001;
		y=0.95999998;
		w=0.89999998;
		h=0.039999999;
		colorText[]={0,1,0,1};
		text="$STRWFCLICKONRESPAWNLOCATION";
	};
};
class RespawnTimer
{
	idd=5000;
	movingEnable=1;
	objects[]={};
	controls[]=
	{
		"RespawnBar"
	};
	controlsBackground[]={};
	onLoad="_this Exec (corePath + ""Client\GUI\GUI_UpdateRespawnTimer.sqs"")";
	class RespawnBar
	{
		type=0;
		text="";
		style=0;
		colorText[]={0.75,0.75,0.75,1};
		colorBackground[]={0,0,0,0};
		idc=511;
		font="EtelkaNarrowMediumPro";
		sizeEx=0.025;
		x=0.0099999998;
		y=0.02;
		w=0.98000002;
		h=0.059999999;
	};
};
class RscDisplayWFCity: RscStandardDisplay
{
	idd=1003;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			idc=1002;
			x=0.28299999;
			y=0.133549;
			w="0.6274510 + 0.24";
			h=0.83660132;
			text="\ca\ui\data\igui_wf_vote_background_ca.paa";
			colorText[]={1,1,1,1};
		};
	};
	class controls
	{
		class CityTitle: RscText
		{
			idc=1013;
			x=0.28299999;
			y=0.133549;
			w=0.44;
			h=0.039209999;
			text="$STR_client_playerrespawn.sqf2";
		};
		class NameLabel: RscText
		{
			idc=1014;
			x="0.283 + 0.0";
			y="0.133549+ 0.08";
			w=0.13500001;
			h=0.039209999;
			text="$STR_WF_NAME";
		};
		class NameValue: RscText
		{
			idc=1015;
			x="0.283 + 0.0 + 0.23";
			y="0.133549 + 0.08";
			w=0.30599999;
			h=0.039209999;
			text="";
		};
		class OwnerLabel: RscText
		{
			idc=1016;
			x="0.283 + 0.0";
			y="0.133549 + 0.08+ 0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_OWNER";
		};
		class OwnerValue: RscText
		{
			idc=1017;
			x="0.283 + 0.0 + 0.23";
			y="0.133549 + 0.08+ 0.04";
			w=0.30599999;
			h=0.039209999;
			text="";
		};
		class ValueLabel: RscText
		{
			idc=1018;
			x="0.283 + 0.0";
			y="0.133549 + 0.08+ 6*0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_VALUE";
		};
		class ValueValue: RscText
		{
			idc=1019;
			x="0.283 + 0.0 + 0.23 /2";
			y="0.133549 + 0.08+ 6*0.04";
			w=0.30599999;
			h=0.039209999;
			text="";
		};
		class ValueDefenseLabel: RscText
		{
			idc=1020;
			x="0.283 + 0.0 + 0.02";
			y="0.133549 + 0.08+ 7*0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_DEFENCE_ACT";
		};
		class ValueDefenseValue: RscText
		{
			idc=1021;
			x="0.283 + 0.0 + 0.23 + 0.02";
			y="0.133549 + 0.08+ 7*0.04";
			w=0.30599999;
			h=0.039209999;
			text="000";
		};
		class ValueLogisticLabel: RscText
		{
			idc=1022;
			x="0.283 + 0.0 + 0.32";
			y="0.133549 + 0.08+ 7*0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_LOGISTICS_ACT";
		};
		class ValueLogisticValue: RscText
		{
			idc=1023;
			x="0.283 + 0.0 + 0.23 + 0.32";
			y="0.133549 + 0.08+ 7*0.04";
			w=0.30599999;
			h=0.039209999;
			text="111";
		};
		class ValueDefenseLabelWanted: RscText
		{
			idc=1024;
			x="0.283 + 0.0 + 0.02";
			y="0.133549 + 0.08+ 8*0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_DEFENSE_REQ";
		};
		class ValueDefenseValueWanted: RscText
		{
			idc=1025;
			x="0.283 + 0.0 + 0.23 + 0.02";
			y="0.133549 + 0.08+ 8*0.04";
			w=0.30599999;
			h=0.039209999;
			text="000";
		};
		class ValueLogisticLabelWanted: RscText
		{
			idc=1026;
			x="0.283 + 0.0 + 0.32";
			y="0.133549 + 0.08+ 8*0.04";
			w=0.30599999;
			h=0.039209999;
			text="$STR_WF_LOGISTICS_REQ";
		};
		class ValueLogisticValueWanted: RscText
		{
			idc=1027;
			x="0.283 + 0.0 + 0.23 + 0.32";
			y="0.133549 + 0.08+ 8*0.04";
			w=0.30599999;
			h=0.039209999;
			text="111";
		};
		class leftArrow: RscGearShortcutButton
		{
			idc=10001;
			style=2048;
			x=0;
			y=0;
			onButtonClick="BIS_WFUI_menuButton = 4;";
			text="&lt;";
			shortcuts[]={203,30};
		};
		class rightArrow: leftArrow
		{
			idc=10002;
			x=0;
			y=0;
			onButtonClick="BIS_WFUI_menuButton = 5;";
			text="&gt;";
			shortcuts[]={205,32};
		};
		class ValueSlider: RscIGUIListNBox
		{
			idc=1006;
			columns[]={0.30000001,0.69999999};
			x="0.283 + 0.0 + 0.02";
			y="0.133549 + 0.08+ 12*0.04";
			w=0.47;
			h=0.050000001;
			rows=1;
			rowHeight=0.025;
			drawSideArrows=1;
			idcLeft=10001;
			idcRight=10002;
		};
		class ButtonClose: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 0",
				"0x00050000 + 1",
				28,
				156,
				57
			};
			x="0.283 + 0.0 + 0.02";
			y=0.828439;
			text="$STR_DISP_CLOSE";
			onButtonClick="BIS_WFUI_menuButton = 2;";
		};
	};
};
class RscDisplayArtillery: RscStandardDisplay
{
	idd=-1;
	enableSimulation=1;
	class controlsBackground
	{
		delete Background1;
		class CA_TSMap: RscMapControl
		{
			idc=500;
			x="SafeZoneX";
			y="SafeZoneY";
			w="safeZoneW";
			h="safeZoneH";
			type=101;
			ShowCountourInterval=0;
			scaleDefault=0.1;
			colorbackground[]={1,1,1,1};
			onMouseButtonClick="_dummy = [_this, ""CA_TS_MapClick""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"";";
			onMouseButtonDblClick="_dummy = [_this, ""CA_TS_ListDoubleClick""] execVM ""\ca\ui\scripts\TeamSwitch.sqf"";";
		};
	};
	class Controls
	{
		delete Background;
		delete Roles;
		delete ButtonOK;
		delete ButtonCancel;
		class Mainback: CA_Mainback
		{
			x="SafeZoneX + SafezoneW - 	0.21*1.5";
			y="SafeZoneY";
			w="0.21*1.5";
			h="SafeZoneH";
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class IntelBack: CA_Back
		{
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="safezoneY + (						 0.03921)*1";
			w="0.21*1.5 * 0.9";
			h="0.03921*3";
			colorText[]={0.15000001,0.15000001,0.15000001,0.69999999};
		};
		class ArtilleryName: RscText
		{
			idc=502;
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="safezoneY + (						 0.03921)*2";
			w="0.21*1.5 * 0.9";
			h=0.039209999;
			text="--";
			sizeex=0.050653595;
			style=2;
		};
		class ArtilleryGridText: RscText
		{
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="safezoneY + (						 0.03921)*5";
			sizeex=0.039209999;
			style=0;
			text="GRID";
		};
		class ArtilleryGrid: ArtilleryName
		{
			idc=504;
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="safezoneY + (						 0.03921)*5";
			sizeex=0.039209999;
			style=1;
		};
		class ArtilleryDistText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*6";
			text="DIST";
		};
		class ArtilleryDist: ArtilleryGrid
		{
			idc=505;
			y="safezoneY + (						 0.03921)*6";
		};
		class ArtilleryMinRangeText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*7";
			text="  MIN";
		};
		class ArtilleryMinRange: ArtilleryGrid
		{
			idc=506;
			y="safezoneY + (						 0.03921)*7";
		};
		class ArtilleryMaxRangeText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*8";
			text="  MAX";
		};
		class ArtilleryMaxRange: ArtilleryGrid
		{
			idc=507;
			y="safezoneY + (						 0.03921)*8";
		};
		class ArtilleryDirText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*9";
			text="DIR";
		};
		class ArtilleryDir: ArtilleryGrid
		{
			idc=508;
			y="safezoneY + (						 0.03921)*9";
		};
		class ArtilleryAltText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*10";
			text="ALT";
		};
		class ArtilleryAlt: ArtilleryGrid
		{
			idc=509;
			y="safezoneY + (						 0.03921)*10";
		};
		class ArtilleryModeText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*12";
			text="MODE";
		};
		class ArtilleryMode: RscCombo
		{
			idc=510;
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2 + (			0.21*1.5 * 0.9 * 0.4)";
			y="safezoneY + (						 0.03921)*12";
			w="0.21*1.5 * 0.9 * 0.6";
		};
		class ArtilleryTypeText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*13";
			text="TYPE";
		};
		class ArtilleryType: ArtilleryGrid
		{
			idc=511;
			y="safezoneY + (						 0.03921)*13";
		};
		class ArtilleryShellsText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*14";
			text="BURST";
		};
		class ArtilleryShells: ArtilleryGrid
		{
			idc=512;
			y="safezoneY + (						 0.03921)*14";
		};
		class ArtilleryAmmoText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*15";
			text="AMMO";
		};
		class ArtilleryAmmo: ArtilleryGrid
		{
			idc=515;
			y="safezoneY + (						 0.03921)*15";
		};
		class ArtillerySpreadText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*16";
			text="SPREAD";
		};
		class ArtillerySpread: ArtilleryGrid
		{
			idc=513;
			y="safezoneY + (						 0.03921)*16";
		};
		class ArtilleryETAText: ArtilleryGridText
		{
			y="safezoneY + (						 0.03921)*17";
			text="ETA";
		};
		class ArtilleryETA: ArtilleryGrid
		{
			idc=514;
			y="safezoneY + (						 0.03921)*17";
		};
		class CA_Warning: CA_IGUI_Title
		{
			idc=516;
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			w="0.21*1.5 * 0.9";
			y="SafeZoneY + SafezoneH - 0.0522876*5";
			text="WARNING";
			style=2;
			colorText[]={0.70599997,0.074500002,0.0196,1};
		};
		class CA_ButtonFire: RscIGUIShortcutButton
		{
			idc=501;
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="SafeZoneY + SafezoneH - 0.0522876*2";
			w="0.21*1.5 * 0.9";
			default=1;
			text="$STR_STATE_FIRE";
		};
		class CA_ButtonContinue: RscIGUIShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(SafeZoneW + SafeZoneX) - 			0.21*1.5 * 0.9 - (	0.21*1.5 - 			0.21*1.5 * 0.9)/2";
			y="SafeZoneY + SafezoneH - 0.0522876*3";
			w="0.21*1.5 * 0.9";
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayMain: RscStandardDisplay
{
	onKeyDown=" _dummy = _this execVM ""\ca\ui\scripts\mainmenuShortcuts.sqf"";";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class CA_ARMA2: RscPicture
		{
			idc=1106;
			colorText[]=
			{
				1,
				1,
				1,
				"0.6+0.4"
			};
			x="(SafeZoneW + SafeZoneX) - (0.1568627*1.5 + 0.04)";
			y="SafeZoneY + 0.00";
			w="0.1568627*1.5";
			h="0.2091503*1.5";
			text="\CA\ui\data\startup_logo_arma_all_ca.paa";
		};
	};
	class controls
	{
		delete B_Player;
		delete B_SinglePlayer;
		delete B_SingleMission;
		delete B_MultiPlayer;
		delete B_MissionEditor;
		delete B_Credits;
		delete B_Quit;
		delete B_Campaign;
		delete B_Expansions;
		delete B_Options;
		delete Date;
		delete Version;
		delete Modlist;
		class CA_TitleMainMenu: CA_Title
		{
			idc=1003;
			x=0.086999997;
			y=0.192;
			w=0.28;
			text="$STR_DISP_MAIN_MENU";
		};
		class CA_SinglePlayer: RscShortcutButtonMain
		{
			idc=138;
			default=1;
			x=0.050999999;
			y=0.25369999;
			toolTip="$STR_TOOLTIP_MAIN_SINGLEPLAYER";
			text="$STR_DISP_MAIN_SINGLE_PLAYER";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_MP: RscShortcutButtonMain
		{
			idc=105;
			x=0.050999999;
			y=0.35451901;
			toolTip="$STR_TOOLTIP_MAIN_MULTIPLAYER";
			text="$STR_CA_MAIN_MULTI";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Options: RscShortcutButtonMain
		{
			idc=102;
			default=0;
			x=0.050999999;
			y=0.455421;
			action="";
			toolTip="$STR_TOOLTIP_MAIN_OPTIONS";
			text="$STR_CA_MAIN_OPTIONS";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_PlayerProfile: RscShortcutButtonMain
		{
			idc=1001;
			default=0;
			x=0.050999999;
			y=0.55732399;
			onButtonClick="_display = ctrlParent (_this select 0);  _ctrl109 =_display displayCtrl 109; ctrlActivate _ctrl109; debuglog _ctrl109";
			toolTip="$STR_TOOLTIP_MAIN_PLAYER";
			text="$STR_DISP_PROFILE";
			class KeyHints
			{
			};
		};
		class CA_Expansions: RscShortcutButtonMain
		{
			idc=140;
			default=0;
			x=0.050999999;
			y=0.65799999;
			action="";
			toolTip="$STR_TOOLTIP_MAIN_EXPANSIONS";
			text="$STR_DISP_EXPANSIONS";
			class KeyHints
			{
			};
		};
		class CA_Exit: RscShortcutButton
		{
			idc=106;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.109431;
			y=0.76249999;
			w=0.227943;
			text="$STR_CA_MAIN_QUIT";
			toolTip="$STR_TOOLTIP_MAIN_EXIT";
		};
		class CA_Achievements: RscShortcutButtonMain
		{
			idc=137;
			x=0.050999999;
			y=0.65799999;
			text="$STR_DISP_ACHIEVEMENTS";
			class KeyHints
			{
			};
		};
		class CA_ModList: RscStructuredText
		{
			idc=139;
			style=1;
			x="(SafeZoneW + SafeZoneX) - (0.53)";
			y="SafeZoneY + 0.2091503*1.5";
			w=0.5;
			h=0.5;
			size=0.02674;
			class Attributes
			{
				font="Zeppelin32";
				color="#dfd7a5";
				align="right";
				shadow=0;
			};
		};
		class ModIcons: RscControlsGroup
		{
			idc=141;
			x="SafeZoneX+0.03";
			y="(SafeZoneH + SafeZoneY) - (0.113*SafeZoneH)";
			w=0.80000001;
			h=0.2;
			class Controls
			{
			};
		};
		class IconPicture: RscPicture
		{
			w=0.058823548;
			h=0.078431398;
			spacing=0.02;
		};
		class CA_PlayerName: RscText
		{
			idc=109;
			style=256;
			colorbackground[]={0.1,0.1,0.1,0};
			x="SafeZoneX + 0.03";
			y="SafeZoneY + 0.03";
			w=0.5;
			h=0.050000001;
		};
		class CA_Version: RscText
		{
			idc=118;
			style="0x100 + 0x01";
			x="(SafeZoneW + SafeZoneX) - (0.53)";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.92)";
			w=0.5;
			h=0.050000001;
			sizeEx=0.02674;
		};
		class HintA_Select: RscXKeyShadow
		{
			idc=1007;
			key="0x00050000 + 0";
			x=0.14;
			y=0.78399998;
			w=0.33088499;
			h=0.1045752;
			text="$STR_DISP_BACK";
		};
		class ButtonCampaign: RscText
		{
			idc=120;
			x=2.585;
			y=2.0380001;
		};
		class ButtonAllMissions: RscShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x="(SafeZoneW + SafeZoneX) - (0.24)";
			y="(SafeZoneH + SafeZoneY) - (0.2)";
			w=0.235296;
			text="All missions";
		};
		class ButtonEditor: RscText
		{
			idc=115;
			x=2.585;
			y=2.0380001;
		};
	};
	class KeyHints
	{
		class KeyA
		{
			key="0x00050000 + 0";
			hint="";
		};
	};
};
scriptsPath="ca\data\scripts\";
startupScript="ca\ca_e\data\scripts\startup.sqs";
cameraScript="camera.sqs";
playerKilledScript="onPlayerKilled.sqs";
playerRespawnScript="onPlayerRespawn.sqs";
playerRespawnOtherUnitScript="onPlayerRespawnOtherUnit.sqs";
playerRespawnSeagullScript="onPlayerRespawnAsSeagull.sqs";
playerResurrectScript="onPlayerResurrect.sqs";
teamSwitchScript="onTeamSwitch.sqf";
TrackIR_Developer_ID=7502;
TrackIR_Developer_AppKeyHigh=-348776781;
TrackIR_Developer_AppKeyLow=-1538325063;
profilePathDefault="Armed Assault";
profilePathCommon="Armed Assault Other Profiles";
overviewLockedMission="ca\ui\data\dtaext\lockedmission";
overviewMyMissions="ca\ui\data\dtaext\mymissions";
overviewNewMission="ca\ui\data\dtaext\newmission";
fontPlate="EtelkaNarrowMediumPro";
fontHelicopterHUD="EtelkaNarrowMediumPro";
fontClanName="EtelkaNarrowMediumPro";
class CfgWrapperUI
{
	class Background
	{
		texture="#(argb,8,8,3)color(0,0,0,1)";
	};
	class TitleBar
	{
		texture="\ca\ui\data\ui_window_title_co.paa";
	};
	class GroupBox2
	{
		texture="\ca\ui\data\ui_window_background_co.paa";
	};
	class ListBox
	{
		line="#(argb,8,8,3)color(1,1,1,0)";
		thumb="\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty="\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_left_active_ca.paa";
		border="\ca\ui\data\ui_border_frame_ca.paa";
		boxLeft="\ca\ui\data\ui_combo_left_ca.paa";
		boxRight="\ca\ui\data\ui_combo_right_ca.paa";
		boxHorz="\ca\ui\data\ui_combo_horizon_ca.paa";
	};
	class Slider
	{
		arrowEmpty="\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull="\ca\ui\data\ui_arrow_left_active_ca.paa";
		border="\ca\ui\data\ui_border_frame_ca.paa";
		thumb="\ca\ui\data\ui_slider_bar_ca.paa";
	};
	class Cursors
	{
		class Arrow
		{
			texture="\ca\ui\data\cursor_raw.paa";
			width=32;
			height=32;
			hotspotX=0.1875;
			hotspotY=0.03125;
		};
		class Track
		{
			texture="\ca\ui\data\cursor_mapediting_raw.paa";
		};
		class Move
		{
			texture="\ca\ui\data\cursor_mapmoving_raw.paa";
		};
		class Scroll
		{
			texture="\ca\ui\data\cursor_scroll_ca.paa";
		};
		class Rotate
		{
			texture="\ca\ui\data\cursor_editor_2d_rotation_ca.paa";
		};
		class Track3D
		{
			texture="\ca\ui\data\cursor_editor_3d_selection_ca.paa";
			width=32;
			height=32;
			hotspotX=0;
			hotspotY=0;
		};
		class Move3D
		{
			texture="\ca\ui\data\cursor_editor_3d_movement_ca.paa";
			width=32;
			height=32;
			hotspotX=0;
			hotspotY=0;
		};
		class Rotate3D
		{
			texture="\ca\ui\data\cursor_editor_3d_rotation_ca.paa";
			width=32;
			height=32;
			hotspotX=0;
			hotspotY=0;
		};
		class Raise3D
		{
			texture="\ca\ui\data\cursor_editor_3d_elevation_ca.paa";
			width=32;
			height=32;
			hotspotX=0;
			hotspotY=0;
		};
		class Wait
		{
			texture="\ca\ui\data\cursor_editor_2d_loading_ca.paa";
			color[]={0.69999999,0.69999999,0.69999999,1};
		};
		class HC_move: Track
		{
			texture="\ca\ui\data\cursor_map_move_ca.paa";
			color[]={0,0.60000002,0,1};
		};
		class HC_overFriendly: Track
		{
			texture="\ca\ui\data\cursor_map_overFriendly_ca.paa";
			color[]={0,0.60000002,0,1};
		};
		class HC_overEnemy: Track
		{
			texture="\ca\ui\data\cursor_map_overEnemy_ca.paa";
		};
		class HC_overMission: Track
		{
			texture="\ca\ui\data\cursor_map_overMission_ca.paa";
			color[]={0.85000002,0.40000001,0,1};
		};
		class HC_unsel: Track
		{
			texture="\ca\ui\data\cursor_map_unsel_ca.paa";
		};
	};
};
class CfgInGameUI
{
	imageCornerElement="\ca\ui\data\igui_hud_corner.paa";
	xboxStyle=0;
	colorBackground[]={1,1,1,0};
	colorBackgroundCommand[]={1,1,1,1};
	colorBackgroundHelp[]={1,1,1,1};
	colorText[]={0.40000001,0.67449999,0.2784,1};
	class SideColors
	{
		colorFriendly[]={0.40000001,0.67449999,0.2784,1};
		colorEnemy[]={0.70599997,0.074500002,0.0196,1};
		colorNeutral[]={0.60600001,0.60600001,0.60600001,1};
		colorCivilian[]={0.60600001,0.60600001,0.60600001,1};
		colorUnknown[]={0.86299998,0.58399999,0,1};
	};
	class IslandMap
	{
		colorFriendly[]={0,0.5,0,1};
		colorEnemy[]={0.5,0,0,1};
		colorNeutral[]={1,0.5,0,1};
		colorCivilian[]={0,0,1,1};
		colorUnknown[]={1,0.5,0,0.80000001};
		shadow=2;
		iconPlayer="\ca\ui\data\map_player_ca.paa";
		iconPlayerDirection="\ca\ui\data\map_dir_ca.paa";
		iconCheckpoint="\ca\ui\data\map_target_ca.paa";
		iconCamera="\ca\ui\data\map_camera_ca.paa";
		iconSelect="\ca\ui\data\map_select_ca.paa";
		iconSensor="\ca\ui\data\map_trigger_ca.paa";
		sizeLeader=24;
		size=26;
		sizePlayer=26;
		colorTracks[]={0.2,0.13,0,1};
		colorRoads[]={0.2,0.13,0,1};
		colorMainRoads[]={0,0,0,1};
		colorTracksFill[]={0,0,0,0};
		colorRoadsFill[]={1,0.88,0.64999998,1};
		colorMainRoadsFill[]={0.94,0.69,0.2,1};
		cursorLineWidth=1;
		colorGrid[]={0.050000001,0.1,0,0.60000002};
		colorGridMap[]={0.050000001,0.1,0,0.40000001};
	};
	class MPTable
	{
		color[]={0.69999999,0.69999999,0.69999999,1};
		colorTitleBg[]={0.1,0.1,0.1,1};
		colorBg[]={0,0,0,0};
		colorSelected[]={0.69999999,0.69999999,0.69999999,0.40000001};
		colorWest[]={0.69999999,0.94999999,0.69999999,1};
		colorEast[]={0.94999999,0.69999999,0.69999999,1};
		colorCiv[]={0.80000001,0.80000001,0.80000001,1};
		colorRes[]={0.69999999,0.69999999,0.94999999,1};
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		class Columns
		{
			class KillsInfantry
			{
				colorBg[]={0.1,0.23,0.1,0.80000001};
				picture="\ca\ui\data\stats_infantry_ca.paa";
			};
			class KillsSoft
			{
				picture="\ca\ui\data\stats_soft_ca.paa";
			};
			class KillsArmor
			{
				picture="\ca\ui\data\stats_armored_ca.paa";
			};
			class KillsAir
			{
				picture="\ca\ui\data\stats_air_ca.paa";
			};
			class Killed
			{
				picture="\ca\ui\data\stats_killed_ca.paa";
			};
			class KillsTotal
			{
				picture="\ca\ui\data\stats_total_ca.paa";
			};
		};
		class RespawnMessage
		{
			x=0.050000001;
			y=0.050000001;
			font="EtelkaNarrowMediumPro";
			size=0.034000002;
			color[]={0.94999999,0.94999999,0.94999999,1};
			xBg=-2;
			yBg="SafeZoneY";
			wBg=6;
			hBg=0.23;
			colorBg[]={0,0,0,0};
		};
	};
	class TankDirection
	{
		left=-10;
		top=-10;
		width=0.23529412;
		height=0.31372553;
		color[]={0.40000001,0.67449999,0.2784,1};
		colorHalfDammage[]={0.86299998,0.58399999,0,1};
		colorFullDammage[]={0.70599997,0.074500002,0.0196,1};
		imageTower="\ca\ui\data\igui_Tower_gs.paa";
		imageTurret="\ca\ui\data\igui_Turret_gs.paa";
		imageGun="\ca\ui\data\igui_Gun_gs.paa";
		imageObsTurret="\ca\ui\data\igui_ObsTurret_gs.paa";
		imageLTrack="\ca\ui\data\igui_LTrack_gs.paa";
		imageRTrack="\ca\ui\data\igui_RTrack_gs.paa";
		imageHull="\ca\ui\data\igui_Hull_gs.paa";
		imageEngine="\ca\ui\data\igui_Engine_gs.paa";
		imageMoveStop="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveBack="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveForward="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveFast="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveLeft="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveRight="#(argb,8,8,3)color(0,0,0,0)";
		imageMoveAuto="#(argb,8,8,3)color(0,0,0,0)";
	};
	class Picturem
	{
		imageBusy="\ca\ui\data\ui_busy_icon_ca.paa";
		imageWaiting="\ca\ui\data\ui_waiting_icon_ca.paa";
		imageCommand="\ca\ui\data\ui_command_icon_ca.paa";
	};
	class ProgressFont
	{
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
	};
	class CheatXFont
	{
		font="EtelkaNarrowMediumPro";
	};
	class FadeFont
	{
		font="EtelkaNarrowMediumPro";
	};
	class DragAndDropFont
	{
		font="EtelkaNarrowMediumPro";
		shadow=2;
		size=0.034000002;
		colorEnabled[]={0,0,0,0.89999998};
		colorDisabled[]={0,0,0,0.60000002};
		hideCursor=0;
	};
	class TooltipFont
	{
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		shadow=2;
	};
	class Compass
	{
		left=0.273;
		top="0.058 + SafeZoneY";
		width=0.47299999;
		height=0.052287601;
		shadow=2;
		color[]={0.40000001,0.67449999,0.2784,1};
		dirColor[]={0.40000001,0.67449999,0.2784,1};
		texture0="ca\ui\data\radar_compass1_ca.paa";
		texture90="ca\ui\data\radar_compass2_ca.paa";
		texture180="ca\ui\data\radar_compass3_ca.paa";
		texture270="ca\ui\data\radar_compass4_ca.paa";
	};
	class TacticalDisplay: SideColors
	{
		left="(0.263)";
		top="0.055 + SafeZoneY";
		width=0.47299999;
		height=0.0080000004;
		targetTexture="\ca\ui\data\igui_target_ground_gs.paa";
		targetAirTexture="\ca\ui\data\igui_target_air_gs.paa";
		class Cursor
		{
			width=0.019607799;
			height=0.0261438;
			color[]={1,1,1,1};
		};
		shadow=0;
		colorCamera[]={1,1,1,0};
	};
	class Radar
	{
		left="0.078 + SafeZoneX";
		top="0.012 + SafeZoneY";
		width="0.161*SafezoneH";
		height="0.215*SafezoneH";
		radarAirBackgroundTexture="\ca\ui\data\igui_radar_air_ca.paa";
		radarTankBackgroundTexture="\ca\ui\data\igui_radar_air_ca.paa";
		radarIncommingMissile="\ca\ui\data\igui_radar_missle_ca.paa";
		radarAirDangerSector="\ca\ui\data\igui_radar_danger_ca.paa";
		radarLockDangerColor[]={0.80000001,0.60000002,0,0.75};
		radarIncommingDangerColor[]={0.69999999,0.1,0,0.75};
		radarVehicleTarget="\ca\ui\data\igui_radar_target_ca.paa";
		radarTargetingEnemy="\ca\ui\data\igui_radar_targeting_ca.paa";
		radarFOV="\ca\ui\data\igui_radar_viewdir_ca.paa";
		radarFOVPlayer[]={0.40000001,0.67449999,0.2784,1};
		radarFOVCrew[]={0.40000001,0.40000001,0.40000001,1};
		shadow=0;
	};
	class GroupDir
	{
		left="(SafeZoneW + SafeZoneX) - (1 - 0.890)";
		top="(SafeZoneH + SafeZoneY) - (1 - 0.708)";
		width=0.096187003;
		height=0.1274;
		colorBackground[]={0.40000001,0.67449999,0.2784,1};
		image="\ca\ui\data\squad_orientation_ca.paa";
		shadow=2;
	};
	class Hint
	{
		sound[]=
		{
			"\Ca\sounds\sfx\hint.wss",
			0.31622776,
			1
		};
	};
	class PlayerInfo
	{
		left="0 + SafeZoneX";
		top="0.177 + SafeZoneY";
		width=0.15000001;
		colorBackground[]={1,0,1,1};
		class UnitPicture
		{
			width=0.55000001;
			height=0.56;
		};
	};
	class Menu
	{
		hide="HTFade";
		width=0.44999999;
		height=0.40000001;
		x="0.012 + SafeZoneX";
		y=0.83187997;
		top=0.23;
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		shadow=2;
		align=0;
		widthMin=0.155;
		widthMax=0.44999999;
		colorChecked[]={0.86299998,0.58399999,0,1};
		colorEnabled[]={0.40000001,0.67449999,0.2784,1};
		colorDisabled[]={0.60600001,0.60600001,0.60600001,1};
		colorSelected[]={0.42399999,0.65100002,0.24699999,1};
		colorSelectedText[]={0.94999999,0.94999999,0.94999999,1};
		hideTime=60;
		quickMenuDelay=0.5;
	};
	class Capture
	{
		colorBackground[]={0,0,0,0};
		colorText[]={0.40000001,0.67449999,0.2784,1};
		colorLine[]={0.80000001,0.80000001,0.80000001,1};
	};
	class Bar
	{
		imageBar="#(argb,8,8,3)color(1,1,1,1)";
		colorBackground[]={0,0,0,0};
		colorGreen[]={0.40000001,0.67449999,0.2784,1};
		colorYellow[]={0.40000001,0.67449999,0.2784,1};
		colorRed[]={0.70599997,0.074500002,0.0196,1};
		colorBlinkOn[]={0.86299998,0.58399999,0,1};
		colorBlinkOff[]={0.70599997,0.074500002,0.0196,1};
		height=0.0099999998;
	};
	class Actions
	{
		align="0x00 + 0x08";
		shadow=2;
		x="0.012 + SafeZoneX";
		y=0.41100001;
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		rows="5*SafeZoneH";
		arrowWidth=0.015;
		arrowHeight=0.02;
		iconArrowUp="\ca\ui\data\ui_action_arrow_up_gs.paa";
		iconArrowDown="\ca\ui\data\ui_action_arrow_down_gs.paa";
		colorBackground[]={0,0,0,0};
		colorText[]={0.40000001,0.67449999,0.2784,1};
		colorSelect[]={0.94999999,0.94999999,0.94999999,1};
		colorBackgroundSelected[]={0.42399999,0.65100002,0.24699999,1};
		background="\ca\ui\data\igui_hud_corner.paa";
		underlineSelected=0;
	};
	class DefaultAction
	{
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		colorText[]={0.40000001,0.67449999,0.2784,1};
		shadow=2;
		showHint=0;
		showNext=0;
		showLine=0;
		relativeToCursor=1;
		offsetX=-0.043000001;
		offsetY=0.07;
		hotspotX=0;
		hotspotY=0;
	};
	class GroupInfo
	{
		class Semaphore
		{
		};
		imageDefaultWeapons="\ca\ui\data\cmdbar_unarmed_ca.paa";
		imageNoWeapons="\ca\ui\data\cmdbar_unarmed_ca.paa";
	};
	class CommandBar
	{
		left="-0.032 + SafeZoneX";
		top="(SafeZoneH + SafeZoneY) - (1 - 0.851)";
		width=1.0599999;
		height=0.079999998;
		imageDefaultWeapons="ca\ui\data\cmdbar_clean_ca.paa";
		imageNoWeapons="ca\ui\data\cmdbar_unit_noweapon_ca.paa";
		imageCommander="ca\ui\data\cmdbar_commander_ca.paa";
		imageDriver="ca\ui\data\cmdbar_driver_ca.paa";
		imageGunner="ca\ui\data\cmdbar_gunner_ca.paa";
		imageCargo="ca\ui\data\cmdbar_cargo_ca.paa";
		dimm=0.30000001;
		colorRedTeam[]={1,0,0,1};
		colorBlueTeam[]={0,0,1,1};
		colorGreenTeam[]={0.40000001,0.67449999,0.2784,1};
		colorYellowTeam[]={0.80000001,0.80000001,0,1};
		colorWhiteTeam[]={0.94999999,0.94999999,0.94999999,1};
		class prevPage
		{
			x=0.032000002;
			y=0.028999999;
			w=0.019607799;
			h=0.1045752;
			color[]={0.40000001,0.67449999,0.2784,1};
			texture="ca\ui\data\cmdbar_leftarrow_ca.paa";
		};
		class nextPage
		{
			x=0;
			y=0.028999999;
			w=0.019607799;
			h=0.1045752;
			color[]={0.40000001,0.67449999,0.2784,1};
			texture="ca\ui\data\cmdbar_rightarrow_ca.paa";
		};
		class UnitInfo
		{
			class GroupIcon
			{
				x=0.016000001;
				y=0.012;
				w=0.057330001;
				h=0.076229997;
			};
			class HcGroupText
			{
				x=0.045000002;
				y=0.082999997;
				font="Zeppelin32";
				SizeEx=0.039209999;
			};
			class UnitBackground
			{
				x=0;
				y=0;
				w=0.15686271;
				h=0.2091503;
				textureNormal="ca\ui\data\cmdbar_background_ca.paa";
				textureSelected="ca\ui\data\cmdbar_selected_ca.paa";
				texturePlayer="ca\ui\data\cmdbar_player_ca.paa";
				textureFocus="ca\ui\data\cmdbar_background_ca.paa";
			};
			class UnitFocus
			{
				x=0;
				y=0;
				w=0;
				h=0;
				color[]={1,1,1,0};
				texture="#(argb,8,8,3)color(0,0,0,0)";
			};
			class UnitIcon
			{
				x=0;
				y=0;
				w=0.090999998;
				h=0.121;
				color[]={0.40000001,0.67449999,0.2784,1};
				colorPlayer[]={0.94999999,0.94999999,0.94999999,1};
				colorNoAmmo[]={0.80000001,0.40000001,0,1};
				colorWounded[]={0.80000001,0,0,1};
				colorWoundedFade[]={0,0,0,1};
				colorNoFuel[]={0.80000001,0.69999999,0,1};
			};
			class Semaphore
			{
				x=0;
				y=0;
				w=0.15686271;
				h=0.2091503;
				color[]={0.80000001,0,0,1};
				texture="ca\ui\data\cmdbar_donotfire_ca.paa";
			};
			class CommandBackground
			{
				x=0;
				y=0;
				w=0.15686271;
				h=0.052287601;
				color[]={1,1,1,1};
				texture="ca\ui\data\cmdbar_order_background_ca.paa";
			};
			class CommandText
			{
				x=0.045000002;
				y=0;
				w=0.090999998;
				h=0.033;
				color[]={1,1,1,1};
				font="Zeppelin32";
				SizeEx=0.039209999;
			};
			class UnitSpecialRole
			{
				x=0.052999999;
				y=0.033;
				w=0.039215699;
				h=0.052287601;
				color[]={0.94999999,0.94999999,0.94999999,1};
			};
			class VehicleNumberBackground
			{
				x=-0.0020000001;
				y=0.071999997;
				w=0.039215699;
				h=0.052287601;
				color[]={0.023529001,0,0.031372499,1};
				texture="ca\ui\data\cmdbar_commander_number_ca.paa";
			};
			class VehicleNumberText
			{
				x=0.017000001;
				y=0.079999998;
				w=0.022;
				h=0.028999999;
				colorText[]={0.023529001,0,0.031372499,1};
				font="Zeppelin32";
				SizeEx=0.039209999;
			};
			class UnitRole
			{
				x=0.026000001;
				y=0.071999997;
				w=0.039215699;
				h=0.052287601;
				color[]={0.023529001,0,0.031372499,1};
			};
			class UnitNumberBackground
			{
				x=0.061000001;
				y=0.079999998;
				w=0.039215699;
				h=0.052287601;
				color[]={0.023529001,0,0.031372499,1};
				texture="ca\ui\data\cmdbar_unitnumberbackground_ca.paa";
			};
			class UnitNumberText
			{
				x=0.077;
				y=0.082999997;
				w=0.022;
				h=0.028999999;
				colorText[]={0.023529001,0,0.031372499,1};
				font="Zeppelin32";
				SizeEx=0.039209999;
			};
			class CombatMode
			{
				x=0.064000003;
				y=0.0049999999;
				w="0.0392157*0.6";
				h="0.0522876*0.6";
				textureMCareless="ca\ui\data\icon_combatmode_careless_ca.paa";
				textureMSafe="ca\ui\data\icon_combatmode_safe_ca.paa";
				textureMAware="ca\ui\data\icon_combatmode_aware_ca.paa";
				textureMCombat="ca\ui\data\icon_combatmode_combat_ca.paa";
				textureMStealth="ca\ui\data\icon_combatmode_stealth_ca.paa";
			};
		};
	};
	class ConnectionLost
	{
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		color[]={0.80000001,0,0,1};
	};
	class Cursor
	{
		font="EtelkaNarrowMediumPro";
		size=0.034000002;
		activeWidth=0.039215699;
		activeHeight=0.052287601;
		activeMinimum=1.1;
		activeMaximum=1.1;
		aim="\ca\ui\data\cursor_aim_ca.paa";
		weapon="\ca\ui\data\cursor_w_airMG_gs.paa";
		outArrow="\ca\ui\data\icon_offarrow_ca.paa";
		select_target="\ca\ui\data\cursor_w_target_gs.paa";
		lock_target="\ca\ui\data\cursor_w_laserlock_gs.paa";
		gunner_lock="\ca\ui\data\gunner_lock.paa";
		select="\ca\ui\data\icon_unit_ca.paa";
		selectOver="\ca\ui\data\cursor_select_unit_ca.paa";
		me="\ca\ui\data\cursor_circle_ca.paa";
		leader="\ca\ui\data\icon_unit_teamleader_ca.paa";
		mission="\ca\ui\data\icon_task_ca.paa";
		unitUnconscious="\ca\ui\data\icon_unit_agony_ca.paa";
		assault="\ca\ui\data\icon_attack_ca.paa";
		board="\ca\ui\data\icon_task_board_ca.paa";
		customMark="\ca\ui\data\icon_custom_task_ca.paa";
		iconBoardIn="\ca\ui\data\icon_board_into_ca.paa";
		iconBoardOut="\ca\ui\data\icon_board_out_ca.paa";
		iconMove="\ca\ui\data\icon_mission_move_ca.paa";
		iconJoin="\ca\ui\data\icon_mission_join_ca.paa";
		iconHealAt="#(argb,8,8,3)color(0,0,0,0)";
		iconRepairAt="\ca\ui\data\icon_mission_repair_ca.paa";
		iconRearmAt="\ca\ui\data\icon_mission_rearm_ca.paa";
		iconRefuelAt="\ca\ui\data\icon_mission_refuel_ca.paa";
		iconComplex="ca\ui\data\Cursor_hand_CA.paa";
		iconSupport="#(argb,8,8,3)color(0,0,0,0)";
		iconInFormation="#(argb,8,8,3)color(0,0,0,0)";
		iconCursorSupport="\ca\ui\data\cursor_support_ca.paa";
		iconRepairVehicle="\ca\ui\data\icon_mission_repair_ca.paa";
		tactical="\ca\ui\data\cursor_tactical_ca.paa";
		move="\ca\ui\data\cursor_basic_ca.paa";
		selected="\ca\ui\data\cursor_selected_ca.paa";
		attack="\ca\ui\data\cursor_attack_ca.paa";
		getIn="\ca\ui\data\cursor_getin_ca.paa";
		watch="\ca\ui\data\cursor_igui_scroll_ca.paa";
		meColor[]={0,0,0,0.2};
		dimmMe=0.2;
		dimmMeStartTime=5;
		dimmMeEndTime=10;
		dimmCmdStartTime=5;
		dimmCmdEndTime=10;
		selectColor[]={0.40000001,0.67449999,0.2784,1};
		leaderColor[]={0.86299998,0.58399999,0,1};
		missionColor1[]={0.86299998,0.58399999,0,1};
		missionColor2[]={0.86299998,0.58399999,0,1};
		unitUnconsciousColor[]={0.19599999,0.59200001,0.70599997,1};
		enemyActiveColor[]={0.70599997,0.074500002,0.0196,1};
		customMarkColor[]={0.40000001,0.67449999,0.2784,1};
		assaultColor[]={0.70599997,0.074500002,0.0196,1};
		boardColor[]={0.86299998,0.58399999,0,1};
		iconMoveColor[]={0.86299998,0.58399999,0,1};
		iconJoinColor[]={0.86299998,0.58399999,0,1};
		iconHealAtColor[]={0.86299998,0.58399999,0,1};
		iconRepairAtColor[]={0.86299998,0.58399999,0,1};
		iconRearmAtColor[]={0.86299998,0.58399999,0,1};
		iconRefuelAtColor[]={0.86299998,0.58399999,0,1};
		iconSupportColor[]={0.86299998,0.58399999,0,1};
		iconInFormationColor[]={0.86299998,0.58399999,0,1};
		blinkingPeriod=2;
		color[]={0.40000001,0.67449999,0.2784,1};
		colorBackground[]={0,0,0,0};
		colorLocked[]={1,0,0,1};
		dimm=0.15000001;
		shadow=2;
		infoTextShadow=2;
		class Sign
		{
			height=2.7;
			widthSector=2.5999999;
			widthGroup=2.5;
			widthUnit=2.4000001;
		};
	};
	class PeripheralVision
	{
		cueTexture="ca\ui\data\tacticaldisplay_target_gs.paa";
		bloodTexture="ca\ui\data\periph_blood_ca.paa";
		bloodColor[]={1,1,1,0.75};
		cueColor[]={1,1,1,1};
		cueEnemyColor[]={0.70599997,0.074500002,0.0196,1};
		cueFriendlyColor[]={0.40000001,0.67449999,0.2784,1};
	};
	class HitZones
	{
		shadow=0;
		hitZonesTexture="ca\ui\data\igui_hitzones_ca.paa";
	};
};
class CfgDiary
{
	class FixedPages
	{
		class Diary
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
		};
		class Tasks
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
		};
		class Conversation
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
		};
		class Units
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
		};
		class Players
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
			squad="%$STR_DISP_MP_SQ %SQUAD_TITLE<br/>%$STR_DISP_MP_SQ_NAME %SQUAD_NAME<br/>%$STR_DISP_MP_SQ_MAIL %SQUAD_EMAIL<br/>%$STR_DISP_MP_SQ_WEB %SQUAD_WEB<br/>                <img width=70 height=70 image='\\%SQUAD_PICTURE'/><br/>";
		};
		class Statistics
		{
			picture="#(argb,8,8,3)color(0,0,0,0)";
		};
	};
	class Icons
	{
		unitNone="#(argb,8,8,3)color(0,0,0,0)";
		unitGroup="ca\ui\data\ui_diary_group_ca.paa";
		unitPlayable="ca\ui\data\ui_diary_playable_ca.paa";
		unitGroupPlayable="ca\ui\data\ui_diary_grpplay_ca.paa";
		taskNone="ca\ui\data\ui_task_none_ca.paa";
		taskCreated="ca\ui\data\ui_task_created_ca.paa";
		taskAssigned="ca\ui\data\ui_task_assigned_ca.paa";
		taskSucceeded="ca\ui\data\ui_task_done_ca.paa";
		taskFailed="ca\ui\data\ui_task_failed_ca.paa";
		taskCanceled="ca\ui\data\ui_task_cancelled_ca.paa";
		playerWest="ca\ui\data\igui_side_blufor_ca.paa";
		playerEast="ca\ui\data\igui_side_opfor_ca.paa";
		playerCiv="ca\ui\data\igui_side_civil_ca.paa";
		playerGuer="ca\ui\data\igui_side_indep_ca.paa";
		playerUnknown="ca\ui\data\igui_side_unknown_ca.paa";
		playerBriefWest="ca\ui\data\igui_sidebriefing_blufor_ca.paa";
		playerBriefEast="ca\ui\data\igui_sidebriefing_opfor_ca.paa";
		playerBriefGuer="ca\ui\data\igui_sidebriefing_indep_ca.paa";
		playerBriefCiv="ca\ui\data\igui_sidebriefing_civil_ca.paa";
		playerBriefUnknown="ca\ui\data\igui_sidebriefing_unknown_ca.paa";
		playerConnecting="ca\ui\data\igui_sideconnecting_ca.paa";
	};
	class TaskIcons
	{
		shadow=2;
		taskNew="ca\ui\data\ui_taskstate_new_CA.paa";
		taskDone="ca\ui\data\ui_taskstate_done_CA.paa";
		taskFailed="ca\ui\data\ui_taskstate_failed_CA.paa";
		taskCurrent="ca\ui\data\ui_taskstate_current_CA.paa";
	};
};
class CfgActions
{
	class None
	{
		shadow=2;
		priority=0;
		show=1;
		showWindow=0;
		hideOnUse=1;
		shortcut="";
		text="";
		textDefault="";
		textSimple="";
	};
	class TeamSwitch: None
	{
		show=0;
	};
	class Gear: None
	{
		showWindow=1;
		priority=1;
		textDefault="<img image='\ca\ui\data\ui_action_gear_ca.paa' size='2.5' shadow=2 />";
	};
	class NVGoggles: None
	{
		show=0;
	};
	class NVGogglesOff: NVGoggles
	{
		show=0;
	};
	class GetOut: None
	{
		showWindow=0;
		priority=0.89999998;
		textDefault="<img image='\ca\ui\data\ui_action_getout_ca.paa' size='1.8' shadow=2 />";
	};
	class Eject: None
	{
		showWindow=0;
		priority=0.89999998;
		textDefault="<img image='\ca\ui\data\ui_action_eject_ca.paa' size='1.8' shadow=2 />";
	};
	class LadderOnUp: None
	{
		showWindow=1;
		textDefault="<img image='\ca\ui\data\ui_action_ladderup_ca.paa' size='1.8' shadow=2 />";
	};
	class LadderOnDown: None
	{
		showWindow=1;
		textDefault="<img image='\ca\ui\data\ui_action_ladderdown_ca.paa' size='1.8' shadow=2 />";
	};
	class LadderOff: None
	{
		showWindow=0;
		priority=5;
		text="$STR_ACTION_LADDEROFF";
		textDefault="<img image='\ca\ui\data\ui_action_ladderoff_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToDriver: None
	{
		showWindow=0;
		priority=4.0500002;
		textDefault="<img image='\ca\ui\data\ui_action_getindriver_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToPilot: MoveToDriver
	{
		priority=4.1500001;
		textDefault="<img image='\ca\ui\data\ui_action_getinpilot_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToGunner: None
	{
		showWindow=0;
		priority=4.3499999;
		textDefault="<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToCommander: None
	{
		showWindow=0;
		priority=4.25;
		textDefault="<img image='\ca\ui\data\ui_action_getincommander_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToCargo: None
	{
		showWindow=0;
		priority=4;
		textDefault="<img image='\ca\ui\data\ui_action_getincargo_ca.paa' size='1.8' shadow=2 />";
	};
	class MoveToTurret: None
	{
		showWindow=0;
		priority=4.1999998;
		textDefault="<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.8' shadow=2 />";
	};
	class LoadMagazine: None
	{
		show=0;
	};
	class LoadOtherMagazine: LoadMagazine
	{
		show=1;
		showWindow=0;
	};
	class LoadEmptyMagazine: LoadMagazine
	{
		show=1;
		textDefault="<img image='\ca\ui\data\ui_action_reload_ca.paa' size='1.8' shadow=2 />";
		priority=9.1000004;
		showWindow=1;
	};
	class EngineOn: None
	{
		show=0;
		showWindow=0;
		priority=2.7;
		textDefault="<img image='\ca\ui\data\ui_action_engine_on_ca.paa' size='1.8' shadow=2 />";
	};
	class EngineOff: None
	{
		show=1;
		showWindow=0;
		priority=2.7;
		textDefault="<img image='\ca\ui\data\ui_action_engine_off_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInCommander: None
	{
		showWindow=1;
		priority=4.6999998;
		textDefault="<img image='\ca\ui\data\ui_action_getincommander_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInDriver: None
	{
		showWindow=1;
		priority=4.8000002;
		textDefault="<img image='\ca\ui\data\ui_action_getindriver_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInPilot: None
	{
		showWindow=1;
		priority=4.5;
		textDefault="<img image='\ca\ui\data\ui_action_getinpilot_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInGunner: None
	{
		showWindow=1;
		priority=4.1999998;
		textDefault="<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInCargo: None
	{
		showWindow=1;
		priority=4.0999999;
		textDefault="<img image='\ca\ui\data\ui_action_getincargo_ca.paa' size='1.8' shadow=2 />";
	};
	class GetInTurret: None
	{
		showWindow=1;
		priority=4.5999999;
		textDefault="<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.8' shadow=2 />";
	};
	class Repair: None
	{
		showWindow=1;
		priority=7.5999999;
		textDefault="<img image='\ca\ui\data\ui_action_repair_ca.paa' size='1.8' shadow=2 />";
	};
	class Rearm: None
	{
		showWindow=1;
		priority=3.9000001;
		textDefault="<img image='\ca\ui\data\ui_action_reammo_ca.paa' size='1.8' shadow=2 />";
	};
	class Refuel: None
	{
		showWindow=1;
		priority=7.5;
		textDefault="<img image='\ca\ui\data\ui_action_refuel_ca.paa' size='1.8' shadow=2 />";
	};
	class Heal: None
	{
		showWindow=1;
		priority=9.8999996;
		textDefault="<img image='\ca\ui\data\ui_action_heal_ca.paa' size='1.8' shadow=2 />";
	};
	class HealSoldier: None
	{
		priority=9.8999996;
		showWindow=1;
		textDefault="<img image='\ca\ui\data\ui_action_heal_ca.paa' size='1.8' shadow=2 />";
	};
	class FirstAid: None
	{
		priority=9.8999996;
		showWindow=1;
		textDefault="<img image='\ca\ui\data\ui_action_heal_ca.paa' size='1.8' shadow=2 />";
	};
	class RepairVehicle: None
	{
		priority=9.8999996;
		showWindow=1;
		textDefault="<img image='\ca\ui\data\ui_action_repair_ca.paa' size='1.8' shadow=2 />";
	};
	class TakeWeapon: None
	{
		showWindow=1;
		priority=5.5999999;
		textDefault="<img image='\ca\ui\data\ui_action_reammo_ca.paa' size='1.8' shadow=2 />";
	};
	class TakeMagazine: None
	{
		showWindow=1;
		priority=5.5;
		textDefault="<img image='\ca\ui\data\ui_action_reammo_ca.paa' size='1.8' shadow=2 />";
	};
	class TakeFlag: None
	{
		showWindow=1;
		priority=5.9000001;
		textDefault="<img image='\ca\ui\data\ui_action_takeflag_ca.paa' size='1.8' shadow=2 />";
	};
	class ReturnFlag: None
	{
		showWindow=1;
		priority=8;
		textDefault="<img image='\ca\ui\data\ui_action_returnflag_ca.paa' size='1.8' shadow=2 />";
	};
	class WeaponInHand: None
	{
	};
	class WeaponOnBack: None
	{
	};
	class SetTimer: None
	{
		showWindow=1;
		priority=7.9000001;
		textDefault="<img image='\ca\ui\data\ui_action_settimer_ca.paa' size='1.8' shadow=2 />";
	};
	class Deactivate: None
	{
		showWindow=1;
		priority=8.3999996;
		textDefault="<img image='\ca\ui\data\ui_action_close_ca.paa' size='1.8' shadow=2 />";
	};
	class FireInflame: None
	{
	};
	class FirePutDown: None
	{
	};
	class TakeMine: None
	{
		showWindow=1;
		priority=5.1999998;
		text="$STR_ACTION_TAKE_MINE";
		textDefault="<img image='\ca\ui\data\ui_action_reammo_ca.paa' size='1.8' shadow=2 />";
	};
	class DropWeapon: None
	{
		showWindow=1;
		priority=3.2;
		text="$STR_ACTION_DROP_WEAPON";
	};
	class PutWeapon: DropWeapon
	{
		showWindow=1;
		priority=5.3000002;
		text="$STR_ACTION_PUT_WEAPON";
	};
	class DeactivateMine: None
	{
		showWindow=1;
		priority=8.3000002;
		textDefault="<img image='\ca\ui\data\ui_action_close_ca.paa' size='1.8' shadow=2 />";
	};
	class CancelTakeFlag: None
	{
		showWindow=1;
		priority=8.5;
		textDefault="<img image='\ca\ui\data\ui_action_close_ca.paa' size='1.8' shadow=2 />";
	};
	class CancelAction: None
	{
		showWindow=0;
		priority=8.6000004;
		textDefault="";
	};
	class MarkEntity: None
	{
	};
	class Talk: None
	{
		priority=9;
		text="$STR_ACTION_ASK";
		textDefault="<img image='\ca\ui\data\ui_action_talk_ca.paa' size='1.8' shadow=2 />";
	};
	class AutoHover: None
	{
		priority=6;
		text="$STR_ACTION_HOVER";
		textDefault="<img image='\ca\ui\data\ui_action_autohover_ca.paa' size='1.8' shadow=2 />";
	};
	class AutoHoverCancel: AutoHover
	{
		showWindow=0;
		priority=6;
		textDefault="<img image='\ca\ui\data\ui_action_cancelhover_ca.paa' size='1.8' shadow=2 />";
	};
};
class CfgEditCamera
{
	iconSelect="\ca\ui\data\cursor_selected_ca.paa";
};
class RscDisplayESRBOnline: RscStandardDisplay
{
	movingEnable=1;
	class ControlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.197641;
			y=0.28393099;
			w=0.627451;
			h=0.41830069;
			text="\ca\ui\data\ui_background_esrb_ca.paa";
		};
	};
	class Controls
	{
		delete Title;
		delete Text;
		delete B_OK;
		delete B_Cancel;
		class ESRB_Title: CA_Title
		{
			idc=1001;
			x=0.21323299;
			y=0.30676401;
			text="ESRB Notice:";
		};
		class CA_ESRB_Text: RscStructuredText
		{
			idc=1002;
			style=2;
			x=0.21799999;
			y=0.384;
			w=0.52100003;
			h=0.132;
			text="Game experience may change during online play.";
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			class Attributes
			{
				font="Zeppelin32";
				color="#F0F0F0";
				align="left";
				shadow=1;
			};
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			default=1;
			text="$STR_DISP_OK";
			x=0.36764601;
			y=0.51519698;
		};
		class CA_B_Cancel: CA_B_OK
		{
			idc=2;
			default=0;
			x=0.55719;
			y=0.51397097;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayMultiplayer: RscStandardDisplay
{
	sortUp="\ca\ui\data\arrow_up_ca.paa";
	sortDown="\ca\ui\data\arrow_down_ca.paa";
	showPassworded="ca\ui\data\ui_mpfilter_icon_empty_password_ca.paa";
	hidePassworded="ca\ui\data\ui_mpfilter_icon_nopassword_ca.paa";
	showBattlEye="ca\ui\data\ui_mpfilter_icon_be_ca.paa";
	showNoBattlEye="ca\ui\data\ui_mpfilter_icon_nobe_ca.paa";
	hideBattlEye="ca\ui\data\ui_mpfilter_icon_empty_be_ca.paa";
	showFull="ca\ui\data\ui_mpfilter_icon_empty_full_ca.paa";
	hideFull="ca\ui\data\ui_mpfilter_icon_nofull_ca.paa";
	showExpansions="ca\ui\data\ui_mpfilter_icon_empty_expansions_ca.paa";
	hideExpansions="ca\ui\data\ui_mpfilter_icon_noexpansions_ca.paa";
	colorPingUnknown[]={0.40000001,0.40000001,0.40000001,1};
	colorPingGood[]={0,1,0,1};
	colorPingPoor[]={1,0.60000002,0,1};
	colorPingBad[]={1,0,0,1};
	colorVersionGood[]={0.87840003,0.84710002,0.65100002,1};
	colorVersionBad[]={1,0,0,1};
	class controlsbackground
	{
		delete MainbackTop;
		delete MainbackBottom;
		delete MainbackMiddle;
		delete CA_ServerDetailLanguage;
		delete CA_ServerDetailMission;
		delete CA_ServerDetailPing;
		delete CA_ServerDetailSlots;
		delete CA_ServerDetailState;
		delete CA_TextDetailState;
		delete CA_TextServerDetailLanguage;
		delete CA_TextServerDetailPing;
		delete CA_TextServerDetailSlots;
		class Mainback: RscText
		{
			x="SafeZoneX";
			y="SafeZoneY";
			w="SafeZoneW";
			h="SafeZoneH";
			colorbackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class MainbackSessions: Mainback
		{
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(14/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(51.45/100)	* SafeZoneH";
		};
		class CA_Title2: CA_Title
		{
			idc=101;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
		};
		class CA_Title2Border: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class GameSpy: RscPictureKeepAspect
		{
			idc=1106;
			x="(82/100)	* SafeZoneW + SafeZoneX";
			y="(3/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="\ca\ui\data\gamespy_logo.paa";
		};
		class ValueSessionsBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(14/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(51.45/100)	* SafeZoneH";
		};
		class CA_ServerIcon: RscPictureKeepAspect
		{
			idc=111;
			x="(01.5/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w=0.029999999;
			h=0.029999999;
			colorText[]={1,1,1,1};
		};
		class CA_TypeIcon: CA_ServerIcon
		{
			idc=140;
			x="(39.25/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_MissionIcon: CA_ServerIcon
		{
			idc=113;
			x="(45.5/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_StateIcon: CA_ServerIcon
		{
			idc=115;
			x="(78.25/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_PlayersIcon: CA_ServerIcon
		{
			idc=117;
			x="(85.5/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_PingIcon: CA_ServerIcon
		{
			idc=119;
			x="(91.75/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_FilterPasswordedServers: RscPictureKeepAspect
		{
			idc=150;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(67/100)	* SafeZoneH + SafeZoneY";
			w="(2/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
		};
		class CA_FilterFullServers: CA_FilterPasswordedServers
		{
			idc=151;
			x="(5/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_ServerBEFilter: CA_FilterPasswordedServers
		{
			idc=154;
			x="(8/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_ServerExpansionsFilter: CA_FilterPasswordedServers
		{
			idc=155;
			x="(11/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_ServerFilter: RscText
		{
			idc=125;
			SizeEx=0.02674;
			x="(16/100)	* SafeZoneW + SafeZoneX";
			y="(67/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
		};
		class CA_TypeFilter: CA_ServerFilter
		{
			idc=152;
			x="(40/100)	* SafeZoneW + SafeZoneX";
			w="(8/100)	* SafeZoneW";
		};
		class CA_MissionFilter: CA_ServerFilter
		{
			idc=126;
			x="(55/100)	* SafeZoneW + SafeZoneX";
		};
		class CA_PlayersFilter: CA_ServerFilter
		{
			idc=127;
			style=2;
			x="(86.5/100)	* SafeZoneW + SafeZoneX";
			w="(6/100)	* SafeZoneW";
		};
		class CA_PingFilter: CA_ServerFilter
		{
			idc=128;
			x="(93/100)	* SafeZoneW + SafeZoneX";
			w="(4/100)	* SafeZoneW";
		};
		class CA_ServerDetailPassword: RscPictureKeepAspect
		{
			idc=143;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(71/100)	* SafeZoneH + SafeZoneY";
			w="(2/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailHost: RscText
		{
			idc=129;
			SizeEx=0.02674;
			x="(04/100)	* SafeZoneW + SafeZoneX";
			y="(71/100)	* SafeZoneH + SafeZoneY";
			w="(94/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
			colorbackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class CA_ServerDetailType: CA_ServerDetailHost
		{
			x=-10;
			text="$STR_DISP_ARCGRP_TYPE";
		};
		class CA_TextServerDetailType: CA_ServerDetailHost
		{
			idc=130;
			x=-10;
		};
		class CA_TextServerDetailMission: CA_TextServerDetailType
		{
			text="$STR_DISP_FILTER_MISSION";
			x=-10;
		};
		class CA_Progress2: RscProgress
		{
			x=-10;
			idc=121;
			y="(SafeZoneH + SafeZoneY) - (1 - (0.841284))";
			w=0.97000003;
			h=0.0089999996;
			texture="\ca\ui\data\mp_progressbar_ca.paa";
			colorBar[]={0.023529001,0,0.031372499,1};
			colorFrame[]={1,1,1,0};
		};
		class CA_TextServerDetailBE: CA_TextServerDetailMission
		{
			text="$STR_FILTER_BATTLEYE_TEXT";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailBE: CA_ServerDetailType
		{
			idc=201;
			x="(18/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailountry: CA_TextServerDetailMission
		{
			text="$STR_DISP_MULTI_COUNTRY";
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(9/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailCountry: CA_ServerDetailType
		{
			idc=145;
			x="(38/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailPlatform: CA_TextServerDetailMission
		{
			idc=-1;
			text="$STR_DISP_ARCEFF_TITTYPE";
			x="(53/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(14/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailPlatform: CA_ServerDetailType
		{
			idc=144;
			x="(68/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailVersion: CA_ServerDetailType
		{
			idc=146;
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(74/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailTimeLeft: CA_TextServerDetailMission
		{
			text="$STRWFMISSIONENDTIME";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailTimeLeft: CA_ServerDetailType
		{
			idc=134;
			x="(18/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailIsland: CA_TextServerDetailMission
		{
			text="$STR_DISP_XBOX_MULTI_ISLAND";
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(9/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailIsland: CA_ServerDetailType
		{
			idc=132;
			x="(38/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailDifficulty: CA_TextServerDetailMission
		{
			text="$STR_CA_DIFFICULTY";
			x="(53/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(14/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailDifficulty: CA_ServerDetailType
		{
			idc=138;
			x="(68/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_ServerDetailVersionRequired: CA_ServerDetailType
		{
			idc=147;
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(77/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
		};
		class CA_TextServerDetailExpansions: CA_TextServerDetailMission
		{
			text="$STR_DISP_MP_EXPANSIONS";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(80/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(6.75/100)* SafeZoneH";
		};
		class CA_ServerDetailExpansion: CA_ServerDetailType
		{
			idc=148;
			style="0x10 + 0x200";
			lineSpacing=0.89999998;
			x="(18/100)	* SafeZoneW + SafeZoneX";
			y="(80/100)	* SafeZoneH + SafeZoneY";
			w="(80/100)	* SafeZoneW";
			h="(6.75/100)* SafeZoneH";
		};
		class CA_TextServerDetailPlayers: CA_TextServerDetailMission
		{
			text="$STR_DISP_MP_PLAYERS";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(6.75/100)* SafeZoneH";
		};
		class CA_ServerDetailPlayers: CA_ServerDetailType
		{
			idc=149;
			style="0x10 + 0x200";
			lineSpacing=0.89999998;
			x="(18/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(80/100)	* SafeZoneW";
			h="(6.75/100)* SafeZoneH";
		};
		class CA_Cancel: RscShortcutButton
		{
			idc=2;
			x="(85/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			default=0;
			text="$STR_CA_CANCEL";
		};
		class CA_Internet_Lan: CA_Cancel
		{
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.28382501;
			class TextPos
			{
				left=0.037500001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
			shortcuts[]={};
			idc=122;
		};
		class CA_New: CA_Cancel
		{
			x="(22.5/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=104;
			shortcuts[]={};
			text="$STR_CA_MULTI_NEW";
			default=0;
		};
		class CA_Refresh: CA_Cancel
		{
			x="(35/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=123;
			text="$STR_DISP_MULTI_REFRESH";
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
		};
		class CA_Join: CA_Cancel
		{
			x="(47.5/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=105;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			default=1;
			text="$STR_CA_MULTI_JOIN";
		};
		class CA_BFilter: CA_Cancel
		{
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=124;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_DISP_MULTI_FILTER";
		};
		class CA_BRemote: CA_Cancel
		{
			x="(72.5/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=103;
			shortcuts[]={};
			text="$STR_CA_MULTI_REMOTE";
		};
	};
	class controls
	{
		delete Title;
		delete ValueSessions;
		delete ColumnPlayers;
		delete ColumnPing;
		delete ColumnType;
		delete ColumnMission;
		delete ColumnState;
		delete ColumnServer;
		delete FilterPlayers;
		delete FilterPing;
		delete FilterMission;
		delete FilterType;
		delete FilterServer;
		delete ServerDetailType;
		delete ServerDetailMission;
		delete ServerDetailState;
		delete ServerDetailSlots;
		delete ServerDetailPing;
		delete ServerDetailLanguage;
		delete ServerDetailCountry;
		delete ServerDetailVersion;
		delete ServerDetailVersionRequired;
		delete ServerDetailMods;
		delete ServerDetailIsland;
		delete ServerDetailDifficulty;
		delete ServerDetailTimeLeft;
		delete ServerDetailPlatform;
		delete ServerDetailPlayers;
		delete ServerDetailPassword;
		delete ServerDetailHost;
		delete FilterBattlEyeServers;
		delete FilterPasswordedServers;
		delete FilterFullServers;
		delete IconPlayers;
		delete IconPing;
		delete IconType;
		delete IconState;
		delete IconMission;
		delete IconServer;
		delete B_DPlay;
		delete B_Internet;
		delete B_Remote;
		delete B_Password;
		delete B_Refresh;
		delete B_Filter;
		delete B_Port;
		delete Progress;
		delete B_Join;
		delete B_New;
		delete B_Cancel;
		class CA_ServerColumn: RscButtonTextOnly
		{
			idc=112;
			text="$STR_MP_SERVER";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(29/100)	* SafeZoneW";
			h="(2/100)	* SafeZoneH";
			colorBackgroundActive[]={0,0,0,1};
			colorBackgroundDisabled[]={1,1,1,1};
		};
		class CA_TypeColumn: CA_ServerColumn
		{
			idc=141;
			text="$STR_DISP_ARCSENS_TYPE";
			x="(40.75/100)	* SafeZoneW + SafeZoneX";
			w="(5/100)	* SafeZoneW";
		};
		class CA_MissionColumn: CA_ServerColumn
		{
			idc=114;
			text="$STR_SECTION_MISSION";
			x="(47/100)	* SafeZoneW + SafeZoneX";
			w="(25/100)	* SafeZoneW";
		};
		class CA_StateColumn: CA_ServerColumn
		{
			idc=116;
			text="$STR_MENU_STATUS";
			x="(78.5/100)	* SafeZoneW + SafeZoneX";
			w="(8/100)	* SafeZoneW";
		};
		class CA_PlayersColumn: CA_ServerColumn
		{
			idc=118;
			text="$STR_MP_PLAYERS";
			x="(87/100)	* SafeZoneW + SafeZoneX";
			w="(6/100)	* SafeZoneW";
		};
		class CA_PingColumn: CA_ServerColumn
		{
			idc=120;
			text="$STR_DISP_MULTI_PING";
			x="(93/100)	* SafeZoneW + SafeZoneX";
			w="(4/100)	* SafeZoneW";
		};
		class CA_ValueSessions: RscIGUIListBox
		{
			idc=102;
			style=16;
			shadow=2;
			colorSelect[]={0.69,0.76899999,0.87099999,1};
			colorPingUnknown[]={0.40000001,0.40000001,0.40000001,1};
			colorPingGood[]={0,1,0,1};
			colorPingPoor[]={1,0.60000002,0,1};
			colorPingBad[]={1,0,0,1};
			rowHeight=0.025;
			colorSelectBackground[]={0,0,0,1};
			colorSelectBackground2[]={0.57999998,0.1147,0.1108,1};
			password="ca\ui\data\ui_server_password_ca.paa";
			locked="ca\ui\data\ui_server_locked_ca.paa";
			version="ca\ui\data\ui_wrong_version_ca.paa";
			none="ca\ui\data\ui_server_connect_ca.paa";
			star="ca\ui\data\ui_mission_done_ca.paa";
			addons="ca\ui\data\ui_server_addons_ca.paa";
			mods="ca\ui\data\ui_server_red_mark_ca.paa";
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(14/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(51.25/100)	* SafeZoneH";
			SizeEx=0.025;
			columns[]={0.40000001,0.059999999,0.36000001,0.079999998,0.059999999,0.039999999};
		};
	};
};
class RscDisplayFilter: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_gameoptions_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete FilterTitle;
		delete TextMaxPing;
		delete TextMinPlayers;
		delete TextMaxPlayers;
		delete ValueMaxPlayers;
		delete ValueMinPlayers;
		delete ValueMaxPing;
		delete ValueServer;
		delete PasswordedServers;
		delete FilterType;
		delete BattlEyeServers;
		delete FullServers;
		delete TextServer;
		delete B_OK;
		delete B_Cancel;
		delete B_Default;
		class CA_FilterTitle: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_DISP_FILTER_TITLE";
		};
		class CA_TextServer: RscText
		{
			x=0.159803;
			y="(0.416549 + -3*0.0500)";
			w=0.235296;
			text="$STR_DISP_FILTER_SERVER";
		};
		class CA_ValueServer: RscEdit
		{
			idc=101;
			x=0.400534;
			y="(0.416549 + -3*0.0500)";
			w=0.30000001;
		};
		class CA_TextMaxPing: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + -2*0.0500)";
			text="$STR_DISP_FILTER_MAXPING";
		};
		class CA_ValueMaxPing: CA_ValueServer
		{
			idc=103;
			x=0.400534;
			y="(0.416549 + -2*0.0500)";
			w=0.1;
		};
		class CA_TextMinPlayers: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + -1*0.0500)";
			text="$STR_DISP_FILTER_MINPLAYERS";
		};
		class CA_ValueMinPlayers: CA_ValueMaxPing
		{
			idc=104;
			x=0.400534;
			y="(0.416549 + -1*0.0500)";
		};
		class CA_TextMaxPlayers: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 0*0.0500)";
			text="$STR_DISP_FILTER_MAXPLAYERS";
		};
		class CA_ValueMaxPlayers: CA_ValueMaxPing
		{
			idc=105;
			x=0.400534;
			y="(0.416549 + 0*0.0500)";
		};
		class CA_TextMission: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 1*0.0500)";
			text="$STR_DISP_FILTER_MISSION";
		};
		class ValueMission: CA_ValueServer
		{
			idc=102;
			x=0.400534;
			y="(0.416549 + 1*0.0500)";
		};
		class CA_TextFilterType: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 2*0.0500)";
			text="$STR_DISP_ARCGRP_TYPE";
		};
		class CA_FilterType: RscCombo
		{
			idc=109;
			x=0.400534;
			y="(0.416549 + 2*0.0500)";
			w=0.30000001;
		};
		class CA_TextExpansionsType: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 3*0.0500)";
			text="$STR_DISP_EXPANSIONS";
		};
		class CA_FilterExpansions: RscXListBox
		{
			idc=111;
			x=0.400534;
			y="(0.416549 + 3*0.0500)";
			w=0.30000001;
		};
		class CA_TextHideFull: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 4*0.0500)";
			text="$STR_FILTER_FULL_TEXT";
		};
		class CA_FullServers: RscXListBox
		{
			idc=106;
			x=0.400534;
			y="(0.416549 + 4*0.0500)";
			w=0.30000001;
		};
		class CA_TextPassworded: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 5*0.0500)";
			text="$STR_FILTER_PASSWORDED_TEXT";
		};
		class CA_PasswordedServers: CA_FullServers
		{
			idc=107;
			x=0.400534;
			y="(0.416549 + 5*0.0500)";
		};
		class CA_TextBattlEye: CA_TextServer
		{
			x=0.159803;
			y="(0.416549 + 6*0.0500)";
			text="$STR_FILTER_BATTLEYE_TEXT";
		};
		class CA_BEServers: CA_FullServers
		{
			idc=110;
			x=0.400534;
			y="(0.416549 + 6*0.0500)";
			w=0.30000001;
		};
		class CA_Filter_Default: RscShortcutButton
		{
			idc=108;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.338;
			y=0.76249999;
			text="$STR_DISP_DEFAULT";
		};
		class CA_Filter_Ok: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.52499998;
			y=0.76249999;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_Filter_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.15099999;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayMultiplayerSetup: RscStandardDisplay
{
	west="ca\ui\data\flag_bluefor_ca.paa";
	east="ca\ui\data\flag_opfor_ca.paa";
	guer="ca\ui\data\flag_indep_ca.paa";
	civl="ca\ui\data\flag_civil_ca.paa";
	none="ca\ui\data\flag_civil_ca.paa";
	westUnlocked="ca\ui\data\flag_bluefor_ca.paa";
	westLocked="ca\ui\data\flag_bluefor_ca.paa";
	eastUnlocked="ca\ui\data\flag_opfor_ca.paa";
	eastLocked="ca\ui\data\flag_opfor_ca.paa";
	guerUnlocked="ca\ui\data\flag_indep_ca.paa";
	guerLocked="ca\ui\data\flag_indep_ca.paa";
	civlUnlocked="ca\ui\data\flag_civil_ca.paa";
	civlLocked="ca\ui\data\flag_civil_ca.paa";
	disabledAllAI="$STR_DISP_MULTI_ENABLE_AI";
	enabledAllAI="$STR_DISP_MULTI_DISABLE_AI";
	hostLocked="$STR_DISP_MULTI_UNLOCK";
	hostUnlocked="$STR_DISP_MULTI_LOCK";
	colorNotAssigned[]={0.40000001,0.40000001,0.40000001,1};
	colorAssigned[]={0.77999997,0.38999999,0,1};
	colorConfirmed[]={0,1,0,1};
	class controlsbackground
	{
		class MP_roles_TitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class TextBack: RscText
		{
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(6/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class TextBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(6/100)	* SafeZoneH";
		};
		class SidesBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(16/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class SidesBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(16/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
		};
		class ValueRolesBack: RscText
		{
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class ValueRolesBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
		};
		class ValuePoolBack: RscText
		{
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class ValuePoolBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(73/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete B_Civilian;
		delete B_Guerrila;
		delete B_East;
		delete B_West;
		delete B_Side;
		delete B_OK;
		delete B_Cancel;
		delete B_Kick;
		delete B_EnableAll;
		delete B_Lock;
		delete TextDescription;
		delete ValueDescription;
		delete TextMessage;
		delete ValueRoles;
		delete TextParam1;
		delete TextParam2;
		delete ValueParam1;
		delete ValueParam2;
		delete ValuePool;
		delete B_Params;
		delete Title;
		class CA_MP_roles_Title: CA_Title
		{
			idc=1001;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
			text="$STR_DISP_MPSETUP_TITLE";
		};
		class CA_TextVotingTimeLeft: CA_MP_roles_Title
		{
			idc=121;
			style=1;
			x="(50/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(45/100)	* SafeZoneW";
			colorBackground[]={0,0,0,0};
		};
		class TextMission: RscText
		{
			idc=1002;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(18/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
			text="$STR_DISP_SRVSETUP_NAME";
		};
		class ValueMission: RscText
		{
			idc=101;
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(40/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
		};
		class CA_TextDescription: RscText
		{
			idc=1004;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(12.5/100)	* SafeZoneH + SafeZoneY";
			w="(18/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
			text="$STR_DISP_SRVSETUP_DESC";
		};
		class CA_ValueDescription: RscText
		{
			idc=103;
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(12.5/100)	* SafeZoneH + SafeZoneY";
			w="(78/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
		};
		class TextIsland: RscText
		{
			idc=1003;
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(5/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
			text="$STR_DISP_SRVSETUP_ISLAND";
		};
		class ValueIsland: RscText
		{
			idc=102;
			x="(65/100)	* SafeZoneW + SafeZoneX";
			y="(9.5/100)	* SafeZoneH + SafeZoneY";
			w="(33/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.029999999;
		};
		class TextSide: RscText
		{
			idc=1005;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(16.5/100)	* SafeZoneH + SafeZoneY";
			w="(16/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.039209999;
			text="$STR_DISP_MPSETUP_SIDE";
		};
		class TextRoles: RscText
		{
			style=2;
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(16.5/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.039209999;
			text="$STR_DISP_MPSETUP_SIDE";
		};
		class CA_B_West: RscActiveText
		{
			x="(4.15/100)	* SafeZoneW + SafeZoneX";
			y="(21/100)	* SafeZoneH + SafeZoneY";
			w="(11.7/100)	* SafeZoneW";
			h="(7/100)	* SafeZoneH";
			style="0x02 + 0x100 + 0x40";
			type=11;
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.15000001};
			colorShade[]={1,1,1,1};
			colorText[]={1,1,1,1};
			pictureWidth=1;
			pictureHeight=1;
			textHeight=0.38;
			sideDisabled="ca\ui\data\flag_none_ca.paa";
			sideToggle="ca\ui\data\flag_side_toggle_ca.paa";
			idc=104;
			color[]={1,1,1,0.55000001};
			text="$STR_WEST";
			picture="\ca\ui\data\flag_bluefor_ca.paa";
		};
		class CA_B_East: CA_B_West
		{
			idc=105;
			y="(31/100)	* SafeZoneH + SafeZoneY";
			text="$STR_EAST";
			picture="\ca\ui\data\flag_opfor_ca.paa";
		};
		class CA_B_Guerrila: CA_B_West
		{
			idc=106;
			y="(41/100)	* SafeZoneH + SafeZoneY";
			text="$STR_GUERRILA";
			picture="\ca\ui\data\flag_indep_ca.paa";
		};
		class CA_B_Civilian: CA_B_West
		{
			idc=107;
			y="(51/100)	* SafeZoneH + SafeZoneY";
			text="$STR_CIVILIAN";
			picture="\ca\ui\data\flag_civil_ca.paa";
		};
		class CA_ValueRoles: RscIGUIListBox
		{
			idc=109;
			style=16;
			x="(20/100)	* SafeZoneW + SafeZoneX";
			y="(20.5/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(72/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
			rowHeight=0.050000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			colorPlayer[]={1,1,0,1};
			colorAI[]={1,0,0,1};
			colorNobody[]={0.40000001,0.40000001,0.40000001,1};
			enabledAI="ca\ui\textures\ai2_on.paa";
			disabledAI="ca\ui\textures\ai2_off.paa";
		};
		class TextPool: RscText
		{
			idc=1006;
			style=2;
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(16.5/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(3/100)	* SafeZoneH";
			SizeEx=0.039209999;
			text="$STR_DISP_SRVSIDE_POOL";
		};
		class CA_ValuePool: RscIGUIListBox
		{
			idc=114;
			style=16;
			x="(60/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(38/100)	* SafeZoneW";
			h="(72/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
			rows=25;
			canDrag=1;
		};
		class CA_B_EnableAll: RscShortcutButton
		{
			idc=117;
			x="(22/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.22382499;
			class TextPos
			{
				left=0.035;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
			default=0;
		};
		class CA_B_Lock: RscShortcutButton
		{
			idc=118;
			x="(39/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.183825;
		};
		class CA_B_Params: RscShortcutButton
		{
			idc=128;
			x="(53/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.203825;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_PARAMS";
		};
		class CA_B_DSinterface: RscShortcutButton
		{
			idc=1012;
			default=0;
			onButtonClick="openDSInterface;";
			shortcuts[]={};
			x="(2.75/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.25999999;
			text="$STR_DISP_SERVER_CONTROL";
		};
		class CA_B_Kick: RscShortcutButton
		{
			idc=116;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(14/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_MP_KICKOFF";
		};
		class CA_ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_OK";
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(68/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.203825;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayMultiplayerSetupParams: RscStandardDisplay
{
	idd=146;
	class controlsBackground
	{
		class CA_Title: CA_Title
		{
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
			text="$STR_DISP_XBOX_EDITOR_WIZARD_PARAMS";
		};
		class CA_TitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class LB_ParamsTitlesBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(82.5/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class LB_ParamsTitlesBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(82.5/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete Title;
		delete LB_ParamsTitles;
		delete B_OK;
		delete B_Edit;
		class CA_LB_ParamsTitles: RscIGUIListNBox
		{
			idc=102;
			columns[]={0.075000003,0.57499999};
			drawSideArrows=0;
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10.5/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(81/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			default=1;
			text="$STR_DISP_BACK";
		};
		class CA_B_Edit: RscShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(57/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_DISP_EDIT";
		};
	};
};
class RscDisplayMultiplayerSetupParameter: RscStandardDisplay
{
	idd=147;
	class controlsBackground
	{
		class TitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class LB_ParamsTitlesBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(82.5/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class LB_ParamsTitlesBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(82.5/100)	* SafeZoneH";
		};
	};
	class controls
	{
		delete Title;
		delete B_Cancel;
		delete B_OK;
		delete LB_ParamsTitles;
		class CA_Title: CA_Title
		{
			idc=105;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
		};
		class CA_LB_ParamsTitles: RscIGUIListBox
		{
			idc=103;
			style="16 + 2";
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10.5/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(81/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			default=1;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayPassword: RscStandardDisplay
{
	movingEnable=0;
	simulationEnabled=0;
	class controlsbackground
	{
		class CA_Background_Top: RscPicture
		{
			x=0.13;
			y=0.23999999;
			w=1.254902;
			h=0.41830069;
			text="\ca\ui\data\ui_background_messagebox_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete Title;
		class SetPasswordTitle: CA_Title
		{
			idc=1001;
			x=0.14991701;
			y=0.252352;
			text="$STR_DISP_PASSWORD_TITLE";
		};
		class TextPassword: RscText
		{
			idc=1002;
			x=0.188315;
			y=0.354166;
			w=0.16176599;
			text="$STR_DISP_PASSWORD";
		};
		class ValuePassword: RscEdit
		{
			x=0.36151901;
			y=0.356617;
			w=0.33088499;
			h=0.039216001;
			colorBackground[]={0,0,0,0.5};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
			x=0.150196;
			y=0.44392401;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
			default=1;
			x=0.65498102;
			y=0.44392401;
		};
	};
};
class RscDisplayPort: RscStandardDisplay
{
	class controlsBackground
	{
		class Mainback: CA_Mainback
		{
			moving=1;
			x=0.29779199;
			y=0.39705801;
			w=0.40441501;
			h=0.20588399;
			colorbackground[]={0.60000002,0.60000002,0.60000002,0.40000001};
		};
		class PortTitleBack: CA_Title_Back
		{
			x=0.30514601;
			y=0.40686199;
			w=0.389709;
			h=0.039216001;
		};
		class Logo: CA_Logo_Small
		{
			x=0.51838201;
			y=0.35882199;
		};
	};
	class controls
	{
		delete Title;
		delete B_OK;
		delete B_Cancel;
		delete TextPort;
		delete ValuePort;
		class SetPortTitle: CA_Title
		{
			x=0.30514601;
			y=0.401862;
			text="$STR_DISP_PORT_TITLE";
			colorText[]={0.94999999,0.94999999,0.94999999,1};
		};
		class CA_TextPort: RscText
		{
			x=0.312498;
			y=0.45588201;
			w=0.088235997;
			text="$STR_DISP_IP_PORT";
		};
		class CA_Valueport: RscEdit
		{
			idc=101;
			x=0.40073401;
			y=0.45588201;
			w=0.29412001;
			h=0.039216001;
			colorBackground[]={0,0,0,0.5};
		};
		class Ok: CA_RscButton_dialog
		{
			idc=1;
			x=0.54779398;
			y=0.50490201;
			w=0.14706001;
			h=0.039216001;
			default=1;
			text="$STR_DISP_OK";
		};
		class Cancel: Ok
		{
			idc=2;
			default=0;
			y=0.553922;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayIPAddress: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_revert_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete Title;
		delete TextPort;
		delete ValuePort;
		delete TextAddress;
		delete ValueAddress;
		class CA_IPTitle: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_DISP_IP_TITLE";
		};
		class CA_TextAddress: RscText
		{
			x=0.160706;
			y=0.27962801;
			w=0.169119;
			text="$STR_DISP_IP_ADDRESS";
		};
		class CA_ValueAddress: RscEdit
		{
			idc=101;
			x=0.33717799;
			y=0.27962801;
			w=0.26470801;
			h=0.039216001;
		};
		class CA_TextPort: CA_TextAddress
		{
			y=0.328648;
			text="$STR_DISP_IP_PORT";
		};
		class CA_ValuePort: CA_ValueAddress
		{
			idc=102;
			y=0.328648;
			w=0.110295;
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.426;
			y=0.76249999;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.226;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayDedicatedServerSettings: RscStandardDisplay
{
	movingEnable=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_missions_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete HintStart;
		delete HintB;
		delete SliderMaxSlots;
		delete ValueMaxSlots;
		delete TitleMaxSlots;
		delete SliderPrivateSlots;
		delete ValuePrivateSlots;
		delete TitlePrivateSlots;
		delete Title;
		class CA_Title_dedicated: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_XBOX_DEDICATED_HOST";
		};
		class CA_TitlePrivateSlots: RscText
		{
			idc=105;
			x=0.166667;
			y=0.281863;
			w=0.60000002;
			text="$STR_DISP_XBOX_PRIVATE_SLOTS";
		};
		class CA_ValuePrivateSlots: CA_TitlePrivateSlots
		{
			idc=106;
			x=0.61300701;
			y=0.26838201;
			w=0.30000001;
		};
		class CA_SliderPrivateSlots: RscXSliderH
		{
			idc=104;
			x=0.37745199;
			y=0.35416999;
			w=0.55000001;
			class Value
			{
				idc=106;
				colorBase[]={0.94999999,0.94999999,0.94999999,1};
				colorActive[]={0.94999999,0.94999999,0.94999999,1};
				format="%.0f%";
			};
		};
		class CA_TitleMaxSlots: CA_TitlePrivateSlots
		{
			idc=102;
			x=0.166667;
			y=0.42524901;
			text="$STR_DISP_XBOX_MULTI_MAX_SLOTS_DED";
			class Attributes
			{
			};
		};
		class CA_ValueMaxSlots: CA_ValuePrivateSlots
		{
			idc=103;
			x=0.61300701;
			y=0.42524901;
		};
		class CA_SliderMaxSlots: CA_SliderPrivateSlots
		{
			idc=101;
			style="0x400 + 0x10";
			y=0.49755299;
			class Value
			{
				idc=103;
				x=0.20588399;
				y=0.46078801;
				colorBase[]={0.94999999,0.94999999,0.94999999,1};
				colorActive[]={0.94999999,0.94999999,0.94999999,1};
				format="%.0f%";
			};
		};
		class CA_HintB: RscXKeyShadow
		{
			key="0x00050000 + 1";
			x=0.40000001;
			y=0.88;
			w=0.30000001;
		};
		class CA_HintStart: RscXKeyShadow
		{
			key="0x00050000 + 8";
			x=0.40000001;
			y=0.935;
			w=0.49200001;
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
			x=0.55199999;
			y=0.76249999;
		};
		class CA_B_OK: CA_B_Cancel
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
			x=0.75199997;
			y=0.76249999;
			default=1;
		};
	};
};
class RscDisplayServerGetReady: RscDisplayGetReady
{
	onload="private ['_dummy']; _dummy = [_this,'onload'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
	color0[]={0.40000001,0.40000001,0.40000001,1};
	color1[]={1,0.60000002,0,1};
	color2[]={0.1961,0.1451,0.094099998,1};
	class controls
	{
		delete B_Cancel;
		delete B_Continue;
		class PlayersTitle: RscText
		{
			x=-2;
			y=-2;
		};
		class Players: RscListBox
		{
			x=-2;
			y=-2;
		};
		class CA_MainBackground: IGUIBack
		{
			idc=1020;
			x="SafeZoneX + 0.010 * SafeZoneW";
			y="SafeZoneY + 0.031";
			w="0.98*SafeZoneW";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_TopicsBackground: IGUIBack
		{
			idc=1021;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.146*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_SubTopicsBackground: IGUIBack
		{
			idc=1022;
			x="0.16*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.283*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_ContentBackground: IGUIBack
		{
			idc=1023;
			x="0.446*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="SafeZoneW * 0.544";
			h=0.83200002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_PlayerName: RscIGUIText
		{
			idc=111;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_PLAYER_NAME";
		};
		class CA_PlayerRank: RscIGUIText
		{
			idc=116;
			style=2;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class CA_MissionName: RscText
		{
			idc=112;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_MISSION_NAME";
		};
		class CA_CurrentTaskLabel: RscText
		{
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			text="$STR_DIARY_CURRENT_TASK";
		};
		class CA_CurrentTask: RscText
		{
			idc=113;
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="0.96*SafeZoneW";
			h=0.041000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class DiaryList: RscIGUIListBox
		{
			idc=1001;
			onLBSelChanged="[_this select 0, _this select 1, 'List'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';       private ['_dummy']; _dummy = [_this,'onLBSelChanged'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
			default=1;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.146*SafeZoneW";
			h=0.60000002;
		};
		class CA_DiaryIndex: RscIGUIListBox
		{
			idc=1002;
			onLBSelChanged="[_this select 0, _this select 1, 'Index'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';";
			default=0;
			x="0.16*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.283*SafeZoneW";
			h=0.60000002;
			sizeEx=0.034000002;
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc=1013;
			x="0.446*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.534*SafeZoneW";
			h=0.71799999;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.0099999998;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Diary: RscHTML
				{
					idc=1003;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
			};
		};
		class CA_ButtonsBackground: IGUIBack
		{
			idc=1026;
			x="0.010*SafeZoneW + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.887)";
			w="SafeZoneW * 0.98";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class ButtonCancel: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="0.031 + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			text="$STR_DISP_CANCEL";
		};
		class ButtonContinue: ButtonCancel
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 8"
			};
			x="((SafeZoneW + SafeZoneX) - (1 - 0.788))";
			text="$STR_DISP_CONTINUE";
		};
	};
};
class RscDisplayClientGetReady: RscDisplayGetReady
{
	onload="private ['_dummy']; _dummy = [_this,'onload'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
	color0[]={0.40000001,0.40000001,0.40000001,1};
	color1[]={1,0.60000002,0,1};
	color2[]={0.1961,0.1451,0.094099998,1};
	class controls
	{
		delete B_Cancel;
		delete B_Continue;
		class PlayersTitle: RscText
		{
			x=-2;
			y=-2;
		};
		class Players: RscListBox
		{
			x=-2;
			y=-2;
		};
		class CA_MainBackground: IGUIBack
		{
			idc=1020;
			x="SafeZoneX + 0.010 * SafeZoneW";
			y="SafeZoneY + 0.031";
			w="0.98*SafeZoneW";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_TopicsBackground: IGUIBack
		{
			idc=1021;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.146*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_SubTopicsBackground: IGUIBack
		{
			idc=1022;
			x="0.16*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="0.283*SafeZoneW";
			h=0.52999997;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_ContentBackground: IGUIBack
		{
			idc=1023;
			x="0.446*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.117";
			w="SafeZoneW * 0.544";
			h=0.83200002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_PlayerName: RscIGUIText
		{
			idc=111;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_PLAYER_NAME";
		};
		class CA_PlayerRank: RscIGUIText
		{
			idc=116;
			style=2;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="SafeZoneW * 0.96";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class CA_MissionName: RscText
		{
			idc=112;
			style=1;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DIARY_MISSION_NAME";
		};
		class CA_CurrentTaskLabel: RscText
		{
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.033";
			w="0.96 * SafeZoneW";
			h=0.041000001;
			sizeEx=0.034000002;
			text="$STR_DIARY_CURRENT_TASK";
		};
		class CA_CurrentTask: RscText
		{
			idc=113;
			style=0;
			x="0.02*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.07";
			w="0.96*SafeZoneW";
			h=0.041000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="";
		};
		class DiaryList: RscIGUIListBox
		{
			idc=1001;
			onLBSelChanged="[_this select 0, _this select 1, 'List'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';       private ['_dummy']; _dummy = [_this,'onLBSelChanged'] call compile preprocessfile '\ca\ui\scripts\server_interface.sqf';";
			default=1;
			x="0.010*SafeZoneW + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.146*SafeZoneW";
			h=0.60000002;
		};
		class CA_DiaryIndex: RscIGUIListBox
		{
			idc=1002;
			onLBSelChanged="[_this select 0, _this select 1, 'Index'] call compile preprocessFileLineNumbers 'ca\Warfare2\Scripts\Client\GUI\GUI_logEH.sqf';";
			default=0;
			x="0.16*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.283*SafeZoneW";
			h=0.60000002;
			sizeEx=0.034000002;
		};
		class CA_DiaryGroup: RscControlsGroup
		{
			idc=1013;
			x="0.446*SafeZoneW  + SafeZoneX";
			y="SafeZoneY + 0.137";
			w="0.534*SafeZoneW";
			h=0.71799999;
			class VScrollbar
			{
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
				color[]={1,1,1,1};
				width=0.0099999998;
			};
			class HScrollbar
			{
				color[]={1,1,1,0};
				height=0.001;
			};
			class Controls
			{
				class CA_Diary: RscHTML
				{
					idc=1003;
					cycleLinks=0;
					cycleAllLinks=0;
					default=0;
					x="0.01*SafeZoneW";
					y=0;
					w="0.514*SafeZoneW";
					h=1.807;
					colorText[]={0.94999999,0.94999999,0.94999999,1};
					class H1
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
					class P
					{
						font="Zeppelin32";
						fontBold="Zeppelin32";
						sizeEx=0.034000002;
					};
				};
			};
		};
		class CA_ButtonsBackground: IGUIBack
		{
			idc=1026;
			x="0.010*SafeZoneW + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.887)";
			w="SafeZoneW * 0.98";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class ButtonCancel: RscIGUIShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x="0.031 + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			text="$STR_DISP_CANCEL";
		};
		class ButtonContinue: ButtonCancel
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 8"
			};
			x="((SafeZoneW + SafeZoneX) - (1 - 0.788))";
			text="$STR_DISP_CONTINUE";
		};
	};
};
class RscDisplayMPPlayers: RscStandardDisplay
{
	class controlsBackground
	{
		class Mainback: CA_Mainback
		{
			moving=1;
			x=0.022055;
			y=0.058820002;
			w=0.95589;
			h=0.88235998;
			colorbackground[]={0.60000002,0.60000002,0.60000002,0.40000001};
		};
		class Missionback: CA_Back
		{
			x=0.025;
			y=0.11;
			w=0.94999999;
			h=0.035;
		};
		class Playersback: CA_Back
		{
			x=0.025;
			y=0.15000001;
			w=0.25;
			h=0.72000003;
		};
		class Squadback: CA_Back
		{
			x=0.28;
			y=0.15000001;
			w=0.69999999;
			h=0.72000003;
		};
		class FilterTitleBack: CA_Title_Back
		{
			x=0.029408;
			y=0.068623997;
			w=0.94118398;
			h=0.039216001;
		};
		class Logo: CA_Logo_Small
		{
			x=0.79412001;
			y=0.020584401;
		};
	};
	class controls
	{
		delete Title;
		delete TextMission;
		delete ValueMission;
		delete TextIsland;
		delete ValueIsland;
		delete TextTime;
		delete ValueTime;
		delete ValueRest;
		delete TextPlayers;
		delete ValuePlayers;
		delete TextPlayer;
		delete ValuePlayer;
		delete TextPlayerName;
		delete ValuePlayerName;
		delete TextPlayerMail;
		delete ValuePlayerMail;
		delete TextPlayerICQ;
		delete ValuePlayerICQ;
		delete TextPlayerRemark;
		delete ValuePlayerRemark;
		delete PingTitle;
		delete PingMinValue;
		delete PingAvgValue;
		delete PingMaxValue;
		delete BandwidthTitle;
		delete BandwidthMinValue;
		delete BandwidthAvgValue;
		delete BandwidthMaxValue;
		delete DesyncTitle;
		delete DesyncValue;
		delete TextSquad;
		delete ValueSquad;
		delete TextSquadName;
		delete ValueSquadName;
		delete TextSquadId;
		delete ValueSquadId;
		delete TextSquadMail;
		delete ValueSquadMail;
		delete TextSquadWeb;
		delete ValueSquadWeb;
		delete TextSquadPicture;
		delete ValueSquadPicture;
		delete TextSquadTitle;
		delete ValueSquadTitle;
		delete B_Cancel;
		delete B_Ban;
		delete B_Mute;
		delete B_KickOff;
		class CA_PlayersTitle: CA_Title
		{
			text="$STR_DISP_MP_PLAYERS_TITLE";
			x=0.025;
			y=0.055;
			w=0.12;
			colortext[]={0.94999999,0.94999999,0.94999999,1};
		};
		class CA_TextMission: RscText
		{
			x=0.025;
			y=0.11;
			w=0.12;
			text="$STR_DISP_SRVSETUP_NAME";
		};
		class CA_ValueMission: RscText
		{
			idc=116;
			x=0.145;
			y=0.11;
			w=0.23;
		};
		class CA_TextIsland: RscText
		{
			x=0.40000001;
			y=0.11;
			w=0.1;
			text="$STR_DISP_SRVSETUP_ISLAND";
		};
		class CA_ValueIsland: RscText
		{
			idc=117;
			x=0.5;
			y=0.11;
			w=0.2;
		};
		class CA_TextTime: RscText
		{
			x=0.625;
			y=0.11;
			w=0.1;
			text="$STR_DISP_MP_PL_TIME";
		};
		class CA_ValueTime: RscText
		{
			idc=118;
			x=0.72500002;
			y=0.11;
			w=0.1;
		};
		class CA_ValueRest: RscText
		{
			idc=126;
			x=0.82499999;
			y=0.11;
			w=0.15000001;
		};
		class CA_TextPlayers: RscText
		{
			x=0.025;
			y=0.15000001;
			w=0.25;
			text="$STR_DISP_MP_PLAYERS";
		};
		class CA_ValuePlayers: RscListBox
		{
			idc=101;
			onLBSelChanged="_this call compile preprocessfile ""\ca\ui\scripts\lbColor.sqf"";";
			x=0.025;
			y=0.2;
			w=0.25;
			h=0.64999998;
			rows=18.5;
		};
		class CA_TextPlayer: RscText
		{
			x=0.30000001;
			y=0.15000001;
			w=0.15000001;
			text="$STR_DISP_MP_PL";
		};
		class CA_ValuePlayer: RscText
		{
			idc=102;
			x=0.44999999;
			y=0.15000001;
			w=0.52499998;
		};
		class CA_TextPlayerName: RscText
		{
			x=0.32499999;
			y=0.18000001;
			w=0.125;
			text="$STR_DISP_MP_PL_NAME";
		};
		class CA_ValuePlayerName: RscText
		{
			idc=103;
			x=0.44999999;
			y=0.18000001;
			w=0.52499998;
		};
		class CA_TextPlayerMail: RscText
		{
			x=0.32499999;
			y=0.20999999;
			w=0.125;
			text="$STR_DISP_MP_PL_MAIL";
		};
		class CA_ValuePlayerMail: RscText
		{
			idc=104;
			x=0.44999999;
			y=0.20999999;
			w=0.52499998;
		};
		class CA_TextPlayerICQ: RscText
		{
			x=0.32499999;
			y=0.23999999;
			w=0.125;
			text="$STR_DISP_MP_PL_ICQ";
		};
		class CA_ValuePlayerICQ: RscText
		{
			idc=105;
			x=0.44999999;
			y=0.23999999;
			w=0.52499998;
		};
		class CA_TextPlayerRemark: RscText
		{
			x=0.32499999;
			y=0.27000001;
			w=0.125;
			text="$STR_DISP_MP_PL_REMARK";
		};
		class CA_ValuePlayerRemark: RscText
		{
			idc=106;
			x=0.44999999;
			y=0.27000001;
			w=0.52499998;
			h=0.145;
			style=16;
			lines=3;
			lineSpacing=0.0099999998;
		};
		class CA_PingTitle: RscText
		{
			x=0.32499999;
			y=0.41999999;
			w=0.15000001;
			text="$STR_DISP_MP_PING";
		};
		class CA_PingMinValue: RscText
		{
			idc=119;
			x=0.47999999;
			y=0.41999999;
			w=0.07;
		};
		class CA_PingAvgValue: RscText
		{
			idc=120;
			x=0.57999998;
			y=0.41999999;
			w=0.07;
		};
		class CA_PingMaxValue: RscText
		{
			idc=121;
			x=0.68000001;
			y=0.41999999;
			w=0.07;
		};
		class CA_BandwidthTitle: RscText
		{
			x=0.32499999;
			y=0.44999999;
			w=0.15000001;
			text="$STR_DISP_MP_BANDWIDTH";
		};
		class CA_BandwidthMinValue: RscText
		{
			idc=122;
			x=0.47999999;
			y=0.44999999;
			w=0.07;
		};
		class CA_BandwidthAvgValue: RscText
		{
			idc=123;
			x=0.57999998;
			y=0.44999999;
			w=0.07;
		};
		class CA_BandwidthMaxValue: RscText
		{
			idc=124;
			x=0.68000001;
			y=0.44999999;
			w=0.07;
		};
		class CA_DesyncTitle: RscText
		{
			x=0.32499999;
			y=0.47999999;
			w=0.15000001;
			text="$STR_DISP_MP_DESYNC";
		};
		class CA_DesyncValue: RscText
		{
			idc=125;
			x=0.47999999;
			y=0.47999999;
			w=0.07;
		};
		class CA_TextSquad: RscText
		{
			x=0.30000001;
			y=0.54000002;
			w=0.15000001;
			text="$STR_DISP_MP_SQ";
		};
		class CA_ValueSquad: RscText
		{
			idc=107;
			x=0.44999999;
			y=0.54000002;
			w=0.52499998;
		};
		class CA_TextSquadName: RscText
		{
			x=0.32499999;
			y=0.56999999;
			w=0.125;
			text="$STR_DISP_MP_SQ_NAME";
		};
		class CA_ValueSquadName: RscText
		{
			idc=108;
			x=0.44999999;
			y=0.56999999;
			w=0.52499998;
		};
		class CA_TextSquadId: RscText
		{
			x=0.32499999;
			y=0.60000002;
			w=0.125;
			text="$STR_DISP_MP_SQ_ID";
		};
		class CA_ValueSquadId: RscText
		{
			idc=109;
			x=0.44999999;
			y=0.60000002;
			w=0.52499998;
		};
		class CA_TextSquadMail: RscText
		{
			x=0.32499999;
			y=0.63;
			w=0.125;
			text="$STR_DISP_MP_SQ_MAIL";
		};
		class CA_ValueSquadMail: RscText
		{
			idc=110;
			x=0.44999999;
			y=0.63;
			w=0.52499998;
		};
		class CA_TextSquadWeb: RscText
		{
			x=0.32499999;
			y=0.66000003;
			w=0.125;
			text="$STR_DISP_MP_SQ_WEB";
		};
		class CA_ValueSquadWeb: RscText
		{
			idc=111;
			x=0.44999999;
			y=0.66000003;
			w=0.52499998;
		};
		class CA_TextSquadPicture: RscText
		{
			x=0.32499999;
			y=0.69;
			w=0.125;
			text="$STR_DISP_MP_SQ_PICTURE";
		};
		class CA_ValueSquadPicture: RscPicture
		{
			idc=112;
			style=48;
			x=0.44999999;
			y=0.69;
			w=0.093000002;
			h=0.124;
		};
		class CA_TextSquadTitle: RscText
		{
			x=0.32499999;
			y=0.81999999;
			w=0.125;
			text="$STR_DISP_MP_SQ_TITLE";
		};
		class CA_ValueSquadTitle: RscText
		{
			idc=113;
			x=0.44999999;
			y=0.81999999;
			w=0.52499998;
		};
		class CA_B_Mute: CA_RscButton_dialog
		{
			idc=127;
			x=0.28;
			y=0.89999998;
			borderSize=0;
			text="$STR_DIK_MUTE";
		};
		class CA_B_KickOff: CA_B_Mute
		{
			idc=114;
			x=0.28;
			y=0.89999998;
			borderSize=0;
			text="$STR_DISP_MP_KICKOFF";
		};
		class CA_B_Ban: CA_B_KickOff
		{
			idc=115;
			x=0.43799999;
			borderSize=0;
			text="$STR_DISP_MP_BAN";
		};
		class CA_B_Cancel: CA_RscButton_dialog
		{
			idc=2;
			x=0.82800001;
			y=0.89999998;
			default=1;
			text="$STR_DISP_CLOSE";
		};
	};
};
class RscDisplayClientWait: RscDisplayMPPlayers
{
	class LoadingPic: RscPicture
	{
		x=0;
		y=0;
		w=1;
		h=1;
		text="\ca\ui\textures\loading.paa";
		colortext[]={1,1,1,1};
	};
	class Cancel: CA_Ok
	{
		default=1;
		idc=2;
		y=0.85000002;
		onMouseEnter="_display = ctrlParent (_this select 0); _ctrl031 = _display displayCtrl 031; _ctrl032 = _display displayCtrl 032; _ctrl031 ctrlSetTextColor [0.84,1,0.55,1]; _ctrl032 ctrlSetTextColor [0, 0, 0, 1]";
		onMouseExit="_display = ctrlParent (_this select 0); _ctrl031 = _display displayCtrl 031; _ctrl032 = _display displayCtrl 032; _ctrl031 ctrlSetTextColor [1,1,1,0.9]; _ctrl032 ctrlSetTextColor [0, 0, 0, 0.9]";
		onSetFocus="_display = ctrlParent (_this select 0); _ctrl031 = _display displayCtrl 031; _ctrl032 = _display displayCtrl 032; _ctrl031 ctrlSetTextColor [0.84,1,0.55,1]; _ctrl032 ctrlSetTextColor [0, 0, 0, 1]";
		onKillFocus="_display = ctrlParent (_this select 0); _ctrl031 = _display displayCtrl 031; _ctrl032 = _display displayCtrl 032; _ctrl031 ctrlSetTextColor [1,1,1,0.9]; _ctrl032 ctrlSetTextColor [0, 0, 0, 0.9]";
	};
	class Cancel_image: CA_Ok_image
	{
		idc=31;
		y=0.85000002;
	};
	class Cancel_image2: CA_Ok_image2
	{
		y=0.85000002;
	};
	class Cancel_text: CA_Ok_text
	{
		idc=32;
		y=0.85000002;
		text="$STR_CA_CANCEL";
	};
};
class RscDisplayClient: RscStandardDisplay
{
	class controlsBackground
	{
		class CA_Black_Back3: CA_Black_Back
		{
		};
		class LoadingPic: RscPicture
		{
			x=-0.75490201;
			y=-0.33660129;
			w=2.509804;
			h=1.6732026;
			text="#(argb,8,8,3)color(0,0,0,1)";
		};
	};
	class controls
	{
		delete Background;
		delete PlayersTitle;
		class CA_Background: RscLoadingText
		{
			idc=101;
			style=2;
			colorText[]={1,1,1,1};
		};
		class Progress: RscProgress
		{
			idc=103;
			x=0;
			y=0.91000003;
			w=1;
			h=0.079999998;
		};
		class Players: RscListBox
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
			y="SafeZoneY";
			h="SafeZoneH";
			w=0.30000001;
			colorText[]={0.60000002,0.60000002,0.60000002,1};
		};
	};
};
class RscDisplayMPInterrupt: RscStandardDisplay
{
	movingEnable=0;
	enableSimulation=1;
	onLoad="_dummy = [""Init"", _this] execVM ""\ca\ui\scripts\pauseLoadinit.sqf""";
	onUnload="private ['_dummy']; _dummy = ['Unload', _this] execVM '\ca\ui\scripts\pauseOnUnload.sqf';";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_background_mp_pause_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete B_Players;
		delete B_Options;
		delete B_Abort;
		delete B_Retry;
		delete B_Load;
		delete B_Save;
		delete B_Continue;
		delete B_Diary;
		class MissionTitle: RscText
		{
			idc=120;
			x=0.050000001;
			y=0.81800002;
			text="";
		};
		class DifficultyTitle: RscText
		{
			idc=121;
			x=0.050000001;
			y=0.77200001;
			text="";
		};
		class Paused_Title: CA_Title
		{
			idc=523;
			x=0.086999997;
			y=0.192;
			text="$STR_DISP_MAIN_MULTI";
		};
		class CA_B_SAVE: RscShortcutButtonMain
		{
			idc=103;
			y="0.2537 + 0.101903 * 0";
			x=0.050999999;
			text="$STR_DISP_INT_SAVE";
			default=0;
		};
		class CA_B_Skip: CA_B_SAVE
		{
			idc=1002;
			text="$STR_DISP_INT_SKIP";
		};
		class CA_B_REVERT: CA_B_SAVE
		{
			idc=119;
			y="0.2537 + 0.101903 * 1";
			text="$str_disp_revert";
			default=0;
		};
		class CA_B_Respawn: CA_B_SAVE
		{
			idc=1010;
			onButtonClick="if (alive player) then { player SetDamage 1;};";
			y="0.2537 + 0.101903 * 2";
			text="$STR_DISP_INT_RESPAWN";
			default=0;
		};
		class CA_B_Options: CA_B_SAVE
		{
			idc=101;
			y="0.2537 + 0.101903 * 3";
			text="$STR_DISP_INT_OPTIONS";
			default=0;
		};
		class CA_B_Abort: CA_B_SAVE
		{
			idc=104;
			y="0.2537 + 0.101903 * 4";
			text="$STR_DISP_INT_ABORT";
			default=0;
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1",
				"0x00050000 + 8"
			};
			default=1;
			x=0.1605;
			y=0.8617;
			text="$STR_DISP_INT_CONTINUE";
		};
	};
};
class RscDisplayRemoteMissions: RscStandardDisplay
{
	colorEditor[]={0.19599999,0.59200001,0.70599997,1};
	colorWizard[]={0.86299998,0.58399999,0,1};
	colorMission[]={0.87840003,0.84710002,0.65100002,1};
	colorMissionEditor[]={0.19599999,0.59200001,0.70599997,1};
	colorMissionWizard[]={0.86299998,0.58399999,0,1};
	class controlsBackground
	{
		class CA_TitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class CustomFieldsBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(15/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class CustomFieldsBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(15/100)	* SafeZoneH";
		};
		class ValueDescriptionBack: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(35/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(57/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class ValueDescriptionBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(35/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(57/100)	* SafeZoneH";
		};
		class ValuemapsBack: RscText
		{
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(35/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(57/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class ValuemapsBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(35/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(57/100)	* SafeZoneH";
		};
		class DifficultyBack: RscText
		{
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(15/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class DifficultyBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(15/100)	* SafeZoneH";
		};
		class ValueMissionsBack: RscText
		{
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(77/100)	* SafeZoneH";
			colorBackground[]={0.1961,0.1451,0.094099998,0.41999999};
		};
		class ValueMissionsBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(77/100)	* SafeZoneH";
		};
		delete MainbackFaded1;
		delete MainbackFaded2;
		delete Mainback;
		delete MainbackPlain;
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete B_Editor;
		delete B_Difficulty;
		delete ValueMissions;
		delete TextMissions;
		delete ValueMaps;
		delete TextMaps;
		delete Title;
		delete Respawn;
		delete GameType;
		delete MaxPlayers;
		delete Overview;
		class CA_Title: CA_Title
		{
			idc=1001;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
			text="$STR_DISP_SERVER_TITLE";
		};
		class CA_TextCustomFields: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="Mission settings:";
		};
		class CA_TextSlots: RscText
		{
			x="(3/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(14/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="$STR_DISP_XBOX_MULTI_MAX_SLOTS";
		};
		class CA_ValueSlots: RscText
		{
			idc=132;
			x="(17/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="";
		};
		class CA_TextType: RscText
		{
			x="(3/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(14/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="$STR_DISP_ARCEFF_TITTYPE";
		};
		class CA_ValueType: RscText
		{
			idc=131;
			x="(17/100)	* SafeZoneW + SafeZoneX";
			y="(20/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="";
		};
		class CA_TextRespawn: RscText
		{
			x="(3/100)	* SafeZoneW + SafeZoneX";
			y="(25/100)	* SafeZoneH + SafeZoneY";
			w="(14/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="$STR_MP_BT_RESPAWN";
		};
		class CA_ValueRespawn: RscText
		{
			idc=133;
			x="(17/100)	* SafeZoneW + SafeZoneX";
			y="(25/100)	* SafeZoneH + SafeZoneY";
			w="(10/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			sizeEx=0.034000002;
			text="";
		};
		class CA_TextDescription: RscText
		{
			x="(2/100)	* SafeZoneW + SafeZoneX";
			y="(30/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="$STR_MAP_DLOG";
		};
		class CA_ValueDescription: RscHTML
		{
			idc=130;
			x="(2.5/100)	* SafeZoneW + SafeZoneX";
			y="(36/100)	* SafeZoneH + SafeZoneY";
			w="(24/100)	* SafeZoneW";
			h="(85/100)	* SafeZoneH";
			sizeEx=0.034000002;
			class H1
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class H2
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class H3
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class H4
			{
				font="Zeppelin33Italic";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class H5
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class H6
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
			class P
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.034000002;
				align="left";
			};
		};
		class CA_TextMaps: RscText
		{
			idc=1002;
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(30/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="$STR_DISP_SERVER_ISLAND";
		};
		class CA_Valuemaps: RscIGUIListBox
		{
			idc=101;
			style=16;
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(35/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(57/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class CA_TextDiff: RscText
		{
			idc=1004;
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="$STR_CA_DIFFICULTY";
		};
		class CA_B_Difficulty: RscIGUIListBox
		{
			idc=104;
			style=16;
			x="(28/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(23/100)	* SafeZoneW";
			h="(15/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class CA_TextMissions: RscText
		{
			idc=1003;
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(5/100)	* SafeZoneH";
			text="$STR_DISP_SERVER_MISSION";
		};
		class CA_ValueMissions: RscIGUIListBox
		{
			idc=102;
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(15.5/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(76/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelect2[]={1,1,0,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
			period=1;
		};
		class ButtonCancel: RscShortcutButton
		{
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_DISP_BACK";
		};
		class CA_B_Editor: RscShortcutButton
		{
			x="(41/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=103;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_DISP_EDIT";
		};
		class ButtonRestart: RscShortcutButton
		{
			idc=123;
			x="(55/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w=0.203825;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			text="$STR_XBOX_PLAY_AGAIN";
		};
		class ButtonContinue: RscShortcutButton
		{
			x="(83/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_CONTINUE";
		};
	};
};
class RscDisplayServer: RscDisplayRemoteMissions
{
	colorEditor[]={0.19599999,0.59200001,0.70599997,1};
	colorWizard[]={0.86299998,0.58399999,0,1};
	colorMission[]={0.87840003,0.84710002,0.65100002,1};
	colorMissionEditor[]={0.19599999,0.59200001,0.70599997,1};
	colorMissionWizard[]={0.86299998,0.58399999,0,1};
	delete ControlsBackground;
	delete controls;
};
class RscDisplayRemoteMissionVoted: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_missions_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1108;
			x=0.184;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizardtemplate_background_ca.paa";
		};
	};
	class controls
	{
		delete TextWait;
		delete B_Cancel;
		class CA_Remaining_Time: CA_Title
		{
			IDC=118;
			x=0.197713;
			y=0.188127;
		};
		class CA_TextPlayer: RscText
		{
			IDC=117;
			x=0.20567299;
			y=0.26686299;
			h=0.029999999;
			text="$STR_DISP_SERVER_ISLAND";
		};
		class CA_Players_list: RscListBox
		{
			IDC=105;
			colorSelectBackground[]={1,1,1,0};
			colorSelectBackground2[]={1,1,1,0};
			x=0.20205;
			y=0.30224699;
			w=0.255;
			h=0.45726401;
		};
		class CA_Voted_missions_list: CA_Players_list
		{
			IDC=116;
			x=0.45757499;
			w=0.45500001;
		};
		class CA_Voted_diff: RscText
		{
			IDC=119;
			x=0.20567299;
			y=0.70710802;
			w=0.755;
			h=0.039216001;
		};
		class CA_ChangeVote: RscShortcutButton
		{
			idc=2;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.209405;
			y=0.755;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayHostSettings: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_revert_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete TextName;
		delete ValueName;
		delete TextPassword;
		delete ValuePassword;
		delete TextMaxPlayers;
		delete ValueMaxPlayers;
		delete TextPrivate;
		delete ValuePrivate;
		delete TextPort;
		delete ValuePort;
		delete B_OK;
		delete B_Cancel;
		class CA_SetHost_Title: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_DISP_SERVER_TITLE";
		};
		class CA_TextName: RscText
		{
			x=0.160706;
			y=0.27962801;
			w=0.169119;
			text="$STR_DISP_GAME_NAME";
		};
		class CA_ValueName: RscEdit
		{
			idc=101;
			x=0.33717799;
			y=0.27962801;
			w=0.26470801;
			h=0.039216001;
		};
		class CA_TextPort: CA_TextName
		{
			y=0.328648;
			text="$STR_DISP_IP_PORT";
		};
		class CA_ValuePort: CA_ValueName
		{
			idc=105;
			y=0.328648;
			w=0.110295;
		};
		class CA_TextMaxPlayers: CA_TextName
		{
			y=0.37766799;
			text="$STR_DISP_FILTER_MAXPLAYERS";
		};
		class CA_ValueMaxPlayers: CA_ValuePort
		{
			idc=103;
			y=0.37766799;
		};
		class CA_TextPassword: CA_TextName
		{
			y=0.42668799;
			text="$STR_DISP_PASSWORD";
		};
		class CA_ValuePassword: CA_ValuePort
		{
			idc=102;
			y=0.42668799;
		};
		class CA_TextPrivate: CA_TextName
		{
			y=0.47570801;
			text="$STR_DISP_FILTER_SERVER";
		};
		class CA_ValuePrivate: RscXListBox
		{
			idc=104;
			x=0.33554399;
			y=0.47570801;
			w=0.26470801;
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.426;
			y=0.76249999;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.226;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscMPSetupMessage
{
	class controlsBackground
	{
		class CA_Background: IGUIBack
		{
			x=0.2;
			y=0.17200001;
			w=0.60000002;
			h=0.09804;
			colorBackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
	};
	class Controls
	{
		delete Background;
		delete Text;
		delete Progress;
		delete ProgressIcon;
		class CA_MPSetupMessageTitle: RscStructuredText
		{
			idc=101;
			text="$STR_DISP_ERROR";
			style="0x02 + 0x100";
			y=0.182;
			h=0.078432001;
			x=0;
			w=1;
		};
		class CA_Progress: RscProgress
		{
			idc=102;
			y=0.22499999;
			x=0.214;
			w=0.57099998;
		};
	};
};
class RscPendingInvitation
{
	textureConnectionQualityPoor="\ca\ui\data\ui_connectionqualitypoor_ca.paa";
	textureConnectionQualityBad="\ca\ui\data\ui_connectionqualitybad_ca.paa";
	textureDesyncLow="\ca\ui\data\ui_desynclow_ca.paa";
	textureDesyncHigh="\ca\ui\data\ui_desynchigh_ca.paa";
	color[]={1,1,1,1};
	x=0.93900001;
	y=0.852;
	w=0.054000001;
	h=0.071999997;
	timeout=10;
	blinkingPeriod=2;
};
class RscPendingInvitationInGame
{
	textureConnectionQualityPoor="\ca\ui\data\ui_connectionqualitypoor_ca.paa";
	textureConnectionQualityBad="\ca\ui\data\ui_connectionqualitybad_ca.paa";
	textureDesyncLow="\ca\ui\data\ui_desynclow_ca.paa";
	textureDesyncHigh="\ca\ui\data\ui_desynchigh_ca.paa";
	color[]={1,1,1,1};
	x=0.93900001;
	y=0.852;
	w=0.054000001;
	h=0.071999997;
	timeout=10;
	blinkingPeriod=2;
};
class RscDisplaySelectIsland: RscStandardDisplay
{
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_selectisland_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete Islands;
		delete B_Editor;
		delete B_OK;
		delete B_Cancel;
		delete B_Wizard;
		class Title2: CA_Title
		{
			x=0.18000001;
			y=0.192;
			text="$STR_CA_SELECT_ISLAND";
		};
		class IslandPanorama: RscPicture
		{
			idc=1005;
			x=0.16150001;
			y=0.26800001;
			w=0.627451;
			h=0.2091503;
			text="\ca\ui\data\island_picture_dummy_ca.paa";
		};
		class IslandsBox: RscListBox
		{
			idc=101;
			onLBSelChanged="_dummy = [_this, ""CA_SI_IslandSelected""] execVM ""\ca\ui\scripts\islandPicture.sqf"";";
			x=0.16150001;
			y=0.5;
			w=0.627451;
			h=0.23899999;
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.61000001;
			y=0.76249999;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.41;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayArcadeMap: RscMap
{
	textureClear="\ca\ui\data\editor_jasno.paa";
	textureCloudly="\ca\ui\data\editor_polojasno.paa";
	textureOvercast="\ca\ui\data\editor_zatazeno.paa";
	textureRainy="\ca\ui\data\editor_destivo.paa";
	textureStormy="\ca\ui\data\editor_bourka.paa";
	class controlsBackground
	{
		class CA_Map: RscMapControl
		{
			moveOnEdges=1;
			sizeExLabel=0.02674;
			shadow=0;
			class Legend
			{
				x="SafeZoneX";
				y="SafeZoneY";
				w=0.34;
				h=0.152;
				font="Zeppelin32";
				sizeEx=0.039209999;
				colorBackground[]={1,1,1,0};
				color[]={0,0,0,1};
			};
		};
	};
	class controls: controls
	{
		delete Background1;
		delete ToolboxMode;
		delete B_Intel;
		delete Difficulty;
		delete MissionName;
		delete B_Merge;
		delete B_Save;
		delete B_Clear;
		delete Section;
		delete B_Ids;
		delete B_Textures;
		delete B_Preview;
		delete B_Continue;
		delete B_Cancel;
		delete B_Load;
		delete Map;
		class Mainback: CA_Mainback
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.79)";
			y="SafeZoneY";
			w=0.20999999;
			h="SafeZoneH";
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class IntelBack: CA_Back
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.14;
			w=0.191;
			h=0.185;
			colorText[]={0.15000001,0.15000001,0.15000001,0.69999999};
		};
		class CA_Section: RscCombo
		{
			idc=109;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.090000004;
			w=0.191;
			h=0.029999999;
			wholeHeight=0.44999999;
		};
		class Intel_text: RscText
		{
			idc=-1;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.15000001;
			w=0.191;
			h=0.029999999;
			text="$STR_CA_EDIT_INTEL";
			colorText[]={0.94999999,0.94999999,0.94999999,1};
		};
		class CA_MissionName: RscText
		{
			idc=113;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.039999999;
			w=0.191;
			h=0.039999999;
			text="XXX";
			sizeEx=0.029999999;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
		};
		class Weather: RscPicture
		{
			idc=52;
			text="\ca\ui\data\Editor_bourka.paa";
			x="(SafeZoneW + SafeZoneX) - (1 - 0.92)";
			y=0.13500001;
			w=0.059999999;
			h=0.079999998;
			colorText[]={1,1,1,1};
		};
		class TimeFrame: RscFrame
		{
			colorText[]={1,1,1,0};
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.23999999;
			w=0.191;
			h=0.028000001;
		};
		class Time: RscText
		{
			idc=54;
			style=2;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.23999999;
			w=0.191;
			h=0.028000001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
		};
		class DateFrame: RscFrame
		{
			colorText[]={1,1,1,0};
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.278;
			w=0.191;
			h=0.028000001;
		};
		class Date: Time
		{
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			idc=55;
			style=2;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.278;
			w=0.191;
			h=0.028000001;
		};
		class Intel: RscActiveText
		{
			idc=105;
			default=0;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.14;
			w=0.191;
			h=0.185;
			text="#(argb,8,8,3)color(1,1,1,0)";
			style=48;
			colortext[]={0,0,0,0};
		};
		class TollBoxBack: CA_Title_Back
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.34999999;
			w=0.191;
			h=0.185;
			colorText[]={0.1961,0.1451,0.094099998,1};
		};
		class CA_ToolboxMode: RscToolbox
		{
			idc=104;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.799)";
			y=0.34400001;
			w=0.191;
			h="6 * 0.03";
			style=0;
			sizeEx=0.029999999;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			color[]={0.94999999,0.94999999,0.94999999,1};
			colorTextSelect[]={0.94999999,0.94999999,0.94999999,1};
			colorSelect[]={0.94999999,0.94999999,0.94999999,1};
			default=0;
			strings[]=
			{
				"$STR_DISP_ARCMAP_UNITS",
				"$STR_DISP_ARCMAP_GROUPS",
				"$STR_DISP_ARCMAP_SENSORS",
				"$STR_DISP_ARCMAP_WAYPOINTS",
				"$STR_DISP_ARCMAP_SYNCHRONIZE",
				"$STR_DISP_ARCMAP_MARKERS",
				"$STR_DISP_ARCMAP_MODULE"
			};
			rows=7;
			columns=1;
		};
		class Load: RscShortcutButton
		{
			idc=101;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.795)";
			y=0.51999998;
			w=0.20200001;
			text="$STR_DISP_ARCMAP_LOAD";
			shortcuts[]={38};
			toolTip="Ctrl+L";
			default=0;
			class TextPos
			{
				left=0.052000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class Save: Load
		{
			idc=102;
			y=0.60000002;
			text="$STR_DISP_ARCMAP_SAVE";
			shortcuts[]={31};
			toolTip="Ctrl+S";
		};
		class Merge: Load
		{
			idc=106;
			y=0.56;
			text="$STR_DISP_ARCMAP_MERGE";
			shortcuts[]={50};
			toolTip="Ctrl+M";
		};
		class Clear: Load
		{
			idc=103;
			y=0.63999999;
			text="$STR_DISP_ARCMAP_CLEAR";
			shortcuts[]={19};
			toolTip="Ctrl+R";
		};
		class Ids: Load
		{
			idc=111;
			y=0.72000003;
			text="$STR_CA_EDIT_IDS";
			toolTip="";
		};
		class Textures: Load
		{
			idc=112;
			y=0.75999999;
			text="$STR_CA_EDIT_TEXTURES";
			shortcuts[]={20};
			toolTip="Ctrl+T";
		};
		class Preview: Load
		{
			idc=107;
			default=1;
			y=0.83999997;
			text="$STR_DISP_ARCMAP_PREVIEW";
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			toolTip="Enter";
		};
		class Continue: Load
		{
			idc=108;
			y=0.88;
			shortcuts[]={18};
			toolTip="Ctrl+E";
			text="$STR_DISP_ARCMAP_CONTINUE";
		};
		class Cancel: Load
		{
			idc=2;
			y=0.92000002;
			text="$STR_DISP_ARCMAP_EXIT";
			toolTip="Esc";
		};
	};
};
class RscDisplayArcadeUnit
{
	idd=27;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.050000001;
			y=0.0098040001;
			w=0.89999998;
			h=0.98040003;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.057353001;
			y=0.019608;
			w=0.88529402;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Title;
		delete Background;
		delete TextSide;
		delete ValueSide;
		delete ValueFaction;
		delete TextFaction;
		delete TextRank;
		delete ValueRank;
		delete TextClass;
		delete ValueClass;
		delete TextVehicle;
		delete ValueVehicle;
		delete TextControl;
		delete ValueControl;
		delete TextSpecial;
		delete ValueSpecial;
		delete TextAge;
		delete ValueAge;
		delete TextText;
		delete ValueText;
		delete TextLock;
		delete ValueLock;
		delete TextSkill;
		delete ValueSkill;
		delete TextInit;
		delete ValueInit;
		delete TextDescription;
		delete ValueDescription;
		delete Azimut;
		delete TextAzimut;
		delete ValueAzimut;
		delete TextHealth;
		delete ValueHealth;
		delete TextFuel;
		delete ValueFuel;
		delete TextAmmo;
		delete ValueAmmo;
		delete TextPresence;
		delete ValuePresence;
		delete TextPresenceCondition;
		delete ValuePresenceCondition;
		delete TextPlacement;
		delete ValuePlacement;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=101;
			x=0.057353001;
			y=0.019608;
			w=0.870588;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="";
		};
		class CA_TextSide: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_SIDE";
		};
		class CA_ValueSide: RscCombo
		{
			idc=102;
			x=0.28419101;
			y=0.088235997;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextFaction: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.13235401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_FACTION";
		};
		class CA_ValueFaction: RscCombo
		{
			idc=123;
			x=0.28419101;
			y=0.13235401;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextRank: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.13235401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_RANK";
		};
		class CA_ValueRank: RscCombo
		{
			idc=104;
			x=0.723162;
			y=0.13235401;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextClass: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.17647199;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_CLASS";
		};
		class CA_ValueClass: RscCombo
		{
			idc=107;
			x=0.28419101;
			y=0.17647199;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextVehicle: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.17647199;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_VEHICLE";
		};
		class CA_ValueVehicle: RscCombo
		{
			idc=103;
			onLBSelChanged="";
			x=0.723162;
			y=0.17647199;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextControl: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.22059;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_CTRL";
		};
		class CA_ValueControl: RscCombo
		{
			idc=105;
			x=0.28419101;
			y=0.22059;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextSpecial: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.22059;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_SPECIAL";
		};
		class CA_ValueSpecial: RscCombo
		{
			idc=112;
			x=0.723162;
			y=0.22059;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextAge: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.26470801;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_AGE";
		};
		class CA_ValueAge: RscCombo
		{
			idc=113;
			x=0.28419101;
			y=0.26470801;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextText: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.26470801;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_TEXT";
		};
		class CA_ValueText_Background: RscPicture
		{
			x=0.723162;
			y=0.26470801;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueText: RscEdit
		{
			idc=118;
			x=0.723162;
			y=0.26470801;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextLock: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.308826;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_LOCK";
		};
		class CA_ValueLock: RscCombo
		{
			idc=119;
			x=0.28419101;
			y=0.308826;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextSkill: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.308826;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_SKILL";
		};
		class CA_ValueSkill: RscXSliderH
		{
			idc=121;
			x=0.723162;
			y=0.308826;
			w=0.21213201;
		};
		class CA_TextInit: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.36765;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_INIT";
		};
		class CA_ValueInit_Background: RscPicture
		{
			x=0.28419101;
			y=0.36765;
			w=0.65110302;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueInit: RscEdit
		{
			idc=120;
			x=0.28419101;
			y=0.36765;
			w=0.65110302;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_TextDescription: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.477945;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_DESC";
		};
		class CA_ValueDescription_Background: RscPicture
		{
			x=0.28419101;
			y=0.477945;
			w=0.65110302;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueDescription: RscEdit
		{
			idc=122;
			x=0.28419101;
			y=0.477945;
			w=0.65110302;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_Azimut: RscPicture
		{
			idc=114;
			text="\ca\ui\data\azimuth_ca.paa";
			x=0.833;
			y=0.543769;
			w=0.104;
			h=0.139;
		};
		class CA_ValueAzimut: RscEdit
		{
			idc=111;
			x=0.76200002;
			y=0.59696501;
			w=0.058823999;
			h=0.029412;
			sizeEx=0.029999999;
		};
		class CA_TextHealth: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.558828;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_HEALTH";
		};
		class CA_TextAzimut: RscText
		{
			x=0.71100003;
			y=0.558828;
			w=0.0845595;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_AZIMUT";
		};
		class CA_ValueHealth: RscXSliderH
		{
			idc=108;
			x=0.28419101;
			y=0.558828;
			w=0.36138201;
		};
		class CA_TextFuel: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.60294598;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_FUEL";
		};
		class CA_ValueFuel: RscXSliderH
		{
			idc=109;
			x=0.28419101;
			y=0.60294598;
			w=0.36138201;
		};
		class CA_TextAmmo: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.64706397;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_AMMO";
		};
		class CA_ValueAmmo: RscXSliderH
		{
			idc=110;
			x=0.28419101;
			y=0.64706397;
			w=0.36138201;
		};
		class CA_TextPresence: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.70588797;
			w=0.43161699;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_PRESENCE";
		};
		class CA_ValuePresence: RscXSliderH
		{
			idc=116;
			x=0.503676;
			y=0.70588797;
			w=0.43161699;
		};
		class CA_TextPresenceCondition: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.75000602;
			w=0.43161699;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_PRESENCE_COND";
		};
		class CA_ValuePresenceCondition_Bacground: RscPicture
		{
			x=0.503676;
			y=0.75000602;
			w=0.43161699;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValuePresenceCondition: RscEdit
		{
			idc=117;
			x=0.503676;
			y=0.75000602;
			w=0.43161699;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_TextPlacement: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.86030102;
			w=0.43161699;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_PLACE";
		};
		class CA_ValuePlacement_background: RscPicture
		{
			x=0.503676;
			y=0.86030102;
			w=0.43161699;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValuePlacement: RscEdit
		{
			idc=115;
			x=0.503676;
			y=0.86030102;
			w=0.43161699;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.56029099;
			y=0.901968;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.75514501;
			y=0.901968;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeModules
{
	idd=153;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.050000001;
			y=0.0098040001;
			w=0.89999998;
			h=0.68628001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.057353001;
			y=0.019608;
			w=0.88529402;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Title;
		delete Background;
		delete TextSide;
		delete ValueSide;
		delete ValueFaction;
		delete TextFaction;
		delete TextClass;
		delete ValueClass;
		delete TextVehicle;
		delete ValueVehicle;
		delete TextText;
		delete ValueText;
		delete TextInit;
		delete ValueInit;
		delete TextDescription;
		delete ValueDescription;
		delete TextPresence;
		delete ValuePresence;
		delete TextPresenceCondition;
		delete ValuePresenceCondition;
		delete TextPlacement;
		delete ValuePlacement;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=1003;
			x=0.057353001;
			y=0.019608;
			w=0.870588;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DN_MODULES";
		};
		class Dummy_Title_do_not_delete: RscText
		{
			idc=101;
			x=-5;
			y=-5;
		};
		class CA_ValueSide: RscCombo
		{
			idc=102;
			x=0.28235301;
			y=0.078432001;
			w=0.217647;
			sizeEx=0.029999999;
		};
		class CA_ValueFaction: RscCombo
		{
			idc=123;
			x=0.28235301;
			y=0.078432001;
			w=0.217647;
			sizeEx=0.029999999;
		};
		class CA_ValueClass: RscCombo
		{
			idc=107;
			x=0.28235301;
			y=0.078432001;
			w=0.217647;
			sizeEx=0.029999999;
		};
		class CA_TextVehicle: RscText
		{
			idc=-1;
			style=1;
			x=0.057353001;
			y=0.078432001;
			w=0.217647;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_VEHICLE";
		};
		class CA_ValueVehicle: RscCombo
		{
			idc=103;
			onLBSelChanged="";
			x=0.28235301;
			y=0.078432001;
			w=0.44264701;
			sizeEx=0.029999999;
		};
		class CA_TextText: RscText
		{
			idc=-1;
			style=1;
			x=0.057353001;
			y=0.12255;
			w=0.217647;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_TEXT";
		};
		class CA_ValueText_Background: RscPicture
		{
			x=0.28235301;
			y=0.12255;
			w=0.44264701;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueText: RscEdit
		{
			idc=118;
			x=0.28235301;
			y=0.12255;
			w=0.44264701;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextInit: RscText
		{
			idc=-1;
			style=1;
			x=0.057353001;
			y=0.166668;
			w=0.217647;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_INIT";
		};
		class CA_ValueInit_Background: RscPicture
		{
			x=0.28235301;
			y=0.166668;
			w=0.62264699;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueInit: RscEdit
		{
			idc=120;
			x=0.28235301;
			y=0.166668;
			w=0.62264699;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_TextDescription: RscText
		{
			idc=-1;
			style=1;
			x=0.057353001;
			y=0.276963;
			w=0.217647;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_DESC";
		};
		class CA_ValueDescription_Background: RscPicture
		{
			x=0.28235301;
			y=0.276963;
			w=0.62264699;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueDescription: RscEdit
		{
			idc=122;
			x=0.28235301;
			y=0.276963;
			w=0.62264699;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextPresence: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.37990499;
			w=0.34382299;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_PRESENCE";
		};
		class CA_ValuePresence: RscXSliderH
		{
			idc=116;
			x=0.28419101;
			y=0.424023;
			w=0.60720599;
		};
		class CA_TextPresenceCondition: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.46814099;
			w=0.34382299;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCUNIT_PRESENCE_COND";
		};
		class CA_ValuePresenceCondition_Bacground: RscPicture
		{
			x=0.28419101;
			y=0.51225901;
			w=0.60720599;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValuePresenceCondition: RscEdit
		{
			idc=117;
			x=0.28419101;
			y=0.51225901;
			w=0.60720599;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.56029099;
			y=0.60784799;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.75514501;
			y=0.60784799;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeGroup
{
	idd=40;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.268381;
			y=0.28462699;
			w=0.75999999;
			h=0.39216;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.27573401;
			y=0.294431;
			w=0.74529397;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete azimut;
		delete ValueAzimut;
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=-1;
			x=0.27573401;
			y=0.294431;
			w=0.73058802;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_ARCGRP_TITLE";
		};
		class CA_Azimut: RscPicture
		{
			idc=105;
			onMouseButtonUp="private [""_display"", ""_control""]; _display = ctrlParent (_this select 0); _control = _display displayctrl 104; ctrlSetFocus _control;";
			text="\ca\ui\data\azimuth_ca.paa";
			x=0.82038099;
			y=0.353627;
			w=0.14706001;
			h=0.19608;
		};
		class TextAzimut: RscText
		{
			x=0.74238002;
			y=0.353627;
			w=0.0845595;
			sizeEx=0.02674;
		};
		class CA_ValueAzimut: RscEdit
		{
			idc=104;
			x=0.74838102;
			y=0.434627;
			w=0.050000001;
			h=0.029412;
		};
		class TextSide: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.36305901;
			w=0.14023501;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCGRP_SIDE";
		};
		class ValueSide: RscCombo
		{
			idc=101;
			x=0.430675;
			y=0.36305901;
			w=0.280444;
			sizeEx=0.029999999;
		};
		class TextFaction: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.407177;
			w=0.14023501;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCGRP_FACTION";
		};
		class ValueFaction: RscCombo
		{
			idc=106;
			x=0.430675;
			y=0.407177;
			w=0.280444;
			sizeEx=0.029999999;
		};
		class TextType: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.45129499;
			w=0.14023501;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCGRP_TYPE";
		};
		class ValueType: RscCombo
		{
			idc=102;
			x=0.430675;
			y=0.45129499;
			w=0.280444;
			sizeEx=0.029999999;
		};
		class TextName: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.49541301;
			w=0.14023501;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCGRP_NAME";
		};
		class ValueName: RscCombo
		{
			idc=103;
			x=0.430675;
			y=0.49541301;
			w=0.280444;
			sizeEx=0.029999999;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.63867199;
			y=0.58855098;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.83352602;
			y=0.58855098;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeWaypoint
{
	idd=28;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.12;
			y=0.0098040001;
			w=0.89999998;
			h=0.98040003;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.127353;
			y=0.019608;
			w=0.88529402;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		delete ButtonEffects;
		class CA_Title: CA_Title
		{
			idc=101;
			x=0.127353;
			y=0.019608;
			w=0.870588;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="";
		};
		class TextType: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.088235997;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_TYPE";
		};
		class ValueType: RscCombo
		{
			idc=102;
			x=0.470079;
			y=0.088235997;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextSequence: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.13235401;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_SEQ";
		};
		class ValueSequence: RscCombo
		{
			idc=103;
			x=0.470079;
			y=0.13235401;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextDescription: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.17647199;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_DESC";
		};
		class ValueDescription_background: RscPicture
		{
			x=0.470079;
			y=0.17647199;
			w=0.53521401;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueDescription: RscEdit
		{
			idc=104;
			x=0.470079;
			y=0.17647199;
			w=0.53521401;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextCombatMode: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.22059;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_SEMAPHORE";
		};
		class ValueCombatMode: RscCombo
		{
			idc=105;
			x=0.470079;
			y=0.22059;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextFormation: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.26470801;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_FORM";
		};
		class ValueFormation: RscCombo
		{
			idc=106;
			x=0.470079;
			y=0.26470801;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextSpeed: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.308826;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_SPEED";
		};
		class ValueSpeed: RscCombo
		{
			idc=107;
			x=0.470079;
			y=0.308826;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextCombat: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.35294399;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_COMBAT";
		};
		class ValueCombat: RscCombo
		{
			idc=108;
			x=0.470079;
			y=0.35294399;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextPlacement: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.397062;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_PLACE";
		};
		class ValuePlacement_background: RscPicture
		{
			x=0.470079;
			y=0.397062;
			w=0.53521401;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValuePlacement: RscEdit
		{
			idc=109;
			x=0.470079;
			y=0.397062;
			w=0.53521401;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextPrecision: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.44117999;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_PRECISION";
		};
		class ValuePrecision_background: RscPicture
		{
			x=0.470079;
			y=0.44117999;
			w=0.53521401;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValuePrecision: RscEdit
		{
			idc=120;
			x=0.470079;
			y=0.44117999;
			w=0.53521401;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextHousePos: RscText
		{
			idc=115;
			style=1;
			x=0.13470601;
			y=0.48529801;
			w=0.32802001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_HOUSEPOS";
		};
		class ValueHousePos: RscCombo
		{
			idc=114;
			x=0.470079;
			y=0.48529801;
			w=0.53521401;
			sizeEx=0.029999999;
		};
		class TextTimeout: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.52941602;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_TIMEOUT";
		};
		class TextTimeoutMin: RscText
		{
			idc=-1;
			style=1;
			x=0.35419101;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_TIMEOUT_MIN";
		};
		class ValueTimeoutMin_background: RscPicture
		{
			x=0.463934;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueTimeoutMin: RscEdit
		{
			idc=111;
			x=0.463934;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextTimeoutMid: RscText
		{
			idc=-1;
			style=1;
			x=0.57367599;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_TIMEOUT_MID";
		};
		class ValueTimeoutMid_background: RscPicture
		{
			x=0.68341899;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueTimeoutMid: RscEdit
		{
			idc=113;
			x=0.68341899;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextTimeoutMax: RscText
		{
			idc=-1;
			style=1;
			x=0.79316199;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_TIMEOUT_MAX";
		};
		class ValueTimeoutMax_background: RscPicture
		{
			x=0.90290397;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueTimeoutMax: RscEdit
		{
			idc=112;
			x=0.90290397;
			y=0.52941602;
			w=0.10239;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextExpCond: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.57353401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_EXPCOND";
		};
		class ValueExpCond_background: RscPicture
		{
			x=0.35419101;
			y=0.57353401;
			w=0.65110302;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueExpCond: RscEdit
		{
			idc=118;
			x=0.35419101;
			y=0.57353401;
			w=0.65110302;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class TextExpActiv: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.68382901;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_EXPACTIV";
		};
		class ValueExpActiv_background: RscPicture
		{
			x=0.35419101;
			y=0.68382901;
			w=0.65110302;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueExpActiv: RscEdit
		{
			idc=116;
			x=0.35419101;
			y=0.68382901;
			w=0.65110302;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class TextExpScript: RscText
		{
			idc=-1;
			style=1;
			x=0.13470601;
			y=0.79412401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCWP_SCRIPT";
		};
		class ValueExpScript_Background: RscPicture
		{
			x=0.35419101;
			y=0.79412401;
			w=0.65110302;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueExpScript: RscEdit
		{
			idc=119;
			x=0.35419101;
			y=0.79412401;
			w=0.65110302;
			h=0.029412;
			style="0x00 + 0x40";
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
			autocomplete="scripting";
		};
		class Show: RscToolbox
		{
			idc=117;
			x=0.13470601;
			y=0.83824199;
			w=0.870588;
			h=0.039216001;
			strings[]=
			{
				"$STR_DISP_ARCWP_SHOW_NEVER",
				"$STR_DISP_ARCWP_SHOW_EASY",
				"$STR_DISP_ARCWP_SHOW_ALWAYS"
			};
			rows=1;
			columns=3;
		};
		class CA_ButtonEffects: RscShortcutButton
		{
			idc=110;
			x=0.127353;
			y=0.901968;
			text="$STR_DISP_ARCWP_EFFECTS";
			default=0;
			class ShortcutPos
			{
				left=-0.0049999999;
				top=0.026000001;
				w=0.039215699;
				h=0.052287601;
			};
			class TextPos
			{
				left=0.059999999;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.63029099;
			y=0.901968;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.82514501;
			y=0.901968;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeMarker
{
	idd=45;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.194851;
			y=0.20972399;
			w=0.75999999;
			h=0.450984;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.20220301;
			y=0.219528;
			w=0.74529397;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete ValueA;
		delete ValueB;
		delete ValueAngle;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=101;
			x=0.20220301;
			y=0.219528;
			w=0.73058802;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="";
		};
		class TextName: RscText
		{
			idc=-1;
			style=1;
			x=0.209557;
			y=0.288156;
			w=0.27454001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_NAME";
		};
		class ValueName_background: RscPicture
		{
			x=0.49145001;
			y=0.288156;
			w=0.44869399;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueName: RscEdit
		{
			idc=102;
			x=0.49145001;
			y=0.288156;
			w=0.44869399;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class Marker: RscToolbox
		{
			idc=103;
			x=0.209557;
			y=0.35433301;
			w=0.73058802;
			h=0.039216001;
			strings[]=
			{
				"$STR_DISP_ARCMARK_ICON",
				"$STR_DISP_ARCMARK_RECT",
				"$STR_DISP_ARCMARK_ELLIPSE"
			};
			rows=1;
			columns=3;
		};
		class TextColorName: RscText
		{
			idc=-1;
			style=1;
			x=0.209557;
			y=0.42050999;
			w=0.177132;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_COLOR";
		};
		class ValueColorName: RscCombo
		{
			idc=105;
			x=0.39404199;
			y=0.42050999;
			w=0.177132;
			sizeEx=0.029999999;
		};
		class TextType: RscText
		{
			idc=109;
			style=1;
			x=0.57852697;
			y=0.42050999;
			w=0.177132;
			h=0.029412;
			sizeEx=0.029999999;
			text="";
		};
		class ValueIcon: RscCombo
		{
			idc=104;
			x=0.76301199;
			y=0.42050999;
			w=0.177132;
			sizeEx=0.029999999;
		};
		class ValueFill: RscCombo
		{
			idc=110;
			x=0.76301199;
			y=0.42050999;
			w=0.177132;
			sizeEx=0.029999999;
		};
		class TextA: RscText
		{
			idc=-1;
			style=1;
			x=0.209557;
			y=0.46462801;
			w=0.16458701;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_A";
		};
		class ValueA_background: RscPicture
		{
			x=0.381497;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueA: RscEdit
		{
			idc=106;
			x=0.381497;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextB: RscText
		{
			idc=-1;
			style=1;
			x=0.455291;
			y=0.46462801;
			w=0.16458701;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_B";
		};
		class ValueB_background: RscPicture
		{
			x=0.627231;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueB: RscEdit
		{
			idc=107;
			x=0.627231;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextAngle: RscText
		{
			idc=-1;
			style=1;
			x=0.70102501;
			y=0.46462801;
			w=0.16458701;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_ANGLE";
		};
		class ValueAngle_background: RscPicture
		{
			x=0.873703;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueAngle: RscEdit
		{
			idc=108;
			x=0.873703;
			y=0.46462801;
			w=0.066441096;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextText: RscText
		{
			idc=-1;
			style=1;
			x=0.209557;
			y=0.50874603;
			w=0.27454001;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCMARK_TEXT";
		};
		class ValueText_background: RscPicture
		{
			x=0.49145001;
			y=0.50874603;
			w=0.44869399;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueText: RscEdit
		{
			idc=111;
			x=0.49145001;
			y=0.50874603;
			w=0.44869399;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.56514102;
			y=0.57247198;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.759996;
			y=0.57247198;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeSensor
{
	idd=41;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.050000001;
			y=0.0098040001;
			w=0.89999998;
			h=0.98040003;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.057353001;
			y=0.019608;
			w=0.88529402;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonEffects;
		delete TextA;
		delete TextB;
		delete ValueB;
		delete ValueA;
		delete TextAngle;
		delete ValueAngle;
		delete TextActivation;
		delete ValueActivation;
		delete TextTimeoutMin;
		delete ValueTimeoutMin;
		delete TextTimeoutMax;
		delete ValueTimeoutMax;
		delete TextTimeoutMid;
		delete ValueTimeoutMid;
		delete TextType;
		delete ValueType;
		delete TextName;
		delete ValueName;
		delete TextText;
		delete ValueText;
		delete TextExpCond;
		delete ValueExpCond;
		delete TextExpActiv;
		delete ValueExpActiv;
		delete TextExpDesactiv;
		delete ValueExpDesactiv;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=101;
			x=0.057353001;
			y=0.019608;
			w=0.870588;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TITLE";
		};
		class CA_TextA: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_A";
		};
		class CA_ValueA_background: RscPicture
		{
			x=0.28419101;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueA: RscEdit
		{
			idc=102;
			x=0.28419101;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextB: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_B";
		};
		class CA_ValueB_background: RscPicture
		{
			x=0.723162;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueB: RscEdit
		{
			idc=103;
			x=0.723162;
			y=0.088235997;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextAngle: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.13235401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_ANGLE";
		};
		class CA_ValueAngle_background: RscPicture
		{
			x=0.28419101;
			y=0.13235401;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueAngle: RscEdit
		{
			idc=104;
			x=0.28419101;
			y=0.13235401;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class Rectangular: RscToolbox
		{
			idc=120;
			x=0.503676;
			y=0.127452;
			h=0.039216001;
		};
		class CA_TextActivation: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.201472;
			w=0.22091199;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_ACTIV";
		};
		class CA_ValueActivation: RscCombo
		{
			idc=105;
			x=0.28419101;
			y=0.201472;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class Repeating: RscToolbox
		{
			x=0.503676;
			y=0.19656999;
			h=0.039216001;
		};
		class Presence: RscToolbox
		{
			x=0.064705998;
			y=0.25539401;
			h=0.117648;
			w=0.870588;
			rows=3;
			columns=2;
		};
		class Interruptable: RscToolbox
		{
			x=0.064705998;
			y=0.358336;
			w=0.43161699;
			h=0.039216001;
			rows=1;
			columns=2;
		};
		class CA_TextTimeoutMin: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TIMEOUT_MIN";
		};
		class CA_ValueTimeoutMin_background: RscPicture
		{
			x=0.21102899;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueTimeoutMin: RscEdit
		{
			idc=109;
			x=0.21102899;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextTimeoutMid: RscText
		{
			idc=-1;
			style=1;
			x=0.357353;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TIMEOUT_MID";
		};
		class CA_ValueTimeoutMid_background: RscPicture
		{
			x=0.503676;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueTimeoutMid: RscEdit
		{
			idc=111;
			x=0.503676;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextTimeoutMax: RscText
		{
			idc=-1;
			style=1;
			x=0.64999998;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TIMEOUT_MAX";
		};
		class CA_ValueTimeoutMax_background: RscPicture
		{
			x=0.796323;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueTimeoutMax: RscEdit
		{
			idc=110;
			x=0.796323;
			y=0.40735599;
			w=0.138971;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextType: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.49618;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TYPE";
		};
		class CA_ValueType: RscCombo
		{
			idc=112;
			x=0.28419101;
			y=0.49618;
			w=0.21213201;
			sizeEx=0.029999999;
		};
		class CA_TextName: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_NAME";
		};
		class ValueName_background: RscPicture
		{
			x=0.28419101;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueName: RscEdit
		{
			idc=121;
			x=0.28419101;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextText: RscText
		{
			idc=-1;
			style=1;
			x=0.503676;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_TEXT";
		};
		class CA_ValueText_background: RscPicture
		{
			x=0.723162;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueText: RscEdit
		{
			idc=114;
			x=0.723162;
			y=0.54029799;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextExpCond: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.60941601;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_EXPCOND";
		};
		class CA_ValueExpCond_Background: RscPicture
		{
			x=0.28419101;
			y=0.60941601;
			w=0.65110302;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueExpCond: RscEdit
		{
			idc=117;
			x=0.28419101;
			y=0.60941601;
			w=0.65110302;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_TextExpActiv: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.71971101;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_EXPACTIV";
		};
		class CA_ValueExpActiv_Background: RscPicture
		{
			x=0.28419101;
			y=0.71971101;
			w=0.65110302;
			h=0.09804;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueExpActiv: RscEdit
		{
			idc=118;
			x=0.28419101;
			y=0.71971101;
			w=0.65110302;
			h=0.09804;
			style=16;
			text="$STR_DISP_ERROR";
			sizeEx=0.029999999;
			autocomplete="scripting";
		};
		class CA_TextExpDesactiv: RscText
		{
			idc=-1;
			style=1;
			x=0.064705998;
			y=0.830006;
			w=0.21213201;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCSENS_EXPDESACTIV";
		};
		class CA_ValueExpDesactiv_Background: RscPicture
		{
			x=0.28419101;
			y=0.830006;
			w=0.65110302;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueExpDesactiv: RscEdit
		{
			idc=119;
			x=0.28419101;
			y=0.830006;
			w=0.65110302;
			h=0.029412;
			style="0x00 + 0x40";
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
			autocomplete="scripting";
		};
		class CA_ButtonEffects: RscShortcutButton
		{
			idc=116;
			x=0.057353001;
			y=0.901968;
			text="$STR_DISP_ARCSENS_EFFECTS";
			default=0;
			class ShortcutPos
			{
				left=-0.0049999999;
				top=0.026000001;
				w=0.039215699;
				h=0.052287601;
			};
			class TextPos
			{
				left=0.059999999;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.56029099;
			y=0.901968;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.75514501;
			y=0.901968;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayArcadeEffects
{
	idd=44;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.224263;
			y=0.074899502;
			w=0.55147499;
			h=0.80392802;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.23161501;
			y=0.084703498;
			w=0.53676897;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ValueTitleText;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=-1;
			x=0.23161501;
			y=0.084703498;
			w=0.52206302;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_TITLE";
		};
		class Condition_Background: RscPicture
		{
			x=0.30144;
			y=0.153331;
			w=0.39712101;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class Condition: RscEdit
		{
			idc=113;
			x=0.30144;
			y=0.153331;
			w=0.39712101;
			h=0.029412;
			style="0x00 + 0x40";
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
			autocomplete="scripting";
		};
		class TextSound: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.197449;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_SOUND_ANON";
		};
		class ValueSound: RscCombo
		{
			idc=103;
			x=0.44120499;
			y=0.197449;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextVoice: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.241567;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_VOICE";
		};
		class ValueVoice: RscCombo
		{
			idc=104;
			x=0.44120499;
			y=0.241567;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextSoundEnv: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.285685;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_SOUND_ENV";
		};
		class ValueSoundEnv: RscCombo
		{
			idc=105;
			x=0.44120499;
			y=0.285685;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextSoundDet: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.32980299;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_SOUND_DET";
		};
		class ValueSoundDet: RscCombo
		{
			idc=106;
			x=0.44120499;
			y=0.32980299;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextMusic: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.37392101;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_TRACK";
		};
		class ValueMusic: RscCombo
		{
			idc=107;
			x=0.44120499;
			y=0.37392101;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextTitleType: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.41803899;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_TITTYPE";
		};
		class ValueTitleType: RscCombo
		{
			idc=108;
			x=0.44120499;
			y=0.41803899;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextTitleEffect: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.46215701;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_TITEFF";
		};
		class ValueTitleEffect: RscCombo
		{
			idc=109;
			x=0.44120499;
			y=0.46215701;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class TextTitle: RscText
		{
			idc=114;
			style=1;
			x=0.238969;
			y=0.46215701;
			w=0.194884;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ARCEFF_TITTEXT";
		};
		class ValueTitleRes: RscCombo
		{
			idc=111;
			x=0.44120499;
			y=0.46215701;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class ValueTitleObj: RscCombo
		{
			idc=112;
			x=0.44120499;
			y=0.46215701;
			w=0.257355;
			sizeEx=0.029999999;
		};
		class ValueTitleText_background: RscPicture
		{
			x=0.44120499;
			y=0.506275;
			w=0.257355;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueTitleText: RscEdit
		{
			idc=110;
			x=0.44120499;
			y=0.506275;
			w=0.257355;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.38602901;
			y=0.790591;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.58088303;
			y=0.790591;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayTemplateSave
{
	idd=29;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.268381;
			y=0.303352;
			w=0.46323901;
			h=0.27451199;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.27573401;
			y=0.31315601;
			w=0.448533;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=-1;
			x=0.27573401;
			y=0.31315601;
			w=0.43382701;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_SAVE";
		};
		class TextName: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.38178399;
			w=0.16117799;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_NAME";
		};
		class ValueName_background: RscPicture
		{
			x=0.451617;
			y=0.38178399;
			w=0.26529601;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class ValueName: RscEdit
		{
			idc=101;
			x=0.451617;
			y=0.38178399;
			w=0.26529601;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class TextMode: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.42590201;
			w=0.16117799;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_MODE";
		};
		class ValueMode: RscCombo
		{
			idc=103;
			x=0.451617;
			y=0.42590201;
			w=0.26529601;
			sizeEx=0.029999999;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.34191;
			y=0.48962799;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.53676498;
			y=0.48962799;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayTemplateLoad
{
	idd=30;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.268381;
			y=0.303352;
			w=0.46323901;
			h=0.27451199;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.27573401;
			y=0.31315601;
			w=0.448533;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_Title: CA_Title
		{
			idc=102;
			x=0.27573401;
			y=0.31315601;
			w=0.43382701;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_LOAD";
		};
		class TextIsland: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.38178399;
			w=0.16117799;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_ISLAND";
		};
		class ValueIsland: RscCombo
		{
			idc=104;
			x=0.451617;
			y=0.38178399;
			w=0.26529601;
			sizeEx=0.029999999;
		};
		class TextName: RscText
		{
			idc=-1;
			style=1;
			x=0.28308699;
			y=0.42590201;
			w=0.16117799;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_TEMPL_NAME";
		};
		class ValueName: RscCombo
		{
			idc=101;
			x=0.451617;
			y=0.42590201;
			w=0.26529601;
			sizeEx=0.029999999;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.34191;
			y=0.48962799;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.53676498;
			y=0.48962799;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplayIntel
{
	idd=32;
	movingEnable=1;
	access=0;
	class controlsBackground
	{
		class CA_Background: RscPicture
		{
			x=0.224263;
			y=0.0337031;
			w=0.81999999;
			h=0.98040003;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.1961,0.1451,0.094099998,0.75};
		};
		class Blackback: RscPicture
		{
			x="SafeZoneXAbs-SafeZoneWAbs*2";
			y="SafeZoneY-SafeZoneH";
			w="SafeZoneWAbs*6";
			h="SafeZoneH*3";
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.40000001};
		};
		class CA_Title_Background: CA_Title_Back
		{
			x=0.23161501;
			y=0.043507099;
			w=0.80529398;
			h=0.039216001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colorText[]={0,0,0,0.60000002};
			moving=1;
		};
	};
	class controls
	{
		delete TextBriefingName;
		delete ValueBriefingName;
		delete TextBriefingDescription;
		delete ValueBriefingDescription;
		delete TextDate;
		delete ValueMonth;
		delete ValueYear;
		delete ValueDay;
		delete TextTime;
		delete ValueHour;
		delete ValueMinute;
		delete TextWeather;
		delete ValueWeather;
		delete Editor_Overcast1;
		delete Editor_Clear1;
		delete TextFog;
		delete Editor_Slider1;
		delete ValueFog;
		delete TextForecasted;
		delete ValueWeatherForecast;
		delete Editor_Overcast2;
		delete Editor_Clear2;
		delete TextForecastedFog;
		delete Editor_Slider2;
		delete ValueFogForecast;
		delete TextRestanceStance;
		delete ValueResistance;
		delete ButtonOK;
		delete ButtonCancel;
		delete Background;
		delete Title;
		class CA_Title: CA_Title
		{
			idc=-1;
			x=0.23161501;
			y=0.043507099;
			w=0.79058802;
			h=0.039216001;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_TITLE";
		};
		class CA_TextBriefingName: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.112135;
			w=0.192132;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_NAME";
		};
		class CA_ValueBriefingName_background: RscPicture
		{
			x=0.438454;
			y=0.112135;
			w=0.59110302;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueBriefingName: RscEdit
		{
			idc=106;
			x=0.438454;
			y=0.112135;
			w=0.59110302;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextBriefingDescription: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.156253;
			w=0.192132;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_DESC";
		};
		class CA_ValueBriefingDescription_background: RscPicture
		{
			x=0.438454;
			y=0.156253;
			w=0.59110302;
			h=0.029412;
			text="#(argb,8,8,3)color(0,0,0,1)";
			colortext[]={1,1,1,0.60000002};
		};
		class CA_ValueBriefingDescription: RscEdit
		{
			idc=107;
			x=0.438454;
			y=0.156253;
			w=0.59110302;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_ERROR";
		};
		class CA_TextDate: RscText
		{
			idc=-1;
			style=1;
			x=0.238969;
			y=0.244489;
			w=0.092389598;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_DATE";
		};
		class CA_ValueMonth: RscCombo
		{
			idc=102;
			x=0.33871099;
			y=0.244489;
			w=0.092389598;
			sizeEx=0.029999999;
		};
		class CA_ValueDay: RscCombo
		{
			idc=103;
			x=0.438454;
			y=0.244489;
			w=0.092389598;
			sizeEx=0.029999999;
		};
		class CA_ValueYear: CA_ValueDay
		{
			idc=112;
			from=1985;
			to=2020;
			x=0.53819603;
		};
		class CA_TextTime: RscText
		{
			idc=-1;
			style=1;
			x=0.73768198;
			y=0.244489;
			w=0.092389598;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_TIME";
		};
		class CA_ValueHour: RscCombo
		{
			idc=104;
			x=0.83742398;
			y=0.244489;
			w=0.092389598;
			sizeEx=0.029999999;
		};
		class CA_ValueMinute: RscCombo
		{
			idc=105;
			x=0.93716699;
			y=0.244489;
			w=0.092389598;
			sizeEx=0.029999999;
		};
		class CA_TextWeather: RscText
		{
			idc=-1;
			style=0;
			x=0.238969;
			y=0.33272499;
			w=0.23202901;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_EDIT_WEATHER";
		};
		class CA_ValueWeather: RscXSliderH
		{
			idc=108;
			x=0.238969;
			y=0.37684301;
			w=0.79058802;
		};
		class CA_Editor_Overcast1: RscPictureKeepAspect
		{
			x=0.25492701;
			y=0.398902;
			w=0.039216001;
			h=0.039216001;
			text="\ca\ui\data\editor_bourka.paa";
			colorText[]={0,0,0,1};
		};
		class CA_Editor_Clear1: CA_Editor_Overcast1
		{
			x=0.95711499;
			y=0.398902;
			text="\ca\ui\data\editor_jasno.paa";
			colorText[]={0,0,0,1};
		};
		class CA_TextFog: RscText
		{
			idc=-1;
			style=0;
			x=0.238969;
			y=0.46507901;
			w=0.23202901;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_EDIT_FOG";
		};
		class CA_Editor_Slider1: RscPictureKeepAspect
		{
			x=0.27886599;
			y=0.509197;
			w=0.486;
			h=0.021;
			colorText[]={1,1,1,0.60000002};
			text="\ca\ui\data\slider_back.paa";
		};
		class CA_ValueFog: RscXSliderH
		{
			idc=109;
			x=0.238969;
			y=0.509197;
			w=0.79058802;
		};
		class CA_TextForecasted: RscText
		{
			idc=-1;
			style=0;
			x=0.238969;
			y=0.59743297;
			w=0.23202901;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_EDIT_FORECAST";
		};
		class CA_ValueWeatherForecast: RscXSliderH
		{
			idc=110;
			x=0.238969;
			y=0.64155102;
			w=0.79058802;
		};
		class CA_Editor_Overcast2: CA_Editor_Overcast1
		{
			x=0.25492701;
			y=0.66360998;
			text="\ca\ui\data\editor_bourka.paa";
			colorText[]={0,0,0,1};
		};
		class CA_Editor_Clear2: CA_Editor_Overcast1
		{
			x=0.95711499;
			y=0.66360998;
			text="\ca\ui\data\editor_jasno.paa";
			colorText[]={0,0,0,1};
		};
		class CA_TextForecastedFog: RscText
		{
			idc=-1;
			style=0;
			x=0.238969;
			y=0.72978699;
			w=0.23202901;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_EDIT_FOGFORECAST";
		};
		class CA_Editor_Slider2: RscPictureKeepAspect
		{
			x=0.27886599;
			y=0.77390498;
			w=0.486;
			h=0.021;
			colorText[]={1,1,1,0.60000002};
			text="\ca\ui\data\slider_back.paa";
		};
		class CA_ValueFogForecast: RscXSliderH
		{
			idc=111;
			x=0.238969;
			y=0.77390498;
			w=0.79058802;
		};
		class CA_TextRestanceStance: RscText
		{
			idc=-1;
			style=0;
			x=0.238969;
			y=0.86214101;
			w=0.31182301;
			h=0.029412;
			sizeEx=0.029999999;
			text="$STR_DISP_INTEL_EDIT_GUERILLA";
		};
		class CA_ValueResistance: RscToolbox
		{
			idc=101;
			x=0.238969;
			y=0.906259;
			w=0.79058802;
			h=0.039216001;
			strings[]=
			{
				"$STR_DISP_INTEL_NONE_FRIENDLY",
				"$STR_DISP_INTEL_WEST_FRIENDLY",
				"$STR_DISP_INTEL_EAST_FRIENDLY",
				"$STR_DISP_INTEL_BOTH_FRIENDLY"
			};
			rows=1;
			columns=4;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			x=0.65455401;
			y=0.92586702;
			text="$STR_DISP_OK";
			default=1;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.84940797;
			y=0.92586702;
			text="$STR_DISP_CANCEL";
			default=0;
			class TextPos
			{
				left=0.050000001;
				top=0.034000002;
				right=0.0049999999;
				bottom=0.0049999999;
			};
		};
	};
};
class RscDisplaySelectProfile: RscStandardDisplay
{
	class controls
	{
		class TxtControls: RscText
		{
			text="$STR_CA_PROFILE_CONTROLS";
		};
		class TxtDifficulty: TxtControls
		{
			text="$STR_CA_DIFFICULTY";
		};
	};
};
class RscDisplayXWizardTemplate: RscStandardDisplay
{
	west="ca\ui\data\flag_bluefor_ca.paa";
	east="ca\ui\data\flag_opfor_ca.paa";
	guer="ca\ui\data\flag_indep_ca.paa";
	civl="ca\ui\data\flag_civil_ca.paa";
	movingEnable=0;
	enableSimulation=1;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1103;
			x=0.185;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizardtemplate_background_ca.paa";
		};
	};
	class controls
	{
		delete title;
		delete TemplateText;
		delete B_OK;
		delete B_Cancel;
		class TemplateText_CA: CA_Title
		{
			x=0.23;
			y=0.192;
			text="$STR_DISP_MPW_TEMPLATE";
		};
		class TemplateValue: RscListBox
		{
			idc=101;
			x=0.2;
			y=0.27103001;
			w=0.33199999;
			h=0.48300001;
			rowHeight=0.043909099;
		};
		class Overview: RscHTML
		{
			idc=102;
			x=0.60500002;
			y=0.27103001;
			w=0.38999999;
			h=0.48699999;
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class OK_Text: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.80000001;
			y=0.76249999;
			default=1;
		};
		class Camp_B_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.60000002;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayXWizardIntel: RscStandardDisplay
{
	movingEnable=0;
	enableSimulation=1;
	enableDisplay=1;
	textureClear="\ca\ui\data\Editor_jasno.paa";
	textureCloudly="\ca\ui\data\Editor_polojasno.paa";
	textureOvercast="\ca\ui\data\Editor_zatazeno.paa";
	textureRainy="\ca\ui\data\Editor_destivo.paa";
	textureStormy="\ca\ui\data\Editor_bourka.paa";
	onUnload="UI_dialogReferer = ""RscDisplayXWizardIntel"";";
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete Title;
		delete SumaTemplateValue;
		delete Island;
		delete Name;
		delete Map;
		delete Time;
		delete Weather;
		delete Params;
		delete Unit;
		delete Timetext;
		delete TimeValue;
		delete DateText;
		delete DateValue;
		delete WeatherForecastText;
		delete WeatherForecastValue;
		delete WeatherCurrentValue;
		delete WeatherCurrentText;
		delete IslandText;
		delete IslandValue;
		delete NameValue;
		delete NameText;
		class Title_CA: CA_Title
		{
			idc=1106;
			x=0.079999998;
			y=0.192;
			text="$STR_XBOX_WIZARD_EDIT";
		};
		class TemplateThumbnail: RscPicture
		{
			idc=1107;
			x=0.47999999;
			y=0.27294099;
			w="0.3137255*1.2";
			h="0.2091503*1.2";
			text="\ca\ui\data\template_thumb_ca.paa";
		};
		class CA_SumaTemplateValue: CA_Title
		{
			idc=107;
			style=1;
			x=0.050000001;
			y=0.192;
			w=0.88;
		};
		class Name_CA: RscShortcutButton
		{
			idc=101;
			x=0.056000002;
			y=0.245;
			w=0.315;
			default=1;
			text="$STR_DISP_XBOX_EDIT_PROFILE_NAME";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class Island_CA: RscShortcutButton
		{
			idc=102;
			x=0.056000002;
			y=0.315;
			w=0.315;
			default=0;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_ISLAND";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class Unit_CA: RscShortcutButton
		{
			idc=111;
			x=0.056000002;
			y=0.38499999;
			w=0.315;
			default=0;
			text="$STR_DISP_SRVSETUP_UNITS";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class Weather_CA: RscShortcutButton
		{
			idc=103;
			x=0.056000002;
			y=0.45500001;
			w=0.315;
			default=0;
			text="$STR_DISP_INTEL_WEATHER";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class Time_CA: RscShortcutButton
		{
			idc=104;
			x=0.056000002;
			y=0.52499998;
			w=0.315;
			default=0;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_TITLE";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_Params: RscShortcutButton
		{
			idc=114;
			x=0.056000002;
			y=0.59500003;
			w=0.315;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_PARAMS";
		};
		class Map_CA: RscShortcutButton
		{
			idc=112;
			x=0.056000002;
			y=0.66500002;
			w=0.315;
			default=0;
			text="$STR_DISP_EDIT";
			class KeyHints
			{
				class A
				{
					key="0x00050000 + 0";
					hint="";
				};
			};
		};
		class CA_NameText: RscText
		{
			idc=1114;
			x=0.419121;
			y=0.51348299;
			w=0.31617901;
			h=0.039216001;
			text="$STR_DISP_GAME_NAME";
		};
		class CA_NameValue: CA_NameText
		{
			idc=105;
			x=0.54330498;
			y=0.51348299;
		};
		class CA_IslandText: CA_NameText
		{
			idc=1115;
			x=0.419121;
			y=0.57394099;
			text="$STR_DISP_XBOX_MULTI_ISLAND";
		};
		class CA_IslandValue: CA_IslandText
		{
			idc=108;
			x=0.54330498;
		};
		class CA_WeatherCurrentText: CA_IslandText
		{
			idc=1118;
			x=0.419121;
			y=0.634399;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_WEATHER_SUMA_CURRENT";
		};
		class CA_WeatherCurrentValue: RscPicture
		{
			idc=109;
			x=0.61765301;
			y=0.62949699;
			w=0.050000001;
			h=0.050000001;
		};
		class CA_WeatherForecastText: CA_IslandText
		{
			idc=1119;
			x=0.67729098;
			y=0.634399;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_WEATHER_SUMA_FORECAST";
		};
		class CA_WeatherForecastValue: CA_WeatherCurrentValue
		{
			idc=110;
			x=0.881823;
			y=0.62949699;
			text="";
		};
		class CA_DateText: CA_NameText
		{
			idc=1117;
			x=0.419121;
			y=0.694857;
			text="$STR_DISP_INTEL_DATE";
		};
		class CA_DateValue: CA_DateText
		{
			idc=113;
			x=0.54330498;
			y=0.694857;
			text="";
		};
		class CA_TimeText: CA_DateText
		{
			idc=1116;
			x=0.72140902;
			y=0.694857;
			text="$STR_DISP_INTEL_TIME";
		};
		class CA_TimeValue: CA_DateText
		{
			idc=106;
			x=0.82925302;
			y=0.694857;
			text="";
		};
		class HintX_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.55147499;
			y=0.78100002;
			text="$STR_DISP_CONTINUE";
			default=1;
		};
		class CA_ButtonPreview: RscShortcutButton
		{
			idc=1;
			x=0.76200002;
			y=0.76249999;
			shortcuts[]=
			{
				"0x00050000 + 8"
			};
			default=1;
			text="$STR_DISP_ARCMAP_PREVIEW";
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayXWizardParams: RscStandardDisplay
{
	idd=146;
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class IslandWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete LB_ParamsTitles;
		delete B_OK;
		delete B_Edit;
		class CA_Title: CA_Title
		{
			x=0.134;
			y=0.192;
			text="$STR_WF_PARAMETERS";
		};
		class CA_LB_ParamsTitles: RscListBox
		{
			idc=102;
			x=0.102;
			y=0.27103001;
			w=0.38999999;
			h=0.48300001;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			default=1;
			text="$STR_DISP_BACK";
		};
		class CA_B_Edit: RscShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.76200002;
			y=0.76249999;
			text="$STR_DISP_EDIT";
		};
	};
};
class RscDisplayXWizardParameter: RscStandardDisplay
{
	idd=147;
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.30000001};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class MainWizardBack2: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
		class UnitSelectCustomWizardBack: RscPicture
		{
			idc=1106;
			x=0.134;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_customunits_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete B_Cancel;
		delete B_OK;
		class CA_Title: CA_Title
		{
			idc=105;
			x=0.17050999;
			y=0.192;
		};
		class LB_ParamsTitles: RscListBox
		{
			idc=103;
			x=0.184;
			y=0.27103001;
			w=0.27900001;
			h=0.35499999;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.75515002;
			y=0.76249999;
			default=1;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayXWizardUnit: RscStandardDisplay
{
	west="ca\ui\data\flag_bluefor_ca.paa";
	east="ca\ui\data\flag_opfor_ca.paa";
	guer="ca\ui\data\flag_indep_ca.paa";
	civl="ca\ui\data\flag_civil_ca.paa";
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class NameWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete UnitText;
		delete UnitValue;
		delete B_OK;
		delete B_Cancel;
		class Title_CA: CA_Title
		{
			x=0.126;
			y=0.192;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_CHOOSE";
		};
		class CA_UnitText: RscText
		{
			x=0.1;
			y=0.27000001;
			text="$STR_DISP_ARCUNIT_VEHICLE";
		};
		class CA_UnitValue: RscListBox
		{
			idc=101;
			x=0.1;
			y=0.315;
			w=0.85000002;
			h=0.44999999;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.76200002;
			y=0.76249999;
			text="$STR_DISP_EDIT";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayXWizardUnitSelect: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class MainWizardBack2: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
		class NameWizardBack: RscPicture
		{
			idc=1104;
			x=0.13;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_CANCEL;
		delete UnitText;
		delete UnitValue;
		delete Title;
		class CA_SelectUnit_Title: CA_Title
		{
			idc=102;
			x=0.126;
			y=0.192;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_SELECT";
		};
		class CA_UnitText: RscText
		{
			x=0.153;
			y=0.26100001;
			text="$STR_MM_UNITS";
		};
		class CA_UnitValue: RscListBox
		{
			idc=101;
			x=0.153;
			y=0.30700001;
			w=0.77700001;
			h=0.43000001;
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.74396002;
			y=0.755;
			text="$STR_DISP_OK";
		};
		class CA_B_Back: RscShortcutButton
		{
			idc=2;
			x=0.1511503;
			y=0.755;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayXWizardUnitSelectCustom: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.30000001};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class MainWizardBack2: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
		class UnitSelectCustomWizardBack: RscPicture
		{
			idc=1106;
			x=0.134;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_customunits_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete ButtonCount;
		delete TitleCount;
		delete ButtonType;
		delete TitleType;
		delete ButtonClass;
		delete TitleClass;
		delete Title;
		class CA_Title: CA_Title
		{
			idc=105;
			x=0.17050999;
			y=0.192;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_SELECT";
		};
		class CA_TitleClass: RscText
		{
			x=0.17900001;
			y=0.29699999;
			w=0.27206099;
			text="$STR_DISP_ARCUNIT_CLASS";
		};
		class CA_LbClass: RscListBox
		{
			idc=101;
			x=0.17900001;
			y=0.34999999;
			w=0.27900001;
			h=0.35499999;
			wholeHeight=0.40000001;
		};
		class CA_TitleType: RscText
		{
			x=0.49000001;
			y=0.29699999;
			w=0.27206099;
			text="$STR_DISP_ARCGRP_TYPE";
		};
		class CA_lbType: CA_LbClass
		{
			idc=102;
			x=0.49000001;
			y=0.34999999;
			w=0.27900001;
			h=0.35499999;
		};
		class CA_TitleCount: RscText
		{
			x=0.801;
			y=0.29699999;
			w=0.27206099;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_COUNT";
		};
		class CA_LbCount: CA_LbClass
		{
			idc=103;
			x=0.801;
			y=0.34999999;
			w=0.11;
			h=0.35499999;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.75515002;
			y=0.76249999;
			default=1;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayXWizardIntelIsland: RscStandardDisplay
{
	movingEnable=0;
	enableSimulation=1;
	enableDisplay=1;
	onLoad="_dummy = [_this, ""CA_SI_IslandSelected""] execVM ""\ca\ui\scripts\islandPicture.sqf"";";
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class IslandWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete Title;
		delete IslandValue;
		delete IslandShots;
		class Title_CA: CA_Title
		{
			x=0.126;
			y=0.192;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_ISLAND_TITLE";
		};
		class IslandPanorama: RscPicture
		{
			idc=1005;
			x=0.20999999;
			y=0.27103001;
			w=0.627451;
			h=0.2091503;
			text="\ca\ui\data\island_picture_dummy_ca.paa";
		};
		class IslandsBox: RscListBox
		{
			idc=101;
			onLBSelChanged="_dummy = [_this, ""CA_SI_IslandSelected""] execVM ""\ca\ui\scripts\islandPicture.sqf"";";
			x=0.20999999;
			y=0.5;
			w=0.627451;
			h=0.23899999;
		};
		class CA_IslandShots: RscPicture
		{
			x=0;
			y=0;
			w=0.53676897;
			h=0.26470801;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.76200002;
			y=0.76249999;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayXWizardIntelTime: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class TimeWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete B_OK;
		delete B_Cancel;
		delete Year;
		delete Month;
		delete Day;
		delete Minute;
		delete Hour;
		delete YearText;
		delete MonthText;
		delete DayText;
		delete MinuteText;
		delete HourText;
		class Title_CA: RscStructuredText
		{
			idc=1003;
			x=0.12800001;
			y=0.192;
			w=0.95074302;
			h=0.058823999;
			type=13;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_TITLE";
			size=0.050653595;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			class Attributes
			{
				font="Zeppelin32";
				color="#F0F0F0";
				align="left";
				shadow=1;
			};
		};
		class CA_HourText: RscText
		{
			x=0.25999999;
			y=0.46000001;
			w=0.66912299;
			h=0.029412;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_HOUR";
		};
		class CA_MinuteText: CA_HourText
		{
			x=0.37;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_MINUTES";
		};
		class CA_DayText: CA_HourText
		{
			x=0.47999999;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_DAY";
		};
		class CA_MonthText: CA_HourText
		{
			x=0.58999997;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_MONTH";
		};
		class CA_YearText: CA_HourText
		{
			x=0.69999999;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_TIME_YEAR";
		};
		class CA_Hour: RscCombo
		{
			idc=101;
			x=0.27000001;
			y=0.5;
			w=0.080882996;
			h=0.039216001;
		};
		class CA_Minute: CA_Hour
		{
			idc=102;
			x=0.38;
		};
		class CA_Day: CA_Hour
		{
			idc=103;
			x=0.49000001;
		};
		class CA_Month: CA_Hour
		{
			idc=104;
			x=0.60000002;
		};
		class CA_Year: CA_Hour
		{
			idc=105;
			x=0.70999998;
			from=1985;
			to=2020;
		};
		class ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.76200002;
			y=0.76249999;
			default=1;
			text="$STR_DISP_OK";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayXWizardIntelWeather: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class WeatherWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete Bourka;
		delete WeatherValueTitle;
		delete WeatherValue;
		delete Forecast2;
		delete Forecast;
		delete ForecastWeatherTitle;
		delete ForecastWeatherValue;
		delete FogText;
		delete Current2;
		delete FogValueTitle;
		delete FogValue;
		delete ForecastFogValueTitle;
		delete ForecastFogValue;
		delete WeatherText;
		delete Current;
		delete Jasno;
		delete B_OK;
		delete B_Cancel;
		class CA_Title: CA_Title
		{
			idc=1006;
			x=0.1275;
			y=0.192;
			text="$STR_DISP_INTEL_WEATHER";
		};
		class CA_Bourka: RscPicture
		{
			idc=1007;
			text="\ca\ui\data\Editor_bourka.paa";
			x=0.225229;
			y=0.281647;
			w=0.059999999;
			h=0.079999998;
		};
		class CA_Jasno: RscPicture
		{
			idc=1008;
			text="\ca\ui\data\Editor_jasno.paa";
			x=0.82999998;
			y=0.281647;
			w=0.059999999;
			h=0.079999998;
		};
		class CA_WeatherText: RscText
		{
			idc=1009;
			style=0;
			x=0.100902;
			y=0.322088;
			w=0.43000001;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_WEATHER";
		};
		class CA_Current: RscText
		{
			idc=101;
			style=0;
			x=0.117242;
			y=0.391;
			w=0.34;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_WEATHER_CURRENT";
		};
		class CA_WeatherValue: RscXSliderH
		{
			idc=102;
			x=0.242;
			y=0.391;
			w=0.63;
		};
		class CA_Forecast: CA_Current
		{
			idc=103;
			y=0.46599999;
			text="$STR_DISP_INTEL_FORECAST";
		};
		class CA_ForecastWeatherTitle: RscText
		{
			idc=103;
			x=0.096000001;
			y=0.46306899;
			w=0.5;
		};
		class CA_ForecastWeatherValue: RscXSliderH
		{
			idc=104;
			x=0.242;
			y=0.46599999;
			w=0.63;
		};
		class CA_FogText: CA_WeatherText
		{
			idc=1010;
			x=0.100902;
			y=0.53797102;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_WEATHER_FOG";
		};
		class CA_Current2: CA_Current
		{
			idc=105;
			y=0.60909802;
		};
		class CA_FogValueTitle: RscText
		{
			idc=105;
			x=0.096000001;
			y=0.61400002;
			w=0.5;
		};
		class CA_FogValue: RscXSliderH
		{
			idc=106;
			x=0.242;
			y=0.61400002;
			w=0.63;
		};
		class CA_Forecast2: CA_Forecast
		{
			idc=107;
			x=0.117242;
			y=0.68392199;
		};
		class CA_ForecastFogValue: RscXSliderH
		{
			idc=108;
			x=0.242;
			y=0.68599999;
			w=0.63;
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.76200002;
			y=0.76249999;
			default=1;
			text="$STR_DISP_OK";
		};
		class CA_ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.56199998;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplaySelectDifficulty: RscStandardDisplay
{
	onUnload="UI_dialogReferer = ""RscDisplaySelectDifficulty"";";
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.1};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded3: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1103;
			x=0.185;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizardtemplate_background_ca.paa";
		};
	};
	class controls
	{
		delete Difficulty;
		delete Description;
		class CA_SelectDiffTitle: CA_Title
		{
			x=0.23;
			y=0.192;
			text="$STR_DISP_OPTIONS_DIFFICULTY";
		};
		class CA_Difficulty: RscListBox
		{
			idc=101;
			x=0.2;
			y=0.27103001;
			w=0.33199999;
			h=0.48300001;
			rowHeight=0.043909099;
		};
		class CA_Description: RscHTML
		{
			idc=102;
			x=0.55782402;
			y=0.23407;
			w=0.38999999;
			h=0.48699999;
			class H1: H1
			{
			};
			class H2: H2
			{
			};
			class H3: H3
			{
			};
			class H4: H4
			{
			};
			class H5: H5
			{
			};
			class H6: H6
			{
			};
			class P: P
			{
			};
		};
		class OK_Text: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.80000001;
			y=0.76249999;
			default=1;
			text="$STR_SINGLE_PLAY";
		};
		class Diff_B_Back: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.60000002;
			y=0.76249999;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayXWizardIntelName: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
		class NameWizardBack: RscPicture
		{
			idc=1104;
			x=0.083999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wizard_units_background_ca.paa";
		};
	};
	class controls
	{
		delete B_OK;
		delete B_Cancel;
		delete Name;
		delete Title;
		class CA_Mission_Name_Title_CA: CA_Title
		{
			x=0.126;
			y=0.192;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			text="$STR_DISP_XBOX_EDITOR_WIZARD_NAME_TITLE";
		};
		class CA_Mission_NameValue: RscEdit
		{
			idc=101;
			x=0.23999999;
			y=0.48500001;
			w=0.419121;
			h=0.039216001;
			colorBackground[]={0,0,0,0.5};
		};
		class Ok: RscShortcutButton
		{
			idc=1;
			x=0.76200002;
			y=0.76249999;
			default=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
		};
		class Cancel: RscShortcutButton
		{
			idc=2;
			default=0;
			x=0.56199998;
			y=0.76249999;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_CA_CANCEL";
		};
	};
};
class RscDisplayXWizardMap: RscStandardDisplay
{
	idd=97;
	class controlsBackground
	{
		delete Map;
		class CA_Black: CA_Black_Back
		{
		};
		class CA_Map: RscMapControl
		{
			moveOnEdges=1;
			x="SafeZoneXAbs";
			y="SafeZoneY";
			w="SafeZoneWAbs";
			h="SafeZoneH";
			class Command
			{
				icon="#(argb,8,8,3)color(1,1,1,1)";
				color[]={0,0,0,1};
				size=12;
				importance=1;
				coefMin=1;
				coefMax=1;
			};
			class ActiveMarker
			{
				color[]={0.30000001,0.1,0.89999998,1};
				size=50;
			};
			scaleMin=0.029999999;
			scaleMax=0.31999999;
			scaleDefault=0.096000001;
		};
	};
	class controls
	{
		delete B_OK;
		delete Briefing;
		delete Points;
		class CA_ButtonsBackground: IGUIBack
		{
			idc=1026;
			x="0.010*SafeZoneW + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.895)";
			w="SafeZoneW * 0.98";
			h=0.082000002;
			colorbackground[]={0.1961,0.1451,0.094099998,0.85000002};
		};
		class CA_Points: RscText
		{
			idc=101;
			x=0;
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			w=1;
			h=0.059999999;
			style="0x02 + 0x100";
			text="$STR_MISSION_WIZARD_POINTS";
		};
		class CA_Briefing: RscHTML
		{
			idc=56;
			x=0.12;
			y=0.07;
			w=0.80000001;
			h=0.69999999;
		};
		class CA_B_CANCEL: RscIGUIShortcutButton
		{
			idc=2;
			x="0.031 + SafeZoneX";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_BACK";
		};
		class CA_B_OK: RscIGUIShortcutButton
		{
			idc=1;
			default=1;
			x="((SafeZoneW + SafeZoneX) - (1 - 0.788))";
			y="(SafeZoneH + SafeZoneY) - (1 - 0.908)";
			shortcuts[]=
			{
				"0x00050000 + 8"
			};
			text="$STR_DISP_ARCMAP_PREVIEW";
		};
	};
};
class RscDisplayXWizardMapInsertUnit: RscStandardDisplay
{
	class controlsBackground
	{
		class MainWizardBack: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_wiz_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete TitleCount;
		delete TitleClass;
		delete ComboClass;
		delete TitleType;
		delete ComboType;
		delete TitleComunt;
		delete ComboCount;
		delete TitleSide;
		delete ComboSide;
		delete ValueClass;
		delete ValueSkill;
		delete ValueVehicle;
		delete ValueRank;
		class CA_Title: CA_Title
		{
			idc=1006;
			x=0.067973897;
			y=0.19180401;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_SELECT";
		};
		class CA_TextSide: RscText
		{
			x=0.075000003;
			y=0.28299999;
			w=0.27206099;
			text="$STR_DISP_ARCUNIT_SIDE";
		};
		class CA_ValueSide: RscListBox
		{
			idc=104;
			x=0.075000003;
			y=0.32600001;
			w=0.17299999;
			h=0.375;
		};
		class CA_TextClass: CA_TextSide
		{
			x=0.30599999;
			y=0.28299999;
			w=0.27206099;
			text="$STR_DISP_ARCUNIT_CLASS";
		};
		class CA_ValueClass: CA_ValueSide
		{
			idc=101;
			x=0.30599999;
		};
		class CA_TextType: CA_TextSide
		{
			x=0.53100002;
			w=0.27206099;
			text="$STR_DISP_ARCGRP_TYPE";
		};
		class CA_ValueType: CA_ValueSide
		{
			idc=102;
			x=0.53100002;
			w=0.252;
		};
		class CA_TextCount: CA_TextSide
		{
			x=0.81900001;
			text="$STR_DISP_XBOX_EDITOR_WIZARD_UNIT_COUNT";
		};
		class CA_ValueCount: CA_ValueSide
		{
			idc=103;
			x=0.81900001;
			w=0.104;
		};
		class CA_InsertUnit_Ok: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.75195998;
			y=0.759902;
			default=1;
			text="$STR_DISP_OK";
		};
		class CA_InsertUnit_Cancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.059150301;
			y=0.759902;
			text="$STR_CA_CANCEL";
		};
	};
};
class RscMsgBox
{
	movingEnable=1;
	class controlsBackground
	{
	};
	class Top
	{
		delete Title;
		class CA_Background_Top: RscPicture
		{
			x=0.13;
			y=0.23999999;
			w=1.254902;
			h=0.1045752;
			moving=1;
			text="\ca\ui\data\ui_messagebox_top_ca.paa";
		};
	};
	class Middle
	{
		delete Background;
		delete SubBackground;
		delete Text;
		class CA_Background_Middle: RscPicture
		{
			x=0.13;
			y=0.34462059;
			w=1.254902;
			h=0.032000002;
			text="\ca\ui\data\ui_messagebox_middle_ca.paa";
		};
		class CA_Text: RscStructuredText
		{
			idc=101;
			x=0.1460454;
			y=0.34462059;
			w=0.70999998;
			h=0;
			size=0.039209999;
			class Attributes
			{
				color="#e0d8a6";
			};
		};
	};
	class Bottom
	{
		delete Button2;
		delete Button1;
		class CA_Background_Bottom: RscPicture
		{
			x=0.13;
			y=0.37662059;
			w=1.254902;
			h=0.2091503;
			text="\ca\ui\data\ui_messagebox_bottom_ca.paa";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
			default=1;
			x=0.454;
			y=0.3716206;
			w=0.2;
		};
		class CA_ButtonCancel: CA_ButtonOK
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
			x=0.66000003;
		};
	};
};
class RscMsgBox3
{
	movingEnable=1;
	class controlsBackground
	{
	};
	class Top
	{
		delete Title;
		class CA_Background_Top: RscPicture
		{
			x=0.13;
			y=0.23999999;
			w=1.254902;
			h=0.1045752;
			moving=1;
			text="\ca\ui\data\ui_messagebox_top_ca.paa";
		};
	};
	class Middle
	{
		delete Background;
		delete SubBackground;
		delete Text;
		class CA_Background_Middle: RscPicture
		{
			x=0.13;
			y=0.34462059;
			w=1.254902;
			h=0.032000002;
			text="\ca\ui\data\ui_messagebox_middle_ca.paa";
		};
		class CA_Text: RscStructuredText
		{
			idc=101;
			x=0.1460454;
			y=0.34462059;
			w=0.70999998;
			h=0;
			size=0.039209999;
			class Attributes
			{
				color="#e0d8a6";
			};
		};
	};
	class Bottom
	{
		delete Button3;
		delete Button2;
		delete Button1;
		class CA_Background_Bottom: RscPicture
		{
			x=0.13;
			y=0.37662059;
			w=1.254902;
			h=0.2091503;
			text="\ca\ui\data\ui_messagebox_bottom_ca.paa";
		};
		class CA_ButtonOK: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			text="$STR_DISP_OK";
			default=1;
			x=0.248;
			y=0.3716206;
			w=0.2;
		};
		class CA_ButtonCancel: CA_ButtonOK
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
			x=0.454;
		};
		class CA_Later: CA_ButtonOK
		{
			idc=6;
			shortcuts[]={};
			text="$STR_DISP_LATER";
			default=0;
			x=0.66000003;
		};
	};
};
class RscDisplayMissionEditor
{
	class ControlsBackground
	{
		class Background: RscListBox
		{
			x=-1;
			y=-1;
			w=3;
			h=3;
		};
		class CA_M_Map: RscMapControl
		{
			class Legend
			{
				x=0.029999999;
				y=0.029999999;
				w=0.29899999;
				h=0.122;
				font="Zeppelin32";
				sizeEx=0.02674;
				colorBackground[]={0.90600002,0.90100002,0.88,0.80000001};
				color[]={0,0,0,1};
			};
			moveOnEdges=0;
			iconCamera="\ca\ui\data\editor_2d_camera_ca";
			iconCameraColor[]={0.80000001,0.60000002,0.050000001,0.80000001};
			iconCameraSize=24;
		};
	};
	class Controls
	{
		delete B_Save;
		delete B_Restart;
		delete B_Clear;
		delete B_Preview;
		delete B_Map;
		delete B_Exit;
		delete B_Load;
		delete T_Frame1;
		delete M_Map;
		delete T_Help1;
		class T_Background2: RscText
		{
			x="SafeZoneX";
			y="SafeZoneY";
			w=0.25;
			h="SafeZoneH";
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
		};
		class T_Background1: RscText
		{
			x="SafeZoneX + SafeZoneW - 1 + 0.81";
			y="SafeZoneY";
			w=0.19;
			h="SafeZoneH";
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
		};
		class T_ObjectBrowser: RscTree
		{
			x="SafeZoneX";
			y="SafeZoneY";
			w=0.25;
			h="SafeZoneH";
		};
		class L_NewObject: RscListBox
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.821)";
			y="SafeZoneY + 0.01";
			w=0.169;
			h="14 * 0.03";
			sizeEx=0.029999999;
			colorText[]={0.94999999,0.94999999,0.94999999,1};
			color[]={0.94999999,0.94999999,0.94999999,1};
			colorTextSelect[]={0.094099998,0.1608,0.062700003,1};
			colorSelect[]={0.094099998,0.1608,0.062700003,1};
			rows=15;
			columns=1;
		};
		class L_ObjectInfo: RscListBox
		{
			x="(SafeZoneW + SafeZoneX) - (1 - 0.821)";
			y="SafeZoneY + 0.02 + 14 * 0.03";
			w=0.169;
			h="6 * 0.03";
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
			sizeEx=0.029999999;
		};
		class CA_B_Load: RscShortcutButton
		{
			idc=206;
			x="(SafeZoneW + SafeZoneX) - (1 - 0.817)";
			y=0.51999998;
			w=0.18000001;
			text="$STR_DISP_ARCMAP_LOAD";
			toolTip="$STR_UI_EDITOR_LOAD_T";
			sizeEx=0.02674;
			default=0;
		};
		class CA_B_Save: CA_B_Load
		{
			idc=205;
			y=0.56;
			text="$STR_DISP_ARCMAP_SAVE";
			toolTip="$STR_UI_EDITOR_SAVE_T";
		};
		class CA_B_Restart: CA_B_Load
		{
			idc=207;
			y=0.60000002;
			text="$STR_UI_EDITOR_RESTART";
			toolTip="$STR_UI_EDITOR_RESTART_T";
		};
		class CA_B_Clear: CA_B_Load
		{
			idc=210;
			y=0.63999999;
			text="$STR_DISP_ARCMAP_CLEAR";
			toolTip="$STR_UI_EDITOR_CLEAR_T";
		};
		class CA_B_Map: CA_B_Load
		{
			idc=209;
			y=0.72000003;
			text="$STR_UI_EDITOR_HIDE_MAP";
			toolTip="$STR_UI_EDITOR_HIDE_MAP_T";
		};
		class CA_B_Preview: CA_B_Load
		{
			idc=208;
			y=0.83999997;
			text="$STR_DISP_ARCMAP_PREVIEW";
			toolTip="$STR_UI_EDITOR_PREVIEW_T";
			default=1;
		};
		class CA_B_Exit: CA_B_Load
		{
			idc=2;
			y=0.92000002;
			text="$STR_DISP_ARCMAP_EXIT";
			toolTip="$STR_UI_EDITOR_QUIT_T";
		};
	};
	class Menu
	{
		colorBackground[]={0.25,0,0,1};
	};
};
class RscDisplayEditObject
{
	class Controls
	{
		class T_Background: RscText
		{
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
			x="SafeZoneX + 0.25 + 0.02";
			y=0.079999998;
			w=0.70999998;
			h=0.89999998;
		};
		class Title: RscText
		{
			idc=-1;
			style="0x20 + 0x02 + 0x00";
			x="SafeZoneX + 0.25 + 0.02";
			y=0;
			w=0.19;
			h=0.025;
			sizeEx=0.025;
			text="";
		};
		class B_OK: RscShortcutButton
		{
			idc=1;
			x="SafeZoneX + 0.25 + 0.2";
			y="0.915-0.05";
			w=0.18000001;
			h=0.1045752;
			text="$STR_DISP_OK";
			default=1;
		};
		class B_Cancel: B_OK
		{
			idc=2;
			x="SafeZoneX + 0.25 + 0.39";
			text="$STR_DISP_CANCEL";
			default=0;
		};
		class T_Title: RscTitle
		{
			style="0x20 + 0x02";
			x="SafeZoneX + 0.25 + 0.02";
			y=0.090000004;
			w=0.70999998;
			text="$STR_UI_EDITOR_OBJECT_PROPERTIES";
		};
		class G_ControlsGroup: RscControlsGroup
		{
			idc=101;
			x="SafeZoneX + 0.25 + 0.02";
			y=0.15000001;
			w=0.70999998;
			h=0.73000002;
			class Controls
			{
			};
		};
	};
};
class RscDisplayMissionLoad
{
	idd=122;
	movingEnable=1;
	class Controls
	{
		class T_Background: RscText
		{
			x=0.175;
			y=0.31999999;
			w=0.40000001;
			h=0.30000001;
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
		};
		class T_Title: RscTitle
		{
			style=0;
			x=0.175;
			y=0.33000001;
			w=0.40000001;
			text="$STR_UI_EDITOR_LOAD_TITLE";
		};
		class B_OK: RscShortcutButton
		{
			idc=1;
			x=0.2;
			y=0.51999998;
			w=0.18000001;
			h=0.1045752;
			text="$STR_DISP_OK";
			default=1;
		};
		class B_Cancel: B_OK
		{
			idc=2;
			x=0.38999999;
			text="$STR_DISP_CANCEL";
			default=0;
		};
	};
};
class RscDisplayMissionSave
{
	idd=123;
	movingEnable=1;
	class Controls
	{
		class T_Background: RscText
		{
			x=0.175;
			y=0.31999999;
			w=0.40000001;
			h=0.30000001;
			colorBackground[]={0.094099998,0.1608,0.062700003,0.75};
		};
		class T_Title: RscTitle
		{
			style=0;
			x=0.175;
			y=0.33000001;
			w=0.40000001;
			text="$STR_UI_EDITOR_SAVE_TITLE";
		};
		class B_OK: RscShortcutButton
		{
			idc=1;
			x=0.2;
			y=0.51999998;
			w=0.18000001;
			h=0.1045752;
			text="$STR_DISP_OK";
			default=1;
		};
		class B_Cancel: B_OK
		{
			idc=2;
			x=0.38999999;
			text="$STR_DISP_CANCEL";
			default=0;
		};
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	onLoad="private ['_dummy']; _dummy = ['Init', _this] execVM '\ca\ui\scripts\pauseLoadinit.sqf';";
	onUnload="private ['_dummy']; _dummy = ['Unload', _this] execVM '\ca\ui\scripts\pauseOnUnload.sqf';";
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.037999999;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete B_Cancel;
		delete B_Quit;
		delete B_Options;
		delete B_Restart;
		delete B_Edit3D;
		delete B_Edit2D;
		delete Title;
		class Preview_Title: CA_Title
		{
			x=0.057;
			y=0.182;
			text="$STR_DISP_INT_TITLE";
		};
		class CA_B_Edit2D: RscShortcutButtonMain
		{
			idc=113;
			x=0.050000001;
			y=0.271;
			text="$STR_UI_EDITOR_INT_EDIT2D";
			default=0;
		};
		class CA_B_Edit3D: CA_B_Edit2D
		{
			idc=114;
			x=0.050000001;
			y=0.368;
			text="$STR_UI_EDITOR_INT_EDIT3D";
		};
		class CA_B_Restart: CA_B_Edit2D
		{
			idc=105;
			x=0.050000001;
			y=0.46399999;
			text="$STR_UI_EDITOR_RESTART";
		};
		class CA_B_Options: CA_B_Edit2D
		{
			idc=101;
			y=0.56;
			text="$STR_DISP_INT_OPTIONS";
		};
		class CA_B_Quit: CA_B_Edit2D
		{
			idc=104;
			y=0.65600002;
			text="$STR_UI_EDITOR_INT_QUIT";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.050000001;
			y=0.755;
			text="$STR_DISP_INT_CONTINUE";
		};
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay
{
	class controls
	{
		class Title: RscTitle
		{
			text="$STR_DISP_INT_3DEDIT_TITLE";
		};
		class B_Edit2D: RscButton
		{
			h=0.039999999;
		};
		class B_Preview: B_Edit2D
		{
		};
		class B_Restart: B_Edit2D
		{
		};
		class B_Options: B_Edit2D
		{
		};
		class B_Quit: B_Edit2D
		{
		};
		class B_Cancel: B_Edit2D
		{
		};
	};
};
class RscDisplayScriptingHelp
{
	movingEnable=1;
	class Controls
	{
		delete Background;
		delete Back;
		delete Forward;
		delete CopyExample;
		delete Done;
		delete Content;
		class CA_Background: RscPicture
		{
			moving=1;
			x=0.1;
			y=0.1;
			w=0.80000001;
			h=0.80000001;
			text="#(argb,8,8,3)color(1,1,1,1)";
			colortext[]={0.094099998,0.1608,0.062700003,1};
		};
		class CA_Content: RscHTML
		{
			idc=101;
			x=0.12;
			y=0.12;
			w=0.75999999;
			h=0.66000003;
			class H1
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.039209999;
				align="left";
			};
			class H2
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.02674;
				align="left";
			};
			class P
			{
				font="Zeppelin32";
				fontBold="Zeppelin33";
				sizeEx=0.02674;
				align="left";
			};
		};
		class CA_Back: RscShortcutButton
		{
			idc=102;
			x=0.110196;
			y=0.81;
			w=0.15000001;
			text="<";
		};
		class CA_Forward: RscShortcutButton
		{
			idc=103;
			x=0.26549;
			y=0.81;
			w=0.15000001;
			text=">";
		};
		class CA_CopyExample: RscShortcutButton
		{
			idc=104;
			x=0.47143799;
			y=0.81;
			w=0.23999999;
			text="Copy example";
		};
		class CA_Done: RscShortcutButton
		{
			idc=2;
			x=0.710392;
			y=0.81;
			text="$STR_DISP_CLOSE";
			default=1;
		};
	};
};
class RscDisplayAddonActions
{
	idd=156;
	class controlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.204;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_gameoptions_background_ca.paa";
		};
	};
	class Controls
	{
		delete T_Background;
		delete T_Title;
		delete T_Actions;
		delete C_Actions;
		delete B_Cancel;
		delete B_NewMod;
		delete B_OK;
		class CA_T_Title: CA_Title
		{
			idc=1002;
			moving=1;
			x=0.225803;
			y=0.192;
			text="$STR_DISP_ADDON_ACTIONS_TITLE";
		};
		class CA_T_Actions: RscText
		{
			idc=1003;
			x=0.225803;
			y="(0.367549 + -2*0.0523905)";
			text="$STR_DISP_ADDON_ACTIONS_ACTIONS";
		};
		class CA_C_Actions: RscListBox
		{
			idc=101;
			x=0.235;
			y=0.31999999;
			w=0.52999997;
			h=0.41;
		};
		class CA_B_OK: RscShortcutButton
		{
			idc=1;
			x=0.59100002;
			y=0.76249999;
			text="$STR_DISP_OK";
			default=1;
		};
		class CA_B_NewMod: RscShortcutButton
		{
			idc=102;
			x=0.405;
			y=0.76249999;
			text="New Mod";
			default=0;
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			x=0.21699999;
			y=0.76249999;
			text="$STR_DISP_CANCEL";
			default=0;
		};
	};
};
class RscDisplayEditProfile
{
	movingEnable=1;
	enableSimulation=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete Audio;
		delete Controller;
		delete Voice;
		delete Accept;
		delete Name;
		delete Video;
		delete StorageDevice;
		delete Face;
		delete TxtController;
		delete ValueController;
		class CA_EditProfileTitle: CA_Title
		{
			x=0.104;
			y=0.182;
			text="$STR_CA_MAIN_OPTIONS";
		};
		class BVideo: RscShortcutButtonMain
		{
			idc=106;
			default=1;
			x=0.105;
			y=0.271;
			text="$STR_DISP_OPTIONS_VIDEO";
		};
		class BAudio: BVideo
		{
			idc=105;
			default=0;
			x=0.105;
			y=0.368;
			text="$STR_DISP_OPTIONS_AUDIO";
		};
		class BConfigure: BVideo
		{
			idc=104;
			default=0;
			x=0.105;
			y=0.46399999;
			text="$STR_DISP_OPTIONS_CONFIGURE";
		};
		class BFace: BVideo
		{
			idc=102;
			default=0;
			x=0.105;
			y=0.56099999;
			text="$STR_DISP_INT_FACE";
		};
		class BVoice: BVideo
		{
			idc=103;
			x=0.405;
			y=0.56099999;
			text="$STR_DISP_INT_VOICE";
		};
		class BStorage: BVideo
		{
			idc=115;
			x=0.105;
			y=0.65799999;
			text="$STR_DISP_XBOX_STORAGE";
		};
		class HintX_Select: RscXKeyShadow
		{
			key="0x00050000 + 0";
			x=0.26499999;
			y=0.78399998;
			w=0.22059;
			h=0.1045752;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.105;
			y=0.755;
			h=0.1045752;
			w=0.16176599;
			text="$STR_DISP_BACK";
		};
	};
	class KeyHints
	{
		class KeyA
		{
			key="0x00050000 + 0";
			hint="";
		};
	};
};
class RscDisplayEditProfileInGame
{
	enableSimulation=0;
	enableDisplay=1;
	movingEnable=0;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete VideoPause;
		delete ControllerPause;
		delete VoiceMask;
		delete StorageDevice;
		delete AudioPause;
		class CA_TitleOptions: CA_Title
		{
			x=0.104;
			y=0.182;
			text="$STR_DISP_OPTIONS_TITLE";
		};
		class BVideo: RscShortcutButtonMain
		{
			idc=106;
			default=1;
			x=0.105;
			y=0.271;
			text="$STR_DISP_OPTIONS_VIDEO";
		};
		class CA_AudioOptions: BVideo
		{
			idc=105;
			default=0;
			x=0.105;
			y=0.368;
			text="$STR_DISP_OPTIONS_AUDIO";
		};
		class BConfigure: BVideo
		{
			idc=104;
			default=0;
			x=0.105;
			y=0.46399999;
			text="$STR_DISP_OPTIONS_CONFIGURE";
		};
		class BStorage: BVideo
		{
			idc=115;
			default=0;
			x=0.105;
			y=0.56;
			text="$STR_WF_STORAGE_DEVICE";
		};
		class HintX_Select: RscXKeyShadow
		{
			idc=1150;
			key="0x00050000 + 0";
			x=0.26499999;
			y=0.78399998;
			text="$STR_DISP_CONTINUE";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.105;
			y=0.755;
			w=0.16176599;
			text="$STR_DISP_BACK";
		};
	};
	class KeyHints
	{
		class KeyA
		{
			key="0x00050000 + 0";
			hint="";
		};
	};
};
class RscDisplayVoiceMask
{
	access=3;
	idd=78;
	movingEnable=1;
	enableDisplay=0;
	class controlsBackground
	{
		class Background1: RscText
		{
			x=0;
			y=0;
			w=1;
			h=1;
			colorBackground[]={0.30000001,0.30000001,0.30000001,1};
		};
	};
	class controls
	{
		class Title: RscText
		{
			style=2;
			x=0.15000001;
			y=0.12;
			w=0.69999999;
			text="$STR_DISP_XBOX_PROFILE_VOICE_MASK";
		};
		class MaskText: RscText
		{
			x=0.30000001;
			y=0.30000001;
			w=1;
			text="$STR_DISP_XBOX_EDIT_PROFILE_VOICE_MASK";
		};
		class Mask: RscListBox
		{
			idc=105;
			x=0.30000001;
			y=0.34999999;
			w=0.40000001;
			h=0.16;
		};
		class voicetrough: RscText
		{
			x=0.30000001;
			y=0.55000001;
			w=1;
			text="$STR_DISP_PROF_VOICE_THROUGH";
		};
		class ThroughSpeakers: RscListBox
		{
			idc=106;
			x=0.30000001;
			y=0.60000002;
			w=0.40000001;
			h=0.079999998;
		};
	};
};
class RscDisplayProfileAudio
{
	idd=80;
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete TextMusic;
		delete ValueMusic;
		delete MusicSlider;
		delete TextRadio;
		delete ValueRadio;
		delete RadioSlider;
		delete TextEffect;
		delete ValueEffect;
		delete EffectSlider;
		class CA_TitleAudio: CA_Title
		{
			text="$STR_DISP_OPTIONS_AUDIO";
			x=0.15099999;
			y=0.182;
		};
		class CA_TextVolume: RscText
		{
			style=2;
			x=0.31900001;
			y=0.41800001;
			w=0.36000001;
			text="$STR_CA_VOLUME";
		};
		class CA_TextVoices: RscText
		{
			style=1;
			x=0.17299999;
			y=0.472;
			h=0.029412;
			text="$STR_DISP_OPT_VOICES";
		};
		class CA_SliderVoices: RscXSliderH
		{
			idc=106;
			x=0.29899999;
			y=0.472;
			w=0.40000001;
		};
		class CA_TextEffects: CA_TextVoices
		{
			y=0.54799998;
			text="$STR_DISP_OPT_EFFECTS";
		};
		class CA_SliderEffects: CA_SliderVoices
		{
			idc=109;
			y=0.54799998;
		};
		class CA_TextMusic: CA_TextEffects
		{
			text="$STR_DISP_OPT_MUSIC";
			y=0.62;
		};
		class CA_SliderMusic: CA_SliderEffects
		{
			idc=103;
			y=0.62;
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.153;
			y=0.755;
			text="$STR_DISP_CANCEL";
		};
		class ButtonDefault: RscShortcutButton
		{
			idc=110;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.34099999;
			y=0.755;
			text="$STR_DISP_DEFAULT";
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.528;
			y=0.755;
			text="$STR_DISP_CONTINUE";
			default=1;
		};
	};
};
class RscDisplayProfileVideo
{
	movingEnable=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class Controls
	{
		delete Title;
		delete TextBright;
		delete ValueBright;
		delete BrightSlider;
		delete TextContrast;
		delete ValueContrast;
		delete ContrastSlider;
		delete Radio;
		delete Subtitles;
		class Title1: CA_Title
		{
			idc=212;
			x=0.15099999;
			y=0.182;
			text="$STR_DISP_OPTIONS_VIDEO";
		};
		class CA_TextBrightness: RscText
		{
			idc=217;
			style=1;
			x=0.126;
			y=0.426;
			w=0.17;
			h=0.029412;
			text="$STR_DISP_OPT_BRIGHT";
		};
		class CA_SliderBrightness: RscXSliderH
		{
			idc=101;
			x=0.30599999;
			y=0.426;
			w=0.40000001;
		};
		class CA_TextGamma: CA_TextBrightness
		{
			idc=220;
			y=0.498;
			text="$STR_DISP_OPT_GAMMA";
		};
		class CA_SliderGamma: CA_SliderBrightness
		{
			idc=104;
			y=0.498;
		};
		class CA_TextSubtitles: CA_TextBrightness
		{
			x=0.126;
			w=0.28529999;
			y=0.56900001;
			text="$STR_OPT_SUBTITLES";
		};
		class CA_VideoSubtitles: RscXListBox
		{
			idc=107;
			x=0.42133;
			y=0.56900001;
			w=0.284666;
		};
		class CA_TextRadioSubtitles: CA_TextBrightness
		{
			y=0.64399999;
			w=0.28529999;
			text="$STR_OPT_RADIO_SUBTITLES";
		};
		class CA_RadioSubtitles: CA_VideoSubtitles
		{
			idc=108;
			y=0.64399999;
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.153;
			y=0.755;
			text="$STR_DISP_CANCEL";
		};
		class ButtonDefault: RscShortcutButton
		{
			idc=109;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.34099999;
			y=0.755;
			text="$STR_DISP_DEFAULT";
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.528;
			y=0.755;
			text="$STR_DISP_CONTINUE";
			default=1;
		};
	};
};
class RscDisplayProfileController: RscStandardDisplay
{
	enableSimulation=0;
	onload="(_this select 0) closeDisplay 0;";
	class controlsBackground
	{
		class Mainback_faded: RscPicture
		{
			idc=1105;
			x=0.013;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_background_controls_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.059999999;
			y=0.118;
			w=1.254902;
			h=0.83660132;
			text="\ca\ui\data\ui_background_controlers_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete Vehicle;
		delete ControllerType;
		delete Controller;
		delete controlsTitle;
		delete Sensitivity;
		delete HeadlineD;
		delete HeadlineR;
		delete BButton;
		delete YButton;
		delete XButton;
		delete RightTrigger;
		delete BlackButton;
		delete StartButton;
		delete BackButton;
		delete WhiteButton;
		delete LeftStickY;
		delete LeftStickPush;
		delete DStick2;
		delete DStick3;
		delete DStick;
		delete RightStickY;
		delete RightStickPush;
		delete RightStickX;
		delete CurrentScheme;
		delete HintA;
		delete HintB;
		delete HintWhite;
		delete HintBlack;
		delete HintX;
		delete HintY;
		delete ButtonContinue;
		delete ButtonClose;
		delete HeadlineL;
		delete LeftTrigger;
		delete LeftStickX;
		delete AButton;
	};
	class KeyHints
	{
	};
};
class RscDisplayProfileControllerWheel: RscStandardDisplay
{
	class ControlsBackground
	{
	};
	class Controls
	{
	};
};
class RscDisplayProfileVoice
{
	movingEnable=1;
	enableSimulation=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class controls
	{
		delete Title;
		delete MaskText;
		delete Mask;
		delete TextSpeakers;
		delete Speakers;
		delete TextPitch;
		delete ValuePitch;
		delete Pitch;
		delete voicetrough;
		delete ThroughSpeakers;
		class CA_ProfileVoiceTitle: CA_Title
		{
			x=0.15099999;
			y=0.182;
			text="$STR_DISP_INT_VOICE";
		};
		class CA_TextSpeakers: RscText
		{
			style=1;
			x=0.126;
			y=0.426;
			w=0.17;
			text="$STR_DISP_NEW_USER_SPEAKER";
		};
		class CA_Speakers: RscXListBox
		{
			idc=101;
			x=0.30599999;
			y=0.426;
			w=0.31999999;
		};
		class CA_TextPitch: CA_TextSpeakers
		{
			y=0.498;
			text="$STR_DISP_NEW_USER_PITCH";
		};
		class CA_Pitch: RscXSliderH
		{
			idc=104;
			x=0.30599999;
			y=0.498;
			w=0.31999999;
			class Title
			{
				idc=102;
				colorBase[]={0.80000001,0.80000001,0.80000001,1};
				colorActive[]={0.94999999,0.94999999,0.94999999,1};
			};
		};
		class CA_Voicetrough: CA_TextSpeakers
		{
			y=0.56900001;
			text="$STR_DISP_INT_VOICE_THROUGH";
		};
		class CA_ThroughSpeakers: CA_Speakers
		{
			idc=106;
			y=0.56900001;
		};
		class ButtonDefault: RscShortcutButton
		{
			idc=108;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_DISP_DEFAULT";
			x=0.34099999;
			y=0.755;
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.528;
			y=0.755;
			text="$STR_DISP_CONTINUE";
			default=1;
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.153;
			y=0.755;
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayProfileFace
{
	movingEnable=1;
	enableSimulation=0;
	enableDisplay=1;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_audio_background_ca.paa";
		};
	};
	class objects
	{
		class Head: RscObject
		{
			model="\ca\ui\face_preview";
			modelWoman="\ca\ui\face_preview";
			idc=103;
			type=80;
			x=0.347;
			y=0.58499998;
			z=0.30000001;
			xBack=0.40000001;
			yBack=0.25;
			zBack=0.30000001;
			scale=0.16;
			direction[]={0,0,1};
			up[]={0,1,0};
			faceType="man";
			selectionLBrow="lBrow";
			selectionMBrow="mBrow";
			selectionRBrow="rBrow";
			selectionLMouth="lMouth";
			selectionMMouth="mMouth";
			selectionRMouth="rMouth";
			selectionEyelid="eyelids";
			selectionLip="LLip";
			boneHead="head";
			boneLEye="l_eye";
			boneREye="r_eye";
			boneLEyelidUp="eye_upl";
			boneREyelidUp="eye_upr";
			boneLEyelidDown="eye_lwl";
			boneREyelidDown="eye_lwr";
			boneLPupil="l_pupila";
			boneRPupil="r_pupila";
			selectionPersonality="osobnost";
			selectionGlasses="eyelids";
		};
	};
	class controls
	{
		delete TextGlasses;
		delete TextFace;
		delete GlassesList;
		delete FaceList;
		delete Title;
		class CA_TitleFace: CA_Title
		{
			x=0.15099999;
			y=0.182;
			text="$STR_DISP_INT_FACE";
		};
		class CA_TextFace: RscText
		{
			x=0.17;
			y=0.41800001;
			text="$STR_DISP_NEW_USER_FACE";
		};
		class CA_TextGlasses: RscText
		{
			x=0.442;
			y=0.41800001;
			text="$STR_DISP_NEW_USER_GLASSES";
		};
		class CA_FaceList: RscListBox
		{
			idc=101;
			x=0.17;
			y=0.47;
			w=0.241;
			h=0.25299999;
		};
		class CA_GlassesList: RscListBox
		{
			idc=102;
			x=0.442;
			y=0.47;
			w=0.241;
			h=0.25299999;
		};
		class ButtonContinue: RscShortcutButton
		{
			idc=1;
			shortcuts[]=
			{
				"0x00050000 + 0",
				28,
				57,
				156
			};
			x=0.528;
			y=0.755;
			text="$STR_DISP_CONTINUE";
			default=1;
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			x=0.153;
			y=0.755;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			text="$STR_DISP_CANCEL";
		};
	};
};
class RscDisplayMPType: RscStandardDisplay
{
	idd=83;
	enableSimulation=0;
	class controlsBackground
	{
		class MainbackFaded: RscPicture
		{
			idc=1105;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1105;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class Controls
	{
		delete HintB;
		delete HintA;
		delete Title;
		delete SystemLink;
		delete CreateDed;
		delete Download;
		delete Stats;
		delete Friends;
		delete PlayerMatch;
		delete RankedMatch;
		delete Line;
		delete Line02;
		class CA_Title_MP: CA_Title
		{
			x=0.104;
			y=0.182;
			text="$STR_DISP_MAIN_MULTI";
		};
		class CA_RankedMatch: RscShortcutButtonMain
		{
			idc=101;
			x=0.105;
			y=0.271;
			text="$STR_DISP_XBOX_MULTI_RANKED_MATCH";
			default=1;
		};
		class CA_PlayerMatch: CA_RankedMatch
		{
			idc=102;
			y=0.368;
			text="$STR_DISP_XBOX_MULTI_PLAYER_MATCH";
		};
		class CA_CreateDed: CA_RankedMatch
		{
			idc=109;
			y=0.46399999;
			text="Dedicated Host";
		};
		class CA_SystemLink: CA_RankedMatch
		{
			idc=103;
			y=0.56099999;
			text="$STR_XBOX_SYSTEM_LINK";
		};
		class CA_DownloadContent: CA_RankedMatch
		{
			idc=105;
			y=0.65762502;
			text="$STR_DISP_MAIN_XBOX_MULTI_DOWNLOAD";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.105;
			y=0.755;
			text="$STR_DISP_BACK";
		};
		class CA_Friends: RscShortcutButton
		{
			idc=104;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			x=0.74184602;
			y=0.88;
			w=0.23;
			text="$STR_DISP_MAIN_XBOX_MULTI_FRIENDS";
		};
		class CA_Stats: RscShortcutButton
		{
			idc=107;
			shortcuts[]=
			{
				"0x00050000 + 3"
			};
			x=0.47634801;
			y=0.88;
			w=0.25;
			text="$STR_XBOX_LEADERBOARDS";
		};
	};
};
class RscDisplayLive: RscStandardDisplay
{
	idd=139;
	class controlsBackground
	{
		class MainbackFaded1: RscPicture
		{
			idc=1106;
			x=0.045000002;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.25};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class MainbackFaded2: RscPicture
		{
			idc=1107;
			x=0.092;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			colorText[]={1,1,1,0.5};
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
		class Mainback: RscPicture
		{
			idc=1104;
			x=0.138;
			y=0.17;
			w=0.627451;
			h=0.83660132;
			text="\ca\ui\data\ui_mainmenu_background_ca.paa";
		};
	};
	class controls
	{
		delete CreateMatch;
		delete CustomMatch;
		delete QuickMatch;
		class CA_Title_MP: CA_Title
		{
			x=0.15000001;
			y=0.182;
			text="$STR_XBOX_LIVE";
		};
		class CA_QuickMatch: RscShortcutButtonMain
		{
			idc=101;
			x=0.15099999;
			y=0.271;
			text="$STR_XBOX_QUICKMATCH";
		};
		class CA_CustomMatch: CA_QuickMatch
		{
			idc=102;
			y=0.368;
			text="$STR_XBOX_CUSTOMMATCH";
		};
		class CA_CreateMatch: CA_QuickMatch
		{
			idc=103;
			y=0.46399999;
			text="$STR_XBOX_CREATEMATCH";
		};
		class ButtonCancel: RscShortcutButton
		{
			idc=2;
			default=0;
			shortcuts[]=
			{
				"0x00050000 + 1"
			};
			x=0.163405;
			y=0.755;
			text="$STR_DISP_BACK";
		};
	};
};
class RscDisplayQuickMatch: RscStandardDisplay
{
	enableSimulation=0;
	class Controls
	{
		delete SlotsPrivateValue;
		delete SlotsPublicValue;
		delete IslandValue;
		delete MissionValue;
		delete TypeValue;
		delete HostValue;
		delete Title;
		delete ButtonOK;
		delete ButtonNext;
		class CA_Title: RscTitle
		{
			text="$STR_DISP_MAIN_XBOX_MULTI_QUICK";
		};
		class HostText: RscText
		{
			x=0.2;
			y=0.28999999;
			w=0.30000001;
			h=0.079999998;
			text="$str_xbox_filter_host";
			sizeEx="SizeNormal";
		};
		class CA_HostValue: RscStructuredText
		{
			idc=129;
			x=0.44999999;
			y=0.30000001;
			w=0.56;
			h=0.079999998;
		};
		class TypeText: HostText
		{
			y=0.36000001;
			text="$STR_DISP_XBOX_MULTI_TYPE";
		};
		class CA_TypeValue: CA_HostValue
		{
			idc=130;
			y=0.37;
		};
		class MissionText: HostText
		{
			y=0.44;
			text="$STR_DISP_XBOX_MULTI_MISSION";
		};
		class CA_MissionValue: CA_HostValue
		{
			idc=131;
			y=0.44999999;
		};
		class IslandText: HostText
		{
			y=0.50999999;
			text="$STR_DISP_XBOX_MULTI_ISLAND";
		};
		class CA_IslandValue: CA_HostValue
		{
			idc=132;
			y=0.51999998;
			text="";
		};
		class SlotsPublicText: HostText
		{
			y=0.58999997;
			text="$STR_DISP_XBOX_MULTI_PUBLIC_SLOTS";
		};
		class CA_SlotsPublicValue: CA_HostValue
		{
			idc=135;
			y=0.60000002;
			text="";
		};
		class SlotsPrivateText: HostText
		{
			y=0.66000003;
			text="$STR_DISP_XBOX_MULTI_PRIVATE_SLOTS";
		};
		class CA_SlotsPrivateValue: CA_HostValue
		{
			idc=136;
			y=0.67000002;
			text="";
		};
		class CA_ButtonOK: RscButton
		{
			idc=1;
			x=0.47;
			y=0.88;
			w=0.30000001;
			h=0.050000001;
			text="$STR_XBOX_ACCEPT_SESSION";
		};
		class CA_ButtonNext: RscButton
		{
			idc=153;
			x=0.47;
			y=0.935;
			w=0.30000001;
			h=0.050000001;
			text="$STR_XBOX_OTHER_HOST";
		};
	};
};
class RscAnimatedLetters
{
	idd=998877;
	movingEnable=0;
	onUnload="BIS_Credits_Closed = true";
	class ControlsBackground
	{
		class Background1: RscText
		{
			x=-3;
			y=-3;
			w=6;
			h=6;
			colorBackground[]={0,0,0,0.2};
		};
	};
	class Controls
	{
		class L1: RscText
		{
			idc=5000;
			x=0.5;
			y=0.5;
			h=0.30000001;
			w=0.1;
		};
		class L2: L1
		{
			idc=5001;
		};
		class L3: L1
		{
			idc=5002;
		};
		class L4: L1
		{
			idc=5003;
		};
		class L5: L1
		{
			idc=5004;
		};
		class L6: L1
		{
			idc=5005;
		};
		class L7: L1
		{
			idc=5006;
		};
		class L8: L1
		{
			idc=5007;
		};
		class L9: L1
		{
			idc=5008;
		};
		class L10: L1
		{
			idc=5009;
		};
		class L11: L1
		{
			idc=5010;
		};
		class L12: L1
		{
			idc=5011;
		};
		class L13: L1
		{
			idc=5012;
		};
		class L14: L1
		{
			idc=5013;
		};
		class L15: L1
		{
			idc=5014;
		};
		class L16: L1
		{
			idc=5015;
		};
		class L17: L1
		{
			idc=5016;
		};
		class L18: L1
		{
			idc=5017;
		};
		class L19: L1
		{
			idc=5018;
		};
		class L20: L1
		{
			idc=5019;
		};
		class L21: L1
		{
			idc=5020;
		};
		class L22: L1
		{
			idc=5021;
		};
		class L23: L1
		{
			idc=5022;
		};
		class L24: L1
		{
			idc=5023;
		};
		class L25: L1
		{
			idc=5024;
		};
		class L26: L1
		{
			idc=5025;
		};
		class L27: L1
		{
			idc=5026;
		};
		class L28: L1
		{
			idc=5027;
		};
		class L29: L1
		{
			idc=5028;
		};
		class L30: L1
		{
			idc=5029;
		};
		class L31: L1
		{
			idc=5030;
		};
		class L32: L1
		{
			idc=5031;
		};
		class L33: L1
		{
			idc=5032;
		};
		class L34: L1
		{
			idc=5033;
		};
		class L35: L1
		{
			idc=5034;
		};
		class L36: L1
		{
			idc=5035;
		};
		class L37: L1
		{
			idc=5036;
		};
		class L38: L1
		{
			idc=5037;
		};
		class L39: L1
		{
			idc=5038;
		};
		class L40: L1
		{
			idc=5039;
		};
		class L41: L1
		{
			idc=5040;
		};
		class L42: L1
		{
			idc=5041;
		};
		class L43: L1
		{
			idc=5042;
		};
		class L44: L1
		{
			idc=5043;
		};
		class L45: L1
		{
			idc=5044;
		};
		class L46: L1
		{
			idc=5045;
		};
		class L47: L1
		{
			idc=5046;
		};
		class L48: L1
		{
			idc=5047;
		};
		class L49: L1
		{
			idc=5048;
		};
		class L50: L1
		{
			idc=5049;
		};
		class L51: L1
		{
			idc=5050;
		};
		class L52: L1
		{
			idc=5051;
		};
		class L53: L1
		{
			idc=5052;
		};
		class L54: L1
		{
			idc=5053;
		};
		class L55: L1
		{
			idc=5054;
		};
		class L56: L1
		{
			idc=5055;
		};
		class L57: L1
		{
			idc=5056;
		};
		class L58: L1
		{
			idc=5057;
		};
		class L59: L1
		{
			idc=5058;
		};
		class L60: L1
		{
			idc=5059;
		};
		class L61: L1
		{
			idc=5060;
		};
		class L62: L1
		{
			idc=5061;
		};
		class L63: L1
		{
			idc=5062;
		};
		class L64: L1
		{
			idc=5063;
		};
		class L65: L1
		{
			idc=5064;
		};
		class L66: L1
		{
			idc=5065;
		};
		class L67: L1
		{
			idc=5066;
		};
		class L68: L1
		{
			idc=5067;
		};
		class L69: L1
		{
			idc=5068;
		};
		class L70: L1
		{
			idc=5069;
		};
		class L71: L1
		{
			idc=5070;
		};
		class L72: L1
		{
			idc=5071;
		};
		class L73: L1
		{
			idc=5072;
		};
		class L74: L1
		{
			idc=5073;
		};
		class L75: L1
		{
			idc=5074;
		};
		class L76: L1
		{
			idc=5075;
		};
		class L77: L1
		{
			idc=5076;
		};
		class L78: L1
		{
			idc=5077;
		};
		class L79: L1
		{
			idc=5078;
		};
		class L80: L1
		{
			idc=5079;
		};
		class L81: L1
		{
			idc=5080;
		};
		class L82: L1
		{
			idc=5081;
		};
		class L83: L1
		{
			idc=5082;
		};
		class L84: L1
		{
			idc=5083;
		};
		class L85: L1
		{
			idc=5084;
		};
		class L86: L1
		{
			idc=5085;
		};
		class L87: L1
		{
			idc=5086;
		};
		class L88: L1
		{
			idc=5087;
		};
		class L89: L1
		{
			idc=5088;
		};
		class L90: L1
		{
			idc=5089;
		};
		class L91: L1
		{
			idc=5090;
		};
		class L92: L1
		{
			idc=5091;
		};
		class L93: L1
		{
			idc=5092;
		};
		class L94: L1
		{
			idc=5093;
		};
		class L95: L1
		{
			idc=5094;
		};
		class L96: L1
		{
			idc=5095;
		};
		class L97: L1
		{
			idc=5096;
		};
		class L98: L1
		{
			idc=5097;
		};
		class L99: L1
		{
			idc=5098;
		};
		class L100: L1
		{
			idc=5099;
		};
		class L101: L1
		{
			idc=5100;
		};
		class L102: L1
		{
			idc=5101;
		};
		class L103: L1
		{
			idc=5102;
		};
		class L104: L1
		{
			idc=5103;
		};
		class L105: L1
		{
			idc=5104;
		};
		class L106: L1
		{
			idc=5105;
		};
		class L107: L1
		{
			idc=5106;
		};
		class L108: L1
		{
			idc=5107;
		};
		class L109: L1
		{
			idc=5108;
		};
		class L110: L1
		{
			idc=5109;
		};
		class L111: L1
		{
			idc=5110;
		};
		class L112: L1
		{
			idc=5111;
		};
		class L113: L1
		{
			idc=5112;
		};
		class L114: L1
		{
			idc=5113;
		};
		class L115: L1
		{
			idc=5114;
		};
		class L116: L1
		{
			idc=5115;
		};
		class L117: L1
		{
			idc=5116;
		};
		class L118: L1
		{
			idc=5117;
		};
		class L119: L1
		{
			idc=5118;
		};
		class L120: L1
		{
			idc=5119;
		};
		class L121: L1
		{
			idc=5120;
		};
		class L122: L1
		{
			idc=5121;
		};
		class L123: L1
		{
			idc=5122;
		};
		class L124: L1
		{
			idc=5123;
		};
		class L125: L1
		{
			idc=5124;
		};
		class L126: L1
		{
			idc=5125;
		};
		class L127: L1
		{
			idc=5126;
		};
		class L128: L1
		{
			idc=5127;
		};
		class L129: L1
		{
			idc=5128;
		};
		class L130: L1
		{
			idc=5129;
		};
		class L131: L1
		{
			idc=5130;
		};
		class L132: L1
		{
			idc=5131;
		};
		class L133: L1
		{
			idc=5132;
		};
		class L134: L1
		{
			idc=5133;
		};
		class L135: L1
		{
			idc=5134;
		};
		class L136: L1
		{
			idc=5135;
		};
		class L137: L1
		{
			idc=5136;
		};
		class L138: L1
		{
			idc=5137;
		};
		class L139: L1
		{
			idc=5138;
		};
		class L140: L1
		{
			idc=5139;
		};
		class L141: L1
		{
			idc=5140;
		};
		class L142: L1
		{
			idc=5141;
		};
		class L143: L1
		{
			idc=5142;
		};
		class L144: L1
		{
			idc=5143;
		};
		class L145: L1
		{
			idc=5144;
		};
		class L146: L1
		{
			idc=5145;
		};
		class L147: L1
		{
			idc=5146;
		};
		class L148: L1
		{
			idc=5147;
		};
		class L149: L1
		{
			idc=5148;
		};
		class L150: L1
		{
			idc=5149;
		};
		class L151: L1
		{
			idc=5150;
		};
		class L152: L1
		{
			idc=5151;
		};
		class L153: L1
		{
			idc=5152;
		};
		class L154: L1
		{
			idc=5153;
		};
		class L155: L1
		{
			idc=5154;
		};
		class L156: L1
		{
			idc=5155;
		};
		class L157: L1
		{
			idc=5156;
		};
		class L158: L1
		{
			idc=5157;
		};
		class L159: L1
		{
			idc=5158;
		};
		class L160: L1
		{
			idc=5159;
		};
		class L161: L1
		{
			idc=5160;
		};
		class L162: L1
		{
			idc=5161;
		};
		class L163: L1
		{
			idc=5162;
		};
		class L164: L1
		{
			idc=5163;
		};
		class L165: L1
		{
			idc=5164;
		};
		class L166: L1
		{
			idc=5165;
		};
		class L167: L1
		{
			idc=5166;
		};
		class L168: L1
		{
			idc=5167;
		};
		class L169: L1
		{
			idc=5168;
		};
		class L170: L1
		{
			idc=5169;
		};
		class L171: L1
		{
			idc=5170;
		};
		class L172: L1
		{
			idc=5171;
		};
		class L173: L1
		{
			idc=5172;
		};
		class L174: L1
		{
			idc=5173;
		};
		class L175: L1
		{
			idc=5174;
		};
		class L176: L1
		{
			idc=5175;
		};
		class L177: L1
		{
			idc=5176;
		};
		class L178: L1
		{
			idc=5177;
		};
		class L179: L1
		{
			idc=5178;
		};
		class L180: L1
		{
			idc=5179;
		};
		class L181: L1
		{
			idc=5180;
		};
		class L182: L1
		{
			idc=5181;
		};
		class L183: L1
		{
			idc=5182;
		};
		class L184: L1
		{
			idc=5183;
		};
		class L185: L1
		{
			idc=5184;
		};
		class L186: L1
		{
			idc=5185;
		};
		class L187: L1
		{
			idc=5186;
		};
		class L188: L1
		{
			idc=5187;
		};
		class L189: L1
		{
			idc=5188;
		};
		class L190: L1
		{
			idc=5189;
		};
		class L191: L1
		{
			idc=5190;
		};
		class L192: L1
		{
			idc=5191;
		};
		class L193: L1
		{
			idc=5192;
		};
		class L194: L1
		{
			idc=5193;
		};
		class L195: L1
		{
			idc=5194;
		};
		class L196: L1
		{
			idc=5195;
		};
		class L197: L1
		{
			idc=5196;
		};
		class L198: L1
		{
			idc=5197;
		};
		class L199: L1
		{
			idc=5198;
		};
		class L200: L1
		{
			idc=5199;
		};
		class L201: L1
		{
			idc=5200;
		};
		class L202: L1
		{
			idc=5201;
		};
		class L203: L1
		{
			idc=5202;
		};
		class L204: L1
		{
			idc=5203;
		};
		class L205: L1
		{
			idc=5204;
		};
		class L206: L1
		{
			idc=5205;
		};
		class L207: L1
		{
			idc=5206;
		};
		class L208: L1
		{
			idc=5207;
		};
		class L209: L1
		{
			idc=5208;
		};
	};
};
class CfgLanguages
{
	class Original
	{
		name="Original";
	};
	class English
	{
		name="$STR_LANG_ENGLISH";
	};
	class French
	{
		name="$STR_LANG_FRENCH";
	};
	class Spanish
	{
		name="$STR_LANG_SPANISH";
	};
	class Italian
	{
		name="$STR_LANG_ITALIAN";
	};
	class German
	{
		name="$STR_LANG_GERMAN";
	};
	class Czech
	{
		name="$STR_LANG_CZECH";
	};
	class Polish
	{
		name="$STR_LANG_POLISH";
	};
	class Russian
	{
		name="$STR_LANG_RUSSIAN";
	};
	class Hungarian
	{
		name="$STR_LANG_HUNGARIAN";
	};
	class Portuguese
	{
		name="$STR_LANG_PORTUGUESE";
	};
};
class cfgGroupIcons
{
	class Flag
	{
		name="$STR_CFG_MARKERS_FLAG";
		icon="\ca\ui\data\markers\dummy_ca.paa";
		color[]={1,0,0,1};
		size=32;
		shadow=1;
		scope=1;
	};
	class Dummy: Flag
	{
		name="$STR_DN_UNKNOWN";
	};
	class NATO_base: Flag
	{
		name="NATO_base";
		icon="\ca\ui\data\markers\b_hq.paa";
		color[]={0,0,0,1};
		size=29;
		shadow=0;
		scope=1;
	};
	class b_empty: NATO_base
	{
		name="BLUFOR - Empty";
		icon="\ca\ui\data\markers\b_unknown.paa";
		side=1;
		color[]={0,0,1,1};
	};
	class o_empty: NATO_base
	{
		name="OPFOR - Empty";
		icon="\ca\ui\data\markers\o_unknown.paa";
		side=0;
		color[]={1,0,0,1};
	};
	class n_empty: NATO_base
	{
		name="Neutral - Empty";
		icon="\ca\ui\data\markers\n_unknown.paa";
		side=1;
	};
	class b_unknown: NATO_base
	{
		name="BLUFOR - Unknown";
		icon="\ca\ui\data\markers\b_unknown.paa";
		side=1;
		color[]={0,0,1,1};
		size=6;
	};
	class o_unknown: NATO_base
	{
		name="OPFOR - Unknown";
		icon="\ca\ui\data\markers\o_unknown.paa";
		side=0;
		color[]={1,0,0,1};
		size=6;
	};
	class n_unknown: NATO_base
	{
		name="Neutral - Unknown";
		icon="\ca\ui\data\markers\n_unknown.paa";
		side=1;
		size=6;
	};
	class b_inf: b_empty
	{
		name="BLUFOR - Infantry";
		icon="\ca\ui\data\markers\b_inf.paa";
	};
	class o_inf: b_inf
	{
		name="OPFOR - Infantry";
		icon="\ca\ui\data\markers\o_inf.paa";
	};
	class n_inf: b_inf
	{
		name="Neutral - Infantry";
		icon="\ca\ui\data\markers\n_inf.paa";
	};
	class b_motor_inf: b_empty
	{
		name="BLUFOR - Motorized Infantry";
		icon="\ca\ui\data\markers\b_motor_inf.paa";
	};
	class o_motor_inf: b_motor_inf
	{
		name="OPFOR - Motorized Infantry";
		icon="\ca\ui\data\markers\o_motor_inf.paa";
	};
	class n_motor_inf: b_motor_inf
	{
		name="Neutral - Motorized Infantry";
		icon="\ca\ui\data\markers\n_motor_inf.paa";
	};
	class b_mech_inf: b_empty
	{
		name="BLUFOR - Mechanized Infantry";
		icon="\ca\ui\data\markers\b_mech_inf.paa";
	};
	class o_mech_inf: b_mech_inf
	{
		name="OPFOR - Mechanized Infantry";
		icon="\ca\ui\data\markers\o_mech_inf.paa";
	};
	class n_mech_inf: b_mech_inf
	{
		name="Neutral - Mechanized Infantryf";
		icon="\ca\ui\data\markers\n_mech_inf.paa";
	};
	class b_armor: b_empty
	{
		name="BLUFOR - Armor";
		icon="\ca\ui\data\markers\b_armor.paa";
	};
	class o_armor: b_armor
	{
		name="OPFOR - Armor";
		icon="\ca\ui\data\markers\o_armor.paa";
	};
	class n_armor: b_armor
	{
		name="Neutral - Armor";
		icon="\ca\ui\data\markers\n_armor.paa";
	};
	class b_recon: b_empty
	{
		name="BLUFOR - Recon";
		icon="\ca\ui\data\markers\b_recon.paa";
	};
	class o_recon: b_recon
	{
		name="OPFOR - Recon";
		icon="\ca\ui\data\markers\o_recon.paa";
	};
	class n_recon: b_recon
	{
		name="Neutral - Recon";
		icon="\ca\ui\data\markers\n_recon.paa";
	};
	class b_air: b_empty
	{
		name="BLUFOR - Helicopter";
		icon="\ca\ui\data\markers\b_air.paa";
	};
	class o_air: b_air
	{
		name="OPFOR - Helicopter";
		icon="\ca\ui\data\markers\o_air.paa";
	};
	class n_air: b_air
	{
		name="Neutral - Helicopter";
		icon="\ca\ui\data\markers\n_air.paa";
	};
	class b_plane: b_empty
	{
		name="BLUFOR - Plane";
		icon="\ca\ui\data\markers\b_plane.paa";
	};
	class o_plane: b_plane
	{
		name="OPFOR - Plane";
		icon="\ca\ui\data\markers\o_plane.paa";
	};
	class n_plane: b_plane
	{
		name="Neutral - Plane";
		icon="\ca\ui\data\markers\n_plane.paa";
	};
	class b_uav: b_empty
	{
		name="BLUFOR - UAV";
		icon="\ca\ui\data\markers\b_uav.paa";
	};
	class o_uav: b_uav
	{
		name="OPFOR - UAV";
		icon="\ca\ui\data\markers\o_uav.paa";
	};
	class n_uav: b_uav
	{
		name="Neutral - UAV";
		icon="\ca\ui\data\markers\n_uav.paa";
	};
	class b_med: b_empty
	{
		name="BLUFOR - Medical";
		icon="\ca\ui\data\markers\b_med.paa";
	};
	class o_med: b_med
	{
		name="OPFOR - Medical";
		icon="\ca\ui\data\markers\o_med.paa";
	};
	class n_med: b_med
	{
		name="Neutral - Medical";
		icon="\ca\ui\data\markers\n_med.paa";
	};
	class b_art: b_empty
	{
		name="BLUFOR - Artillery";
		icon="\ca\ui\data\markers\b_art.paa";
	};
	class o_art: b_art
	{
		name="OPFOR - Artillery";
		icon="\ca\ui\data\markers\o_art.paa";
	};
	class n_art: b_art
	{
		name="Neutral - Artillery";
		icon="\ca\ui\data\markers\n_art.paa";
	};
	class x_art: b_art
	{
		name="Artillery symbol";
		icon="\ca\ui\data\markers\x_art.paa";
	};
	class b_mortar: b_empty
	{
		name="BLUFOR - Mortar";
		icon="\ca\ui\data\markers\b_mortar.paa";
	};
	class o_mortar: b_mortar
	{
		name="OPFOR - Mortar";
		icon="\ca\ui\data\markers\o_mortar.paa";
	};
	class n_mortar: b_mortar
	{
		name="Neutral - Mortar";
		icon="\ca\ui\data\markers\n_mortar.paa";
	};
	class x_mortar: b_mortar
	{
		name="Mortat symbol";
		icon="\ca\ui\data\markers\x_mortar.paa";
	};
	class b_hq: b_empty
	{
		name="BLUFOR - HQ";
		icon="\ca\ui\data\markers\b_hq.paa";
	};
	class o_hq: b_hq
	{
		name="OPFOR - HQ";
		icon="\ca\ui\data\markers\o_hq.paa";
	};
	class n_hq: b_hq
	{
		name="Neutral - HQ";
		icon="\ca\ui\data\markers\n_hq.paa";
	};
	class b_support: b_empty
	{
		name="BLUFOR - Support";
		icon="\ca\ui\data\markers\b_support.paa";
	};
	class o_support: o_empty
	{
		name="OPFOR - Support";
		icon="\ca\ui\data\markers\o_support.paa";
	};
	class n_support: n_empty
	{
		name="Neutral - Support";
		icon="\ca\ui\data\markers\n_support.paa";
	};
	class b_maint: b_empty
	{
		name="BLUFOR - Maintenance";
		icon="\ca\ui\data\markers\b_maint.paa";
	};
	class o_maint: o_empty
	{
		name="OPFOR - Maintenance";
		icon="\ca\ui\data\markers\o_maint.paa";
	};
	class n_maint: n_empty
	{
		name="Neutral - Maintenance";
		icon="\ca\ui\data\markers\n_maint.paa";
	};
	class b_service: b_empty
	{
		name="BLUFOR - Service";
		icon="\ca\ui\data\markers\b_service.paa";
	};
	class o_service: o_empty
	{
		name="OPFOR - Service";
		icon="\ca\ui\data\markers\o_service.paa";
	};
	class n_service: n_empty
	{
		name="Neutral - Service";
		icon="\ca\ui\data\markers\n_service.paa";
	};
	class group_0: NATO_base
	{
		name="Group size - Fire Team";
		icon="\ca\ui\data\markers\group_0.paa";
	};
	class group_1: group_0
	{
		name="Group size - Section";
		icon="\ca\ui\data\markers\group_1.paa";
	};
	class group_2: group_0
	{
		name="Group size - Section";
		icon="\ca\ui\data\markers\group_2.paa";
	};
	class group_3: group_0
	{
		name="Group size - Platoon";
		icon="\ca\ui\data\markers\group_3.paa";
	};
	class group_4: group_0
	{
		name="Group size - Company";
		icon="\ca\ui\data\markers\group_4.paa";
	};
	class group_5: group_0
	{
		name="Group size - Battalion";
		icon="\ca\ui\data\markers\group_5.paa";
	};
	class group_6: group_0
	{
		name="Group size - Regiment";
		icon="\ca\ui\data\markers\group_6.paa";
	};
	class group_7: group_0
	{
		name="Group size - Brigade";
		icon="\ca\ui\data\markers\group_7.paa";
	};
	class group_8: group_0
	{
		name="Group size - Division";
		icon="\ca\ui\data\markers\group_8.paa";
	};
	class group_9: group_0
	{
		name="Group size - Corps";
		icon="\ca\ui\data\markers\group_9.paa";
	};
	class group_10: group_0
	{
		name="Group size - Army";
		icon="\ca\ui\data\markers\group_10.paa";
	};
	class group_11: group_0
	{
		name="Group size - Army Group";
		icon="\ca\ui\data\markers\group_11.paa";
	};
	class waypoint
	{
		name="Waypoint";
		icon="\ca\ui\data\markers\waypoint.paa";
		color[]={0,0,0,1};
		shadow=0;
		scope=1;
		size=29;
	};
	class selector_selectable: NATO_base
	{
		name="Selector - Selectable";
		icon="\ca\ui\data\markers\selector_selectable_ca.paa";
	};
	class selector_selectedEnemy: NATO_base
	{
		name="Selector - Selected Enemy";
		icon="\ca\ui\data\markers\selector_selectedEnemy_ca.paa";
	};
	class selector_selectedFriendly: NATO_base
	{
		name="Selector - Selected Friendly";
		icon="\ca\ui\data\markers\selector_selectedFriendly_ca.paa";
	};
	class selector_selectedMission: NATO_base
	{
		name="Selector - Selected Mission";
		icon="\ca\ui\data\markers\selector_selectedMission_ca.paa";
	};
	class hc_selectable
	{
		name="HC - Selectable";
		icon="\ca\ui\data\markers\selector_selectable_ca.paa";
		size=48;
		color[]={0,0,0,1};
		shadow=0;
		scope=2;
	};
	class hc_selected
	{
		name="HC - Selected";
		icon="\ca\ui\data\markers\selector_selected_ca.paa";
		size=48;
		color[]={0,0,0,1};
		shadow=0;
		scope=2;
	};
	class hc_selectedEnemy
	{
		name="HC - Selected Enemy";
		icon="\ca\ui\data\markers\selector_selectedEnemy_ca.paa";
		size=48;
		color[]={0,0,0,1};
		shadow=0;
		scope=2;
	};
};
class CfgWeaponCursors
{
	class RifleCursorCore;
	class LawCursorCore;
	class MGCursorCore
	{
		texture="\ca\ui\Data\cursor_w_MG_gs";
		color[]={0.40000001,0.67449999,0.2784,1};
		shadowEnabled=2;
	};
	class RifleCursor: RifleCursorCore
	{
		texture="\ca\ui\Data\cursor_w_rifle_gs";
		color[]={0.40000001,0.67449999,0.2784,1};
		shadowEnabled=2;
	};
	class PistolCursor: RifleCursor
	{
		texture="\ca\ui\Data\cursor_w_pistol_gs";
		color[]={0.40000001,0.67449999,0.2784,1};
		shadowEnabled=2;
	};
	class GLCursor: RifleCursor
	{
		texture="\ca\ui\Data\cursor_w_GL_gs";
	};
	class LawCursor: LawCursorCore
	{
		color[]={0.40000001,0.67449999,0.2784,1};
		shadowEnabled=2;
		texture="\ca\UI\Data\cursor_w_MGvehicleW_gs";
	};
	class Cannon: LawCursorCore
	{
		texture="\ca\UI\data\cursor_w_tank_gs";
		color[]={0.40000001,0.67449999,0.2784,1};
		shadowEnabled=2;
		class Sections
		{
		};
		fade=1;
	};
	class ForeSight: Cannon
	{
		texture="\ca\UI\Data\cursor_w_foresight_gs";
	};
	class Air_W_MG: Cannon
	{
		texture="\ca\UI\data\cursor_w_airMG_gs";
	};
	class Air_E_MG: Cannon
	{
		texture="\ca\UI\data\cursor_w_turret_gs";
	};
	class Air_Dot: Cannon
	{
		texture="\ca\UI\Data\cursor_w_dot_gs";
	};
	class Vehicle_E_MG: Cannon
	{
		texture="\ca\UI\data\cursor_w_MGvehicleE_gs";
	};
	class Vehicle_W_MG: Cannon
	{
		texture="\ca\UI\data\cursor_w_MGvehicleW_gs";
	};
	class Vehicle_Grenade_W: Cannon
	{
		texture="\ca\UI\Data\cursor_w_grenade_gs";
	};
	class Vehicle_Grenade_E: Cannon
	{
		texture="\ca\UI\data\cursor_w_GL_gs";
	};
	class Laser: Cannon
	{
		texture="\ca\ui\Data\cursor_w_laserlock_gs";
	};
	class Rocket: Cannon
	{
		texture="\ca\ui\Data\cursor_w_rocket_gs";
	};
	class Missile: Cannon
	{
		texture="\ca\ui\Data\cursor_w_view_gs";
	};
	class Stinger: Cannon
	{
		texture="\ca\UI\Data\cursor_w_stinger_gs";
	};
	class Javelin: Cannon
	{
		texture="\ca\UI\Data\cursor_w_javellin_gs";
	};
};
class RscHCGroupRootMenu
{
	access=0;
	contexsensitive=1;
	title="";
	atomic=0;
	vocabulary="";
	class Items
	{
		class Empty1
		{
			title="$STR_rscmenu.hpprscgrouprootmenu_items_empty1";
			shortcuts[]={0};
			command="";
			show="HCIsLeader * (1 - HCCursorOnIconEnemy)";
			enable="0";
			speechId=0;
		};
		class EmptyBlank1: Empty1
		{
			title="";
			show="(1 - HCIsLeader)";
			enable="0";
		};
		class Attack
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Attack0";
			shortcuts[]={0};
			command=-5;
			class Params
			{
				expression="['ATTACK',_pos,_is3D,hcselected player] call BIS_HC_path_menu";
			};
			show="HCIsLeader * HCCursorOnIconEnemy";
			enable="HCNotEmpty";
			speechId=0;
			cursorTexture="\ca\ui\data\icon_attack_ca.paa";
			priority=2;
		};
		class EmptyBlank2: Empty1
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Move0";
			show="(1 - HCIsLeader) + (HCIsLeader * (1 - CursorOnGround)) + (HCCursorOnIconSelectable)";
			enable="0";
		};
		class Move
		{
			title="$STR_hc_menu_wpset";
			shortcuts[]={0};
			command=-5;
			class Params
			{
				expression="['MOVE',_pos,_is3D,hcselected player,false] call BIS_HC_path_menu";
			};
			show="HCIsLeader * CursorOnGround * (1 - IsWatchCommanded) * (1 - HCCursorOnIconSelectable) * (1 - IsSelectedToAdd)";
			enable="HCNotEmpty";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_tactical_ca.paa";
			priority=1;
		};
		class MoveAdd
		{
			title="$STR_hc_menu_wpadd";
			shortcuts[]={0};
			command=-5;
			class Params
			{
				expression="['MOVE',_pos,_is3D,hcselected player,true] call BIS_HC_path_menu";
			};
			show="HCIsLeader * CursorOnGround * (1 - IsWatchCommanded) * (1 - HCCursorOnIconSelectable) * IsSelectedToAdd";
			enable="HCNotEmpty";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_tactical_ca.paa";
			priority=2;
		};
		class Watch
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Watch0";
			shortcuts[]={0};
			command="CMD_WATCH_CTX";
			show="HCIsLeader * CursorOnGround * IsWatchCommanded";
			enable="HCNotEmpty";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_igui_scroll_ca.paa";
			priority=2;
		};
		class Empty3: Empty1
		{
			title="$STR_hc_menu_moveempty";
			show="(HCIsLeader)";
		};
		class Empty4: Empty1
		{
			title="$STR_hc_menu_fireempty";
			show="(HCIsLeader)";
		};
		class Separator
		{
			title="";
			shortcuts[]={0};
			command=-1;
		};
		class Empty5: Empty1
		{
			title="$STR_hc_menu_empty5";
			show="(HCIsLeader)";
		};
		class Empty6: Empty1
		{
			title="$STR_hc_menu_empty6";
			show="(HCIsLeader)";
		};
		class Empty7: Empty1
		{
			title="$STR_hc_menu_empty7";
			show="HCIsLeader * (1 - HCCursorOnIconSelectable) * (1 - HCCursorOnIconSelectableSelected)";
		};
		class EmptyBlank7: Empty1
		{
			title="";
			show="(1 - HCIsLeader)";
		};
		class Select
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Selectset0";
			shortcuts[]={0};
			command="CMD_HC_SELECT_AUTO";
			show="HCIsLeader * HCCursorOnIconSelectable * (1 - IsSelectedToAdd)";
			enable="1";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_select_unit_ca.paa";
			priority=2;
		};
		class SelectAdd
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Select0";
			shortcuts[]={0};
			command="CMD_HC_SELECT_AUTO_ADD";
			show="HCIsLeader * HCCursorOnIconSelectable * (1 - HCCursorOnIconSelectableSelected) * IsSelectedToAdd";
			enable="1";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_select_unit_ca.paa";
			priority=2;
		};
		class Deselect
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Deselect0";
			shortcuts[]={0};
			command="CMD_HC_DESELECT_AUTO";
			show="HCIsLeader * HCCursorOnIconSelectable * (HCCursorOnIconSelectableSelected) * IsSelectedToAdd";
			enable="1";
			speechId=0;
			cursorTexture="\ca\ui\data\cursor_select_unit_ca.paa";
			priority=2;
		};
		class Empty8: Empty1
		{
			title="";
			command=-1;
			show="1 - (HCIsLeader) * (1 - (HCIsLeader * (1 - HCCanSelectUnitFromBar) * (1 - HCCanDeselectUnitFromBar) * (1 - HCCanSelectTeamFromBar) * (1 - HCCanDeselectTeamFromBar)))";
		};
		class SelectUnitFromBar
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_SelectUnitFromBar0";
			shortcuts[]=
			{
				0,
				"0x00050000 + 3"
			};
			command="CMD_SELECT_UNIT_FROM_BAR";
			show="IsXbox * HCCanSelectUnitFromBar";
			enable="HCNotEmpty";
			speechId=0;
			priority=3;
		};
		class DeselectUnitFromBar
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_DeselectUnitFromBar0";
			shortcuts[]=
			{
				0,
				"0x00050000 + 3"
			};
			command="CMD_DESELECT_UNIT_FROM_BAR";
			show="IsXbox * HCCanDeselectUnitFromBar";
			enable="HCNotEmpty";
			speechId=0;
			priority=3;
		};
		class SelectTeamFromBar
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_SelectTeamFromBar0";
			shortcuts[]=
			{
				0,
				"0x00050000 + 3"
			};
			command="CMD_SELECT_TEAM_FROM_BAR";
			show="IsXbox * HCCanSelectTeamFromBar";
			enable="HCNotEmpty";
			speechId=0;
			priority=3;
		};
		class DeselectTeamFromBar
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_DeselectTeamFromBar0";
			shortcuts[]=
			{
				0,
				"0x00050000 + 3"
			};
			command="CMD_DESELECT_TEAM_FROM_BAR";
			show="IsXbox * HCCanDeselectTeamFromBar";
			enable="HCNotEmpty";
			speechId=0;
			priority=3;
		};
		class Empty9: Empty1
		{
			title="";
			show="1";
		};
		class Empty10: Empty1
		{
			title="";
			show="1";
		};
		class Reply
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Communication0";
			shortcuts[]={0};
			menu="#User:BIS_MENU_GroupCommunication";
			show="1";
			enable="1";
			speechId=0;
		};
	};
};
class RscHCMainMenu
{
	access=0;
	title="$STR_hc_hc";
	atomic=0;
	vocabulary="";
	class Items
	{
		class Move
		{
			title="$STR_MOVE";
			shortcuts[]={2};
			menu="RscHCMoveHigh";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Target
		{
			title="$STR_WATCH_TARGET";
			shortcuts[]={3};
			menu="#USER:HC_Targets_0";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Engage
		{
			title="$STR_WATCH";
			shortcuts[]={4};
			menu="RscHCWatchDir";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Speed
		{
			title="$STR_HC_MENU_SPEED";
			shortcuts[]={5};
			menu="RscHCSpeedMode";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Mission
		{
			title="$STR_HC_MENU_MISSION";
			shortcuts[]={6};
			menu="#USER:HC_Missions_0";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Action
		{
			title="$STR_ACTION";
			shortcuts[]={7};
			menu="#USER:HC_Custom_0";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class CombatMode
		{
			title="$STR_COMBAT_MODE";
			shortcuts[]={8};
			menu="RscHCCombatMode";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Formations
		{
			title="$STR_FORMATION";
			shortcuts[]={9};
			menu="RscHCFormations";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Team
		{
			title="$STR_TEAM";
			shortcuts[]={10};
			menu="RscHCTeam";
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Reply
		{
			title="$STR_REPLY";
			shortcuts[]={11};
			menu="RscHCReply";
			speechId=0;
		};
		class Back
		{
			title="";
			shortcuts[]=
			{
				"BACK"
			};
			command=-4;
			speechId=0;
		};
	};
};
class RscHCMoveHigh
{
	title="$STR_MOVE";
	access=0;
	atomic=0;
	vocabulary="";
	class Items
	{
		class NextWP
		{
			title="$STR_HC_MENU_NEXTWP";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'NEXTWP' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class CancelWP
		{
			title="$STR_HC_MENU_CANCELLASTWP";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'CANCELWP' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class CancelAllWPs
		{
			title="$STR_HC_MENU_CANCELALLWP";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'CANCELALLWP' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
			speechId=0;
		};
		class Back
		{
			title="";
			shortcuts[]=
			{
				"BACK"
			};
			command=-4;
			speechId=0;
		};
	};
};
class RscHCWatchDir
{
	title="$STR_WATCH";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class OpenFire
		{
			title="$STR_OPEN_FIRE";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'OPENFIRE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class HoldFire
		{
			title="$STR_HOLD_FIRE";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'HOLDFIRE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
	};
};
class RscHCCombatMode
{
	title="$STR_COMBAT_MODE";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Stealth
		{
			title="$STR_STEALTH";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'COMBAT_STEALTH' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Combat
		{
			title="$STR_COMBAT";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'COMBAT_DANGER' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Aware
		{
			title="$STR_AWARE";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'COMBAT_AWARE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Safe
		{
			title="$STR_SAFE";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'COMBAT_SAFE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
	};
};
class RscHCSpeedMode
{
	title="$STR_hc_menu_speed";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Limited
		{
			title="$STR_SPEED_LIMITED";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'SPEED_LIMITED' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Normal
		{
			title="$STR_SPEED_NORMAL";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'SPEED_NORMAL' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Full
		{
			title="$STR_SPEED_FULL";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'SPEED_FULL' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
	};
};
class RscHCFormations
{
	title="$STR_FORMATION";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Column
		{
			title="$STR_COLUMN";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'COLUMN' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class ColumnStag
		{
			title="$STR_STAGGERED";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'STAG COLUMN' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Wedge
		{
			title="$STR_WEDGE";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WEDGE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class EchelonL
		{
			title="$STR_ECHL";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'ECH LEFT' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class EchelonR
		{
			title="$STR_ECHR";
			shortcuts[]={6};
			command=-5;
			class Params
			{
				expression="'ECH RIGHT' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Vee
		{
			title="$STR_VEE";
			shortcuts[]={7};
			command=-5;
			class Params
			{
				expression="'VEE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Line
		{
			title="$STR_LINE";
			shortcuts[]={8};
			command=-5;
			class Params
			{
				expression="'LINE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class ColumnCompact
		{
			title="$STR_FILE";
			shortcuts[]={9};
			command=-5;
			class Params
			{
				expression="'FILE' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
		class Delta
		{
			title="$STR_DIAMOND";
			shortcuts[]={10};
			command=-5;
			class Params
			{
				expression="'DIAMOND' call BIS_HC_path_menu";
			};
			show="";
			enable="HCNotEmpty";
		};
	};
};
class RscHCTeam
{
	title="$STR_ASSIGN";
	vocabulary="";
	class items
	{
		class AssignRed
		{
			title="$STR_ASSIGN_RED";
			shortcuts[]={2};
			command="CMD_ASSIGN_RED";
			show="IsLeader";
			enable="NotEmpty";
			speechId=0;
		};
		class AssignGreen
		{
			title="$STR_ASSIGN_GREEN";
			shortcuts[]={3};
			command="CMD_ASSIGN_GREEN";
			show="IsLeader";
			enable="NotEmpty";
			speechId=0;
		};
		class AssignBlue
		{
			title="$STR_ASSIGN_BLUE";
			shortcuts[]={4};
			command="CMD_ASSIGN_BLUE";
			show="IsLeader";
			enable="NotEmpty";
			speechId=0;
		};
		class AssignYellow
		{
			title="$STR_ASSIGN_YELLOW";
			shortcuts[]={5};
			command="CMD_ASSIGN_YELLOW";
			show="IsLeader";
			enable="NotEmpty";
			speechId=0;
		};
		class AssignMain
		{
			title="$STR_ASSIGN_MAIN";
			shortcuts[]={6};
			command="CMD_ASSIGN_MAIN";
			show="IsLeader";
			enable="NotEmpty";
			speechId=0;
		};
		class SelectTeam
		{
			title="$STR_TEAM";
			shortcuts[]={10};
			menu="RscSelectTeam";
			show="IsLeader";
		};
	};
};
class RscHCSelectTeam
{
	title="$STR_TEAM";
	vocabulary="";
	class items
	{
		class TeamRed
		{
			title="$STR_TEAM_RED";
			shortcuts[]={2};
			command="CMD_TEAM_RED";
			show="IsLeader";
			enable="NotEmptyRedTeam";
		};
		class TeamGreen
		{
			title="$STR_TEAM_GREEN";
			shortcuts[]={3};
			command="CMD_TEAM_GREEN";
			show="IsLeader";
			enable="NotEmptyGreenTeam";
		};
		class TeamBlue
		{
			title="$STR_TEAM_BLUE";
			shortcuts[]={4};
			command="CMD_TEAM_BLUE";
			show="IsLeader";
			enable="NotEmptyBlueTeam";
		};
		class TeamYellow
		{
			title="$STR_TEAM_YELLOW";
			shortcuts[]={5};
			command="CMD_TEAM_YELLOW";
			show="IsLeader";
			enable="NotEmptyYellowTeam";
		};
		class TeamMain
		{
			title="$STR_TEAM_MAIN";
			shortcuts[]={6};
			command="CMD_TEAM_MAIN";
			show="IsLeader";
			enable="NotEmptyMainTeam";
		};
	};
};
class RscHCReply
{
	title="$STR_REPLY";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class SITREP
		{
			title="$STR_HC_MENU_SITREP";
			shortcuts[]={2};
			show="HCIsLeader";
			enable="HCNotEmpty";
			speechId=0;
			command=-5;
			class Params
			{
				expression="'SITREP' call BIS_HC_path_menu";
			};
		};
		class Communication
		{
			title="$STR_rscMenu.hppRscGroupRootMenu_Items_Communication0";
			shortcuts[]={9};
			menu="#User:BIS_MENU_GroupCommunication";
		};
		class UserRadio
		{
			title="$STR_RADIO_CUSTOM";
			shortcuts[]={10};
			menu="#CUSTOM_RADIO";
		};
		class Radio
		{
			title="$STR_RADIO";
			shortcuts[]={11};
			menu="RscRadio";
			enable="HasRadio";
		};
	};
};
class RscHCWPRootMenu
{
	access=0;
	title="";
	atomic=0;
	vocabulary="";
	class Items
	{
		class Type
		{
			title="$STR_DISP_ARCSENS_TYPE";
			shortcuts[]={2};
			menu="RscHCWPType";
			show="";
			enable="";
			speechId=0;
		};
		class CombatMode
		{
			title="$STR_COMBAT_MODE";
			shortcuts[]={3};
			menu="RscHCWPCombatMode";
			show="";
			enable="";
			speechId=0;
		};
		class Formations
		{
			title="$STR_FORMATION";
			shortcuts[]={4};
			menu="RscHCWPFormations";
			show="";
			enable="";
			speechId=0;
		};
		class Speed
		{
			title="$STR_HC_MENU_SPEED";
			shortcuts[]={5};
			menu="RscHCWPSpeedMode";
			show="";
			enable="";
			speechId=0;
		};
		class Wait
		{
			title="$STR_DISP_ARCWP_TIMEOUT";
			shortcuts[]={6};
			menu="RscHCWPWait";
			show="";
			enable="";
			speechId=0;
		};
		class WaitUntil
		{
			title="$STR_HC_MENU_WAITUNTIL";
			shortcuts[]={7};
			menu="#USER:HCWPWaitUntil";
			show="";
			enable="";
			speechId=0;
		};
		class WaitRadio
		{
			title="$STR_RADIO";
			shortcuts[]={8};
			menu="#USER:HCWPWaitRadio";
			show="";
			enable="";
			speechId=0;
		};
		class Separator1
		{
			title="";
			shortcuts[]={0};
			command=-1;
		};
		class CreateTask
		{
			title="$STR_HC_MENU_CREATETASK";
			shortcuts[]={9};
			command=-5;
			class Params
			{
				expression="'WP_CREATETASK' call BIS_HC_path_menu";
			};
			show="";
			enable="";
			speechId=0;
		};
		class Separator2
		{
			title="";
			shortcuts[]={0};
			command=-1;
		};
		class CancelWP
		{
			title="$STR_HC_MENU_CANCELWP";
			shortcuts[]={10};
			command=-5;
			class Params
			{
				expression="'WP_CANCELWP' call BIS_HC_path_menu";
			};
			show="";
			enable="";
			speechId=0;
		};
		class Back
		{
			title="";
			shortcuts[]={14};
			command=-4;
			speechId=0;
		};
	};
};
class RscHCWPType
{
	title="$STR_DISP_ARCSENS_TYPE";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Move
		{
			title="$STR_AC_MOVE";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_MOVE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Cycle
		{
			title="$STR_AC_CYCLE";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_CYCLE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class SAD
		{
			title="$STR_AC_SEEKANDDESTROY";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_SAD' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Guard
		{
			title="$STR_AC_GUARD";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_GUARD' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Separator1
		{
			title="";
			shortcuts[]={0};
			command=-1;
		};
		class Unload
		{
			title="$STR_AC_UNLOAD";
			shortcuts[]={6};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_UNLOAD' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Load
		{
			title="$STR_AC_LOAD";
			shortcuts[]={7};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_LOAD' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Separator2
		{
			title="";
			shortcuts[]={0};
			command=-1;
		};
		class GetOut
		{
			title="$STR_AC_GETOUT";
			shortcuts[]={8};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_GETOUT' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class GetIn
		{
			title="$STR_AC_GETIN";
			shortcuts[]={9};
			command=-5;
			class Params
			{
				expression="'WP_TYPE_GETIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
	};
};
class RscHCWPCombatMode
{
	title="$STR_COMBAT_MODE";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Stealth
		{
			title="$STR_STEALTH";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'WP_COMBAT_STEALTH' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Combat
		{
			title="$STR_COMBAT";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'WP_COMBAT_DANGER' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Aware
		{
			title="$STR_AWARE";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WP_COMBAT_AWARE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Safe
		{
			title="$STR_SAFE";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'WP_COMBAT_SAFE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Unchanged
		{
			title="$STR_COMBAT_UNCHANGED";
			shortcuts[]={11};
			command=-5;
			class Params
			{
				expression="'WP_COMBAT_UNCHANGED' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
	};
};
class RscHCWPFormations
{
	title="$STR_FORMATION";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Column
		{
			title="$STR_COLUMN";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'WP_COLUMN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class ColumnStag
		{
			title="$STR_STAGGERED";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'WP_STAG COLUMN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Wedge
		{
			title="$STR_WEDGE";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WP_WEDGE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class EchelonL
		{
			title="$STR_ECHL";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'WP_ECH LEFT' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class EchelonR
		{
			title="$STR_ECHR";
			shortcuts[]={6};
			command=-5;
			class Params
			{
				expression="'WP_ECH RIGHT' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Vee
		{
			title="$STR_VEE";
			shortcuts[]={7};
			command=-5;
			class Params
			{
				expression="'WP_VEE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Line
		{
			title="$STR_LINE";
			shortcuts[]={8};
			command=-5;
			class Params
			{
				expression="'WP_LINE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class ColumnCompact
		{
			title="$STR_FILE";
			shortcuts[]={9};
			command=-5;
			class Params
			{
				expression="'WP_FILE' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Delta
		{
			title="$STR_DIAMOND";
			shortcuts[]={10};
			command=-5;
			class Params
			{
				expression="'WP_DIAMOND' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Unchanged
		{
			title="$STR_COMBAT_UNCHANGED";
			shortcuts[]={11};
			command=-5;
			class Params
			{
				expression="'WP_UNCHANGED' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
	};
};
class RscHCWPSpeedMode
{
	title="$STR_hc_menu_speed";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class Limited
		{
			title="$STR_SPEED_LIMITED";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'WP_SPEED_LIMITED' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Normal
		{
			title="$STR_SPEED_NORMAL";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'WP_SPEED_NORMAL' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Full
		{
			title="$STR_SPEED_FULL";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WP_SPEED_FULL' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class Unchanged
		{
			title="$STR_SPEED_UNCHANGED";
			shortcuts[]={11};
			command=-5;
			class Params
			{
				expression="'WP_SPEED_UNCHANGED' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
	};
};
class RscHCWPWait
{
	title="$STR_DISP_ARCWP_TIMEOUT";
	access=0;
	atomic=0;
	vocabulary="";
	class items
	{
		class NoWait
		{
			title="$STR_HC_MENU_NOWAIT";
			shortcuts[]={2};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_NO' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 1min
		{
			title="$STR_hc_menu_wpwait1";
			shortcuts[]={3};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_1MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 5min
		{
			title="$STR_hc_menu_wpwait5";
			shortcuts[]={4};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_5MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 10min
		{
			title="$STR_hc_menu_wpwait10";
			shortcuts[]={5};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_10MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 15min
		{
			title="$STR_hc_menu_wpwait15";
			shortcuts[]={6};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_15MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 20min
		{
			title="$STR_hc_menu_wpwait20";
			shortcuts[]={7};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_20MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 25min
		{
			title="$STR_hc_menu_wpwait25";
			shortcuts[]={8};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_25MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 30min
		{
			title="$STR_hc_menu_wpwait30";
			shortcuts[]={9};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_30MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 45min
		{
			title="$STR_hc_menu_wpwait45";
			shortcuts[]={10};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_45MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
		class 60min
		{
			title="$STR_hc_menu_wpwait60";
			shortcuts[]={11};
			command=-5;
			class Params
			{
				expression="'WP_WAIT_60MIN' call BIS_HC_path_menu";
			};
			show="";
			enable="";
		};
	};
};
class RscDisplayDSinterface: RscStandardDisplay
{
	idd=155;
	movingEnable=0;
	onLoad="private [""_dummy""]; _dummy = [_this,""onload""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
	class ControlsBackground
	{
		class Mainback: RscPicture
		{
			idc=1100;
			x="SafeZoneX";
			y="SafeZoneY";
			w="SafeZoneW";
			h="SafeZoneH";
			text="#(argb,8,8,3)color(0.2275,0.2078,0.2078,1)";
		};
		class EditProfileTitleBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
		};
		class PlayersListBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(70.5/100)	* SafeZoneH";
		};
		class MissionsListBorder: RscText
		{
			style=64;
			colorText[]={0,0,0,1};
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(15/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(70.5/100)	* SafeZoneH";
		};
		class CA_PasswordText: RscText
		{
			idc=1211;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(13/100)	* SafeZoneW";
			h="(4/100)	* SafeZoneH";
			text="$STR_DISP_PASSWORD";
		};
		class CA_EditPassword: RscEdit
		{
			idc=1113;
			style=0;
			x="(15/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			h="(4/100)	* SafeZoneH";
		};
		class CA_B_Login: RscShortcutButton
		{
			idc=1122;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""login""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(32/100)	* SafeZoneW + SafeZoneX";
			y="(8/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_LOGIN";
			default=0;
		};
		class CA_MissionListText: RscText
		{
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(4/100)	* SafeZoneH";
			text="$STR_DISP_MP_DS_MISSIONS";
		};
		class CA_B_Vote_kick: RscShortcutButton
		{
			idc=1116;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_kick""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(02.75/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_VOTE_KICK";
			default=0;
		};
		class CA_B_Vote_admin: RscShortcutButton
		{
			idc=1118;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_admin""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(27/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_VOTE_ADMIN";
			default=0;
		};
		class CA_B_Play_Vote_Mission: RscShortcutButton
		{
			idc=1229;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_mission""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(8/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_PLAY_MISSION";
			default=0;
		};
		class CA_B_Vote_Missions: RscShortcutButton
		{
			idc=1222;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_missions""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_MISSIONS";
			default=0;
		};
		class CA_B_Vote_Reassign: RscShortcutButton
		{
			idc=1156;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_reassign""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_REASSIGN";
			default=0;
		};
		class CA_B_Vote_Restart: RscShortcutButton
		{
			idc=1119;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""vote_restart""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(77/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_RESTART";
			default=0;
		};
	};
	class Controls
	{
		class CA_B_Logout: RscShortcutButton
		{
			idc=1252;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""logout""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(32/100)	* SafeZoneW + SafeZoneX";
			y="(8/100)	* SafeZoneH + SafeZoneY";
			w="(15/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_LOGOUT";
			default=0;
		};
		class CA_B_Kick: RscShortcutButton
		{
			idc=1216;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""Kick""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(02.75/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_KICK";
			default=0;
		};
		class CA_B_Ban: RscShortcutButton
		{
			idc=1217;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""ban""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(02.75/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_BAN";
			default=0;
		};
		class CA_B_Shutdown: RscShortcutButton
		{
			idc=1221;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""shutdown""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(27/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_SHUTDOWN";
			default=0;
		};
		class CA_B_Play_Mission: RscShortcutButton
		{
			idc=1120;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""mission""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(70/100)	* SafeZoneW + SafeZoneX";
			y="(8/100)	* SafeZoneH + SafeZoneY";
			w="(25/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_PLAY_MISSION";
			default=0;
		};
		class CA_B_Missions: RscShortcutButton
		{
			idc=1127;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""missions""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_MISSIONS";
			default=0;
		};
		class CA_B_Reassign: RscShortcutButton
		{
			idc=1149;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""reassign""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_REASSIGN";
			default=0;
		};
		class CA_B_Restart: RscShortcutButton
		{
			idc=1145;
			onButtonClick="private [""_dummy""]; _dummy = [_this,""restart""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			x="(77/100)	* SafeZoneW + SafeZoneX";
			y="(87/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			text="$STR_DISP_MP_DS_RESTART";
			default=0;
		};
		class CA_AdminText: RscText
		{
			idc=1111;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(10/100)	* SafeZoneH + SafeZoneY";
			w="(28/100)	* SafeZoneW";
			h="(4/100)	* SafeZoneH";
			text="$STR_DISP_MP_DS_LOGGED_IN";
		};
		class MovingBar: RscPicture
		{
			moving=1;
			x=0.145;
			y=0.032000002;
			w=0.722;
			h=0.074000001;
			text="#(argb,8,8,3)color(0,0,0,0)";
			colortext[]={1,1,1,0};
		};
		class DummyBar: RscPicture
		{
			idc=1352;
			x=0.025;
			y=0.145;
			w=0.07;
			h=0.07;
			text="#(argb,8,8,3)color(0,0,0,0)";
			colortext[]={1,1,1,0};
		};
		class CA_EditProfileTitle: CA_Title
		{
			idc=1112;
			style=2;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(02/100)	* SafeZoneH + SafeZoneY";
			w="(96/100)	* SafeZoneW";
			h="(06/100)	* SafeZoneH";
			colorBackground[]=
			{
				"49/255",
				"36/255",
				"25/255",
				"173/255"
			};
			text="$STR_DISP_MP_DS_TITLE";
		};
		class CA_Playerslist: RscIGUIListBox
		{
			idc=101;
			onLBSelChanged="private [""_dummy""]; _dummy = [_this,""players""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
			style=16;
			x="(02/100)	* SafeZoneW + SafeZoneX";
			y="(15.5/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(69.5/100)	* SafeZoneH";
			rowHeight=0.043909099;
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class CA_MissionsList: RscIGUIListBox
		{
			idc=102;
			style=16;
			x="(52/100)	* SafeZoneW + SafeZoneX";
			y="(15.5/100)	* SafeZoneH + SafeZoneY";
			w="(46/100)	* SafeZoneW";
			h="(69.5/100)	* SafeZoneH";
			color[]={1,1,1,1};
			colorSelect[]={1,1,0,1};
			colorSelectBackground[]={0.2,0.2,0.2,1};
			colorSelectBackground2[]={0.1,0.1,0.1,1};
		};
		class CA_B_Cancel: RscShortcutButton
		{
			idc=2;
			x="(77/100)	* SafeZoneW + SafeZoneX";
			y="(93/100)	* SafeZoneH + SafeZoneY";
			w="(20/100)	* SafeZoneW";
			default=0;
			text="$STR_DISP_CLOSE";
		};
	};
};
class CfgCoreData
{
	forceArrowModel="ca\ui\force.p3d";
};
class CfgNonAIVehicles
{
	class Camera
	{
		crossHairs="\ca\ui\data\krizek.paa";
	};
};
class CfgVehicleIcons
{
	iconObject="\ca\ui\data\iconobject_ca.paa";
	iconLogic="\ca\ui\data\iconlogic_ca.paa";
	iconVehicle="\ca\ui\data\iconvehicle_ca.paa";
	iconCar="\ca\ui\data\iconcar_ca.paa";
	iconMotorcycle="\ca\ui\data\iconcar_ca.paa";
	iconTank="\ca\ui\data\icontank_ca.paa";
	iconAPC="\ca\ui\data\iconapc_ca.paa";
	iconMan="\ca\ui\data\iconman_ca.paa";
	iconAir="\ca\ui\data\iconhelicopter_ca.paa";
	iconHelicopter="\ca\ui\data\iconhelicopter_ca.paa";
	iconPlane="\ca\ui\data\iconplane_ca.paa";
	iconShip="\ca\ui\data\iconship_ca.paa";
	iconParachute="\ca\ui\data\iconparachute_ca.paa";
	iconStaticObject="\ca\ui\data\iconobject_ca.paa";
	iconThing="\ca\ui\data\iconobject_ca.paa";
	iconLaserTarget="\ca\ui\data\iconobject_ca.paa";
	iconPaperCar="\ca\ui\data\iconpapercar_ca.paa";
	pictureLogic="\ca\ui\data\picturelogic_ca.paa";
	pictureParachute="\ca\ui\data\pictureparachute_ca.paa";
	pictureLaserTarget="\ca\ui\data\picturelogic_ca.paa";
	picturePaperCar="\ca\ui\data\picturepapercar_ca.paa";
	pictureStaticObject="\ca\ui\data\picturelogic_ca.paa";
	pictureThing="\ca\ui\data\picturelogic_ca.paa";
};
class CfgMarkers
{
	class Flag
	{
		name="$STR_CFG_MARKERS_FLAG";
		icon="\ca\ui\data\markers\gr_mission_CA.paa";
		color[]={1,0,0,1};
		size=32;
		shadow=1;
		scope=0;
	};
	class Flag1: Flag
	{
		name="$STR_CFG_MARKERS_FLAG1";
		icon="\ca\ui\data\markers\gr_flag_CA.paa";
		color[]={1,0,0,1};
	};
	class Dot: Flag
	{
		name="$STR_CFG_MARKERS_DOT";
		icon="\ca\ui\data\markers\gr_marker_dot_CA.paa";
		color[]={1,0,0,1};
	};
	class Destroy: Flag
	{
		name="$STR_CFG_MARKERS_DESTROY";
		icon="\ca\ui\data\markers\gr_marker_cross_CA.paa";
		color[]={1,0,0,1};
	};
	class Start: Flag
	{
		name="$STR_CFG_MARKERS_START";
		icon="\ca\ui\data\markers\gr_start_point_CA.paa";
		color[]={0,1,0,1};
	};
	class End: Flag
	{
		name="$STR_CFG_MARKERS_END";
		icon="\ca\ui\data\markers\gr_end_point_CA.paa";
		color[]={0,0,0,1};
	};
	class Warning: Flag
	{
		name="$STR_CFG_MARKERS_WARNING";
		icon="\ca\ui\data\markers\gr_warning_CA.paa";
		color[]={0,0,0,1};
	};
	class Join: Flag
	{
		name="$STR_CFG_MARKERS_JOIN";
		icon="\ca\ui\data\markers\gr_join_CA.paa";
		color[]={0,0,0,1};
	};
	class Pickup: Flag
	{
		name="$STR_CFG_MARKERS_PICKUP";
		icon="\ca\ui\data\markers\gr_pickup_CA.paa";
		color[]={0,0,0,1};
	};
	class Unknown: Flag
	{
		name="$STR_CFG_MARKERS_UNKNOWN";
		icon="\ca\ui\data\marker_question_ca.paa";
		color[]={0,0,0,1};
	};
	class Marker: Flag
	{
		name="$STR_CFG_MARKERS_MARKER";
		icon="\ca\ui\data\markers\gr_marker_CA.paa";
		color[]={0,0,0,1};
	};
	class Arrow: Flag
	{
		name="$STR_CFG_MARKERS_ARROW";
		icon="\ca\ui\data\markers\gr_arrow_CA.paa";
		color[]={1,0,0,1};
	};
	class mil_objective: Flag
	{
		name="$STR_CFG_MARKERS_FLAG";
		icon="\ca\ui\data\markers\gr_mission_CA.paa";
		color[]={0,0,0,1};
		size=32;
		shadow=1;
		scope=1;
	};
	class mil_marker: mil_objective
	{
		name="$STR_CFG_MARKERS_MARKER";
		icon="\ca\ui\data\markers\gr_marker_CA.paa";
	};
	class mil_flag: mil_objective
	{
		name="$STR_CFG_MARKERS_FLAG1";
		icon="\ca\ui\data\markers\gr_flag_CA.paa";
	};
	class mil_arrow: mil_objective
	{
		name="$STR_CFG_MARKERS_ARROW";
		icon="\ca\ui\data\markers\gr_arrow_CA.paa";
		color[]={1,0,0,1};
		shadow=0;
	};
	class mil_arrow2: mil_objective
	{
		name="$STR_CFG_MARKERS_ARROW2";
		icon="\ca\ui\data\markers\gr_arrow2_CA.paa";
		color[]={1,0,0,1};
		shadow=0;
	};
	class mil_ambush: mil_objective
	{
		name="$STR_CFG_MARKERS_AMBUSH";
		icon="\ca\ui\data\markers\gr_ambush_CA.paa";
		color[]={1,0,0,1};
	};
	class mil_destroy: mil_objective
	{
		name="$STR_CFG_MARKERS_DESTROY";
		icon="\ca\ui\data\markers\gr_marker_cross_CA.paa";
		color[]={1,0,0,1};
	};
	class mil_start: mil_objective
	{
		name="$STR_CFG_MARKERS_START";
		icon="\ca\ui\data\markers\gr_start_point_CA.paa";
	};
	class mil_end: mil_objective
	{
		name="$STR_CFG_MARKERS_END";
		icon="\ca\ui\data\markers\gr_end_point_CA.paa";
	};
	class mil_pickup: mil_objective
	{
		name="$STR_CFG_MARKERS_PICKUP";
		icon="\ca\ui\data\markers\gr_pickup_CA.paa";
	};
	class mil_join: mil_objective
	{
		name="$STR_CFG_MARKERS_JOIN";
		icon="\ca\ui\data\markers\gr_join_CA.paa";
	};
	class mil_warning: mil_objective
	{
		name="$STR_CFG_MARKERS_WARNING";
		icon="\ca\ui\data\markers\gr_warning_CA.paa";
	};
	class mil_unknown: mil_objective
	{
		name="$STR_CFG_MARKERS_UNKNOWN";
		icon="\ca\ui\data\markers\gr_unknown_CA.paa";
	};
	class mil_circle: mil_objective
	{
		name="$STR_CFG_MARKERS_CIRCLE";
		icon="\ca\ui\data\markers\gr_marker_circle_CA.paa";
	};
	class mil_dot: mil_objective
	{
		name="$STR_CFG_MARKERS_DOT";
		icon="\ca\ui\data\markers\gr_marker_dot_CA.paa";
	};
	class mil_box: mil_objective
	{
		name="$STR_CFG_MARKERS_BOX";
		icon="\ca\ui\data\markers\gr_marker_box_CA.paa";
	};
	class mil_triangle: mil_objective
	{
		name="$STR_CFG_MARKERS_TRIANGLE";
		icon="\ca\ui\data\markers\gr_marker_triangle_CA.paa";
	};
	class hd_objective: Flag
	{
		name="$STR_CFG_MARKERS_FLAG";
		icon="\ca\ui\data\markers\hd_mission_CA.paa";
		color[]={0,0,0,1};
		size=32;
		shadow=1;
		scope=2;
	};
	class hd_flag: hd_objective
	{
		name="$STR_CFG_MARKERS_FLAG1";
		icon="\ca\ui\data\markers\hd_flag_CA.paa";
	};
	class hd_arrow: hd_objective
	{
		name="$STR_CFG_MARKERS_ARROW";
		icon="\ca\ui\data\markers\hd_arrow_CA.paa";
		color[]={1,0,0,1};
		shadow=0;
	};
	class hd_ambush: hd_objective
	{
		name="$STR_CFG_MARKERS_AMBUSH";
		icon="\ca\ui\data\markers\hd_ambush_CA.paa";
		color[]={1,0,0,1};
	};
	class hd_destroy: hd_objective
	{
		name="$STR_CFG_MARKERS_DESTROY";
		icon="\ca\ui\data\markers\hd_marker_cross_CA.paa";
		color[]={1,0,0,1};
	};
	class hd_start: hd_objective
	{
		name="$STR_CFG_MARKERS_START";
		icon="\ca\ui\data\markers\hd_start_point_CA.paa";
	};
	class hd_end: hd_objective
	{
		name="$STR_CFG_MARKERS_END";
		icon="\ca\ui\data\markers\hd_end_point_CA.paa";
	};
	class hd_pickup: hd_objective
	{
		name="$STR_CFG_MARKERS_PICKUP";
		icon="\ca\ui\data\markers\hd_pickup_CA.paa";
	};
	class hd_join: hd_objective
	{
		name="$STR_CFG_MARKERS_JOIN";
		icon="\ca\ui\data\markers\hd_join_CA.paa";
	};
	class hd_warning: hd_objective
	{
		name="$STR_CFG_MARKERS_WARNING";
		icon="\ca\ui\data\markers\hd_warning_CA.paa";
	};
	class hd_unknown: hd_objective
	{
		name="$STR_CFG_MARKERS_UNKNOWN";
		icon="\ca\ui\data\markers\hd_unknown_CA.paa";
	};
	class hd_dot: hd_objective
	{
		name="$STR_CFG_MARKERS_DOT";
		icon="\ca\ui\data\markers\hd_marker_dot_CA.paa";
	};
	class Empty
	{
		name="$STR_CFG_MARKERS_EMPTY";
		icon="\ca\ui\data\marker_empty_ca.paa";
		color[]={0.2,0.1,0.40000001,1};
		size=0;
		scope=1;
		shadow=1;
	};
	class Select: Flag
	{
		name="$STR_CFG_MARKERS_SELECT";
		icon="\ca\ui\data\map_player_ca.paa";
		color[]={1,0,0,1};
		scope=1;
		shadow=0;
	};
	class SC_flag_0_east
	{
		name="";
		icon="\ca\ui\data\markers\sc_marker_flag_e_CA.paa";
		color[]={1,1,1,1};
		size=32;
		scope=0;
		shadow=1;
	};
	class SC_flag_0_west: SC_flag_0_east
	{
		name="";
		icon="\ca\ui\data\markers\sc_marker_flag_w_CA.paa";
	};
	class SC_flag_1_east: SC_flag_0_east
	{
		name="";
		icon="\ca\ui\data\markers\sc_marker_flagC_e_CA.paa";
	};
	class SC_flag_1_west: SC_flag_0_east
	{
		name="";
		icon="\ca\ui\data\markers\sc_marker_flagC_w_CA.paa";
	};
	class NATO_base: Flag
	{
		name="NATO_base";
		icon="\ca\ui\data\markers\b_hq.paa";
		color[]={0,0,0,1};
		size=29;
		shadow=0;
		scope=1;
	};
	class b_empty: NATO_base
	{
		name="BLUFOR - Empty";
		icon="\ca\ui\data\markers\b_unknown.paa";
		side=1;
		color[]={0,0,1,1};
	};
	class o_empty: NATO_base
	{
		name="OPFOR - Empty";
		icon="\ca\ui\data\markers\o_unknown.paa";
		side=0;
		color[]={1,0,0,1};
	};
	class n_empty: NATO_base
	{
		name="Neutral - Empty";
		icon="\ca\ui\data\markers\n_unknown.paa";
		side=1;
	};
	class b_unknown: NATO_base
	{
		name="BLUFOR - Unknown";
		icon="\ca\ui\data\markers\b_unknown.paa";
		side=1;
		color[]={0,0,1,1};
		size=6;
	};
	class o_unknown: NATO_base
	{
		name="OPFOR - Unknown";
		icon="\ca\ui\data\markers\o_unknown.paa";
		side=0;
		color[]={1,0,0,1};
		size=6;
	};
	class n_unknown: NATO_base
	{
		name="Neutral - Unknown";
		icon="\ca\ui\data\markers\n_unknown.paa";
		side=1;
		size=6;
	};
	class b_inf: b_empty
	{
		name="BLUFOR - Infantry";
		icon="\ca\ui\data\markers\b_inf.paa";
	};
	class o_inf: b_inf
	{
		name="OPFOR - Infantry";
		icon="\ca\ui\data\markers\o_inf.paa";
	};
	class n_inf: b_inf
	{
		name="Neutral - Infantry";
		icon="\ca\ui\data\markers\n_inf.paa";
	};
	class b_motor_inf: b_empty
	{
		name="BLUFOR - Motorized Infantry";
		icon="\ca\ui\data\markers\b_motor_inf.paa";
	};
	class o_motor_inf: b_motor_inf
	{
		name="OPFOR - Motorized Infantry";
		icon="\ca\ui\data\markers\o_motor_inf.paa";
	};
	class n_motor_inf: b_motor_inf
	{
		name="Neutral - Motorized Infantry";
		icon="\ca\ui\data\markers\n_motor_inf.paa";
	};
	class b_mech_inf: b_empty
	{
		name="BLUFOR - Mechanized Infantry";
		icon="\ca\ui\data\markers\b_mech_inf.paa";
	};
	class o_mech_inf: b_mech_inf
	{
		name="OPFOR - Mechanized Infantry";
		icon="\ca\ui\data\markers\o_mech_inf.paa";
	};
	class n_mech_inf: b_mech_inf
	{
		name="Neutral - Mechanized Infantryf";
		icon="\ca\ui\data\markers\n_mech_inf.paa";
	};
	class b_armor: b_empty
	{
		name="BLUFOR - Armor";
		icon="\ca\ui\data\markers\b_armor.paa";
	};
	class o_armor: b_armor
	{
		name="OPFOR - Armor";
		icon="\ca\ui\data\markers\o_armor.paa";
	};
	class n_armor: b_armor
	{
		name="Neutral - Armor";
		icon="\ca\ui\data\markers\n_armor.paa";
	};
	class b_recon: b_empty
	{
		name="BLUFOR - Recon";
		icon="\ca\ui\data\markers\b_recon.paa";
	};
	class o_recon: b_recon
	{
		name="OPFOR - Recon";
		icon="\ca\ui\data\markers\o_recon.paa";
	};
	class n_recon: b_recon
	{
		name="Neutral - Recon";
		icon="\ca\ui\data\markers\n_recon.paa";
	};
	class b_air: b_empty
	{
		name="BLUFOR - Helicopter";
		icon="\ca\ui\data\markers\b_air.paa";
	};
	class o_air: b_air
	{
		name="OPFOR - Helicopter";
		icon="\ca\ui\data\markers\o_air.paa";
	};
	class n_air: b_air
	{
		name="Neutral - Helicopter";
		icon="\ca\ui\data\markers\n_air.paa";
	};
	class b_plane: b_empty
	{
		name="BLUFOR - Plane";
		icon="\ca\ui\data\markers\b_plane.paa";
	};
	class o_plane: b_plane
	{
		name="OPFOR - Plane";
		icon="\ca\ui\data\markers\o_plane.paa";
	};
	class n_plane: b_plane
	{
		name="Neutral - Plane";
		icon="\ca\ui\data\markers\n_plane.paa";
	};
	class b_uav: b_empty
	{
		name="BLUFOR - UAV";
		icon="\ca\ui\data\markers\b_uav.paa";
	};
	class o_uav: b_uav
	{
		name="OPFOR - UAV";
		icon="\ca\ui\data\markers\o_uav.paa";
	};
	class n_uav: b_uav
	{
		name="Neutral - UAV";
		icon="\ca\ui\data\markers\n_uav.paa";
	};
	class b_med: b_empty
	{
		name="BLUFOR - Medical";
		icon="\ca\ui\data\markers\b_med.paa";
	};
	class o_med: b_med
	{
		name="OPFOR - Medical";
		icon="\ca\ui\data\markers\o_med.paa";
	};
	class n_med: b_med
	{
		name="Neutral - Medical";
		icon="\ca\ui\data\markers\n_med.paa";
	};
	class b_art: b_empty
	{
		name="BLUFOR - Artillery";
		icon="\ca\ui\data\markers\b_art.paa";
	};
	class o_art: b_art
	{
		name="OPFOR - Artillery";
		icon="\ca\ui\data\markers\o_art.paa";
	};
	class n_art: b_art
	{
		name="Neutral - Artillery";
		icon="\ca\ui\data\markers\n_art.paa";
	};
	class x_art: b_art
	{
		name="Artillery symbol";
		icon="\ca\ui\data\markers\x_art.paa";
	};
	class b_mortar: b_empty
	{
		name="BLUFOR - Mortar";
		icon="\ca\ui\data\markers\b_mortar.paa";
	};
	class o_mortar: b_mortar
	{
		name="OPFOR - Mortar";
		icon="\ca\ui\data\markers\o_mortar.paa";
	};
	class n_mortar: b_mortar
	{
		name="Neutral - Mortar";
		icon="\ca\ui\data\markers\n_mortar.paa";
	};
	class x_mortar: b_mortar
	{
		name="Mortat symbol";
		icon="\ca\ui\data\markers\x_mortar.paa";
	};
	class b_hq: b_empty
	{
		name="BLUFOR - HQ";
		icon="\ca\ui\data\markers\b_hq.paa";
	};
	class o_hq: b_hq
	{
		name="OPFOR - HQ";
		icon="\ca\ui\data\markers\o_hq.paa";
	};
	class n_hq: b_hq
	{
		name="Neutral - HQ";
		icon="\ca\ui\data\markers\n_hq.paa";
	};
	class b_support: b_empty
	{
		name="BLUFOR - Support";
		icon="\ca\ui\data\markers\b_support.paa";
	};
	class o_support: o_empty
	{
		name="OPFOR - Support";
		icon="\ca\ui\data\markers\o_support.paa";
	};
	class n_support: n_empty
	{
		name="Neutral - Support";
		icon="\ca\ui\data\markers\n_support.paa";
	};
	class b_maint: b_empty
	{
		name="BLUFOR - Maintenance";
		icon="\ca\ui\data\markers\b_maint.paa";
	};
	class o_maint: o_empty
	{
		name="OPFOR - Maintenance";
		icon="\ca\ui\data\markers\o_maint.paa";
	};
	class n_maint: n_empty
	{
		name="Neutral - Maintenance";
		icon="\ca\ui\data\markers\n_maint.paa";
	};
	class b_service: b_empty
	{
		name="BLUFOR - Service";
		icon="\ca\ui\data\markers\b_service.paa";
	};
	class o_service: o_empty
	{
		name="OPFOR - Service";
		icon="\ca\ui\data\markers\o_service.paa";
	};
	class n_service: n_empty
	{
		name="Neutral - Service";
		icon="\ca\ui\data\markers\n_service.paa";
	};
	class group_0: NATO_base
	{
		name="Group size - Fire Team";
		icon="\ca\ui\data\markers\group_0.paa";
	};
	class group_1: group_0
	{
		name="Group size - Section";
		icon="\ca\ui\data\markers\group_1.paa";
	};
	class group_2: group_0
	{
		name="Group size - Section";
		icon="\ca\ui\data\markers\group_2.paa";
	};
	class group_3: group_0
	{
		name="Group size - Platoon";
		icon="\ca\ui\data\markers\group_3.paa";
	};
	class group_4: group_0
	{
		name="Group size - Company";
		icon="\ca\ui\data\markers\group_4.paa";
	};
	class group_5: group_0
	{
		name="Group size - Battalion";
		icon="\ca\ui\data\markers\group_5.paa";
	};
	class group_6: group_0
	{
		name="Group size - Regiment";
		icon="\ca\ui\data\markers\group_6.paa";
	};
	class group_7: group_0
	{
		name="Group size - Brigade";
		icon="\ca\ui\data\markers\group_7.paa";
	};
	class group_8: group_0
	{
		name="Group size - Division";
		icon="\ca\ui\data\markers\group_8.paa";
	};
	class group_9: group_0
	{
		name="Group size - Corps";
		icon="\ca\ui\data\markers\group_9.paa";
	};
	class group_10: group_0
	{
		name="Group size - Army";
		icon="\ca\ui\data\markers\group_10.paa";
	};
	class group_11: group_0
	{
		name="Group size - Army Group";
		icon="\ca\ui\data\markers\group_11.paa";
	};
	class waypoint
	{
		name="Waypoint";
		icon="\ca\ui\data\markers\waypoint.paa";
		color[]={0,0,0,1};
		shadow=0;
		scope=1;
		size=29;
	};
	class selector_selectable: NATO_base
	{
		name="Selector - Selectable";
		icon="\ca\ui\data\markers\selector_selectable_ca.paa";
	};
	class selector_selectedEnemy: NATO_base
	{
		name="Selector - Selected Enemy";
		icon="\ca\ui\data\markers\selector_selectedEnemy_ca.paa";
	};
	class selector_selectedFriendly: NATO_base
	{
		name="Selector - Selected Friendly";
		icon="\ca\ui\data\markers\selector_selectedFriendly_ca.paa";
	};
	class selector_selectedMission: NATO_base
	{
		name="Selector - Selected Mission";
		icon="\ca\ui\data\markers\selector_selectedMission_ca.paa";
	};
	class HQ: Flag
	{
		name="H.Q.";
		icon="\ca\modules\strat_layer\data\loc_hq_ca.paa";
		color[]={0,0,0,1};
		size=24;
		shadow=0;
		scope=1;
	};
	class FOB: HQ
	{
		name="F.O.B.";
		icon="\ca\modules\strat_layer\data\loc_fob_ca.paa";
	};
	class Airport: HQ
	{
		name="$STR_SRL_AIRPORT";
		icon="\ca\modules\strat_layer\data\loc_airport_ca.paa";
	};
	class Heliport: HQ
	{
		name="$STR_SRL_HELIPORT";
		icon="\ca\modules\strat_layer\data\loc_heliport_ca.paa";
	};
	class Artillery: HQ
	{
		name="$STR_SRL_ARTILLERY";
		icon="\ca\modules\strat_layer\data\loc_artillery_ca.paa";
	};
	class AntiAir: HQ
	{
		name="$STR_SRL_ANTIAIR";
		icon="\ca\modules\strat_layer\data\loc_antiair_ca.paa";
	};
	class City: HQ
	{
		name="$STR_SRL_CITY";
		icon="\ca\modules\strat_layer\data\loc_city_ca.paa";
	};
	class Strongpoint: HQ
	{
		name="$STR_SRL_STRONGPOINT";
		icon="\ca\modules\strat_layer\data\loc_strongpoint_ca.paa";
	};
	class Depot: HQ
	{
		name="$STR_SRL_DEPOT";
		icon="\ca\modules\strat_layer\data\loc_depot_ca.paa";
	};
	class FireMission: Flag
	{
		scope=0;
		name="$STRWFFIREMISSION";
		icon="\CA\Warfare2\Images\wf_map_fire.paa";
		color[]={1,0,0,1};
		size=32;
	};
	class AirTeam: Flag
	{
		scope=0;
		name="$STRWFAIRTEAM";
		icon="\CA\Warfare2\Images\wf_team_air.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class CommandTeam: Flag
	{
		scope=0;
		name="$STRWFCOMMANDTEAM";
		icon="\CA\Warfare2\Images\wf_team_command.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Headquarters: Flag
	{
		scope=0;
		name="$STRWFHEADQUARTERS";
		icon="\CA\Warfare2\Images\wf_team_command2.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class HeavyTeam: Flag
	{
		scope=0;
		name="$STRWFHEAVYTEAM";
		icon="\CA\Warfare2\Images\wf_team_heavy.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class InfantryTeam: Flag
	{
		scope=0;
		name="$STRWFINFANTRYTEAM";
		icon="\CA\Warfare2\Images\wf_team_infantry.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class LightTeam: Flag
	{
		scope=0;
		name="$STRWFLIGHTTEAM";
		icon="\CA\Warfare2\Images\wf_team_light.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Attack: Flag
	{
		scope=0;
		name="$STRWFATTACK";
		icon="\CA\Warfare2\Images\Marker_Attack.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Move: Flag
	{
		scope=0;
		name="$STRWFMOVE";
		icon="\CA\Warfare2\Images\Marker_Move.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Defend: Flag
	{
		scope=0;
		name="$STRWFDEFEND";
		icon="\CA\Warfare2\Images\Marker_Defend.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Vehicle: Flag
	{
		scope=0;
		name="$STRWFVEHICLE";
		icon="\CA\Warfare2\Images\Marker_Vehicle.paa";
		color[]={0,1,0,1};
		size=6;
	};
	class DestroyedVehicle: Flag
	{
		scope=0;
		name="$STRWFDESTROYEDVEHICLE";
		icon="\CA\Warfare2\Images\Marker_DestroyedVehicle.paa";
		color[]={0,1,0,1};
		size=8;
	};
	class RepairVehicle: Flag
	{
		scope=0;
		name="$STRWFREPAIR";
		icon="\CA\Warfare2\Images\Marker_RepairVehicle.paa";
		color[]={0,1,0,1};
		size=6;
	};
	class SalvageVehicle: Flag
	{
		scope=0;
		name="$STRWFSALVAGE";
		icon="\CA\Warfare2\Images\Marker_SalvageVehicle.paa";
		color[]={0,1,0,1};
		size=6;
	};
	class SupplyVehicle: Flag
	{
		scope=0;
		name="$STRWFSUPPLY";
		icon="\CA\Warfare2\Images\Marker_SupplyVehicle.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Town: Flag
	{
		scope=0;
		name="$STRWFTOWN";
		icon="\CA\Warfare2\Images\wf_city_flag.paa";
		color[]={0,1,0,1};
		size=32;
	};
	class Camp: Flag
	{
		scope=0;
		name="$STRWFCAMP";
		icon="\CA\Warfare2\Images\city_small_ca.paa";
		color[]={0,1,0,1};
		size=32;
	};
};
class CfgMarkerColors
{
	class Default
	{
		name="$STR_CFG_MARKERCOL_DEFAULT";
		color[]={0,0,0,1};
		scope=2;
	};
	class ColorBlack: Default
	{
		name="$STR_CFG_MARKERCOL_BLACK";
		color[]={0,0,0,1};
	};
	class ColorRed: Default
	{
		name="$STR_CFG_MARKERCOL_RED";
		color[]={0.89999998,0,0,1};
	};
	class ColorGreen: Default
	{
		name="$STR_CFG_MARKERCOL_GREEN";
		color[]={0,0.80000001,0,1};
	};
	class ColorBlue: Default
	{
		name="$STR_CFG_MARKERCOL_BLUE";
		color[]={0,0,1,1};
	};
	class ColorYellow: Default
	{
		name="$STR_CFG_MARKERCOL_YELLOW";
		color[]={0.85000002,0.85000002,0,1};
	};
	class ColorOrange: Default
	{
		name="$STR_CFG_MARKERCOL_ORANGE";
		color[]={0.85000002,0.40000001,0,1};
	};
	class ColorWhite: Default
	{
		name="$STR_CFG_MARKERCOL_WHITE";
		color[]={1,1,1,1};
	};
	class ColorPink: Default
	{
		name="Pink";
		color[]={1,0.30000001,0.40000001,1};
		scope=1;
	};
	class ColorBrown: Default
	{
		name="Brown";
		color[]={0.5,0.25,0,1};
		scope=1;
	};
	class ColorKhaki: Default
	{
		name="Khaki";
		color[]={0.5,0.60000002,0.40000001,1};
		scope=1;
	};
	class ColorRedAlpha: Default
	{
		name="$STR_CFG_MARKERCOL_REDALPHA";
		color[]={1,0,0,0.5};
		scope=1;
	};
	class ColorGreenAlpha: Default
	{
		name="$STR_CFG_MARKERCOL_GREENALPHA";
		color[]={0,1,0,0.5};
		scope=1;
	};
};
class CfgMarkerBrushes
{
	class Solid
	{
		name="$STR_CFG_MARKERBR_SOLID";
		texture="";
		drawBorder=0;
		scope=2;
	};
	class Horizontal: Solid
	{
		name="$STR_CFG_MARKERBR_HORIZONTAL";
		texture="\ca\ui\data\marker_brush_horizontal_ca.paa";
	};
	class Vertical: Solid
	{
		name="$STR_CFG_MARKERBR_VERTICAL";
		texture="\ca\ui\data\marker_brush_vertical_ca.paa";
	};
	class Grid: Solid
	{
		name="$STR_CFG_MARKERBR_GRID";
		texture="\ca\ui\data\marker_brush_grid_ca.paa";
	};
	class FDiagonal: Solid
	{
		name="$STR_CFG_MARKERBR_FDIAGONAL";
		texture="\ca\ui\data\marker_brush_fdiagonal_ca.paa";
	};
	class BDiagonal: Solid
	{
		name="$STR_CFG_MARKERBR_BDIAGONAL";
		texture="\ca\ui\data\marker_brush_bdiagonal_ca.paa";
	};
	class DiagGrid: Solid
	{
		name="$STR_CFG_MARKERBR_DIAGGRID";
		texture="\ca\ui\data\marker_brush_diaggrid_ca.paa";
	};
	class Cross: Solid
	{
		name="$STR_CFG_MARKERBR_CROSS";
		texture="\ca\ui\data\marker_brush_cross_ca.paa";
	};
	class Border: Solid
	{
		name="Border";
		texture="#(argb,8,8,3)color(0,0,0,0)";
		drawBorder=1;
	};
	class SolidBorder: Solid
	{
		drawBorder=1;
		scope=1;
	};
};
class CfgLocationTypes
{
	class Mount
	{
		font="Zeppelin33";
	};
	class Name
	{
		font="Zeppelin33";
	};
	class NameMarine: Name
	{
		color[]={0.050000001,0.40000001,0.80000001,0.80000001};
		font="Zeppelin33Italic";
	};
	class NameCityCapital: Name
	{
		textSize=0.075000003;
	};
	class NameLocal: Name
	{
		color[]={0.44,0.38,0.30000001,1};
	};
	class Hill: Name
	{
		texture="\ca\ui\data\mapkey_hill_ca.paa";
		font="Zeppelin33Italic";
	};
	class ViewPoint: Hill
	{
		texture="\ca\ui\data\mapkey_viewpoint_ca.paa";
		size=16;
	};
	class RockArea: Hill
	{
		texture="\ca\ui\data\map_rock_ca.paa";
	};
	class BorderCrossing: Hill
	{
		texture="\ca\ui\data\mapkey_borcross_ca.paa";
	};
	class VegetationBroadleaf: Hill
	{
		texture="\ca\ui\data\mapkey_vbroad_ca.paa";
		font="Zeppelin33Italic";
	};
	class VegetationFir: Hill
	{
		texture="\ca\ui\data\mapkey_vfir_ca.paa";
		font="Zeppelin33Italic";
	};
	class VegetationPalm: Hill
	{
		texture="\ca\ui\data\mapkey_vpalm_ca.paa";
		font="Zeppelin33Italic";
	};
	class VegetationVineyard: Hill
	{
		texture="\ca\ui\data\mapkey_vvine_ca.paa";
		font="Zeppelin33Italic";
	};
	class Strategic: Name
	{
		texture="\ca\ui\data\mapkey_viewpoint_ca.paa";
		color[]={0.25,0.40000001,0.2,0.69999999};
		font="Zeppelin33Italic";
		size=16;
		textSize=0.050000001;
	};
	class CityCenter: Strategic
	{
		color[]={0.25,0.40000001,0.2,0};
		name="Center of the village/town/city";
	};
	class fakeTown: Name
	{
		size=0;
	};
};
class CfgMissions
{
	class Cutscenes
	{
		class Credits
		{
			directory="ca\missions_e\data\scenes\credits1.desert_e";
			debriefing=0;
		};
	};
};