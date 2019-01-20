
#Include D:\AHKs\Dev\_CoreLib.ahk
#Include D:\AHKs\Dev\_TempLib.ahk

#Persistent ;不让脚本自动退出,以便查看调试信息
#NoEnv
#Hotstring EndChars  ◎
#Hotstring ?0 O

#Warn All ;#全部开启
#Warn ClassOverwrite ;#无论如何也要开,类覆盖警告
#Warn LocalSameAsGlobal, Off ;#一定关本地全局冲突警告

#SingleInstance force
FileEncoding , UTF-8
SetTitleMatchMode 2
SendMode Input
Process, Priority,,High
SetWorkingDir %A_ScriptDir%
SetFormat,Float,0.2
SciTEConsoleEmpty() ;清除SciTE中控制台的信息
;~ stdoutln("")
DeBugDeepPrintln(A_ScriptName,"A_ScriptName >>> ")


#If WinActive(A_ScriptName)
;可以按下Alt+L查看最近运行的行

!^l:: ;主要是为了防止和CapsLock+Alt+l冲突,所以多加了一个^
ListLines
return

!^h::
KeyHistory
return

!^s::
ListVars 
return

!a::
reload
return

#If


!q::
ExitApp
return
