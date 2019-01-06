**字符串数组内的替换:**

```autohotkey
_SA.StrReplace(StrSA,SearchText,ReplaceText,isRegEx:=false)
```

### 参数 Parameters: 

- StrSA: 输入的字符串数组

- SearchText: 被替换文本

- ReplaceText:   替换文本

- isRegEx: true 代表正则模式, 处于"正则模式"时，SearchText 为正则表达式。

### 返回 Returns: 
null
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;示例

SA:=["123321","123456","ABC123"]
_SA.StrReplace(SA,"3","×")
```