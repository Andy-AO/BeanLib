# String Method

[TOC]
# 介绍
1.  静态类，里面存放着各种实用工具，稍微改改就能直接当软件来用。
2.  这是我的私人工具箱，没有提供源码，只是个人查找使用而已。

### SendShortCut(aLinkFileDir) - 发送快捷方式到指定目录

复制选中的文件，并且发送快捷方式到指定目录

**参数：**

aLinkFileDir - 指定目录

``` autohotkey
^r::
SendShortCut("D:\MyLibrary")
return
```


