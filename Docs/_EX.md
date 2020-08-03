# \_EX

1.  是一个**静态类**, 不提供构造器
2.  提供各种常见 Exception Message 字符串。

## 域 Field 

其中包含了大量的异常字符串，在抛出异常的时候，应该先检查是否已经存在这个异常。

## 方法 Method

### _EX.isRuntimeException(ex)

- ex - Exception对象

检查Exception对象是否为[运行时异常](https://wyagd001.github.io/zh-cn/docs/commands/Catch.htm)