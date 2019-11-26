# Method Class

1.  性质：符合 FunObj 的实例类，并含有 static Function
2.	开发目的：主要用于从类中提取可用的 Func 对象

在AHK中并没有「实例方法」这种概念，如果从 Class 中直接抽取方法，那么带有 this 参数，使用起来有诸多不便。

最简单的方法是对 FuncObj 使用 bind，但是 bind 对象内部完全是不可见的，就为调试带来了诸多麻烦，Method 方法就是为了解决这一问题而生的，它的内部通透性非常好。

通过 __New 方法的最后一个可变参数，提供Bind()功能。

## 静态方法 Static Method

### for(Func)

用于事实上不需要 this 参数的实例方法

- FuncObj - 需要被封装的实例方法

## 方法 Method

### __New(aFunc,aFuncThis,aBindParas*)

用于带有 this 参数的实例方法

- aFunc - 需要被封装的实例方法
- aFuncThis - aFunc 的 this 参数
- aBindParas - 需要绑定的参数