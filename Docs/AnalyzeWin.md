**获取窗口参数,可用于窗口操作和调试:**

```autohotkey
AnalyzeWin(InputWinTitle,EnableWinText:=false,InputDetectHiddenWindows:="")
```

### 参数 Parameters: 

- InputWinTitle - 目标窗口的 `WinTitle`
- EnableWinText - 是否检测 `WinText`
- InputDetectHiddenWindows - 是否检测隐藏窗口
  - 不会影响全局设置
  - 如果不填或者为 NullString ，那么就按照全局设置来执行
  - AutoHotKey 自带的信息窗口属于隐藏窗口

### 返回 Returns: 
Obj

- 包含以下 Key

```autohotkey
WinTitle := "WinTitle: " WinTitle
WinClass := "ahk_class " WinClass
Winexe := "ahk_exe " Winexe
WinPID := "ahk_id " WinPID
WinPath := "WinPath: " WinPath
```

```autohotkey
Str 上面所有信息加入换行符，并变为字符串输出。主要是为了调试时，直接查看信息的方便。
```

### 抛出异常 Throws: 

- null
### 示例 Example
```autohotkey
Obj:=AnalyzeWin(WinTitle)
Str:=Obj.Str
```