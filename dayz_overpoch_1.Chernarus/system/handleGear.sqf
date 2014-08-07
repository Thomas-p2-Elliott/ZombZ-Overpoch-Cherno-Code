private ["_display","_control","_event","_data","_IDCsArray","_isWeapon","_isMagazine","_lbSelectedItem","_higlightIDCs","_returnSlotIDCs","_itemSlot","_returnBitArray","_highlightGearSlots","_output","_lbIDC"];
disableSerialization;

_event = _this select 1;
_data = _this select 0;


if(typeName(_data select 0) == "DISPLAY")then
{
  _display = (_data select 0);
};

if(typeName(_data select 0) == "CONTROL")then
{
  _control = (_data select 0);
  _display = ctrlParent _control;
};

//keep
_IDCsArray = [
  [107],
  [121],
  [108],
  [107],
  [122,123,124,125,126,127,128,129],
  [107],
  [107],
  [107],
  [109,110,111,112,113,114,115,116,117,118,119,120],
  [109,110,111,112,113,114,115,116,117,118,119,120],
  [108],
  [107],
  [130,131],
  [107],
  [107],
  [107],
  [107],
  [134,135,136,137,138,139,140,141,142,143,144,145],
  [107],  
  [107],
  [107],
  [107]
];

//keep
_isWeapon = {
  private ["_item","_return"];
  _item = _this select 0;
  _return = (str(configfile >> "cfgWeapons" >> _item) != "");
  _return;
};

//keep
_isMagazine = {
  private ["_item","_return"];
  _item = _this select 0;
  _return = (str(configfile >> "cfgMagazines" >> _item) != "");
  _return;
};

//keep
_lbSelectedItem = {
  private ["_index","_selectedItem","_n"];
  _lbcontrol = _display displayctrl _lbIDC;
  _index = lbCurSel _lbcontrol;
  _selectedItem = "";
  _n = 0;
  
  while {(_selectedItem == "")&&(_n<6)} do {
    _selectedItem = _lbcontrol lnbData [_index,1];
    uisleep 0.001;
    _n = _n + 1;
  };

  _selectedItem;
};

//keep
_higlightIDCs = {  
  private ["_slotArray","_j","_i"];
  for [{_i=0},{_i<count(_IDCsArray)}, {_i = _i + 1} ] do {
    _slotArray = _IDCsArray select _i;
    for [{_j=0},{_j<count(_slotArray)}, {_j = _j + 1} ] do {
      if (_selectedItemSlotIDCs find  (_slotArray select _j)>-1 ) then {
        _itemSlot = _display displayctrl (_slotArray select _j);
        _itemSlot ctrlSetFade 0.0;
        _itemSlot ctrlCommit 0.3;  
  
        } else {
        _itemSlot = _display displayctrl (_slotArray select _j);
        _itemSlot ctrlSetFade 0.5;
        _itemSlot ctrlCommit 0.3;  
      };
    };
  };
};


//keep
_returnSlotIDCs = {
  _flags = (_this select 0);
  _outputArray = [];
  _sum = 0;
  for [{_i=0},{_i<count(_IDCsArray)}, {_i = _i + 1} ] do
  {
      _sum = _sum + (_flags select _i);
    if ((_flags select _i) == 1) then {
      _outputArray = _outputArray + (_IDCsArray select _i);  

    };
  };
  if (_sum == 0) then {
      _outputArray = (_IDCsArray select 2);
  };
  _outputArray;
};

//keep
_itemSlot = {
  private ["_item", "_return"];
  _item = _this select 0;
  _return = 0;
  if ([_item] call _isWeapon) then {
    _return = getNumber(configfile >> "cfgWeapons" >> _item >> "type");
  };
  if ([_item] call _isMagazine) then {
    _return = getNumber(configfile >> "cfgMagazines" >> _item >> "type");
  };  
_return;
};

//keep
_returnBitArray = {
private ["_i","_bitArray","_valResult","_val","_n","_i"];
_val = _this select 0;
_bitArray = [0,0,0,0,0 ,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
_n = 524288;
for [{_i=19},{_i>=0}, {_i = _i - 1} ] do
{

  _valResult = _val mod _n;
  if (_valResult != _val) then {
    _bitArray set [_i, 1];
  };
  _n = _n / 2;
  _val = _valResult;
  };
  _bitArray
};

_highlightGearSlots ={
    _selectedItem = [] call _lbSelectedItem;
    _selectedItemSlot = [_selectedItem] call _itemSlot;
    _selectedItemSlotFlags = [_selectedItemSlot] call _returnBitArray;
    _selectedItemSlotIDCs = [_selectedItemSlotFlags] call _returnSlotIDCs;
    [_selectedItemSlotIDCs] call _higlightIDCs;
};

_output = true;
_lbIDC = 105;


switch _event do {
  case "onLBSelChanged": {  
    [] call _highlightGearSlots;
  };

  default {
  
  };
};


_output;
false;