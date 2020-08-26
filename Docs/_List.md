# \_List Class

1.  是一个**静态类**, 不提供构造器
2.  主要包含对于数组的各种增强操作, 包括但不限于 排序, 数组替换, 指定范围复制, 去重统计
3.  \_List 和\_Lists 区别在于参数, 传入的参数，如果是二维以上那么属于,\_Lists, 否则属于\_List 
4.  提供一些测试用数组

## 域 Field 

- static RNameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
- static LetterList:=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
- static NumberList:=["1","2","3","4","5","6","7","8","9","0"]
- static TheList1:=["List1"]
- static TheList2:=["List2"]
- static ObjList:=[List1,List2,List2,List2,List1,List1]

## 内部类

+ Class AA,BB,CC,DD
  + 连续继承的四个内部类：CC继承DD，BB继承CC，AA继承BB
  + 主要目的在于测试 Analyze()等，类继承关系分析函数。

## 方法

### Uniq(List)

**StrList去重:**

2019年01月08日 - 这个去重方法是靠写入 Key-Value，一开始我猜 key 不能是 Obj ，后来才知道错了。那么这个方法就是通用的，特此改正。

#### 参数 Parameters: 

- List- 输入的数组

#### 返回 Returns: 
NewList
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
;字符串数组去重

NameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewNameList:=_List.Uniq(NameList)
```

```autohotkey
;Obj 数组 去重

List1:=["1"]
List2:=["2"]
Lists:=[List1,List2,List2,List2,List1,List1]
NewLists:=_List.Uniq(Lists)
```

#### From

[@Jim U](https://stackoverflow.com/users/4695439/jim-u)

https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array

### StrReplace(StrList,SearchText,ReplaceText,isRegEx:=false)

**字符串数组内的替换:**


#### 参数 Parameters: 

- StrList: 输入的字符串数组

- SearchText: 被替换文本

- ReplaceText:   替换文本

- isRegEx: true 代表正则模式, 处于"正则模式"时，SearchText 为正则表达式。

#### 返回 Returns: 
null
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
;示例

List:=["123321","123456","ABC123"]
_List.StrReplace(List,"3","×")
```
### Sort(StrList, Order="A")

**对数组进行排序, 支持顺序, 倒序, 逆序:**


#### 参数 Parameters

- StrList: 输入的字符串数组 (数字或英文字符串)

- Order: 排列顺序 A: 顺序 D: 倒序 R: 逆序

#### 返回 Returns: 
null
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
;排列数字List

InputList:=[]

;生成10个伪随机数,写入InputList
loop,10{
Random,OutputVar,0,999
InputList[A_Index]:=OutputVar
}

_List.sort(InputList)


```
```autohotkey
;数字和英文混排

InputList:=["5","99","Enter","CapsLock","G","Apple"]
_List.sort(InputList)

```

#### From

 https://sites.google.com/site/ahkref/custom-functions/sortarray_

### Remove(List,IndexList)

**按照Index批量移除数组中的元素:**

#### 参数 Parameters: 

- List - 输入的数组
- IndexList - 被移除元素 Index 的 List

#### 返回 Returns: 
null
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
;示例

List:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
IndexList:=["8","6","1","2"]
_List.Remove(List,IndexList)
```
### ElementCounter(List)

**统计List中所有元素出现的次数:**
把List中所有的元素都放入一个Obj,元素是key,元素出现的次数是value


#### 参数 Parameters: 

- List- 输入的数组

#### 返回 Returns: 
关联数组
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
;StrList示例

NameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
NewObj:=_List.ElementCounter(NameList)
```

```autohotkey
;ObjList示例

List1:=["1"],List2:=["2"],Lists:=[List1,List2,List2,List2,List1,List1]
EList:=_List.ElementCounter(Lists)
```
### CopyOfRange(List,FromIndex,ToIndex)

**复制并返回数组的一部分:**

#### 参数 Parameters: 

- List - 输入的数组
- FromIndex - 起始Index(含)
- ToIndex - 终止Index(含)

#### 返回 Returns: 

NewList

#### 抛出异常 Throws: 

- Exception (_EX.IndexOutOfBounds)
- Exception ("FromIndex is bigger than ToIndex.")

#### 示例 Example

```autohotkey
;示例

InputList:=["5","99","Enter","CapsLock","G","Apple"]
FromIndex:=2,ToIndex:=4
SubList:=_List.CopyOfRange(InputList,FromIndex,ToIndex)
```
### clone(aList)

**克隆一个数组:**

#### 参数 Parameters: 

- List - 输入的数组

#### 返回 Returns: 

NewList

#### 抛出异常 Throws: 
- Type.assert

### ToString(Str)

**转换Str数组为字符串:**


#### 参数 Parameters: 

- Str- 输入的字符串数组

#### 返回 Returns: 
TheArrayString
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
List:=_List.RNameList
MsgBox,% _List.ToString(List)
```

### merge(aList1,aList2)

**合并两个List:**


#### 参数 Parameters: 

- aList1 - 在前方的数组
- aList2 - 在后方的数组

#### 返回 Returns: 
TheArray
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
result := _List.merge(_List.NumberList,_List.LetterList)
LogPrintln(result,A_LineFile  "("  A_LineNumber  ")"  " : " "result >>> `r`n")
```