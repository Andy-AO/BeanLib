**如果扑空会抛出异常的 FuncObj 获取器:**

```autohotkey
getFunc(aFuncName)
```

### 参数 Parameters: 

- aFuncName - 函数名

### 返回 Returns: 
%返回说明%
### 抛出异常 Throws: 
-  Exception(_Ex.NoExistFunctionName)
### 示例 Example
```autohotkey
funcObj := getFunc("Println")

%funcObj%("Hello")

```