# Everything Class

使用 Everything 进行搜索

- Everything 是一款非常出名的搜索工具，搜索速度极快
- 使用条件 1.根目录或指定目录下存在 Everything的DLL  2.Everything程序正在运行
  - 根目录指的是`A_ScriptDir`，并不是`BeanLib`所在的根目录。
  - DLL 概不提供 自己从 Everything 中提取，或者直接指定本机 Everything 目录。
- 提取自 RunAny - 一劳永逸的快速启动 @hui-Zz，主要改动如下
  - 精简方法名 
  - 调用 __New 时直接获取 Dll 信息，检查 Everything 窗口是否存在

## 域 Field 

- key:=""
- MatchWholeWord:=false
- DLL:=false


## 方法 Method

### __New(DLLPath:="")

构造一个 Everything 对象

- 会通过 getDll() 检查 Dll 文件是否存在，如果不存在 `throw Exception("Not Found Everything.DLL/Everything64.DLL.")`
- 会检查 `ahk_exe Everything.exe`是否存在，如果不存在`throw Exception("ahk_exe Everything.exe is not Exist.")`

### getDll(DLLPath:="")

确认Everything的DLL是否存在

- 如果存在，返回名称，不存在则返回 false

### SetKey(aValue)

设置搜索关键词

return null

### SetMatchWholeWord(aValue)

设置是否全字匹配

return null

###  Search(aValue=1)

执行搜索动作 (执行后直接返回匹配数)

- aValue - 意义不明，并非必须填写

return null

###  Count()

返回匹配总数

###  GetFileName(aValue)

返回一个文件名

- aValue - 文件名Index

###  GetFullPath(aValue,cValue=128)

返回一个文件全路径

- aValue - 文件路径Index

### GetVersionString()
获取 Everything 版本 (@YuKuan贡献)

### getSearchResultList()

获取所有结果组成的数组

### isEverythingExist()

检测 Everything 是否存在

### afEverythingExist()

断言 Everything 存在

## 示例

```autohotkey
Obj:=new Everything()

Obj.Setkey("xxx")

Obj.Search()
theLen:=Obj.Count()
Str:=Obj.GetFullPath(0)

StrList:=[]

loop,%theLen%{
StrList.push(Obj.GetFullPath(A_Index-1))
}

ExitApp

```

```autohotkey
	Obj:=new Everything()

	thekey="D:\MyDesk" 
	Obj.Setkey(thekey)
	Obj.Search()
	
	searchResultList:=Obj.getSearchResultList()
```