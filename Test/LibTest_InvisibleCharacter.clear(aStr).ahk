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

theNewStr := RandomStr() "`r`n" RandomStr() "`r`n" RandomStr() "`r`n" RandomStr() "`r`n" 

LogPrintln(theNewStr.Length(),A_LineFile  "("  A_LineNumber  ")"  " : " "theNewStr.Length() >>> `r`n")
LogPrintln(theNewStr,A_LineFile  "("  A_LineNumber  ")"  " : " "theNewStr >>> `r`n")

for i,Chr in InvisibleCharacter.List {
	Random,insertIndex,1,% theNewStr.length()
	theNewStr := theNewStr.Insert(Chr,insertIndex)
}

LogPrintln(theNewStr.Length(),A_LineFile  "("  A_LineNumber  ")"  " : " "theNewStr.Length() >>> `r`n")
LogPrintln(theNewStr,A_LineFile  "("  A_LineNumber  ")"  " : " "theNewStr >>> `r`n")

theRegex := InvisibleCharacter.Regex

LogPrintln(theRegex,A_LineFile  "("  A_LineNumber  ")"  " : " "theRegex >>> `r`n")
LogPrintln(InvisibleCharacter.count(theNewStr),A_LineFile  "("  A_LineNumber  ")"  " : " "InvisibleCharacter.count(theNewStr) >>> `r`n")

theNewStr := InvisibleCharacter.clear(theNewStr)

LogPrintln(theNewStr,A_LineFile  "("  A_LineNumber  ")"  " : " "theNewStr >>> `r`n")

LogPrintln(InvisibleCharacter.count(theNewStr),A_LineFile  "("  A_LineNumber  ")"  " : " "InvisibleCharacter.count(theNewStr) >>> `r`n")

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
