# Script Class

1.  用于对 AHK脚本 进行各种操作，比如，重启某个脚本，暂停某个脚本

### 已知问题

1. 发送消息的脚本,如果是通过 `#SingleInstance force` 重启的,不会执行成功 
2. 不支持非Unicode字符,会变成乱码,原因未知

[TOC]

## 域 Field 

**都是常量，写入会throw**

​	Static Msg := 0x111 

 	Static Open := 65300 	;打开窗口
 	Static Reload := 65400 	;重启
 	Static Edit := 65401 	;编辑
 	Static Spy := 65402 	;Spy
 	Static Pause  :=  65403 	;暂停
 	Static Suspend  :=  65404 	;挂起
 	Static Exit := 65405 	;退出

 	Static Lines := 65406 	;最近运行
 	Static Variable := 65407 	;变量信息
 	Static HotKeys := 65408 	;热键信息
 	Static KeyHistory := 65409 	;按键历史信息
 	Static Refresh := 65410 	;刷新 信息窗口

 	Static Help := 65411 	;打开CHM帮助文件
 	Static WebSite := 65412 	;打开 https://www.autohotkey.com

## 方法 Method

### Open()
激活窗口
### Reload()
重启
### Edit()
编辑
### Spy()
打开窗口探测工具
### Pause () 
暂停
### Suspend ()
挂起
### Exit()
退出

### Lines()
显示最近运行Lines
### Variable()
显示打开变量信息
### HotKeys()
显示热键信息
### KeyHistory()
显示按键历史信息
### Refresh()
刷新信息窗口

### Help()
打开CHM帮助文件
### WebSite()
打开 https://www.autohotkey.com

## 示例

```autohotkey

ScriptObj:=new Script("Reloader.ahk")
^p::
ScriptObj.Pause()
return
^r::
ScriptObj.Reload()
return
```