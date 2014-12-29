#define DEBUG_MODE_FULL
disableSerialization;
_input1 = _this select 0;
_input2 = _this select 1;
_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['writeLog2', '%1','%2']", _input1, _input2]);
