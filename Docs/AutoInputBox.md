# AutoInputBox Class

1.  性质：实例类
2.	开发目的：固定宽度,且自动根据 prompt 换行的InputBox

## 域 Fields

static aTextPrefix:=""

static deFaultText:=["UseClipBoard"]

static AlwaysOnTop:=false

## 示例 Examples
```AutoHotKey
inputBox:=new AutoInputBox(aTitle,aPrompt)

inputBox.SetDeFaultText("Func")

inputBox.SetAlwaysOnTop(true)

userInput := inputBox.start()
```

## 方法 Methods

### __New(aTitle,aPrompt)
**构造方法**

#### 参数 Parameters: 

- aTitle - 窗口标题
- aPrompt - 窗口内容

#### 返回 Returns: 

AutoInputBox Object


### SetAlwaysOnTop(aStr)
**让窗口置顶/非置顶(默认)**

#### 参数 Parameters: 

- aStr - 只接受布尔值

#### 返回 Returns: 

aStr

### SetDeFaultText(aStr)

**设置窗口输入框默认文本(默认为ClipBoard)**

#### 参数 Parameters: 

- aStr - 文本

#### 返回 Returns: 

aStr 

### start()

**弹出带有输入框的窗口**

#### 参数 Parameters: 

- null

#### 返回 Returns: 

String - 用户输入的

#### 抛出异常 Throws: 

- UserCancelled
