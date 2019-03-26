**定时执行FuncObj:**

设置之后，并不会立即执行。

```autohotkey
SetTimer(aMin,FuncObj)
```

### 参数 Parameters: 

- aMin - 执行间隔(分钟)
- FuncObj - 需要执行运行的函数或者方法(Obj断言)

### 返回 Returns: 

### 抛出异常 Throws: 
- Obj断言
### 示例 Example
```autohotkey
FuncObj:=Func("println").Bind("OK!")
aMin:=1
SetTimer(aMin,FuncObj)
```