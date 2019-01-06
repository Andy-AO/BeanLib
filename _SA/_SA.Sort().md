**对数组进行排序, 支持顺序, 倒序, 逆序:**

```
_SA.Sort(StrSA, Order="A")
```

### 参数 Parameters

- StrSA: 输入的字符串数组 (数字或英文字符串)

- Order: 排列顺序 A: 顺序 D: 倒序 R: 逆序

### 返回 Returns: 
null
### 抛出异常 Throws: 
- null
### 示例 Example
```autohotkey
;排列数字SA

InputSA:=[]

;生成10个伪随机数,写入InputSA
loop,10{
Random,OutputVar,0,999
InputSA[A_Index]:=OutputVar
}

_SA.sort(InputSA)


```
```autohotkey
;数字和英文混排

InputSA:=["5","99","Enter","CapsLock","G","Apple"]
_SA.sort(InputSA)

```

### From

 https://sites.google.com/site/ahkref/custom-functions/sortarray_