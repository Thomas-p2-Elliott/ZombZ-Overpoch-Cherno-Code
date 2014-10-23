
class zombz_text
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
class zombz_structuredText
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
class zombz_hintMini
{
   idd          = 9100;
   movingEnable =  1;
   duration     =  99999;
   fadein       =  0;
   fadeout      =  0;
   name = "zombz_hintMini";

   onLoad="uiNamespace setVariable ['zombz_hintMini', _this select 0]";
   controls[] = 
   {
      "ZOMBZHINTMINI_BACKGROUND",
      "ZOMBZHINTMINI_TITLE",
      "ZOMBZHINTMINI_LINE",
      "ZOMBZHINTMINI_TEXT"
   };
   class ZOMBZHINTMINI_BACKGROUND: zombz_text
   {
      idc = 9101;
      type = 0;
      colorText[] = {0, 0, 0, 0};
      font = "Bitstream";
      colorBackground[] = {0, 0, 0, 0.2};
      text = "";
      style = 128;
      sizeEx = 0.025;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
      y="0.11 * safezoneH + safezoneY";
      w=0.3;
      h=0.22;
   };
   class ZOMBZHINTMINI_TITLE: zombz_structuredText
   {
      idc = 9102;
      access = 0;
      type = 13;
      style = 2 + 16;
      lineSpacing = 1;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
      y="0.12 * safezoneH + safezoneY";
      w = 0.2998;
      h = 0.1;
      size = 0.026;
      colorBackground[] = {0,0,0,0};
      colorText[] = {0,0,0,0};
      text = "Title";
      font = "BitStream";
      class Attributes 
      {
         font = "BitStream";
         color = "#ffffff";
         align = "left";
         shadow = true;
      };
   };
   class ZOMBZHINTMINI_LINE: zombz_structuredText
   {
      idc = -1;
      type = 0;
      style = 176;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.701)";
      y="0.139 * safezoneH + safezoneY";
      w = 0.2998;
      h = 0.0;
      colorText[] = {1, 1, 1, 1};
      colorBackground[] = {1, 1, 1, 1};
      font = "Bitstream";
      sizeEx = 0.025;
      text = "";
   };
   class ZOMBZHINTMINI_TEXT: zombz_structuredText
   {
      access = 0;
      type = 13;
      idc = 9103;
      style=16;
      lineSpacing = 1;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.702)";
      y="0.15 * safezoneH + safezoneY";
      w=0.27500001;
      h=0.22;
      size = 0.025;
      colorBackground[] = {0,0,0,0};
      colorText[] = {0,0,0,0};
      text = "Text";
      font = "BitStream";
      class Attributes 
      {
         font = "BitStream";
         color = "#ffffff";
         align = "left";
         shadow = true;
      };
   };
};
class zombz_hintFull
{
   idd          = 9104;
   movingEnable =  1;
   duration     =  99999;
   fadein       =  0;
   fadeout      =  0;
   name = "zombz_hintFull";

   onLoad="uiNamespace setVariable ['zombz_hintFull', _this select 0]";
   controls[] = 
   {
      "ZOMBZHINTFULL_BACKGROUND",
      "ZOMBZHINTFULL_TITLE",
      "ZOMBZHINTFULL_LINE",
      "ZOMBZHINTFULL_TEXT"
   };
   class ZOMBZHINTFULL_BACKGROUND: zombz_text
   {
      idc = 9105;
      type = 0;
      colorText[] = {0, 0, 0, 0};
      font = "Bitstream";
      colorBackground[] = {0, 0, 0, 0.2};
      text = "";
      style = 128;
      sizeEx = 0.025;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
      y="0.11 * safezoneH + safezoneY";
      w=0.3;
      h=0.6;
   };
   class ZOMBZHINTFULL_TITLE: zombz_structuredText
   {
      access = 0;
      type = 13;
      idc = 9106;
      style = 2 + 16;
      lineSpacing = 1;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.7)";
      y="0.12 * safezoneH + safezoneY";
      w = 0.2998;
      h = 0.1;
      size = 0.026;
      colorBackground[] = {0,0,0,0};
      colorText[] = {0,0,0,0};
      text = "Title";
      font = "BitStream";
      class Attributes 
      {
         font = "BitStream";
         color = "#ffffff";
         align = "left";
         shadow = true;
      };
   };
   class ZOMBZHINTFULL_LINE: zombz_structuredText
   {
      idc = -1;
      type = 0;
      style = 176;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.701)";
      y="0.139 * safezoneH + safezoneY";
      w = 0.2998;
      h = 0.0;
      colorText[] = {1, 1, 1, 1};
      colorBackground[] = {1, 1, 1, 1};
      font = "Bitstream";
      sizeEx = 0.025;
      text = "";
   };
   class ZOMBZHINTFULL_TEXT: zombz_structuredText
   {
      access = 0;
      type = 13;
      idc = 9107;
      style=16;
      lineSpacing = 1;
      x="(SafeZoneW + SafeZoneX) - (1 - 0.702)";
      y="0.15 * safezoneH + safezoneY";
      w=0.27500001;
      h=0.6;
      size = 0.025;
      colorBackground[] = {0,0,0,0};
      colorText[] = {0,0,0,0};
      text = "Text";
      font = "BitStream";
      class Attributes 
      {
         font = "BitStream";
         color = "#ffffff";
         align = "left";
         shadow = true;
      };
   };
};