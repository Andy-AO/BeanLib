



Name := "TDD_故意测试.ahk"

Msg := 0x111 
Open:=65300 ;打开窗口
Reload:=65400 ;重启
Edit:=65401 ;编辑
Spy:=65402 ;Spy
Pause := 65403 ;暂停
Suspend := 65404 ;挂起
Exit:=65405 ;退出

Lines:=65406 ;最近运行
Variable:=65407 ;变量信息
HotKeys:=65408 ;热键信息
KeyHistory:=65409 ;按键历史信息
Refresh:=65410 ;刷新 信息窗口

Help:=65411 ;打开CHM帮助文件
WebSite:=65412 ;打开 https://www.autohotkey.com

PostMessage, %Msg%, %wParam%,,, %Name% ahk_class AutoHotkey
