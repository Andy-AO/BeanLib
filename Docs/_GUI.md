# _GUI Class

1.  性质：静态类

## 子类 Subclass

### c

用于包装GUI的SubCommand

#### 示例

```AutoHotKey
winHwnd = 0xc12fc

Gui,% _Gui.c.show(winHwnd)

```

### t

用于包装GUI的WinTitle

#### 示例

```AutoHotKey
winHwnd = 0xc12fc

WinActive(_Gui.t.ahk_id(winHwnd))
```

## 方法 Methods

### AddAnimatedGIF(imagefullpath , x="", y="", w="", h="", guiname = "1")

**为GUI添加GIF动图**

#### 参数 Parameters

- ？- ？

#### 返回 Returns

？

#### 抛出异常 Throws

- ？

#### 测试 Test

无



