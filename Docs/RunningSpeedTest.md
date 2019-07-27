# RunningSpeedTest Class

1.  性质：实例类
2.	开发目的：高精度计时

## 域 Field

freq

CounterBefore

## 方法 Method

Start()

End() - 返回 `Start()到End()` 的时间差，单位是毫秒

## 示例

```autohotkey
Obj := new RunningSpeedTest()
Obj.Start()
Sleep 1000
LogPrintln(Obj.End(),A_LineFile  "("  A_LineNumber  ")"  " : " "Obj.End() >>> `r`n")
return
```

 From：https://wyagd001.github.io/zh-cn/docs/commands/DllCall.htm#QPC