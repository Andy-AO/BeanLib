

# _Win Class

1.  是一个**静态类**, 不提供构造器
2.  主要包含针对单个窗口的各种操作
    

[TOC]

## 内部类 InnerClass

### Path

Path 类，可以通过及构造方法迅速的获得包含`name`和`path`两种数据的对象。

由于ahk不支持通过路径操作窗口，而支持通过进程名(name)操作，所以将它们绑定在一起非常有利于使用。

构造方法，从外部直接调用比较麻烦，可读性比较差，可以通过 `_Win.getPathObj() ` 调用。

-  **Method：**

  __New(aPath)

-  **Filed：**

  name:="",path:=""

## 域 Field

### 常量 Const

### 变量 Variate

## 方法 Method

### Analyze(InputWinTitle,EnableWinText:=false)

#### 参数 Parameters: 

- InputWinTitle - 目标窗口的 `WinTitle`
- EnableWinText - 是否检测 `WinText`

#### 返回 Returns: 
Obj 或者 false

- 如果窗口不存在，那么就返回 `false`

- 包含以下 Key

```autohotkey
WinTitle := "WinTitle: " WinTitle
WinClass := "ahk_class " WinClass
Winexe := "ahk_exe " Winexe
WinPId := "ahk_id " WinId
WinPath := "WinPath: " WinPath
```

#### 示例 Example
```autohotkey
Obj:=_Win.Analyze(WinTitle)
```

### getIdByPath(aWinPath,aDetectHiddenWindows:="")

通过路径获取窗口ID

### SwapDetectHidden() 

环保型“窗口隐藏设置”切换

- 用于切换 `A_DetectHiddenWindows`
  - **那为什么不直接切换呢？**
  - 主要是可以实现：在某个方法中切换，但是不污染环境。也就是说方法执行完之后又改回原来的。
  - **那具体怎么操作呢？**
  - 需要在方法的头部和尾部分别使用两个语句。代码在后面的示例中有贴。

```autohotkey
;SwapDetectHidden()使用案例
/*
获取窗口ID(HWND)列表收集器(数组形式)
*/
WinGetList(WinTitle,aDetectHiddenWindows:=""){
	
;头
aFuncId:=getFuncId(A_ThisFunc)
_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)

;....................
	
;尾	_Win.SwapDetectHidden(aFuncId,aDetectHiddenWindows)
	
	return ...
}

```

