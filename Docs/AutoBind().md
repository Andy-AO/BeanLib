**自动为Func绑定参数:**

```autohotkey
AutoBind(aFunc,aParaList,aFirstPara:="")
```

### 参数 Parameters: 

- aFunc
- aParaList
- 如果绑定的 Func 从属于某一个对象，则需要需要传入 `this` 参数，这个就是为这种情况准备的。

### 返回 Returns: 
- BoundFuncObj 

BoundFuncObj 本身只有 `call()`方法，不能再次绑定参数了。

### 抛出异常 Throws: 
- TooManyParas
- TooFewParas
- afObj
### 示例 Example
```autohotkey

	class myClass{
		println(Mes){
			println(Mes)
			LogPrintln(Mes,"Mes >>>")
			return
		}
	}

	aFunc:=myClass.println

	aParaList:=[myClass,"HellWorld"]
	
	resultObj:=AutoBind(aFunc,aParaList)
	resultObj.Call()
```