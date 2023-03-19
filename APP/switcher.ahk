
class Switcher{
	static Options := "Max"
	,winStackMaxSize := 300
	,winStack := new Stack(Switcher.winStackMaxSize)
	/*
		TODO: 可以为每个 Switcher 提供额外的配置,如果想用默认的，那就直接用Switcher.xx(),如果想使用一个额外的配置，那么就Switcher.xx().xx(),这包含了一些常用的预设配置;如果要完全自定义，那么就 theSwitcher := new Switcher(); theSwitcher.xxx();
		主要是为了「隐藏窗口」,以及「wintitle匹配规则」,等等设置,但是暂时先不需要,等我遇到之后再做.
	*/
	/*
			TODO:关于方法之间参数的调用,传参还是经过域的问题.一个Switcher实例代表的是一种「切换设置」,所以关于「窗口」的数据都是经过参数的,而所有关于「设置」的参数都是经过域的.
	*/
	getLastWin(aWinTitle,winPath:=""){
		theLastWin := _Win.Analyze(aWinTitle,"",false,winPath) ;分析出一个
		LogPrintln(theLastWin,A_LineFile  "("  A_LineNumber  ")"  " : " "theLastWin >>> `r`n")
		theWins := _Wins.AnalyzeOnMap(aWinTitle,"",winPath) ;分析出所有符合条件的 Map
		LogPrintln(theWins,A_LineFile  "("  A_LineNumber  ")"  " : " "theWins >>> `r`n")
		if(theWins.Count()<=1){ ;如果符合条件的只有一个，那么直接返回
			return theLastWin
		}
		theEnum := Switcher.winStack.getEnum() ;遍历之前保存的
		while(theEnum.next(v)){
			theWin := theWins[v.id] ;从前到后找，如果匹配符合的，那么就可以返回它
			if(Type.isObj(theWin)){
				theLastWin := theWin
				break
			}
		}
		return theLastWin
		;更改的方法是让 Analyze 支持根据 Path 进行筛选
	}
	;------------------------------
	toggle(aWinTitle,winPath:=""){
		theLastWin := this.getLastWin(aWinTitle,winPath)
		LogPrintln(theLastWin,A_LineFile  "("  A_LineNumber  ")"  " : " "theLastWin >>> `r`n")
		return this.p_ActivateOrMini(theLastWin.WinId)
	}
	;------------------------------
	runFuncObj(funcObj){
		return funcObj.call()
	}
	;------------------------------
	run(aWinTitle,aPathOrFuncObj,aWait = 0){
		if(Type.isStr(aPathOrFuncObj)){
			path := aPathOrFuncObj
			funcObj := new Method(this.p_Run,this,path)
		}
		else{
			funcObj := aPathOrFuncObj
		}
		FuncObjReturn := this.runFuncObj(funcObj) 
		if((aWait != 0) AND (aWait.isNumber())){
			WinWait , %aWinTitle%, , %aWait%
			{
				if(ErrorLevel){
					LogPrintln(ex,A_LineFile  "("  A_LineNumber  ")"  " : " "ex >>> `r`n")
					throw(_EX.NoExistWin "(可能是窗口未能如期出现)")
				}
				WinActivate , %aWinTitle%
			}
		}
	}
	;------------------------------
	switch(aWinTitle,aPathOrFuncObj,aWait = 0,winPath:=""){
		theWinExist := _Win.Exist(aWinTitle,winPath)
		if(theWinExist){
			this.toggle(aWinTitle,winPath)
		}
		else{
			this.run(aWinTitle,aPathOrFuncObj,aWait)
		}
		return theWinExist
	}
	;------------------------------
	p_ActivateOrMini(aWinTitle){
		if(Type.isNS(aWinTitle))
			return false
		LogPrintln(aWinTitle,A_LineFile  "("  A_LineNumber  ")"  " : " "aWinTitle >>> `r`n")
		theWinExist := WinExist(aWinTitle)
		if(WinActive(aWinTitle)){ 
			WinMinimize,%aWinTitle% 
		}
		else{
			LogPrintln(aWinTitle,A_LineFile  "("  A_LineNumber  ")"  " : " "aWinTitle >>> `r`n")
			WinActivate,%aWinTitle%
			;~ this.p_ifJavaSwingReDraw(aWinTitle)
			;不仅Java要重绘,任何窗口都重绘吧,希望能解决VSCode的WSL远程模式的卡顿问题
			WinSet, Redraw ,,%aWinTitle%
		}
		return theWinExist
	}
	p_getWorkingDir(aPath){
		;这是为了去除可能存在的命令行参数
		if(RegExMatch(aPath, "O)^(.+) ([^ ]+)$",SubPat))
			aPath := SubPat.1
		else if(RegExMatch(aPath, "O)^`"(.+)`"",SubPat))
			aPath := SubPat.1
		return (new PathObj(aPath)).dir
	}
	;------------------------------
	p_Run(aPath){
		run,%aPath%,% this.p_getWorkingDir(aPath),% this.Options,OutputVarPID
		return OutputVarPID
	}	
	;------------------------------
	p_ifJavaSwingReDraw(aWinTitle){
		if(WinActive("ahk_class SunAwtFrame")){ 
			WinSet, Redraw ,,%aWinTitle%
		}
		return
	}
}



;------------------------------

global SwitcherEvent

SwitcherEvent := new SwitcherEventBase()

class SwitcherEventBase extends WinEvent{
	OnSwitched(aWinObjs){
		Switcher.winStack.push(aWinObjs[1])
	}	
}

