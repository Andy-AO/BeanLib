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


	static IndexOutOfBounds := "Index Out Of Bounds.数组越界" 
	,NoExistVariate := "Variate is not Exsit.变量不存在"
	,NoExistKey := "Key-Value is not Exsit. Key-Value不存在"
	,NoExistMethod := "Call To Nonexistent Method.调用不存在的方法"
	,NoExistFunctionName := "No Exist FunctionName.不存在的函数名"
	,NoExistFile := "File is Not Exist.文件不存在"
	,ExistFile := "File is Exist.文件已存在"
	,NoExistWin := "Win is Not Exist.窗口不存在"
	,ShownWin := "Win is Shown.窗口已经显示"
	,getWinHwndFailed := "Get Win Hwnd Failed.获取窗口句柄失败"
	,getControlHwndFailed := "Get Control Hwnd Failed.获取控件句柄失败"
	,SetConst := "Set Const.写入常量"
	,TooFewParas := "Too Few ParaMeters.参数过少"
	,TooManyParas := "Too Many ParaMeters.参数过多"
	,InvalidPara := "Invalid Para 无效参数"
	,ParaIsEmpty := "Para Is Empty 参数为空"
	,Assert := "Assert! 断言！ "
	,MoveFailed := "MoveFailed 文件移动失败"
	,NotOverride := "theObj in Class is Not Override 类中对象未被复写"
	,SingletonClass := "Instance Singleton Class 实例化单例类"
	,UnknownType := "Unknown Type 未知类型"
	,UserCancelled := "User cancelled 用户已取消"
	,AccObjectException := "ACC object exception ACC 对象异常"
	,CopyFail := "CopyFail 复制失败"
	,DeserializationFailed := "Deserialization failed 反序列化失败"
	,RetryFail := "Retry fail 重试失败"

}

/*!
End of class
*/
