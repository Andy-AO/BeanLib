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

LogPrintln(toString(InvisibleCharacter.List),A_LineFile  "("  A_LineNumber  ")"  " : " "toString(InvisibleCharacter.List) >>> `r`n")

theCount := InvisibleCharacter.count(toString(InvisibleCharacter.List))

LogPrintln(theCount,A_LineFile  "("  A_LineNumber  ")"  " : " "theCount >>> `r`n")

LogPrintln(InvisibleCharacter.List.Length(),A_LineFile  "("  A_LineNumber  ")"  " : " "InvisibleCharacter.List.Length() >>> `r`n")

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
