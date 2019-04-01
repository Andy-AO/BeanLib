**检查数组中的每个元素，返回符合正则的 Index:**

```autohotkey
MatchIndexList(list,aRegEx)
```

### 参数 Parameters: 

- list - 待检查数组
- aRegEx - 正则

### 返回 Returns: 
由每一个符合正则的元素 index 组成的 list 
### 抛出异常 Throws: 
### 示例 Example
```autohotkey
indexList:=_List.MatchIndexList(ListTilteAndPageNumber,"[0-9]+")
```