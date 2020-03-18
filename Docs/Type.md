# Type Class

1.  是一个**静态类**, 不提供构造器
2.  围绕着`类型`展开，目前支持 **9种类型** 的识别。另，提供类型的 Code 值，判断类型，断言类型等等。
3.  用元编程编写，所以这里只写出那些实际会用到的域和方法，大多数平常都用不到。
4.  `Ever` ：代表可以接受任何类型的参数。

### 域 Field

#### 常量 Const

**如果写入，会 throw _Ex.SetConst**

```autohotkey
		Static StrEndCode := 19,NumberEndCode := 14
		
		Static Str:=10,NS:=11,Number:=12,Boolean:=13
		
		Static List:=130

		Static ObjEndCode := 199
		Static Obj:=100,ExtendsObj:=101,Class:=110,FuncObj:=120,Method:=125
		
		Static FileObj:=150
		
		Static ComObj:=160
```

#### 变量 Variate

```autohotkey
Static Switcher:=true
;只有当该变量值为 true 这时候,断言才会生效
```
### 方法 Method

#### ofCode(TypeCode)

获取 TypeCode 对应的 TypeString。

#### assertOn()/assertOff()

assertOn() - 把变量设为 true ,开启断言

assertOff() - 把变量设为 false ,关闭断言

#### is方法(类型判断方法)

##### isStr(Ever) 
##### isNS(Ever) 
##### isNumber(Ever) 

##### isBoolean(Ever) 

##### isList(Ever) 
##### isObj(Ever) 
##### isClass(Ever) 
##### isFileObj(Ever) 
##### isFuncObj(Ever) 
##### isMethod(Ever) 
##### isComObj(Ever) 

#### assert方法(断言方法)

- assert方法都是**可变参数**，支持检测多个变量。

- **类型断言方法是干什么的？**
  比如，你设计一个给字符串数组排序的函数，你肯定不希望传入的参数是 `FuncObj`，由于`AHK`是弱类型，所以不会报任何错误，但是程序可能会有逻辑错误。
  如果预先使用`Type.assertStr(Str)`，就可以避免此类问题，并告知你类型错误的细节。

##### assertStr(Ever*) 
##### assertNS(Ever*) 
##### assertNumber(Ever*) 

##### assertBoolean(Ever*) 

##### assertList(Ever*) 
##### assertObj(Ever*) 
##### assertClass(Ever*) 
##### assertFileObj(Ever*) 
##### assertFuncObj(Ever*) 
##### assertMethod(Ever*) 
##### assertComObj(Ever*) 

#### ofCode(Type.List)

通过TypeCode反向查类型值