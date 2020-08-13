# \_EX

1.  是一个**静态类**, 不提供构造器
2.  提供各种常见 Exception Message 字符串。

## 域 Field 

这个域变化太快，并不需要增加其他的注解就能够明白意思，也没有实现自动化的文件生成，所以不再维护，直接查阅对应源代码中的字面量就可以。

## 方法 Method

### isRuntimeException(ex)

通过`return (ex.Message = 1)`检查是否为运行时异常