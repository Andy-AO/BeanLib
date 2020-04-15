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


"ABCDEFG".replaceAll("ACG".ToList(),"")

LogPrintln("ACG".ToList(),A_LineFile  "("  A_LineNumber  ")"  " : " """ACG"".ToList() >>> `r`n")

LogPrintln("ABCDEFG".replaceAll("ACG".ToList(),""),A_LineFile  "("  A_LineNumber  ")"  " : " """ABCDEFG"".replaceAll(""ACG"".ToList(),"""") >>> `r`n")

;~ replaceAll("[/\\:*?<>|]","")

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
