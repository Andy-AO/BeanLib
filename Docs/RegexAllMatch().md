```autohotkey
RegexAllMatch(String,NeedleRegEx)
```

返回所有正则表达式匹配对象。

要注意的是需要在选项中开启`O`，否则是获取不到匹配对象的！

### 参数 Parameters: 

- Haystack - 被匹配的字符串
- NeedleRegEx - 匹配所用的模式

### 返回 Returns: 
返回正则表达式匹配对象数组，如果没有匹配成功，则返回空数组
### 抛出异常 Throws: 
- 如果没有在最前面的选项中发现`O`，会直接抛出异常

