# AppLocker Class

简单的应用锁。

- 检查机制：每隔一分钟检查一次时间，如果匹配就开锁，不匹配就上锁。
- 上锁机制：echo Y|cacls %path% /p everyone:N
- 开锁机制：echo Y|cacls %path% /p everyone:F

## 域 Field 

- asPath:=[""]

  路径必须带英文引号 ""

- asUnLockTime:=["",""]

  允许应用被打开的时间段。["1100","1300"] 就表示上午11:00到下午1:00

- sCheckIntervalMin:=1

  检查频率，单位是分钟

## 方法 Method

### Lock()

上锁

### UnLock()

开锁

### AutoLock()

根据时间段执行上锁或者开锁

### CheckTime(targetTime,asUnLockTime)

检查当前时间是否在允许时间段内

### SetTimer()

每分钟执行一次AutoLock()

## 示例

```autohotkey
;给QQ上锁
QQPath="F:\腾讯QQV3\QQ\Bin\QQ.exe"
QQAppLocker:=new AppLocker(QQPath,[1650,1730])
QQAppLocker.AutoLock()
QQAppLocker.SetTimer()
```

