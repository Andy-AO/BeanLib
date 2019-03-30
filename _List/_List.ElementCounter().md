**统计List中所有元素出现的次数:**
把List中所有的元素都放入一个Obj,元素是key,元素出现的次数是value

```autohotkey
ElementCounter(List)
```

### 参数 Parameters: 

- List- 输入的数组

### 返回 Returns: 
关联数组
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;StrList示例

NameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewObj:=_List.ElementCounter(NameList)
```

```autohotkey
;ObjList示例

List1:=["1"],List2:=["2"],Lists:=[List1,List2,List2,List2,List1,List1]
EList:=_List.ElementCounter(Lists)
```