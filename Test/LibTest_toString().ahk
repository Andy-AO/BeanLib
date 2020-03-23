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

LogPrintln(A_ScriptName,"A_ScriptName >>> ")

theComObj := Acc_ObjectFromPoint(vChildId)
theObj := Object()
theExtendsObj := new AutoInputBox("输入要增加的页码","输入要增加的页码")
theClass := AutoInputBox
theFuncObj := new Function("toString")
theException := Exception(_Ex.IndexOutOfBounds)
thePath := theStr := "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"
theNS := ""
theNumber := "123456789"
theBoolean := false
theFileObj :=  FileOpen(thePath,"r")

LogPrintln(theComObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theComObj >>> `r`n")
LogPrintln(theObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theObj >>> `r`n")
LogPrintln(theExtendsObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theExtendsObj >>> `r`n")
LogPrintln(theClass,A_LineFile  "("  A_LineNumber  ")"  " : " "theClass >>> `r`n")
LogPrintln(theFuncObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theFuncObj >>> `r`n")
LogPrintln(theException,A_LineFile  "("  A_LineNumber  ")"  " : " "theException >>> `r`n")
LogPrintln(thePath,A_LineFile  "("  A_LineNumber  ")"  " : " "thePath >>> `r`n")
LogPrintln(theNS,A_LineFile  "("  A_LineNumber  ")"  " : " "theNS >>> `r`n")
LogPrintln(theNumber,A_LineFile  "("  A_LineNumber  ")"  " : " "theNumber >>> `r`n")
LogPrintln(theBoolean,A_LineFile  "("  A_LineNumber  ")"  " : " "theBoolean >>> `r`n")
LogPrintln(theFileObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theFileObj >>> `r`n")

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
