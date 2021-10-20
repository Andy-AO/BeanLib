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

LogPrintln(A_ScriptName,"A_ScriptName >>> ")

ExitAppForHotKeyAltQ(){
	ExitApp
	return
}

Hotkey, !q , ExitAppForHotKeyAltQ
