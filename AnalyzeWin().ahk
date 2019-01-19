
/*
说明:获取窗口参数,可用于窗口操作和调试
*/

AnalyzeWin(InputWinTitle,EnableWinText:=false,InputDetectHiddenWindows:=""){
	
	WinTitle:="",WinClass:="",Winexe:="",WinID:="",WinPath:="",WinText:="*Disabled*",Str:=""
	
	;如果用户没有输入，那么默认就是当前的
	if(InputDetectHiddenWindows="")
		InputDetectHiddenWindows:=A_DetectHiddenWindows
	
	;转换布尔型为 On/Off
	InputDetectHiddenWindows:=InputDetectHiddenWindows ? "On" : "Off"
	
	;先存一下最初的状态
	tempDetectHiddenWindows:=A_DetectHiddenWindows
	
	;如果最初的状态和用户希望的状态是不一样的,那么就切换
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}

	
	
;---------------------所有的操作必须在 隐藏窗口检测状态 第一次切换之后进行------------------------------------------------- 

	;如果窗口不存在就 返回false
	
	WinisExist:=WinExist(InputWinTitle)
	if (Not(WinisExist))
		return false
	
	WinGetTitle,WinTitle,%InputWinTitle%
	WinGetClass,WinClass,%InputWinTitle%
	WinGet,Winexe,ProcessName,%InputWinTitle%
	WinID := GetWinID(InputWinTitle)
	WinGet,WinPath,ProcessPath,%InputWinTitle%	
	
	WinTitle := "WinTitle: " WinTitle
	WinClass := "ahk_class " WinClass
	Winexe := "ahk_exe " Winexe
	WinID := "ahk_id " WinID
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
%WinID%
%WinPath%
%WinText%
)
	
	theObj:=Object("Str",Str,"WinTitle",WinTitle,"WinClass",WinClass,"Winexe",Winexe,"WinID",WinID,"WinPath",WinPath)
	
/*
	DeBugDeepPrintln(WinTitle,"WinTitle >>> ")
	DeBugDeepPrintln(WinClass,"WinClass >>> ")
	DeBugDeepPrintln(Winexe,"Winexe >>> ")
	DeBugDeepPrintln(WinID,"WinID >>> ")
	DeBugDeepPrintln(WinPath,"WinPath >>> ")
	DeBugDeepPrintln(WinText,"WinText >>> ")
*/	
	
	;如果最初的状态和用户希望的状态是不一样的,那么就切换,现在切换完了再切换回来
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}
	
	return theObj
	
}
