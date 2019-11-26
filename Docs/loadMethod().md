**在对象中生成 Method 数组:**

- 把该对象 base 中的所有 FuncObj 与 当前 this 作为参数生成 Method，并且形成 MethodMap 写入当前对象。
- 默认不生成Meta方法。
- 主要用于函数式编程中传递方法。

```autohotkey
loadMethod(this)
```

### 参数 Parameters: 

- this - 方法的this参数

### 返回 Returns: 
null
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
class Test{
	mes := "Test！"
	__New(){
		loadMethod(this)
		return this
	}
	A(){
		LogPrintln(this.mes,"this.mes >>>")
	}
}

theObj := new Test()
theObj.Method.A()
theAct:=theObj.Method.A
%theAct%()

```

```autohotkey
"InitFunc运行中" >>>InitFunc运行中
this.mes >>>Test！
this.mes >>>Test！
```