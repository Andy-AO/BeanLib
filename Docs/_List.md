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

