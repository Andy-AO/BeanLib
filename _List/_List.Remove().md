**按照Index批量移除数组中的元素:**

```autohotkey
_List.Remove(List,IndexList)
```

### 参数 Parameters: 

- List - 输入的数组
- IndexList - 被移除元素 Index 的 List

### 返回 Returns: 
null
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;示例

List:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
IndexList:=["8","6","1","2"]
_List.Remove(List,IndexList)
```