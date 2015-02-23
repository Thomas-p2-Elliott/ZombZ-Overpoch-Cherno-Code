_result = nil;
_key = format["CHILD:421:%1:%2:","76561197994454413",dayZ_instance];
_result = _key call server_hiveReadWrite;
diag_log(format["%1 | %2",format["Sent: (getPackages/CHILD:421): UID (%1)","76561197994454413"],format["Received: %1",_result]]);


uiSleep 1;

_result = nil;
_key = format["CHILD:420:%1:%2:","76561197994454413",[1]];
_result = _key call server_hiveReadWrite;
diag_log(format["%1 | %2",format["Sent: (claimPackage/CHILD:420): Data: (%1), UID (%2)",[1],"76561197994454413"],format["Received: %1",_result]]);


sleep 2;

_result = nil;
_key = format["CHILD:421:%1:%2:","76561197994454413",dayZ_instance];
_result = _key call server_hiveReadWrite;
diag_log(format["%1 | %2",format["Sent: (getPackages/CHILD:421): UID (%1)","76561197994454413"],format["Received: %1",_result]]);

 4:13:13 "Sent: (getPackages/CHILD:421): UID (76561197994454413) 				| Received: ["PASS",[1,2]]"
 4:13:13 "Sent: (claimPackage/CHILD:420): Data: ([1]), UID (76561197994454413) 	| Received: ["PASS"]"
 4:13:13 "Sent: (getPackages/CHILD:421): UID (76561197994454413) 				| Received: ["PASS",[1]]"

