**统计SA中所有元素出现的次数:**
把SA中所有的元素都放入一个Obj,元素是key,元素出现的次数是value

```autohotkey
ElementCounter(SA)
```

### 参数 Parameters: 

- SA- 输入的数组

### 返回 Returns: 
关联数组
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;StrSA示例

NameSA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewObj:=_SA.ElementCounter(NameSA)
```

```autohotkey
;ObjSA示例

SA1:=["1"],SA2:=["2"],SAs:=[SA1,SA2,SA2,SA2,SA1,SA1]
ESA:=_SA.ElementCounter(SAs)
```