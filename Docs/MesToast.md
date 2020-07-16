# MesToast Class

1.  性质：实例类
2.	开发目的：
高度定制化的消息弹窗/消息通知/消息框
## 自动计时并销毁通知
1. 弹出通知后，键鼠无动作不计时。
2. 位于顶层才计时。
3. 鼠标在窗口上方不计时。

## 透明
计时器`<5s`的时候，窗口开始逐渐透明

## 方法 Methods

### __New(aTitle,aText,aDuration := "")
-   aTitle：标题
-   aText：内容
-   aDuration：窗口存活时间

### reset()
重置Toast，计数器回到原始状态
### show()
- 显示Toast

鼠标悬停在上面会停止计时

## 示例
```AutoHotKey
MesToast.setSoundFile(new PathObj(Filename))

theText := "A1"
theTitle := "title"

theMesToast_1 := new MesToast(theTitle,theText)
theMesToast_1.show()


theText := "A2"
theTitle := "title"

theMesToast_2 := new MesToast(theTitle,theText)
theMesToast_2.show()
```