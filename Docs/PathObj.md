# PathObj Class

1.  对路径字符串进行各种操作。完全依赖 `SplitPath` 函数实现。
2.  对路径的合法性进行检查。依赖正则实现。

[TOC]

## 方法 Method
### getPath()
获取原路径

### isFile()

检查路径是否为文件

### af()

检查路径是否合法

### split()

生成以下 Filed：

1. name
2. dir
3. ext (扩展名)
4. name_no_ext
5. drive

### __New(aPath)

建立一个新的路径对象

```autohotkey
FullFileName = C:\My Documents\Address List.txt
;~ FullFileName = C:\My Documents\\Address List.txt
;~ FullFileName = Address List.txt
;~ FullFileName = \Address List.txt

thePathObj:=new PathObj(FullFileName)

LogPrintln(thePathObj.name,"thePathObj.name >>>")
LogPrintln(thePathObj.dir,"thePathObj.dir >>>")
LogPrintln(thePathObj.ext,"thePathObj.ext >>>")
LogPrintln(thePathObj.name_no_ext,"thePathObj.name_no_ext >>>")
LogPrintln(thePathObj.drive,"thePathObj.drive >>>")
```