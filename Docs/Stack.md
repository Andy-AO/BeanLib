# Stack Class

一个堆栈实例类

> “栈”通常是指“后进先出”（LIFO）的容器。有时栈也被称为叠加栈，因为最后“压入”栈的元素，第一个“弹出”栈。经常用来类比栈的事物是装有弹簧的储放器中的自助餐托盘，最后装入的托盘总是最先拿出使用的。
>
> ——《Java编程思想_第4版》

## 方法 Methods

### get()

  获取内置List

### set(aList)

  设置内置List(复制而非引用)

### length()

### __New(aList := "")

  调用set(aList)建立实例

### empty()

### peek()

  获取顶端元素

### pop()

  获取顶端元素并删除

### push(aElement)

  压入

### search(aElement)

  从顶端搜索并返回index

### getEnum()

获取枚举器

```AutoHotKey
theStack := new Stack(_List.LetterList)

theEnum := theStack.getEnum()

while(theEnum.next(v)){
	LogPrintln(v,A_LineFile  "("  A_LineNumber  ")"  " : " "v >>> `r`n")
}
```



