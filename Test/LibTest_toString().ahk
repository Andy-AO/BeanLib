#Include D:\AHKs\Dev\_CoreLib.ahk

Hotstring("EndChars"," ")
#Hotstring ? O Z

#NoEnv 

#Warn All , StdOut
#Warn ClassOverwrite , MsgBox
#Warn LocalSameAsGlobal, Off

#SingleInstance force

Process, Priority,, High
SetTitleMatchMode 2
SendMode Input
SetFormat,Float,0.2
FileEncoding , UTF-8

;------------------------------
#Include D:\AHKs\Dev\_TempLib.ahk
#Include D:\AHKs\ahk_lib\Test\Lib.ahk

LogPrintln(A_ScriptName,"A_ScriptName >>> ")


MapFactory(aMap,aKeyFunc:="",aValueFunc:=""){
     theReturn := ""
     for k,v in aMap {
          theKeyStr := theValueStr := ""
          theKeyStr := aKeyFunc.call(k)
          theValueStr := aValueFunc.call(v)
          theResult := theKeyStr ":" theValueStr
          theReturn .= theResult "`r`n"
     }
     return theReturn
}


theKeyFunc := Method.for(FuncClass.handleKey,FuncClass)
theValueFunc := Method.for(FuncClass.handleValue,FuncClass)


 stdoutln(MapFactory(TypeClassInstance,theKeyFunc,theValueFunc))	


Class FuncClass{
     handleKey(aKey){
          theStr = toString(%aKey%)
          return theStr
     }
     handleValue(aValue){
          return toString(aValue)
     }
}


return

/*
for k,v in TypeClassInstance {
     stdoutln(k ":" v)	
}

*/
LogPrintln(TypeClassInstance.ComObj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.ComObj >>> `r`n")
LogPrintln(TypeClassInstance.Obj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Obj >>> `r`n")
LogPrintln(TypeClassInstance.ExtendsObj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.ExtendsObj >>> `r`n")
LogPrintln(TypeClassInstance.Class,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Class >>> `r`n")
LogPrintln(TypeClassInstance.FuncObj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.FuncObj >>> `r`n")
LogPrintln(TypeClassInstance.Exception,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Exception >>> `r`n")
LogPrintln(TypeClassInstance.Path,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Path >>> `r`n")
LogPrintln(TypeClassInstance.NS,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.NS >>> `r`n")
LogPrintln(TypeClassInstance.Number,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Number >>> `r`n")
LogPrintln(TypeClassInstance.Boolean,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Boolean >>> `r`n")
LogPrintln(TypeClassInstance.FileObj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.FileObj >>> `r`n")

ComObj:=160
FileObj:=150
Obj:=100,ExtendsObj:=101,Class:=110,FuncObj:=120,Exception:=121
List:=130
Str:=10,NS:=11,Number:=12,Boolean:=13

;First

/*
>"F:\gUAPP\AutoHotkey32Bit\SciTE\..\AutoHotkey.exe" /ErrorStdOut "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"    
>Exit code: 0    Time: 0.2503
A_ScriptName >>> LibTest_toString().ahk
D:\AHKs\Dev\MSAA\Acc.ahk (18) : ==> Warning: This variable has not been assigned a value.
     Specifically: h  (a static variable)
D:\AHKs\Dev\MSAA\Acc.ahk (31) : ==> Warning: This variable has not been assigned a value.
     Specifically: pt  (a local variable)
D:\AHKs\Dev\MSAA\Acc.ahk (31) : ==> Warning: This variable has not been assigned a value.
     Specifically: pacc  (a local variable)
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(37) : theComObj >>> 
{Class:*NS*,CLSID:*NS*,IID:{618736E0-3C3D-11CF-810C-00AA00389B71},Name:IAccessible,Value:12458696,VarType:9}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(38) : theObj >>> 
{*Obj*}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(39) : theExtendsObj >>> 
{__Instance:AutoInputBox,AlwaysOnTop:0,aTextPrefix:*NS*,deFaultText:[UseClipBoard],prompt:输入要增加的页码,title:输入要增加的页码}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(40) : theClass >>> 
{__Class:AutoInputBox,__Init:AutoInputBox.__Init(),__New:AutoInputBox.__New(),SetAlwaysOnTop:AutoInputBox.SetAlwaysOnTop(),SetDeFaultText:AutoInputBox.SetDeFaultText(),start:AutoInputBox.start()}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(41) : theFuncObj >>> 
{__Instance:Function,bindParas:{*Obj*},func:toString()}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(42) : theException >>> 
{File:D:\AHKs\ahk_lib\Test\LibTest_toString().ahk,Line:30,Message:Index Out Of Bounds.数组越界.,What:*NS*}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(43) : thePath >>> 
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(44) : theNS >>> 
*NS*
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(45) : theNumber >>> 
123456789
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(46) : theBoolean >>> 
0
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(47) : theFileObj >>> 
{}

*/

;second
/*
>"F:\gUAPP\AutoHotkey32Bit\SciTE\..\AutoHotkey.exe" /ErrorStdOut "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"    
>Exit code: 0    Time: 0.2447
A_ScriptName >>> LibTest_toString().ahk
D:\AHKs\Dev\MSAA\Acc.ahk (18) : ==> Warning: This variable has not been assigned a value.
     Specifically: h  (a static variable)
D:\AHKs\Dev\MSAA\Acc.ahk (31) : ==> Warning: This variable has not been assigned a value.
     Specifically: pt  (a local variable)
D:\AHKs\Dev\MSAA\Acc.ahk (31) : ==> Warning: This variable has not been assigned a value.
     Specifically: pacc  (a local variable)
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(42) : TypeClassInstance.ComObj >>> 
{Class:*NS*,CLSID:*NS*,IID:{618736E0-3C3D-11CF-810C-00AA00389B71},Name:IAccessible,Value:11343624,VarType:9}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(43) : TypeClassInstance.Obj >>> 
{*Obj*}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(44) : TypeClassInstance.ExtendsObj >>> 
{__Instance:AutoInputBox,AlwaysOnTop:0,aTextPrefix:*NS*,deFaultText:[UseClipBoard],prompt:输入要增加的页码,title:输入要增加的页码}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(45) : TypeClassInstance.Class >>> 
{__Class:AutoInputBox,__Init:AutoInputBox.__Init(),__New:AutoInputBox.__New(),SetAlwaysOnTop:AutoInputBox.SetAlwaysOnTop(),SetDeFaultText:AutoInputBox.SetDeFaultText(),start:AutoInputBox.start()}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(46) : TypeClassInstance.FuncObj >>> 
{__Instance:Function,bindParas:{*Obj*},func:toString()}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(47) : TypeClassInstance.Exception >>> 
{File:D:\AHKs\ahk_lib\Test\LibTest_toString().ahk,Line:32,Message:Index Out Of Bounds.数组越界.,What:TypeClass.__Init}
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(48) : TypeClassInstance.Path >>> 
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(49) : TypeClassInstance.NS >>> 
*NS*
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(50) : TypeClassInstance.Number >>> 
123456789
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(51) : TypeClassInstance.Boolean >>> 
0
D:\AHKs\ahk_lib\Test\LibTest_toString().ahk(52) : TypeClassInstance.FileObj >>> 
0

*/
#If WinActive(A_ScriptName)
;可以按下Alt+L查看最近运行的行

/*
!^l:: ;主要是为了防止和CapsLock+Alt+l冲突,所以多加了一个^
ListLines
return

!^h::
KeyHistory
return

!a::
send,{F5}
return

!^s::
ListVars 
return
*/


#If


!q::
ExitApp
return

+!q::
Pause
return
