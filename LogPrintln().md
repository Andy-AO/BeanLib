**将任何对象转换为字符串，并且打印到标准输出:**

主要用于调试。执行的必要条件是 `Bean.LogEnable = true`，默认值为 `false`。

- count = 0 的 Object 会显示 {\*Object\*}
- NullString 会显示 \*NS\*
- count = length 的Object(List) ，用 [] 包裹
- count != length 的Object ，用 {} 包裹

```autohotkey
LogPrintln(Obj:="",prefix:="",postfix:="")
```

### 参数 Parameters: 

- Obj - 需要打印的对象

- prefix - 打印的前缀字符串

- postfix- 打印的后缀字符串

  前后缀主要用于打印时解释对象，详见示例

### 返回 Returns: 

null

### 抛出异常 Throws: 
### 示例 Example
```autohotkey
theList:=Object(_List.TheList1,[_List.TheList2,"D"],[],"D")
LogPrintln(theList,"theList >" ">> ")
```

![运行效果](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_4.png)

```autohotkey
#If WinActive("ahk_exe SciTE.exe") Or WinActive(".ahk - Notepad++")

;一键生成调试语句
^RButton::
	TheName:=SuperCopy(20,0),TheNameAfterEscape:=StrReplace(TheName,"""","""""") 
	;主要是为了防止清理调试语句时候被清除,所以用两端分开再合起来的办法
	logPosfix1="%TheNameAfterEscape% >
	logPosfix2=>>"
	logPosfix:=logPosfix1 . logPosfix2
	OutString=LogPrintln(%TheName%,%logPosfix%)
	ClipBoard:=OutString
	TrayTip,一键生成调试语句,%TheName% 的 DeepPrintln 形式已经放到剪切板中了.
return
#If
```