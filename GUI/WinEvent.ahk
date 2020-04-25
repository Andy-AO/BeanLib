
;--------------------------------------------------------------------------------------------------------------
class WinEvent{
	Usable := true
;------------------------------
	disable(){
		this.Usable := false
		return
	}
	;------------------------------
	
	enable(){
		this.Usable := true
		return
	}
	
	;------------------------------
	findFuncNameFromWParam(aWParam){
		for k,v in WinEvent.wParam {
			if(v = aWParam)
				return "On" k
		}
	}
;------------------------------
	class wParam{
			static Created := 1
            ,Destroyed := 2
            ,Activate := 3
            ,Activated := 4
            ,GetMinRect := 5
            ,ReDraw := 6
            ,Taskman := 7
            ,Language := 8
            ,Sysmenu := 9
            ,Endtask := 10
            ,AccessibilityState := 11
            ,Appcommand := 12
            ,Windowreplaced := 13
            ,Windowreplacing := 14
            ,FullScreen := 53
            ,ExitFullScreen := 54
			,Switched := 32772
			
		;1 顶级窗体被「创建」
		;2 顶级窗体即将被「关闭」
		;3 SHELL 的主窗体将被激活
		;4 顶级窗体被激活
		;5 顶级窗体被最大化或最小化
		;6 Windows 任务栏被刷新，也可以理解成「标题变更」
		;7 任务列表的内容被选中
		;8 中英文切换或输入法切换
		;9 显示系统菜单
		;10 顶级窗体被强制关闭
		;11 用于残障人士的辅助功能
		;12 没有被程序处理的APPCOMMAND。见WM_APPCOMMAND
		;13 wParam=被替换的顶级窗口的hWnd
		;14 wParam=替换顶级窗口的窗口hWnd
		;&H8000& 掩码
		;53 全屏
		;54 退出全屏
		;32772 窗口切换
;------------------------------
	} 
;------------------------------
	__New(){
		this.ShellHook()
		return this
	}
	;------------------------------
	ShellMessagePrint(wParam, lParam,msg:="", hwnd:=""){
		printMap := Object("Paras",Object("wParam",wParam, "lParam",lParam, "msg",msg, "hwnd",hwnd))
		return LogPrintln(printMap)
	}
;------------------------------
	ShellMessage(wParam, lParam, msg:="", hwnd:="") {
		theFindFuncName := this.findFuncNameFromWParam(wParam)
		;~ this.ShellMessagePrint(wParam, lParam, msg, hwnd)
		if(this[theFindFuncName]!=""){
			return this[theFindFuncName](_Win.Analyze("ahk_id " . lParam))
		}
	}
	
	;------------------------------
	ShellMessage_Base(wParam, lParam, msg:="", hwnd:="") {
		if(Not(this.Usable)){
			return
		}
		return this.ShellMessage(wParam, lParam, msg, hwnd)
	}
	ShellHookPrint(MsgNum1,MsgNum,Str,UInt){
		theObj := Object("MsgNum1",MsgNum1,"MsgNum",MsgNum,"Str",Str,"UInt",UInt)
		LogPrintln(theObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theObj >>> `r`n")
	}
;------------------------------
	ShellHook(){
		Gui +LastFound
		hWnd := WinExist() ;返回脚本自身窗口的ID(hWnd)
		MsgNum1 := DllCall("RegisterShellHookWindow",UInt,hWnd) 
		;~ LogPrintln(MsgNum1,A_LineFile  "("  A_LineNumber  ")"  " : " "MsgNum1 >>> `r`n")
		MsgNum := DllCall("RegisterWindowMessage", Str,"SHELLHOOK")
		ShellMessageMethod := new Method(this.ShellMessage_Base,this)
		;~ this.ShellHookPrint(MsgNum1,MsgNum,Str,UInt)
		OnMessage(MsgNum,ShellMessageMethod)
		return
	}
;------------------------------
} ;---------class WinEvent End
;------------------------------