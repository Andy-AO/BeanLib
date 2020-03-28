﻿#Include D:\AHKs\Dev\_CoreLib.ahk

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

theWinTitle := "SciTE4AutoHotkey"

ComObjError(false)


theHWnd := ""
WinGet, theHWnd, ID , %theWinTitle%

theWinObj := _Win.Analyze("ahk_id " theHWnd)
LogPrintln(theWinObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theWinObj >>> `r`n")

theIdObject := "0"

theAccObj := Acc_ObjectFromWindow(theHWnd, theIdObject)

vAccRoleNum := theAccObj.accRole(vChildId)
LogPrintln(vAccRoleNum,A_LineFile  "("  A_LineNumber  ")"  " : " "vAccRoleNum >>> `r`n")


vAccName := theAccObj.accName(vChildId)
LogPrintln(vAccName,A_LineFile  "("  A_LineNumber  ")"  " : " "vAccName >>> `r`n")

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
