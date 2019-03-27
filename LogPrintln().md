**将任何对象转换为字符串，并且打印到标准输出:**

主要用于调试

```autohotkey
LogPrintln(Obj:="",prefix:="",postfix:="")
```

### 参数 Parameters: 

- Obj - 需要打印的对象

- prefix - 打印的前缀字符串

- prefix - 打印的后缀字符串

  前后缀主要用于打印时解释对象，详见示例

### 返回 Returns: 
%返回说明%
### 抛出异常 Throws: 
### 示例 Example
```autohotkey
theSA:=Object(_SA.TheSA1,[_SA.TheSA2,"D"],[],"D")
LogPrintln(theSA,"theSA >" ">> ")
```

![运行效果](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_4.png)