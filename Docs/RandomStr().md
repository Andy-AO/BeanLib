**生成随机字符串**

```autohotkey
RandomStr(aLength = 16, aLowestAsc = 48, aHighestAsc = 122) 
```

### 参数 Parameters

- aLength - 随机数长度
- aLowestAsc - Asc值下限
- aHighestAsc - Asc值上限

### 返回 Returns

随机字符串

### 抛出异常 Throws
- 无
### 示例 Example
```autohotkey
MsgBox, % RandomStr()
MsgBox, % RegExReplace(RandomStr(), "\W", "i") ; only alphanum.
```