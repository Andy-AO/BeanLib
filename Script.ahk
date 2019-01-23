﻿
/*
AHK元编程模板 - @心如止水_Zen
(目前还无法支持 UniCode 字符,原因未知)
- 主要功能:完全控制 __Get __Set __Call , 实现类的高度自定义
- 小提示:是以"Script"这个类为例子搞的,到时候批量替换成自己的名字就行
- 关于Class:会创建两个最外层的类,一个是 Script 一个是 ScriptBase ,编程的三个方法也要创建类，但是为了节约外部命名空间,所以放入 Script类 内部了.
- 如果窗口不存在，会抛出异常

-;已知问题:
 1,发送消息的脚本,如果是通过 #SingleInstance force 重启的,不会执行成功 
 2,不支持非Unicode字符,会变成乱码,原因未知
*/


Class Script{
		__New(InputTitle){
			ObjRawSet(this,"InputTitle",InputTitle) ;为了绕过元函数而用,如果不用，就会陷入死循环
			return this		
		}
;---------------------------------------------------------------------- 

class ScriptCallBase{ 
    __Call(aThis,aFuncName,aParams*){

	TargetDetectHiddenWindows:="On"
	
	;先存一下最初的状态
	tempDetectHiddenWindows:=A_DetectHiddenWindows
	
	;如果最初的状态和目标状态不符合,那么就会切换
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}
		aNameLen:=StrLen(aFuncName)
		
		the__Get:=ObjRawGet(ScriptBase,"__Get") ;为了绕过元函数而用,如果不用，就会陷入死循环
		
		if(ObjHasKey(the__Get,aFuncName)){ ;这里的this指代，真正的元函数本身
			; DeBugDeepPrintln(aFuncName,"aFuncName >>> ")
			
			theMsg:=the__Get["Msg"],wParam:=the__Get[aFuncName]
			
			InputTitle := aThis.InputTitle
			
			ResultTitle := InputTitle " ahk_class AutoHotkey"
			;~ ResultTitle := InputTitle
			
			;~ DeBugDeepPrintln(ResultTitle,"ResultTitle >>> ")
			
			;如果没有发现窗口,就抛出异常
			if(MesObj=false){
			throw Exception(_EX.NoExistWin)
			}
			
			MesObj:=AnalyzeWin(ResultTitle,false,true)
			
			MesStr:=MesObj["Str"]
			
			;~ DeBugDeepPrintln(MesStr,"MesStr >>> ")
			
			ResultWinPID := MesObj["WinPID"]
			
			PostMessage,%theMsg%,%wParam%,,,%ResultWinPID%		
			
	;如果最初的状态和目标状态不符合,那么就会切换
	if (tempDetectHiddenWindows!=InputDetectHiddenWindows){
		_Win.SwapHidden()
	}
			return MesObj ;返回对应窗口的信息
		}
		else{					
			throw Exception(_Ex.NoExistMethod)	;找不到方法,就抛出异常
		}
		
    }
}

;---------------------------------------------------------------------- 

class ScriptGetBase{ 
    __Call(aThis,aVariateName,aParams*){
		
		if(ObjHasKey(this,aVariateName)){ 
			OutPut :=this[aVariateName]
			return OutPut
		}
		else{
			throw Exception(_EX.NoExistVariate) ;如果找不到，那么就抛出值不存在异常
			return ""		
		}
    }
}

;---------------------------------------------------------------------- 
		
;主要是为了实现保护写入,也就是保证里面的东西是常量

class ScriptSetBase{
    __Call(aThis,aVariateName,aParams*){
				
		the__Get:=ObjRawGet(ScriptBase,"__Get") ;为了绕过元函数而用,如果不用，就会陷入死循环
		
		if(ObjHasKey(the__Get,aVariateName)){ 
			throw Exception(_EX.SetConst) ;如果已经存在,那么就抛出常量写入异常
			return ""
		}
		else{					
			throw Exception(_EX.NoExistVariate)	;如果找不到，那么就抛出变量不存在异常	
		}
    }
}	
		
;---------------------------------------------------------------------- 

}  ;Script Class End

;---------------------------------------------------------------------- 
;---------------------------------------------------------------------- 

Script.base:=new ScriptBase()

;---------------------------------------------------------------------- 
;---------------------------------------------------------------------- 


Class ScriptBase{	
	Class __Set extends Script.ScriptSetBase{
	;主要目的就是为了防止写入，所以里面往往什么也不用填写
	}	
	
	Class __Get extends Script.ScriptGetBase{
	
 	Static Msg := 0x111 
	
 	Static Open := 65300 	;打开窗口
 	Static Reload := 65400 	;重启
 	Static Edit := 65401 	;编辑
 	Static Spy := 65402 	;Spy
 	Static Pause  :=  65403 	;暂停
 	Static Suspend  :=  65404 	;挂起
 	Static Exit := 65405 	;退出

 	Static Lines := 65406 	;最近运行
 	Static Variable := 65407 	;变量信息
 	Static HotKeys := 65408 	;热键信息
 	Static KeyHistory := 65409 	;按键历史信息
 	Static Refresh := 65410 	;刷新 信息窗口

 	Static Help := 65411 	;打开CHM帮助文件
 	Static WebSite := 65412 	;打开 https://www.autohotkey.com

	}	
	
;---------------------------------------------------------------------- 	

	Class __Call extends Script.ScriptCallBase{
	;可以在里面填写各种方法
	FuncA(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	FuncB(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	FuncC(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	}
	
;---------------------------------------------------------------------- 
	
} ;ScriptBase Class End
