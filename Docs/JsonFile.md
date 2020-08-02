# JsonFile Class

1.  性质：实例类
2.	开发目的：Json对象的读写

## 方法 Method

### _New(path)

- path - JsonFile文件的路径

会先检查路径是否合法：如果路径不合法，会抛出异常。

### load()

从JsonFile文件中加载JsonObject，文件不存在，会加载空`json`。

### store(jsonObj)

向JsonFile文件中存储JsonObject



```Java
path := "D:\AHKs\Dev\APPBookMarkGroup\MyTomato.json"

jf := new JsonFile(path)

array := jf.load()

LogPrintln(array,A_LineFile  "("  A_LineNumber  ")"  " : " "array >>> `r`n")

array[3] := "New"

content := jf.store(array)

LogPrintln(content,A_LineFile  "("  A_LineNumber  ")"  " : " "content >>> `r`n")
```



```AutoHotKey
>"F:\gUAPP\AutoHotkey32Bit\SciTE\..\AutoHotkey.exe" /ErrorStdOut "D:\AHKs\ahk_lib\IO\Example_JsonFile.ahk"    
A_ScriptName >>> Example_JsonFile.ahk
D:\AHKs\ahk_lib\IO\Example_JsonFile.ahk(38) : array >>> 
[{title:MyGridPane [D:\JavaProject\MyGridPane]},{title:MyTomato [D:\JavaProject\MyTomato]},New]
D:\AHKs\ahk_lib\IO\Example_JsonFile.ahk(44) : content >>> 
[{"title":"MyGridPane [D:\\JavaProject\\MyGridPane]"},{"title":"MyTomato [D:\\JavaProject\\MyTomato]"},"New"]

```

