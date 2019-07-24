# TimeChecker Class

1.  性质：实例类
2.  开发目的：检查当前时间是否位于规定范围内。
    比如，黑名单设为[1100,1200]，那么在这个时间段内调用都会返回 `flase`,反之则会返回`true`。
    另外，还有类似的白名单机制。

## 域 Field

**以下是存放黑白名单的两个数组，为了检查类型，使用属性实现**

BlackList

WhiteList

## 方法 Method

**分别是采用黑、白名单检查当前时间**

CheckByBlackList()

CheckByWhiteList()

## 示例

APPLock中的时间检查，已经通过`TimeChecker `实现。

```autohotkey
TheTimeChecker := new TimeChecker()
TheTimeChecker.WhiteList := [1255,1300]   ;命中的时候应该启用 1
WhiteListResult := TheTimeChecker.CheckByWhiteList()
TheTimeChecker := new TimeChecker()
TheTimeChecker.BlackList := [1222,1600]   ;命中的时候应该禁用 0
BlackListResult := TheTimeChecker.CheckByBlackList()
```


