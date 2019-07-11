## throwWithSt

生成堆栈追踪 stdout 

```autohotkey
throwWithSt(Mes)
```

### 参数 Parameters: 

- Mes - 堆栈追踪字符串开头的提示信息，和Exception中的 Mes。
- EnableEx - 可选的Exception，默认开启

### 返回 Returns: 
堆栈追踪字符串
### 抛出异常 Throws: 
第 2 参数可选开启 Exception

### 示例 Example

![控制台](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190712064758.png)

```autohotkey
;属于throw的增强，可以在第 2 参数中开启真正的throw(为了catch)，也可以不加
try
	f()
return


f() {
	a()
}


a() {
	b()
}

b() {
	c()
}

c() {

	throwWithSt("StackTrace_Test")
	return
}

return

 ;~ From：https://www.autohotkey.com/boards/viewtopic.php?t=6001

```

### 直接依赖 Direct Dependency

StackTrace()