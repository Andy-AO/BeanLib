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

;下面是之前手动测试留下来的痕迹,可以和现在的全自动测试对比下

LogPrintln(TypeClassInstance.ComObj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.ComObj >>> `r`n")
LogPrintln(TypeClassInstance.Obj,A_LineFile  "("  A_LineNumber  ")"  " : " "TypeClassInstance.Obj >>> `r`n")
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
Obj:=100,Class:=110,FuncObj:=120,Exception:=121
List:=130
Str:=10,NS:=11,Number:=12,Boolean:=13

/* 
>"C:\Program Files\AutoHotkey\SciTE\..\AutoHotkey.exe" /ErrorStdOut "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"    
A_ScriptName >>> LibTest_toString().ahk
toString(Boolean):0
toString(Class):{__Class:AutoInputBox,__Init:,__New:,SetAlwaysOnTop:,SetDeFaultText:,start:}
toString(ComObj):{Class:*NS*,CLSID:*NS*,IID:{618736E0-3C3D-11CF-810C-00AA00389B71},Name:IAccessible,Value:13026208,VarType:9}
toString(Exception):{File:D:\AHKs\ahk_lib\Test\Lib.ahk,Line:7,Message:Index Out Of Bounds.数组越界,What:TypeClass.__Init}
toString(FileObj):{}
toString(FuncObj):{__Instance:Function,bindParas:{*Obj*},func:}
toString(NS):*NS*
toString(Number):123456789
toString(Obj):{*Obj*}
toString(Path):D:\AHKs\ahk_lib\Test\LibTest_toString().ahk

 */

!q::
ExitApp
return

+!q::
Pause
return
