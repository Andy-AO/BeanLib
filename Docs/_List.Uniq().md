**StrList去重:**

2019年01月08日 - 这个去重方法是靠写入 Key-Value，一开始我猜 key 不能是 Obj ，后来才知道错了。那么这个方法就是通用的，特此改正。

```autohotkey
Uniq(List)
```

### 参数 Parameters: 

- List- 输入的数组

### 返回 Returns: 
NewList
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;字符串数组去重

NameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewNameList:=_List.Uniq(NameList)
```

```autohotkey
;Obj 数组 去重

List1:=["1"]
List2:=["2"]
Lists:=[List1,List2,List2,List2,List1,List1]
NewLists:=_List.Uniq(Lists)
```

### From

[@Jim U](https://stackoverflow.com/users/4695439/jim-u)

https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array