
/*
说明:主要包含针对单个窗口的各种操作
*/


Class _Win{
	moveToRightCorner(aWinTitle){
		WinGetPos, X, Y, Width, Height, %aWinTitle%

		MaxX := _Win.getMonitorWorkArea().Right - Width ; This will put the Gui to the right
		MaxY := _Win.getMonitorWorkArea().Bottom - Height

		WinMove, %aWinTitle%, ,%MaxX%, %MaxY%
		return
	}
		
;------------------------------

	getMonitorWorkArea(N:=""){
		SysGet, OutputVar, MonitorWorkArea,%N%
		Obj := Object("Top",OutputVarTop,"Bottom",OutputVarBottom,"Left",OutputVarLeft,"Right",OutputVarRight)
		return Obj
	}
;---------------------------------------------------------------------- 
	
		originalDetectHiddenWindows:=""

;---------------------------------------------------------------------- 

toRight(WinTitle:="A",ExcludeTitle:=""){
	MonitorWorkArea := _Win.getMonitorWorkArea()
	HalfScreenWidth:=(MonitorWorkArea.Right/2)
	theHeight:=MonitorWorkArea.Bottom
	X:=HalfScreenWidth
	Y:=0
	if(ExcludeTitle=""){
		WinActivate,%WinTitle%
		Sleep 100
		WinMove, %WinTitle%, , %X%, %Y% , %HalfScreenWidth% , %theHeight%
	}
	else{
		WinActivate,%WinTitle%,,%ExcludeTitle%
		Sleep 100
		WinMove, %WinTitle%, , %X%, %Y% , %HalfScreenWidth% , %theHeight%, %ExcludeTitle%
	}

	return
}

;------------------------------

toLeft(WinTitle:="A",ExcludeTitle:=""){
	HalfScreenWidth:=A_ScreenWidth/2
	theHeight:=A_ScreenHeight
	X:=0
	Y:=0
	if(ExcludeTitle=""){
		WinActivate,%WinTitle%
		Sleep 100
		WinMove, %WinTitle%, , %X%, %Y% , %HalfScreenWidth% , %theHeight%
	}
	else{
		LogPrintln(ExcludeTitle,"ExcludeTitle >>>")
		WinActivate,%WinTitle%,,%ExcludeTitle%
		Sleep 100
		WinMove, %WinTitle%, , %X%, %Y% , %HalfScreenWidth% , %theHeight%, %ExcludeTitle%
	}
	return
}
;------------------------------

/*
允许在 WinTitle 的匹配结果中再叠加排除多个 WinTitle
*/
getIdExclude(WinTitle,WinTitleExcludes){
	wins := _Wins.Analyze(WinTitle)
	if(wins.length()=0){
		return false
	}
	titleList := _Container.ExtractSameElements(wins,"WinTitle")
	result := _List.exclude(titleList,WinTitleExcludes)
	theWinId := wins[result[1]].WinId
	
	if(theWinId="")
		return false
		
	return theWinId	
}

;---------------------------------------------------------------------- 
	/*
	说明:根据路径获取窗口对应进程的路径
	*/
	
getPath(aWinTitle){
	WinGet,Path,ProcessPath,%aWinTitle%
	return Path
}	

;------------------------------

getTitle(aWinTitle){
	WinGetTitle,WinTitle,%aWinTitle%
	return WinTitle
}
;------------------------------

getProcessName(aWinTitle){
	WinGet,WinProcessName,ProcessName,%aWinTitle%
	return WinProcessName
}
;---------------------------------------------------------------------- 
		
	/*
	说明:根据路径获取窗口ID
	*/
	getIdByPath(aWinPath,aDetectHiddenWindows:=""){
		theAnalyzeWins:=_Wins.AnalyzeByPath(aWinPath,aDetectHiddenWindows:="")
		if(theAnalyzeWins.Length=0)
			return
		
		else{
			theWinId:=theAnalyzeWins[1].WinId
			return theWinId
		}

	}
;---------------------------------------------------------------------- 

		
	/*
	说明:获取窗口参数,可用于窗口操作和调试
	*/
	Analyze(aWinTitle,aDetectHiddenWindows:="",EnableWinText:=false){
		
		WinTitle:="",WinClass:="",WinProcessName:="",WinId:="",WinPath:="",WinText:="*DiListbled*",Str:=""
		
		aFuncId:=getFuncId(A_ThisFunc)
		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
	;---------------------所有的操作必须在 隐藏窗口检测状态 第一次切换之后进行------------------------------------------------- 
		;如果窗口不存在就 返回false
		
		WinisExist:=WinExist(aWinTitle)
		if (Not(WinisExist))
			return false
		
		theObj:=Object()
		
		WinTitle := _Win.getTitle(aWinTitle)
		theObj.WinTitle := WinTitle
		
		WinGetClass,WinClass,%aWinTitle%
		theObj.Class := WinClass,theObj.WinClass := "ahk_class " theObj.Class
		
		theObj.ProcessName := _Win.getProcessName(aWinTitle),theObj.WinProcessName := "ahk_exe " theObj.ProcessName
		
		theObj.WinPath := _Win.getPath(aWinTitle)
		
		WinGet,theId,ID,%aWinTitle%

		theObj.Id := theId,theObj.WinId := "ahk_id " theObj.Id
		
		if(EnableWinText){
			WinGetText,WinText,%aWinTitle%	
		}
		else
			WinText := "WinText: " WinText

		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
		return theObj
		
	}

;---------------------------------------------------------------------- 
	
		SwapDetectHidden(aFuncId,aConfig){
			
			if (aConfig="")
				return
			else if ((aConfig="On") Or (aConfig=true)){
			
			}
			else if ((aConfig="Off") Or (aConfig=false)){
			
			}
			else
				throwWithSt(InvalidPara "1")
			
			if(_Win.originalDetectHiddenWindows[aFuncId]=""){
				_Win.originalDetectHiddenWindows[aFuncId]:=A_DetectHiddenWindows
				DetectHiddenWindows,%aConfig%
			}
		
			else{
				DetectHiddenWindows,% _Win.originalDetectHiddenWindows[aFuncId]
				_Win.originalDetectHiddenWindows[aFuncId]:=""
			}
			return
	}
}