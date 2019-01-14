# HIGHLIGHTING(语法高亮)

## 当前的支持情况

准备支持 `SciTE4AutoHotkey` 的语法高亮和自动完成。

现在只是初步的支持，对于一些常用的类和函数做了最简单的适配。

## 使用方法

`SciTE4AutoHotkey` 的语法高亮和自动完成分别由 `ahk.api` `ahk.keywords.properties` 两个文件负责。

这两个文件目前都已经放在 根目录 了，可以直接 Clone 到本地。

我的使用方法是 `mlink` 命令直接建立软链接。

比如

```CMD
mklink "F:AutoHotkey\SciTE\ahk.api" "D:\AHKs\Stable\ahk_lib\ahk.api"
```

这个的意思就是，在 "F:AutoHotkey\SciTE\ahk.api" 建立一个指向 "D:\AHKs\Stable\ahk_lib\ahk.api" 的软链接。

### 软硬链接的区别

硬链接只支持在同卷中建立，支持给文件建立。硬链接相当于同一个文件拥有两个目录，他们是完全平等的。

软链接可以在任意位置间建立，支持文件和文件夹。软链接类似于快捷方式，软链接被删除，不会影响硬链接。

了解更多[可查看该博文](https://blog.csdn.net/x534119219/article/details/79111936)。