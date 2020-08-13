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

path=
(
H:\MyLibrary\电子书_计算机\GitHub实践(2016-11).pdf
H:\MyLibrary\电子书_计算机\Git小书(2016-06-23)_刘传君__EA022_文本版.docx
H:\MyLibrary\电子书_计算机\Git权威指南(2011).docx
H:\MyLibrary\电子书_计算机\Git高手之路(2018-04)_自带OCR_2020.8.13_AYOCR.pdf
H:\MyLibrary\电子书_计算机\Git高手之路(2018-04)_自带OCR_2020.8.13_AYOCR.docx
H:\MyLibrary\电子书_计算机\Git团队协作(2017-6)_625005.pdf
H:\MyLibrary\电子书_计算机\Git学习指南(2015-3)_ rené preibel 普莱贝尔 & bjorn stachmann 斯拉赫曼.docx
H:\MyLibrary\电子书_计算机\精通Git(Pro Git)(2017-9)_第2版_中文版_文本版.pdf
H:\MyLibrary\电子书_计算机\JavaScript\Electron\(2017)Electron From Beginner to Pro Learn to Build Cross Platform Desktop Applications using Githubs Electron by Chris Griffith,Leif Wells (auth.) (z-lib.org).pdf
H:\MyLibrary\电子书_计算机\Git团队协作(2017-6)_艾玛·简·霍格宾·韦斯特比__978-7-115-45467-6_文本版.docx
H:\MyLibrary\电子书_计算机\GitHub_漫游指南(2015.3.9)(网络自制书)_Phodal_Huang_漫游指南__文本版.docx
H:\MyLibrary\电子书_计算机\Git版本控制管理（第2版）_[美]乔恩·罗力格（Jon_Loeliger），马修·麦卡洛（Matthew_McCullough）著___文本版.docx
H:\MyLibrary\电子书_计算机\GitHub入门与实践(2015-7)_(图灵程序设计丛书)_[日]大塚弘记__978-7-115-39409-5_文本版.docx
H:\MyLibrary\电子书_计算机\Git权威指南(2011)_第2版.pdf
)

theList := PathObj.creat(path)

for i,v in theList {
	LogPrintln(v.name,A_LineFile  "("  A_LineNumber  ")"  " : " "v.name >>> `r`n")
}

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
