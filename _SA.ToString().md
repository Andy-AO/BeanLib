**转换Str数组为字符串:**

```autohotkey
_SA.ToString(Str)
```

### 参数 Parameters: 

- Str- 输入的字符串数组

### 返回 Returns: 
TheArrayString
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
SA:=_SA.RNameSA
MsgBox,% _SA.ToString(SA)
```