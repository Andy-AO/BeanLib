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
WinPId := "ahk_id " WinId
WinPath := "WinPath: " WinPath
```

### 抛出异常 Throws: 

- null
### 示例 Example
```autohotkey
Obj:=AnalyzeWin(WinTitle)
```