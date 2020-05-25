# Timer Class

1.  性质：/实例类
2.	开发目的：

已经有了SetTimer()方法，没办法对计时器进行精确管理；有了精确管理的需求之后，准备做一个类。


## 方法 Methods
### set()
开始计时
### off()
停止计时
### delete()
删除计时器
### __New(aFunc,aPeriod := "250")
- aFunc：需要定时运行的函数对象
- aPeriod：计时器运行周期

