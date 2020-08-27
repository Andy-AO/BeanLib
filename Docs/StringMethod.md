# String Method

[TOC]
# 介绍
1.  是一个依靠[元编程](http://xrvu_zen.gitee.io/wyagd001.github.io/docs/Objects.htm#Meta_Functions)实现的 String 方法，并非类。
2.  主要包含对于 String 的各种增强操作, 包括但不限于 获取长度，获取单个字符，转为字符数组，提取汉字汉语拼音首字母...
3.  关于元编程的更多内容，可参考以下文档
    - [AHK官方文档](https://autohotkey.com/docs/Objects.htm#Meta_Functions)
    - [AHK元编程入门系列教程(@心如止水)](https://zhuanlan.zhihu.com/AHKZen)
    - [AHK面向对象的编程教程(@jeeswg)](https://www.autohotkey.com/boards/viewtopic.php?f=7&t=54588)
4.  由于这些方法都非常基础和简单，所以按照官方文档的处理方法(比如其对数学函数的处理方法)，多个方法的文档放在同一个页面之中。

### 定义常量
- 并非真实存在的，只是为了演示方便。
因为名字太常见，容易撞车。以后如果用得多了可能单独放在一个类里面。

**Str:="MyHome"**

**Zh:="那里有条美丽的河"**

### CharAt(index) - 提取字符

提取String中的字符

- 如果越界会抛出 IndexOutOfBounds 异常

**参数：**

index - 索引

``` autohotkey
Str.CharAt(6) ;返回e
Str.CharAt(7) ;抛出异常
Str.CharAt(0) ;抛出异常
```
### insert(insert,pos=1) - 插入字符串

在字符串中插入字符串。

如果`pos`>`length+1`，那么头部位置依旧为`length+1`。

**参数：**

insert- 被插入的字符串

pos - 被插入字符串在新字符串中的头部位置

**测试：**

有

### Length() - 获取长度

获取String的长度

``` autohotkey
Str.Length()
```

### ToList() - 转为数组

提取String中的字符

``` autohotkey
Str.ToList()
```

### toHex() - 转为十六进制(16进制)

如果不是数字会抛出"String is not Number"异常

### py() - 获取拼音首字母

转换汉字字符串为首字母汉语拼音字符串

- 提取自 [HotWindows(@刘老六)](https://www.iplaysoft.com/p/hotwindows)

``` autohotkey
Zh.py()
```

### ExtractFileNameByPath() - 从路径中提取文件名(带后缀)

从路径中提取文件名(带后缀)

```autohotkey
path=D:\BeanLib\StringMethod.ahk
println(path.ExtractNameFromPath())
```

### SplitFileName() - 分割带后缀文件名为单纯的文件名和后缀名(提取后缀名)

分割带后缀文件名为单纯的文件名和后缀名(提取后缀名)

```autohotkey
FileName=chrome.dll
s:=FileName.SplitFileName()
println(s[1])
println(s[2])
```

### isRegExMatch(aRegEx,aRegExOption:="i)")

检查字符串是否能完全匹配正则表达式。

`PathObj` 中的路径合法性检查就是依赖这个实现的，如下：

```autohotkey
	af(){
		aPath:=this.path
		aRegEx=^[a-zA-Z]:\\(((?![<>:"/\\|?*]).)+((?<![ .])\\)?)*$
		
		absolutePathResult:=aPath.isRegExMatch(aRegEx)
		
		if Not(absolutePathResult){
			Mes:=InvalidPara . "1"
			throwWithSt(Mes)
		}
		
		return
	}
```

### isNumber()

检查字符串是否为数字

其实就是检查是否能够完全匹配RegEx=[0-9]+

```autohotkey
LogPrintln("555".isNumber(),"""555"".isNumber() >>>")
```
### minToMSec()
分钟转毫秒

### secToMSec()
秒转毫秒

### replaceAll(aStringList,aReplaceString)

用多个关键词替换字符串

```AutoHotKey
"ABCDEFG".replaceAll("ACG".ToList(),"")

LogPrintln("ACG".ToList(),A_LineFile  "("  A_LineNumber  ")"  " : " """ACG"".ToList() >>> `r`n")

LogPrintln("ABCDEFG".replaceAll("ACG".ToList(),""),A_LineFile  "("  A_LineNumber  ")"  " : " """ABCDEFG"".replaceAll(""ACG"".ToList(),"""") >>> `r`n")
```

