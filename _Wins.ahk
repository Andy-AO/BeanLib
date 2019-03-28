
/*
说明:主要包含针对多个窗口的各种操作
*/


Class _Wins{

;---------------------------------------------------------------------- 
	/*
	获取Analyze(多维数组形式)
	*/
	Analyze(aWinTitle,aDetectHiddenWindows:=""){
		theAnalyzeWins:=[]
		LogPrintln(aDetectHiddenWindows,"aDetectHiddenWindows >>>")
		theWinList:=_Wins.getIdList(aWinTitle,aDetectHiddenWindows)
		LogPrintln(theWinList,"theWinList >>>")
		
		for i,v in theWinList {
			AnalyzeWinObj:=_Win.Analyze(v,aDetectHiddenWindows)
			theAnalyzeWins.Push(AnalyzeWinObj)
		}	
			
		return theAnalyzeWins
	}	

;---------------------------------------------------------------------- 
	/*
	获取窗口ID(HWND)列表收集器(数组形式)
	*/
	getIdList(WinTitle,aDetectHiddenWindows:=""){
		
		aFuncId:=getFuncId(A_ThisFunc)
		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
		WinGet,OutputVar,List,%WinTitle%
		
		if (OutputVar=0)
		return false
		WinList:=[]
			loop,%OutputVar%{
			WinList.Push(OutputVar%A_Index%)
		}
		
		
		_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
		
		for i,v in WinList {
			WinList[i]:="ahk_id " v
		}
			
		return WinList
	}

;---------------------------------------------------------------------- 

	/*
	通过路径(path),获取AnalyzeWins(多维数组形式)
	*/
	
	AnalyzeByPath(aWinPath,aDetectHiddenWindows:=""){
		thePathObj:=_Win.getPathObj(aWinPath)
		theAnalyzeWins:=_Wins.Analyze("ahk_exe" thePathObj.name,aDetectHiddenWindows)

		return SelectWinByPathFromAnalyzeWins(thePathObj,theAnalyzeWins)
	}
;---------------------------------------------------------------------- 

}	;_Wins Class End 