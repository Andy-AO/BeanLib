# InvisibleCharacter Class

1.  性质：静态类
2.	开发目的：用于处理不可见字符(不确定所列出的不可见字符是否完全,感觉已经覆盖了绝大多数情况,列表来自[JAVA过滤掉String中的不可见UNICODE字符_qq_42673507的博客-CSDN博客](https://blog.csdn.net/qq_42673507/article/details/104486357))

## 域 Fields

```AutoHotKey
	static CodeList := [0x200b,0x0200c,0x0200d,0x0200e,0x200f
,0x202a,0x202b,0x202c,0x202d,0x202e
,0x2066,0x2067,0x2068,0x2069
,0xfeff
,0x06ec]
```

## 属性 Attribute

### List[]

无参，返回不可见字符组成的List

## 方法 Methods

### count(aStr)

用于统计字符串中不可见字符的数量

#### 参数 Parameters

- aStr - 被统计字符串

#### 返回 Returns

int

#### 抛出异常 Throws

- assertStr()

#### 测试 Test

有