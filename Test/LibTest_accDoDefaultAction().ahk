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

theWinTitle := "Sourcetree ahk_exe SourceTree.exe",theHWnd := ""
WinGet, theHWnd, ID , %theWinTitle%
theWinObj := _Win.Analyze("ahk_id " theHWnd)
LogPrintln(theWinObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theWinObj >>> `r`n")

theAccObj := AccWrapper.ObjectFromWindow(theHWnd, theIdObject := 0)

theAccObj := theAccObj.ObjectFromPath("4.2.1.2.2.8")

LogPrintln(theAccObj.Analyze(),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj.Analyze() >>> `r`n")

vChildId := 0

Insert::
	result := theAccObj.getDefaultActionText(vChildId)
	returnValue := theAccObj.doDefaultAction(vChildId)
	LogPrintln(result,A_LineFile  "("  A_LineNumber  ")"  " : " "result >>> `r`n")
	LogPrintln(returnValue,A_LineFile  "("  A_LineNumber  ")"  " : " "returnValue >>> `r`n")
return

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
