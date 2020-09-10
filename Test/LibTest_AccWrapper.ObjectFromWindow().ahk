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

theAccWrapperObj.println()

/* 
>"C:\Program Files\AutoHotkey\SciTE\..\AutoHotkey.exe" /ErrorStdOut "D:\AHKs\ahk_lib\Test\LibTest_AccWrapper.ObjectFromWindow().ahk"    
A_ScriptName >>> LibTest_AccWrapper.ObjectFromWindow().ahk
{Action:*NS*,ChildCount:7,Description:*NS*,Focus:*NS*,Help:*NS*,HelpTopic:0,hWnd:65736,Keyboard:*NS*,Location:{h:46,w:1920,x:0,y:1034},Name:任务栏,Path:--,RoleNum:9,RoleNumHex:0x9,RoleText:窗口,Selection:*NS*,SelectionCount:0,StateNum:1048576,StateNumHex:0x100000,StateText:可设定焦点,StateTextAll:focusable,Value:*NS*}
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
