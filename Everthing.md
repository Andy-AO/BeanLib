# Everthing Class

使用 Everthing 进行搜索

- Everthing 是一款非常出名的搜索工具，搜索速度极快
- 使用条件 1.根目录或指定目录下存在 Everthing的DLL  2.Everthing程序正在运行
- 提取自 RunAny - 一劳永逸的快速启动 @hui-Zz，主要改动如下
  - 精简方法名 
  - 调用 __New 时直接获取 Dll 信息，检查 Everthing 窗口是否存在

## 域 Field 

- key:=""
- MatchWholeWord:=false
- DLL:=false


## 方法 Method

### __New(DLLPath:="")

构造一个 Everthing 对象

- 会通过 getDll() 检查 Dll 文件是否存在，如果不存在 `throw Exception("Not Found Everthing.DLL/Everthing64.DLL.")`
- 会检查 `ahk_exe Everything.exe`是否存在，如果不存在  `throw Exception("Not Found Everthing.DLL/Everthing64.DLL.")`

### getDll(DLLPath:="")

确认Everthing的DLL是否存在

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

###  Count()

返回匹配总数

###  GetFileName(aValue)

返回一个文件名

- aValue - 文件名Index

###  GetFullPath(aValue,cValue=128)

返回一个文件全路径

- aValue - 文件路径Index
