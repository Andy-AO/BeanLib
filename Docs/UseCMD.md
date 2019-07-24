**静默执行WindowsCMD命令行**

```autohotkey
UseCMD(command)
```

### 参数 Parameters: 

- command - 命令字符串

### 返回 Returns: 
可以读取并返回信息
### 抛出异常 Throws: 
无

### 示例 Example
```autohotkey
		AndroidApiSearch=
		(
		start "" %360chromePath%  "https://www.google.com/search?gws_rd=cr&gl=us&q=%SearchKey%`%20site:developer.android.com"
		exit  
		)
		
		UseCMD(AndroidApiSearch)
```