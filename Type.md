# Type Class

1.  是一个**静态类**, 不提供构造器
2.  围绕着`类型`展开，目前支持 **9种类型** 的识别。另，提供类型的 Code 值，判断类型，断言类型等等。
    让 AHK 用出强类型的味道，如果你不懂，那就算了...(手动滑稽)。
3.  几乎完全用元编程技术编写，所以这里只写出那些实际会用到的域和方法，大多数平常都用不到。

[TOC]

## 常量 Const

**如果写入，会 throw _Ex.SetConst**

```autohotkey
	Static Str:=10,NS:=11
	
	Static SA:=130
	
	Static Obj:=100,ExtendsObj:=101,Class:=110,FuncObj:=120
	
	Static FileObj:=150
	
	Static ComObj:=160
```

## 变量 variate

```autohotkey
Static Switcher:=true
;只有当该变量值为 true 这时候,断言才会生效
```

## afOn()/afOff()

afOn() - 把变量设为 true ,开启断言

afOff( - 把变量设为 false ,关闭断言

## is方法(类型判断方法)

### isStr() 
### isNS() 
### isSA() 
### isObj() 
### isClass() 
### isFuncObj() 
### isFileObj() 
### isComObj() 

## af方法(断言方法)

- 不知道啥是断言的，可以去[百度百度](https://baike.baidu.com/item/%E6%96%AD%E8%A8%80/13021995)。
- 之后会实现全局的一键开关，今天累了先算了。

### afStr() 
### afNS() 
### afSA() 
### afObj() 
### afClass() 
### afFuncObj() 
### afFileObj() 
### afComObj() 

## ofCode() - 

获取类型对应的 String。

``` autohotkey
ofCode(Type.SA)
```