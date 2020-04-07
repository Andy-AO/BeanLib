
class Switcher{
	static Options := "Max"
	,winStack := new Stack()
	/*
		TODO: 可以为每个 Switcher 提供额外的配置,如果想用默认的，那就直接用Switcher.xx(),如果想使用一个额外的配置，那么就Switcher.xx().xx(),这包含了一些常用的预设配置;如果要完全自定义，那么就 theSwitcher := new Switcher(); theSwitcher.xxx();
		主要是为了「隐藏窗口」,以及「wintitle匹配规则」,等等设置,但是暂时先不需要,等我遇到之后再做.
	*/
	/*
			TODO:关于方法之间参数的调用,传参还是经过域的问题.一个Switcher实例代表的是一种「切换设置」,所以关于「窗口」的数据都是经过参数的,而所有关于「设置」的参数都是经过域的.
	*/
	;------------------------------

	toggle(aWinTitle){
		return this.p_ActivateOrMini(aWinTitle)
	}
	;------------------------------
	switch(aWinTitle,aPathOrFuncObj){
		if(WinExist(aWinTitle)){
			this.toggle(aWinTitle)
		}
		else{
			if(Type.isStr(aPathOrFuncObj)){
				path := aPathOrFuncObj
				funcObj := new Method(this.p_Run,this,path)
			}
			else{
				funcObj := aPathOrFuncObj
			}
			FuncObjReturn := funcObj.call()
		}
		return WinExist(aWinTitle)
	}
	;------------------------------
	p_ActivateOrMini(aWinTitle){
		if(WinActive(aWinTitle)){
			WinMinimize,%aWinTitle%
		}
		else{
			WinActivate,%aWinTitle%
			this.p_ifJavaSwingReDraw(aWinTitle)
		}
		return WinExist(aWinTitle)
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
	OnSwitched(aWinObj){
		Switcher.winStack.push(aWinObj)
	}	
}

