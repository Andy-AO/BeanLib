**统计StrSA中所有元素出现的次数:**
把StrSA中所有的元素都放入一个Obj,元素是key,元素出现的次数是value

```autohotkey
ElementCounter(StrSA)
```

### 参数 Parameters: 

- StrSA - 输入的字符串数组

### 返回 Returns: 
关联数组
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;示例

NameSA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewObj:=_SA.ElementCounter(NameSA)
```