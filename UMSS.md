# Type Class

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

示例：注册组合热键 Tab & j 和 Tab & .

```autohotkey
TabUMSS := new UMSS("Tab")
theFunc := Func("ExActivateAndOpen").bind("ahk_exe SourceTree.exe","C:\SourceTree.exe")
TabUMSS.register("j",theFunc)
TabUMSS.register(".",Func("ActivateBaiDuNetDesk"))
```