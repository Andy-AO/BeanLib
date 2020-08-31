# PathObj Class

1.  对路径字符串进行各种操作。完全依赖 `SplitPath` 函数实现。
2.  对路径的合法性进行检查。依赖正则实现。
3.  [构造方法会自动调用split()生成各种field](### split())。

[TOC]

## 方法 Method
### getPath()
获取原路径

### isExist()

检测文件是否存在

### assertExist()

断言文件存在

### isFile()

检查路径是否为文件

### assert()

检查路径是否合法

默认假设绝对路径，如果发现不合法；那么假设为相对路径，在当前路径的前面加入变量`A_WorkingDir`后再行检查。

### split()

生成以下 Filed：

1. name
2. dir
3. ext (扩展名)
4. name_no_ext
5. drive

### create(aPathList)

批量创建`PathObj`，`aPathList`既可以是`List`，也可以是以换行分开的路径`String`。

返回`PathOb[]`。

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