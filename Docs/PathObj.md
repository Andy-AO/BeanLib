# PathObj Class

1.  对路径字符串进行各种操作。完全依赖 `SplitPath` 函数实现。
2.  对路径的合法性进行检查。依赖正则实现。
3.  [构造方法会自动调用split()生成各种field](### split())。

PathObj不依赖于真实对象，只要路径是合法的，就能够存在。

[TOC]

## 方法 Method

### __New(aPath,aRootPathObj := "")

构造路径对象

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

#### 参数 ParaMeter

- aPath - 路径字符串
  支持相对路径和绝对路径

- aRootPathObj - aPath的根目录PathObj
  如果为空，则未指定根目录

#### 测试 Test

有

### replaceName(SearchText,ReplaceText)

替换文件名

和替换字符串的作用类似，只不过，这个字符串是文件名，替换后文件名会被更改

### reName(aName)

重命名文件或目录

重命名之前会检查，如果是文件则调用`FileMove`命令，否则就调用`FileMoveDir`命令。

#### 返回值 Return

if(失败)

​	return false

else

​	return 新PathObj

#### 测试 Test

有

### getPath()

获取路径

相对路径在构造方法中会转换为绝对路径存储起来，所以不会随后续的相对路径变化而变化，很好的解决AHK命令式编程，导致出现各种全局变量的问题。

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

