# Fuction Class

1.  性质：实例类
2.	开发目的：主要用于代替普通Func对象的Bind()方法

## 方法 Method

### __New(aMethodName,aBindParas*)

**新建一个带有参数绑定的 Function 对象:**

#### 参数 Parameters: 

- aMethodName - 已存在的Function名
- aBindParas - 需要绑定的参数

#### 返回 Returns: 

根据原来的方法而定

#### 抛出异常 Throws: 

- 根据原来的方法而定

```autohotkey
testLogPrintln(text,text2){
	LogPrintln(text)
	LogPrintln(text2)
	return
}


text := "A！"

theFunc := new Function("testLogPrintln",text)

LogPrintln(theFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "theFunc >>> `r`n")

theFunc.call("B！")

Hotkey,^r,% theFunc

```

### call(aCallParas*)
**Func对象的Call方法:**
作为一个Func对象，必须拥有Call方法

#### 参数 Parameters: 

- aCallParas- 调用参数

#### 返回 Returns: 

根据原来的方法而定

#### 抛出异常 Throws: 

- 根据原来的方法而定
