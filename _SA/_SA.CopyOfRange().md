**复制并返回数组的一部分:**

```autohotkey
_SA.CopyOfRange(SA,FromIndex,ToIndex)
```

### 参数 Parameters: 

- SA - 输入的数组
- FromIndex - 起始Index(含)
- ToIndex - 终止Index(含)

### 返回 Returns: 

NewSA

### 抛出异常 Throws: 

- Exception (_EX.IndexOutOfBounds)
- Exception ("FromIndex is bigger than ToIndex.")

### 示例 Example

```autohotkey
;示例

InputSA:=["5","99","Enter","CapsLock","G","Apple"]
FromIndex:=2,ToIndex:=4
SubSA:=_SA.CopyOfRange(InputSA,FromIndex,ToIndex)
```