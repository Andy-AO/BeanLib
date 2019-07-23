**断言:**

- 当表达式值为 `false` 时触发throw，断言可以让程序更壮硕，更能够接受异常数据。

```autohotkey
af(Boolean,Mes:="No Info")
```

### 参数 Parameters: 

- Boolean - 表达式(布尔值)
- Mes - throw 时，附加的信息

### 返回 Returns: 
`Boolean`

### 抛出异常 Throws: 
- ```autohotkey
  ExMes:=_EX.assertfirm . " Mes : " . Mes
  throwWithSt(ExMes)
  ```
### 示例 Example
```autohotkey
Str:="MyString"
af(Str!="") ;断言被触发

Str:=""
af(Str!="") ;断言不被触发，返回 true
```