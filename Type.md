# Type Class

1.  是一个**静态类**, 不提供构造器
2.  围绕着`类型`展开，目前支持 **9种类型** 的识别。另，提供类型的 Code 值，判断类型，断言类型等等。
    让 AHK 用出强类型的味道，如果你不懂，那就算了...(手动滑稽)。
3.  几乎完全用元编程技术编写，所以这里只写出那些实际会用到的域和方法，大多数平常都用不到。
4.  `Ever` 代表：愿意接受任何类型的参数。



### 域 Field

#### 常量 Const

**如果写入，会 throw _Ex.SetConst**

```autohotkey
	Static Str:=10,NS:=11
	
	Static List:=130
	
	Static Obj:=100,ExtendsObj:=101,Class:=110
	
	Static FileObj:=150
	
	Static ComObj:=160
```

#### 变量 Variate

```autohotkey
Static Switcher:=true
;只有当该变量值为 true 这时候,断言才会生效
```
### 方法 Method

### ofCode(TypeCode)

获取 TypeCode 对应的 TypeString。

### afOn()/afOff()

afOn() - 把变量设为 true ,开启断言

afOff() - 把变量设为 false ,关闭断言

### is方法(类型判断方法)

#### isStr(Ever) 
#### isNS(Ever) 
#### isList(Ever) 
#### isObj(Ever) 
#### isClass(Ever) 
#### isFileObj(Ever) 
#### isComObj(Ever) 

### af方法(断言方法)

- **类型断言方法是干什么的？**
  保证类型安全，也就是确保一个值是你想要的类型。因为类型这个概念在AHK中非常弱，所以如果你没有学习过强类型语言，这里很难跟你说清楚。
- **能简单说说怎么用吗？**
  比如，你设计一个给字符串数组排序的函数，你肯定不希望传入的参数是 `FuncObj`，由于`AHK`是弱类型，而且非常弱，所以不会报任何错误，但是程序一定会出现逻辑错误。
  这时候你就可以在最前面加上一个`Type.afStr(Str)`，一旦发现数组中的数据不是`String`就会直接`Throw`，并告知你类型错误的细节。

#### afStr(Ever) 
#### afNS(Ever) 
#### afList(Ever) 
#### afObj(Ever) 
#### afClass(Ever) 
#### afFileObj(Ever) 
#### afComObj(Ever) 

``` autohotkey
ofCode(Type.List)
```
