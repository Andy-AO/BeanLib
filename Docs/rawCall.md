**绕过_Call()元函数调用Method:**

因为AHK的OOP设计问题，方法并不会加载到对象中。 

在元编程的过程中，如果使用了 __Call() ，那么是无法直接调用对象中的方法的，通过这种方式就可以调用。

机制很简单，就是直接从 base 中拿到 Func。

```autohotkey
rawCall(aMethodName,aThis,aParams*)
```

### 参数 Parameters: 

- aMethodName - 方法名
- aThis - 执行Method的this环境
- aParams* - 参数列表 

### 返回 Returns: 
直接返回方法的返回值
### 抛出异常 Throws: 
- %异常说明%
### 示例 Example
```autohotkey
class Method{

initFunc(){
		return "initFunc"
	}
;----------------------------- 	
	__call(aMethodName,aParams*){
		return "__call"
	}
;-----------------------------
	__New(aFuncThis,aFunc){
	rawCall(this,"initFunc",aFuncThis,aFunc)
			return this
	}
} ;---------class Method End
```