**定时执行FuncObj:**

设置之后，并不会立即执行。

```autohotkey
SetTimer(aMSec,FuncObj)
```

### 参数 Parameters: 

- aMSec- 执行间隔(毫秒)
- FuncObj - 需要执行运行的函数或者方法(Obj断言)

### 返回 Returns: 

### 抛出异常 Throws: 
- Obj断言
### 示例 Example

```autohotkey
SetTimer("1".secToMSec(),LongPress_Base.CountAndShow.Bind(LongPress))
```