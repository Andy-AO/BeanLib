
/*
说明:主要包含针对多个窗口的各种操作
*/


Class _Wins{

;---------------------------------------------------------------------- 
	/*
	获取Analyze(多维数组形式)
	*/
	Analyze(aWinTitle,aDetectHiddenWindows:="",path:=""){
		theAnalyzeWins:=[]
		theWinList:=_Wins.getIdList(aWinTitle,aDetectHiddenWindows)
		for i,v in theWinList {
			AnalyzeWinObj:=_Win.Analyze(v,aDetectHiddenWindows,false,path)
			theAnalyzeWins.Push(AnalyzeWinObj)
		}	
		return theAnalyzeWins
	}	
	;------------------------------
	/*
	获取Analyze(多维数组形式)
	*/
	AnalyzeOnMap(aWinTitle,aDetectHiddenWindows:="",path:=""){
		theAnalyzeWins:=Object()
		theWinList:=_Wins.getIdList(aWinTitle,aDetectHiddenWindows)
		for i,v in theWinList {
			AnalyzeWinObj:=_Win.Analyze(v,aDetectHiddenWindows,false,path)
			theAnalyzeWins[AnalyzeWinObj.ID] := AnalyzeWinObj
		}	
			
		return theAnalyzeWins
	}	

;---------------------------------------------------------------------- 
	/*
	获取数组形式窗口ID
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
	
	SelectWinByPath(aPathObj,aAnalyzeWins){
		newAnalyzeWins:=[]
		for i,v in aAnalyzeWins {
			theAnalyzeWin:=v
		
			if(theAnalyzeWin.WinPath=aPathObj.path)
				newAnalyzeWins.push(theAnalyzeWin)
		}	
		return newAnalyzeWins
	}

;---------------------------------------------------------------------- 

	/*
	通过路径(path),获取AnalyzeWins(多维数组形式)
	*/
	
	AnalyzeByPath(aWinPath,aDetectHiddenWindows:=""){
		thePathObj:=new PathObj(aWinPath)
		theAnalyzeWins:=_Wins.Analyze("ahk_exe" thePathObj.name,aDetectHiddenWindows)
		return _Wins.SelectWinByPath(thePathObj,theAnalyzeWins)
	}
;---------------------------------------------------------------------- 

}	;_Wins Class End 