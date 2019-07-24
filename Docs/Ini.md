# Ini Class

1. 更方便地读取 Ini 文件

   

[TOC]

## Section Class

### __New(aIni,aSection)

 构造方法

### read(aKey,aDefault:="")

依照 key 读取 value，完全用 IniRead 命令实现

- aDefault，是当 key 没有找到时，所填的默认值。如果没有填写默认值，数据又找不到，那么就会 throw  Key-Value is not Exsit.

### readInMap(aMap,aKey,aDefault:="")

读取 key 并且放入 一个 Map 中

### getMap(aKeys*)

按照 keyList 批量读取 Value ，并且以 Map 形式返回。

```autohotkey
	aIniPath:=A_ScriptDir "\test.ini"
	aSection:="test"
	newIni:=new Ini(aIniPath)
	newSection:=newIni.getSection(aSection)
	
	theMap:=newSection.getMap("A","B","C","F")
	
	LogPrintln(theMap,"theMap >>>")
```

```autohotkey
A_ScriptName >>> TDD_getMap().ahk
theMap >>>{A:1,B:2,C:3,F:*NS*}

```