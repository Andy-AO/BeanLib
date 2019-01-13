# String Method

[TOC]
# 介绍
1.  是一个依靠[元编程](http://xrvu_zen.gitee.io/wyagd001.github.io/docs/Objects.htm#Meta_Functions)实现的 String 方法，并非类。
2.  主要包含对于String的各种增强操作, 包括但不限于 获取长度，单个字符，转为字符数组，提取汉字汉语拼音首字母...
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

### CharAt() - 提取字符

提取String中的字符

- 如果越界会抛出 IndexOutOfBounds 异常

``` autohotkey
Str.CharAt(6) ;返回e
Str.CharAt(7) ;抛出异常
Str.CharAt(0) ;抛出异常
```

### Length() - 获取长度

获取String的长度

``` autohotkey
Str.Length()
```

### ToSA() - 转为数组

提取String中的字符

``` autohotkey
Str.ToSA()
```


### py() - 获取拼音首字母

转换汉字字符串为首字母汉语拼音字符串

- 提取自 [HotWindows(@刘老六)](https://www.iplaysoft.com/p/hotwindows)

``` autohotkey
Zh.py()
```