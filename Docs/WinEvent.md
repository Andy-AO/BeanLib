# WinEvent Class

1.  性质：抽象类
2.  开发目的：ShellHook(窗口钩子)，让窗口切换、建立等等，十几种窗口操作本身作为触发器。AHK最突出的特点是是「热键」和「热字串」，而现在有了「热窗口」。O(∩_∩)O~
    AHK没有「抽象类」，但是这个函数类似Java中的「抽象类」，只能继承使用。

## 域 Field

```autohotkey
	class wParam_Base{
			Created := 1,
            Destroyed := 2,
            Activate := 3,
            Activated := 4,
            GetMinRect := 5,
            ReDraw := 6,
            Taskman := 7,
            Language := 8,
            Sysmenu := 9,
            Endtask := 10,
            AccessibilityState := 11,
            Appcommand := 12,
            Windowreplaced := 13,
            Windowreplacing := 14,
            FullScreen := 53,
            ExitFullScreen := 54,
			Switched := 32772
			
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
```

## 方法 Method

### ShellMessage_Base(wParam, lParam, msg:="", hwnd:="")

该方法会被COM对象自动回调

### ShellMessage(wParam, lParam, msg:="", hwnd:="")

在之前，该方法必须被复写，现在完全自动化了，不需要复写

### ShellHook()

注册窗口钩子

### enable()

启用

### disable()

禁用

## 示例

运行前，应先导入BeanLib

### 在之前必须复写ShellMessage()

```autohotkey

WinEventObj:=new MyWinEvent()
class MyWinEvent extends WinEvent{
	ShellMessage(wParam, lParam, msg:="", hwnd:=""){
		if (wParam = this.wParam.Switched){
			this.OnSwap()
		}
		return
	}
;------------------------------
	OnSwap(){
		aTitle := A_ScriptName,aTipString := A_ScriptName,TrayTip(aTitle,aTipString) 
		return
	}	
} ;---------class MyWinEvent End

```

### 现在可以直接编写方法

```autohotkey

WinEventObj:=new MyWinEvent()
class MyWinEvent extends WinEvent{
	OnSwap(){
		aTitle := A_ScriptName,aTipString := A_ScriptName,TrayTip(aTitle,aTipString) 
		return
	}	
} ;---------class MyWinEvent End

```