# UMSS Class

1.  实例类
2.	让 Tab/Space 等，并非修饰键的按键，拥有修饰键的类似效果。

## 方法 Method

### 	__New(key)

**UMSS组合按键的特性**

构造中会执行 this.registerNewKey()。该函数会让按键「修饰化」，按键会变成「单发」。

如果没有按下「组合热键」，原按键会在Up之后发送；否则就触发「组合按键」的FuncObj，原按键不发送。

这有利于对其设置组合热键。

**延迟问题**

任何修饰键方案，都会导致原按键发送变慢，这是很难避免的。

设置 Space 等按键的时候，打字会有拖沓的感觉，注意取舍。

### register(keyName,theFunc,Options:="")

- keyName ：组合中，另一个按键的keyName 
- theFunc ： 组合按键触发的Func
- Options：HotKey 的设置，详见AutoHotKey帮助文件

务必要通过这种方法注册。不要直接使用语境约束，会导致组合按键出现BUG。

在不同的 AHK 程序中注册热键，会出现竞争关系，谁后注册谁生效，而其余的则失效。

在同一 AHK 程序中注册热键时，会将对象保存在 UMSS 类的静态 keys Map 中，如果注册热键时，发现之前已经注册，那么就会直接返回之前的 Object，而不会重新注册。这是为了解决「UMSS多次申请同一热键时，除第一次申请外,目标修饰键会在按下时发送的BUG」。

### Unregister(keyName)

删除某个注册热键

- keyName ：组合中，另一个按键的keyName 

### destroy()

删除所有注册过的热键



示例：注册组合热键 Tab & j 和 Tab & .

```autohotkey
class Print{
	P1(){
		LogPrintln(A_ThisFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "A_ThisFunc >>> `r`n")
	}
	P2(){
		LogPrintln(A_ThisFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "A_ThisFunc >>> `r`n")
	}
} ;---------class Print End

TabUMSS := new UMSS("Tab")
TabUMSS.register("j",new Method(Print.P1,Print))
TabUMSS.register(".",new Method(Print.P2,Print))
```