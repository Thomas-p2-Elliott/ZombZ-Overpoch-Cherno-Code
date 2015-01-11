private ["_long"];
_long = ;
private ["_cariDance"];_cariDance = format ["
	player playMove 'ActsPercMstpSnonWnonDnon_DancingDuoIvan';
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
	taskHint ['%1\n%1\n%1',[1,.05,.55,1],'taskDone'];
",cariDanceMsg];
[_cariDance] call cariRE;
