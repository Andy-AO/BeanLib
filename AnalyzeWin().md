**获取窗口参数,可用于窗口操作和调试:**

```autohotkey
AnalyzeWin(InputWinTitle,EnableWinText:=false)
```

### 参数 Parameters: 

- InputWinTitle - 目标窗口的 `WinTitle`
- EnableWinText - 是否检测 `WinText`

### 返回 Returns: 
Obj 或者 false

- 如果窗口不存在，那么就返回 `false`

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