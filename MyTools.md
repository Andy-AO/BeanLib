# String Method

[TOC]
# 介绍
1.  静态类，里面存放着各种实用工具，稍微改改就能直接当软件来用。
2.  这是我的私人工具箱,大多数函数都不能在直接运行,如果不想要的话可以不同步

### SendShortCut(aLinkFileDir) - 发送快捷方式到指定目录

复制选中的文件，并且发送快捷方式到指定目录

**参数：**

aLinkFileDir - 指定目录

``` autohotkey
^r::
SendShortCut("D:\MyLibrary")
return
```


