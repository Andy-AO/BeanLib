
/*
说明:获取窗口参数,可用于窗口操作和调试
*/

AnalyzeWin(InputWinTitle,EnableWinText:=false){

	local WinTitle:="",WinClass:="",Winexe:="",WinPID:="",WinPath:=""
	local WinText:="*Disabled*"
	local Str:=""
	
	WinGetTitle,WinTitle,%InputWinTitle%
	WinGetClass,WinClass,%InputWinTitle%
	WinGet,Winexe,ProcessName,%InputWinTitle%
	WinPID:=GetWinID(InputWinTitle)
	WinGet,WinPath,ProcessPath,%InputWinTitle%	
	
	WinTitle := "WinTitle: " WinTitle
	WinClass := "ahk_class " WinClass
	Winexe := "ahk_exe " Winexe
	WinPID := "ahk_id " WinPID
	WinPath := "WinPath: " WinPath
	
	if(EnableWinText){
		WinGetText,WinText,%InputWinTitle%	
	}
	else
		WinText := "WinText: " WinText
	
Str=
(
%WinTitle%
%WinClass%
%Winexe%
%WinPID%
%WinPath%
%WinText%
)
	
	theObj:=Object("Str",Str,"WinTitle",WinTitle,"WinClass",WinClass,"Winexe",Winexe,"WinPID",WinPID,"WinPath",WinPath)
	
/*
	DeBugDeepPrintln(WinTitle,"WinTitle >>> ")
	DeBugDeepPrintln(WinClass,"WinClass >>> ")
	DeBugDeepPrintln(Winexe,"Winexe >>> ")
	DeBugDeepPrintln(WinPID,"WinPID >>> ")
	DeBugDeepPrintln(WinPath,"WinPath >>> ")
	DeBugDeepPrintln(WinText,"WinText >>> ")
*/

	return theObj
	
}
