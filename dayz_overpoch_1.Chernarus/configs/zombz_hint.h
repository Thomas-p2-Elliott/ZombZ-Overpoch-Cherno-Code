class zombz_hintMini
{
   idd = 100;
   movingEnable =  1;
   duration     =  2;
   fadein       =  0;
   fadeout      =  0.1;
   name = "zombz_hintMini";

   onLoad="uiNamespace setVariable ['zombz_hintMini', _this select 0]";

   class controls 
   {
      class ZOMBZHINTMINI_BACKGROUND
      {
         idc = 101;
         type = 0;
         colorText[] = {1, 1, 1, 1};
         font = "Bitstream";
         colorBackground[] = {0, 0, 1, 0.2};
         text = ;
         style = 128;
         sizeEx = 0.015;
         x="0.77 * safezoneW + safezoneX";
         y="0.12 * safezoneH + safezoneY";
         w = 0.3;
         h = 0.24;
      };
      class ZOMBZHINTMINI_TITLE
      {
         access = 0;
         type = 13;
         idc = 102;
         style = 2 + 16;
         lineSpacing = 1;
         x="0.77 * safezoneW + safezoneX";
         y="0.13 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.12;
         size = 0.030;
         colorBackground[] = {0,0,0,0};
         colorText[] = {0,0,0,0};
         text = "WtituloWj";
         font = "BitStream";
         class Attributes 
         {
            font = "BitStream";
            color = "#ffffff";
            align = "left";
            shadow = true;
         };
      };
      class ZOMBZHINTMINI_LINE
      {
         idc = -1;
         type = 0;
         style = 176;
         x="0.77 * safezoneW + safezoneX";
         y="0.15 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.0;
         colorText[] = {1, 1, 1, 1};
         colorBackground[] = {1, 1, 1, 1};
         font = "Bitstream";
         sizeEx = 0.4;
         text = "";
      };
      class ZOMBZHINTMINI_TEXT
      {
         access = 0;
         type = 13;
         idc = 103;
         style = 2 + 16;
         lineSpacing = 1;
         x="0.77 * safezoneW + safezoneX";
         y="0.17 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.35;
         size = 0.030;
         colorBackground[] = {0,0,0,0};
         colorText[] = {0,0,0,0};
         text = "texto";
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
};

class zombz_hintFull
{
   idd = 104;
   movingEnable =  1;
   duration     =  2;
   fadein       =  0;
   fadeout      =  0.1;
   name = "zombz_hintFull";

   onLoad="uiNamespace setVariable ['zombz_hintFull', _this select 0]";

   class controls 
   {
      class ZOMBZHINTFULL_BACKGROUND
      {
         idc = 105;
         type = 0;
         colorText[] = {1, 1, 1, 1};
         font = "Bitstream";
         colorBackground[] = {0, 0, 1, 0.2};
         text = ;
         style = 128;
         sizeEx = 0.015;
         x="0.77 * safezoneW + safezoneX";
         y="0.12 * safezoneH + safezoneY";
         w = 0.3;
         h = 0.70;
      };
      class ZOMBZHINTFULL_TITLE
      {
         access = 0;
         type = 13;
         idc = 106;
         style = 2 + 16;
         lineSpacing = 1;
         x="0.77 * safezoneW + safezoneX";
         y="0.13 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.12;
         size = 0.030;
         colorBackground[] = {0,0,0,0};
         colorText[] = {0,0,0,0};
         text = "WtituloWj";
         font = "BitStream";
         class Attributes 
         {
            font = "BitStream";
            color = "#ffffff";
            align = "left";
            shadow = true;
         };
      };
      class ZOMBZHINTFULL_LINE
      {
         idc = -1;
         type = 0;
         style = 176;
         x="0.77 * safezoneW + safezoneX";
         y="0.15 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.0;
         colorText[] = {1, 1, 1, 1};
         colorBackground[] = {1, 1, 1, 1};
         font = "Bitstream";
         sizeEx = 0.4;
         text = "";
      };
      class ZOMBZHINTFULL_TEXT
      {
         access = 0;
         type = 13;
         idc = 107;
         style = 2 + 16;
         lineSpacing = 1;
         x="0.77 * safezoneW + safezoneX";
         y="0.17 * safezoneH + safezoneY";
         w = 0.2998;
         h = 0.65;
         size = 0.030;
         colorBackground[] = {0,0,0,0};
         colorText[] = {0,0,0,0};
         text = "texto";
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
};

