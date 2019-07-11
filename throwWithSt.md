## throwWithSt

```autohotkey
throwWithSt(Mes)
```

### 参数 Parameters: 

- Mes - 堆栈追踪字符串前方的提示信息
- EnableEx - 可选的Exception，默认开启

### 返回 Returns: 
堆栈追踪字符串
### 抛出异常 Throws: 
第 2 参数可选开启 Exception

### 示例 Example
```autohotkey
;属于throw的增强，可以在第 2 参数中开启真正的throw(为了catch)，也可以不加
```

### 直接依赖 Direct Dependency

StackTrace()