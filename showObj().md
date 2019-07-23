**用于展示对象中的内容:**

- 主要用于展示对象中的内容。
  比如，展示 WinObj 中的 title 字段等等。
- 如果对象中含有 『__toString』 字段，那么 toString() 函数会优先使用该方法处理对象，而不是使用默认的枚举器。
- 如果『__toString』 字段是数组那么就当它为 aList 参数传入。

```autohotkey
showObj(aObj,aList:="")
```

### 参数 Parameters: 

- aObj - 需要展示的 Object
- aList - 字段名数组

### 返回 Returns: 
默认会返回 base 中所有的 FuncObj 转换成的 String 。

如果也想展示其他的字段，在 aList 中加入即可。

### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
winObj := new Win("春我部防卫队")

act := new Action(winObj,winObj.equal)

act.assertter := Bean.true
act.before := Bean.False

map := showObj(act)
LogPrintln(map,"map >>>")
```

```autohotkey
map >>>{__Class:Action,after:Bean.true,before:Bean.false,func:Win.equal}
```