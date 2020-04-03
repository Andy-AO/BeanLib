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

theAccObj := Acc_ObjectFromWindow(theHWnd, theIdObject := 0)

try{
	theErrorPath := "4.9.9x"
	theErrorAccObj := _Acc.ObjectFromPath(theAccObj,theErrorPath)
}
catch,ex{
	LogPrintln(ex,A_LineFile  "("  A_LineNumber  ")"  " : " "ex >>> `r`n")
}


try{
	theErrorPath := "4.9.9"
	theErrorAccObj := _Acc.ObjectFromPath(theAccObj,theErrorPath)
}
catch,ex{
	LogPrintln(ex,A_LineFile  "("  A_LineNumber  ")"  " : " "ex >>> `r`n")
}

thePath := "4.1.3"

theAccObj := _Acc.ObjectFromPath(theAccObj,thePath)

PrintScreen::
	result := theAccObj.accDefaultAction(vChildId)
	LogPrintln(_Acc.Analyze(theAccObj),A_LineFile  "("  A_LineNumber  ")"  " : " "_Acc.Analyze(theAccObj) >>> `r`n")
	theAccObj.accDoDefaultAction(vChildId)
	LogPrintln(result,A_LineFile  "("  A_LineNumber  ")"  " : " "result >>> `r`n")
return

;------------------------------

/*
PrintScreen::
	theResult := _Acc.AnalyzeFromPoint(vChildId)
	LogPrintln(theResult,A_LineFile  "("  A_LineNumber  ")"  " : " "theResult >>> `r`n")
return
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
