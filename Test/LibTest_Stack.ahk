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


theStack := new Stack()

LogPrintln(theStack.empty(),A_LineFile  "("  A_LineNumber  ")"  " : " "theStack.empty() >>> `r`n")

for i,v in _List.LetterList {
	theStack.push(v)
}

LogPrintln(theStack,A_LineFile  "("  A_LineNumber  ")"  " : " "theStack >>> `r`n")

for i,v in _List.LetterList {
	theStack.push(v)
}

LogPrintln(theStack,A_LineFile  "("  A_LineNumber  ")"  " : " "theStack >>> `r`n")

LogPrintln(theStack.empty(),A_LineFile  "("  A_LineNumber  ")"  " : " "theStack.empty() >>> `r`n")

LogPrintln(theStack.length(),A_LineFile  "("  A_LineNumber  ")"  " : " "theStack.length() >>> `r`n")

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
