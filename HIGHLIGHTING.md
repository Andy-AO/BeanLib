# HIGHLIGHTING(语法高亮)

## 当前的支持情况

准备支持 `SciTE4AutoHotkey` 的语法高亮和自动完成。

现在只是初步的支持，对于一些常用的类和函数做了最简单的适配。

## 使用方法
### SciTE4AutoHotkey 语法高亮机制

`SciTE4AutoHotkey` 的自动完成和语法高亮分别由 `ahk.api` `ahk.keywords.properties` 两个文件负责。

其中 `ahk.api` 是 AHK 格式文件，使用`;`作为注释符号；`properties`则使用`#`为注释符号，且高亮信息仅支持英文小写字母。
### 可以使用 mlink 建立链接使用
两个文件都放在项目的根目录中。Clone 之后可以使用 `mlink` 命令在 Git仓库 和 SciTE根目录 间建立文件软链接，从而实现联动。

比如

```CMD
mklink "F:\AutoHotkey\SciTE\ahk.api" "D:\AHKs\ahk_lib\ahk.api"
```

这个的意思就是，在 "F:AutoHotkey\SciTE\ahk.api" 建立一个指向 "D:\AHKs\ahk_lib\ahk.api" 的软链接。

该命令使用时，应保证  "F:AutoHotkey\SciTE\ahk.api" 路径没有被占用。

### 软硬链接的区别

硬链接只支持在同卷中建立，仅支持给文件建立。硬链接相当于同一个文件拥有两个目录，他们是完全平等的。

软链接可以在任意位置间建立，同时支持文件和文件夹。软链接类似于快捷方式，软链接被删除，不会影响硬链接。

[了解更多](https://blog.csdn.net/x534119219/article/details/79111936)。