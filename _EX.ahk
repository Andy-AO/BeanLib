/*!
Class: _EX
提供各种常见 Exception Message 字符串。


Author:
BeanLib

https://www.kancloud.cn/xrvu_zen/ahk_lib/902301
https://github.com/Oilj/BeanLib
https://gitee.com/xrvu_zen/BeanLib

License:
LGPLv3

*/

;~ Protect(_EX)

Class _EX{


static IndexOutOfBounds:="Index Out Of Bounds.数组越界." 
static NoExistVariate:="Variate is not Exsit.变量不存在."
static NoExistKey:="Key-Value is not Exsit. Key-Value不存在."
static NoExistMethod:="Call To Nonexistent Method.调用不存在的方法."
static NoExistFunctionName:="No Exist FunctionName.不存在的函数名."
static NoExistFile:="File is Not Exist.文件不存在."
static ExistFile:="File is Exist.文件已存在."
static NoExistWin:="Win is Not Exist.窗口不存在."
static getWinHwndFailed:="Get Win Hwnd Failed.获取窗口句柄失败."
static getControlHwndFailed:="Get Control Hwnd Failed.获取控件句柄失败."
static SetConst:="Set Const.写入常量."
static TooFewParas:="Too Few ParaMeters.参数过少."
static TooManyParas:="Too Many ParaMeters.参数过多."
static InvalidPara:="Invalid Para 无效参数:"
static ParaIsEmpty:="Para Is Empty 参数为空:"
static Assert:="Assert! 断言！ "
static MoveFailed:="MoveFailed 文件移动失败."
static NotOverride:="theObj in Class is Not Override 类中对象未被复写."
static SingletonClass:="Instance Singleton Class 实例化单例类."

}

/*!
End of class
*/
