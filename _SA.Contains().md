**检查数组中是否包含某值:**

```autohotkey
Contains(SAorMap,value)
```

### 参数 Parameters: 

- SAorMap - 数组(简单数组，关联数组都行)
- value - 任意类型值

### 返回 Returns: 
Boolean
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
Result1:=_SA.Contains(_SA.LetterSA,"A")
Result2:=_SA.Contains(_SA.LetterSA,"0")
```