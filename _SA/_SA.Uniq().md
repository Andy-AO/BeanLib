**StrSA去重:**

```autohotkey
Uniq(StrSA)
```

### 参数 Parameters: 

- StrSA - 输入的字符串数组

### 返回 Returns: 
NewStrSA
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;示例

NameSA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewNameSA:=_SA.Uniq(NameSA)
```

### From

[@Jim U](https://stackoverflow.com/users/4695439/jim-u)

https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array