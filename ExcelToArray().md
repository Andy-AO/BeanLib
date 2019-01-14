**转 Excel 文件为 SA:**

```autohotkey
ExcelToArray(FileName, nSheet := 1, last_row := "", last_column := "")
```

### 参数 Parameters: 

- FileName - 文件名
- nSheet - 工作表名
- last_row - 截止行(数字)
- last_column - 截止列(数字)

### 返回 Returns: 
SA
### 抛出异常 Throws: 
- _Ex.NoExistFile
### 示例 Example

- 测试文件 `test.xlsx` 放在根目录了

```autohotkey
;全参数示例
arr := ExcelToArray("test.xlsx","Sheet2","3","1")
```

```autohotkey
;自带示例(绘制出了GUI)
#NoEnv
#SingleInstance Force
SetBatchLines -1
#Include ExcelToArray.ahk

Gui, Add, ListView, xm w700 r10 Grid, A|B|C|D|E|F|G|H|I
Loop, 9
	LV_ModifyCol(A_Index, 75)
Gui, Show,, Get Listview data from excel

SplashTextOn, , , Loading...
Gosub, ImportData
SplashTextOff
Return

ImportData:
	arr := ExcelToArray("test.xlsx")

	for i, dat in arr
		LV_Add("", dat*)
Return

GuiClose:
ExitApp
```

Form：https://github.com/tmplinshi/ExcelToArray

在元函数基础上进行了改动

- 使用 Local 变量之前先进行了声明，防止 `#Warn` 报警
- test.xlsx增加 Sheet2 以便测试更多参数