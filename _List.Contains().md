**检查数组中是否包含某值:**

```autohotkey
Contains(ListorMap,value)
```

### 参数 Parameters: 

- ListorMap - 数组(简单数组，关联数组都行)
- value - 任意类型值

### 返回 Returns: 
Boolean
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
Result1:=_Container.Contains(_List.LetterList,"A")
Result2:=_Container.Contains(_List.LetterList,"0")
```