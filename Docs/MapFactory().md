**用于进行有关类型的测试:**

```autohotkey
MapFactory(aMap,aKeyFunc:="",aValueFunc:="")
```
### 参数 Parameters: 
aMap是需要测试的Map，aKeyFunc/aValueFunc是操作

### 返回 Returns: 
返回aKeyFunc/aValueFunc两个函数返回值的拼接字符串

### 抛出异常 Throws: 
- Type.assertObj(aKeyFunc),Type.assertObj(aValueFunc)
