
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
	getLastWin(aWinTitle){
		theLastWin := _Win.Analyze(aWinTitle)
		theWins := _Wins.AnalyzeOnMap(aWinTitle)
		if(theWins.Count()<=1){
			return theLastWin
		}
		theEnum := Switcher.winStack.getEnum()
		while(theEnum.next(v)){
			theWin := theWins[v.id]
			if(Type.isObj(theWin)){
				theLastWin := theWin
				break
			}
		}
		return theLastWin
	}
	;------------------------------
	toggle(aWinTitle){
		theLastWin := this.getLastWin(aWinTitle)
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
			try{
				WinWait , %aWinTitle%, , %aWait%
				try{
					WinActivate , %aWinTitle%
				}
				catch,ex{
				}
			}
			catch,ex{
				throw(_EX.NoExistWin "(可能是窗口未能如期出现)")
			}
		}
	}
	;------------------------------
	switch(aWinTitle,aPathOrFuncObj,aWait = 0){
		theWinExist := WinExist(aWinTitle)
		if(theWinExist){
			this.toggle(aWinTitle)
		}
		else{
			this.run(aWinTitle,aPathOrFuncObj,aWait)
		}
		return theWinExist
	}
	;------------------------------
	p_ActivateOrMini(aWinTitle){
		theWinExist := WinExist(aWinTitle)
		if(WinActive(aWinTitle)){
			WinMinimize,%aWinTitle%
		}
		else{
			WinActivate,%aWinTitle%
			this.p_ifJavaSwingReDraw(aWinTitle)
		}
		return theWinExist
	}
	;------------------------------
	p_Run(aPath){
		;TODO:可以直接在这里以Max方式运行
		run,%aPath%,,% this.Options,OutputVarPID
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

