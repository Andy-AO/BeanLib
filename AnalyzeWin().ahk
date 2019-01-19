
/*
说明:获取窗口参数,可用于窗口操作和调试
*/

AnalyzeWin(InputWinTitle,EnableWinText:=false,InputDetectHiddenWindows:=""){

	;如果用户没有输入，那么默认就是当前的
	if(InputDetectHiddenWindows="")
		InputDetectHiddenWindows:=A_DetectHiddenWindows
	
	;先存一下最初的状态
	tempDetectHiddenWindows:=A_DetectHiddenWindows
	
	;如果最初的状态和用户希望的状态是不一样的,那么就切换
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}
	
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
	
	;如果最初的状态和用户希望的状态是不一样的,那么就切换,现在切换完了再切换回来
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}
	
	return theObj
	
}
