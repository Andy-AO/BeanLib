# InstanceCheck

在单例类的New方法中调用，目的是保证类的对象唯一。(单例模式)

通常的调用方法如下：

```autohotkey
		__New(){
			InstanceCheck(this.base)
			return this
		}
```

### 抛出异常 Throws: 
- %异常说明%
### 示例 Example
```autohotkey

Double.base := new Double_Base()
;~ Double.base := new Double_Base()

class Double{
}
class Double_Base{
;~ static InstanceExist := false ;这个可写可不写

;------------------------------

	__New(){
		InstanceCheck(this.base)
		return this
	}

	} ;---------class Double_Base End
	
	
```

```autohotkey
;实例化次数>1会导致
-Stack Trace ~ ~~  Mes:Instance Singleton Class 实例化单例类.

D:\AHKs\ahk_lib\Function.ahk(480) : ==> offset:-1 caller:StackTrace 
D:\AHKs\ahk_lib\Function.ahk(490) : ==> offset:-2 caller:throwWithSt 
D:\AHKs\ahk_lib\Function.ahk(504) : ==> offset:-3 caller:throw 
D:\AHKs\Dev\TPDD_单例类测试.ahk(50) : ==> offset:-4 caller:InstanceCheck 
D:\AHKs\Dev\TPDD_单例类测试.ahk(34) : ==> offset:-5 caller:Double_Base.__New 
```