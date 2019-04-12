
/*
说明:主要包含针对单个窗口的各种操作
*/


Class _Win{

		

;---------------------------------------------------------------------- 
	
		originalDetectHiddenWindows:=""

;---------------------------------------------------------------------- 
	/*
	说明:根据路径获取窗口对应进程的路径
	*/
getPath(WinTitle){
	WinGet,Path,ProcessPath,%WinTitle%
	return Path
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
		
		WinTitle:="",WinClass:="",Winexe:="",WinId:="",WinPath:="",WinText:="*DiListbled*",Str:=""
		
		aFuncId:=getFuncId(A_ThisFunc)
		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
	;---------------------所有的操作必须在 隐藏窗口检测状态 第一次切换之后进行------------------------------------------------- 
		;如果窗口不存在就 返回false
		
		WinisExist:=WinExist(aWinTitle)
		if (Not(WinisExist))
			return false
		
		WinGetTitle,WinTitle,%aWinTitle%
		WinGetClass,WinClass,%aWinTitle%
		WinGet,Winexe,ProcessName,%aWinTitle%
		WinId := GetWinId(aWinTitle)
		WinGet,WinPath,ProcessPath,%aWinTitle%	
		
		WinClass := "ahk_class " WinClass
		Winexe := "ahk_exe " Winexe
		WinId :=WinId
		
		if(EnableWinText){
			WinGetText,WinText,%aWinTitle%	
		}
		else
			WinText := "WinText: " WinText

		
		theObj:=Object("WinTitle",WinTitle,"WinClass",WinClass,"Winexe",Winexe,"WinId",WinId,"WinPath",WinPath)

		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
		return theObj
		
	}

;---------------------------------------------------------------------- 

;---------------------------------------------------------------------- 
	
		SwapDetectHidden(aFuncId,aConfig){
			;~ LogPrintln(aFuncId,"aFuncId >" ">> ")
			
			if (aConfig="")
				return
			else if ((aConfig="On") Or (aaConfig=true)){
			
			}
			else if ((aConfig="Off") Or (aaConfig=false)){
			
			}
			else
				throw Exception(InvalidPara "1")
			
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