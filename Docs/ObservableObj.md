# ObservableObj Class

1.  性质：静态类/单例类/实例类
2.	开发目的：带有监听器的 Obj，类似 JavaFX 中的 ObservableValue。

## 方法 Method

### get()

获取Object

#### 返回 Returns: 

Obj嗯

### set(aObj)

设置Object

#### 参数 Parameters: 

- 需要设置的 `Object`

#### 返回 Returns: 

Obj

### addListener(aMethod)

#### 参数 Parameters: 

- 添加监听器
  监听器的 `aChange` 参数是`observableObj, oldChange, newChange`

#### 返回 Returns: 

null



## 示例 Example

```autohotkey
theObservableObj := new ObservableObj("FirstString")
theObj := theObservableObj.get()
LogPrintln(theObj,A_LineFile  "("  A_LineNumber  ")"  " : " "theObj >>> `r`n")
theObservableObj.addListener(new Function("callback"))
theObservableObj.addListener(new Function("callback"))
theObservableObj.set("SecondString")

callback(observableObj, oldChange, newChange){
	LogPrintln(observableObj,A_LineFile  "("  A_LineNumber  ")"  " : " "observableObj >>> `r`n")
	LogPrintln(oldChange,A_LineFile  "("  A_LineNumber  ")"  " : " "oldChange >>> `r`n")
	LogPrintln(newChange,A_LineFile  "("  A_LineNumber  ")"  " : " "newChange >>> `r`n")
	return
}

```

```AutoHotKey
D:\AHKs\Dev\TPDD_ObservableObj.ahk(27) : theObj >>> 
FirstString
D:\AHKs\Dev\TPDD_ObservableObj.ahk(33) : observableObj >>> 
{__Instance:ObservableObj,listenerList:[{__Instance:Function,bindParas:{*Obj*},func:callback()},{__Instance:Function,bindParas:{*Obj*},func:callback()}],Obj:FirstString}
D:\AHKs\Dev\TPDD_ObservableObj.ahk(34) : oldChange >>> 
FirstString
D:\AHKs\Dev\TPDD_ObservableObj.ahk(35) : newChange >>> 
SecondString
D:\AHKs\Dev\TPDD_ObservableObj.ahk(33) : observableObj >>> 
{__Instance:ObservableObj,listenerList:[{__Instance:Function,bindParas:{*Obj*},func:callback()},{__Instance:Function,bindParas:{*Obj*},func:callback()}],Obj:FirstString}
D:\AHKs\Dev\TPDD_ObservableObj.ahk(34) : oldChange >>> 
FirstString
D:\AHKs\Dev\TPDD_ObservableObj.ahk(35) : newChange >>> 
SecondString
```

