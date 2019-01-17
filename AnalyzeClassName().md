**分析对象(Object)的继承(extends)关系:**

- 和 `Analyze()` 的区别主要在于，前者是返回`Base`对象本身，后者则是返回其 `.__Class` 属性，也就是类名，如果没有类名，则返回字符串`"Not Class"`。

```autohotkey
AnalyzeClassName(Obj)
```

### 参数 Parameters: 

- Obj - 任意对象

### 返回 Returns: 

StrSA

### 抛出异常 Throws: 

- afObj()

### 示例 Example

```autohotkey
AnalyzeClassName(Type.AA)
```