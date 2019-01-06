**按照Index批量移除数组中的元素:**

```autohotkey
_SA.Remove(SA,IndexSA)
```

### 参数 Parameters: 

- SA - 输入的数组
- IndexSA - 被移除元素 Index 的 SA

### 返回 Returns: 
null
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;示例

SA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
IndexSA:=["8","6","1","2"]
_SA.Remove(SA,IndexSA)
```