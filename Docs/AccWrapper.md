# AccWrapper Class

1.  性质：实例类/静态类
2.	开发目的：

更方便的操作Acc(IAccessible)对象

## 域 Fields

```AutoHotKey
	p_accObj := "",path := AccWrapper.unknown
	;------------------------------
	Static loaded := "",setting := 0,unknown := "UnKnown"
	;sources: WinUser.h, oleacc.h
	;e.g. STATE_SYSTEM_SELECTED := 0x2
	static State := {0x1:"UNAVAILABLE"
	, 0x2:"SELECTED"
	, 0x4:"FOCUSED"
	, 0x8:"PRESSED"
	, 0x10:"CHECKED"
	, 0x20:"MIXED"
	, 0x40:"READONLY"
	, 0x80:"HOTTRACKED"
	, 0x100:"DEFAULT"
	, 0x200:"EXPANDED"
	, 0x400:"COLLAPSED"
	, 0x800:"BUSY"
	, 0x1000:"FLOATING"
	, 0x2000:"MARQUEED"
	, 0x4000:"ANIMATED"
	, 0x8000:"INVISIBLE"
	, 0x10000:"OFFSCREEN"
	, 0x20000:"SIZEABLE"
	, 0x40000:"MOVEABLE"
	, 0x80000:"SELFVOICING"
	, 0x100000:"FOCUSABLE"
	, 0x200000:"SELECTABLE"
	, 0x400000:"LINKED"
	, 0x800000:"TRAVERSED"
	, 0x1000000:"MULTISELECTABLE"
	, 0x2000000:"EXTSELECTABLE"
	, 0x4000000:"ALERT_LOW"
	, 0x8000000:"ALERT_MEDIUM"
	, 0x10000000:"ALERT_HIGH"
	, 0x20000000:"PROTECTED"
	, 0x40000000:"HASPOPUP"}
```



## 示例 Examples
```AutoHotKey
可以用任务栏作为例子操作下
```

## 方法 Methods

### ObjectFromWindow(hWnd, idObject := 0)

**静态方法，用于获取窗口的Acc对象**

#### 参数 Parameters

hWnd - 窗口的ID

idObject - 含义不清，默认用0即可

#### 返回 Returns

AccWrapper

#### 抛出异常 Throws

- 未知

#### 测试 Test

LibTest_AccWrapper.ObjectFromWindow().ahk

### Analyze(vChildId := 0)

**尽量将Acc对象的信息写入到Map当中，便于DeBug：**

#### 参数 Parameters

vChildId - 含义不清，默认用0即可

#### 返回 Returns

Map

#### 抛出异常 Throws

- 未知

#### 测试 Test

LibTest_AccWrapper.ObjectFromWindow().ahk

### println(vChildId := 0)

将`Analyze(vChildId := 0)`的返回值直接打印到控制台

#### 测试 Test

LibTest_AccWrapper.ObjectFromWindow().ahk