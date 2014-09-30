#define CT_EDIT             2
#define ST_LEFT           0x00
#define ST_FRAME          0x40
class ZombZRscEdit
{
   access = 0;
   type = CT_EDIT;
   style = ST_LEFT+ST_FRAME;
   x = 0;
   y = 0;
   h = 0.04;
   w = 0.3;
   colorBackground[] = {0,0,0,0};
   colorText[] = {1,1,1,1};
   colorSelection[] = {1,1,1,0.25};
   font = "TahomaB";
   sizeEx = 0.04;
   autocomplete = "";
   text = "";
   size = 0.2;
   shadow = 0;
};

class ZombZHintColour_Dialog
{
   idd=10666;
   enableDisplay=1;
   onLoad="uiNamespace setVariable ['ZombZHintColour_Dialog', _this select 0];";
   name = "ZombZHintColour_Dialog";
   class controls
   {
      class ZombZHintColour_Dialog_EditBox: ZombZRscEdit
      {
         idc = 169691;
         x = 0.3025;
         y = 0.34;
         text = "";
         autocomplete = "";
      };
   };
};