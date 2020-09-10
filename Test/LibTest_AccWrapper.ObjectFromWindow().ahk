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

theAccWrapperObj := AccWrapper.ObjectFromWindow(_Win.Analyze("ahk_class Shell_TrayWnd ahk_exe explorer.exe").id)

LogPrintln(theAccWrapperObj.Analyze(),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccWrapperObj.Analyze() >>> `r`n")

/*
D:\AHKs\ahk_lib\Test\LibTest_AccWrapper.ObjectFromWindow().ahk(28) : theAccWrapperObj.Analyze() >>> 
{Action:*NS*,ChildCount:7,Description:*NS*,Focus:*NS*,Help:*NS*,HelpTopic:0,hWnd:65736,Keyboard:*NS*,Location:{h:46,w:1920,x:0,y:1034},Name:任务栏,Path:--,RoleNum:9,RoleNumHex:0x9,RoleText:窗口,Selection:*NS*,SelectionCount:0,StateNum:1048576,StateNumHex:0x100000,StateText:可设定焦点,StateTextAll:focusable,Value:*NS*}
*/

theAccWrapperObj.println()

/* 
{Action:*NS*,ChildCount:7,Description:*NS*,Focus:*NS*,Help:*NS*,HelpTopic:0,hWnd:65736,Keyboard:*NS*,Location:{h:46,w:1920,x:0,y:1034},Name:任务栏,Path:--,RoleNum:9,RoleNumHex:0x9,RoleText:窗口,Selection:*NS*,SelectionCount:0,StateNum:1048576,StateNumHex:0x100000,StateText:可设定焦点,StateTextAll:focusable,Value:*NS*}
 */

/*
TODO:现在的问题就是，我没有对于某个窗口进行分析的工具，结果导致经常找不到目标.
原来那个工具的话，主要是用鼠标焦点，在实际的使用中，一般不会这么操作，尤其是对于那些窗口比较另类的情况，比如说任务栏之类的。
之后可以进行改进，在此基础上增加ObjectFromWindow对象的分析功能,最好支持全局搜索,直接找到对应的值所在的控件.
*/

;使用便利来查找窗口下的「任务栏」控件
for i,v in theAccWrapperObj.getChildren() {
  LogPrintln( v.Analyze(),A_LineFile  "("  A_LineNumber  ")"  " : " " v.Analyze() >>> `r`n")
}

;打印任务栏中的「开始」控件信息
LogPrintln(theAccWrapperObj.ObjectFromPath("4.1").Analyze(),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccWrapperObj.ObjectFromPath(""4.1"").Analyze() >>> `r`n")

/* 
D:\AHKs\ahk_lib\Test\LibTest_AccWrapper.ObjectFromWindow().ahk(53) : theAccWrapperObj.ObjectFromPath("4.1").Analyze() >>> 
{Action:*NS*,ChildCount:7,Description:*NS*,Focus:*NS*,Help:*NS*,HelpTopic:0,hWnd:65744,Keyboard:*NS*,Location:{h:46,w:54,x:0,y:1034},Name:开始,Path:--,RoleNum:9,RoleNumHex:0x9,RoleText:窗口,Selection:*NS*,SelectionCount:0,StateNum:1048576,StateNumHex:0x100000,StateText:可设定焦点,StateTextAll:focusable,Value:*NS*}
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
