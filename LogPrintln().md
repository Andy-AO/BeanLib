**将任何对象转换为字符串，并且打印到标准输出:**

主要用于调试。执行的必要条件是 `Bean.LogEnable = true`，默认值为 `false`。

- count = 0 的 Object 会显示 {\*Object\*}
- NullString 会显示 \*NS\*
- count = length 的Object(List) ，用 [] 包裹
- count != length 的Object ，用 {} 包裹

```autohotkey
LogPrintln(Obj:="",prefix:="",postfix:="")
```

### 参数 Parameters: 

- Obj - 需要打印的对象

- prefix - 打印的前缀字符串

- prefix - 打印的后缀字符串

  前后缀主要用于打印时解释对象，详见示例

### 返回 Returns: 

null

### 抛出异常 Throws: 
### 示例 Example
```autohotkey
theList:=Object(_List.TheList1,[_List.TheList2,"D"],[],"D")
LogPrintln(theList,"theList >" ">> ")
```

![运行效果](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_4.png)