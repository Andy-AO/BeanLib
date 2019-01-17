**指出对象是否是特定类的一个实例:**

```autohotkey
Instanof(Obj,Super)
```

### 参数 Parameters: 

- Obj - 对象
- Super - 类 ：可以接受任何类型，如果是字符串，那么就检查类名

### 返回 Returns: 
Boolean
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
re:=Instanof(type.AA,type.CC)
re:=Instanof(type.BB,"Type.DD")
```