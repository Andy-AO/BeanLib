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

theWinTitle := "D:\MyDocs\重要文档\iThoughts思维导图\突发任务.itmz",theHWnd := ""
WinGet, theHWnd, ID , %theWinTitle%
theWinObj := _Win.Analyze("ahk_id " theHWnd)
LogPrintln(theWinObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theWinObj >>> `r`n")

theAccObj := AccWrapper.ObjectFromWindow(theHWnd, theIdObject := 0)
LogPrintln(theAccObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj >>> `r`n")

LogPrintln(theAccObj.Analyze(0),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj.Analyze(0) >>> `r`n")

thePath := "4.1.3"

;在这里可能生成了错误的ACC对象
theAccObj := theAccObj.ObjectFromPath(thePath)


LogPrintln(theAccObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj >>> `r`n")

LogPrintln(theAccObj.Analyze(0),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj.Analyze(0) >>> `r`n")

return


PrintScreen::
	result := theAccObj.accDefaultAction(vChildId)
	LogPrintln(theAccObj.Analyze(theAccObj),A_LineFile  "("  A_LineNumber  ")"  " : " "theAccObj.Analyze(theAccObj) >>> `r`n")
	theAccObj.accDoDefaultAction(vChildId)
	LogPrintln(result,A_LineFile  "("  A_LineNumber  ")"  " : " "result >>> `r`n")
return

;------------------------------


^PrintScreen::
	theResult := _Acc.AnalyzeFromPoint(vChildId)
	LogPrintln(theResult,A_LineFile  "("  A_LineNumber  ")"  " : " "theResult >>> `r`n")
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
