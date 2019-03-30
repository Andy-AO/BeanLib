

/*
说明:

这是"中心式导入"的示例。

导入方法有很多种,只要把所有 子Lib 导入某脚本中 BeanLib 即可。

如果要使用"中心式导入",可以直接移动 本地Git仓库 到示例位置,这是最省事的方法。

当然,你也可以自己搞一个"中心Lib",位置你来定,之后在其他任意脚本中 #Include 即可。

关于该方法的详细介绍请参阅帮助文档。

如果你有更通用的导入方法还请告知。^_^。

*/

;定义 #Include 的工作目录
#Include D:\AHKs\Stable\ahk_lib

;导入 子Lib (请全部导入,否则容易出现兼容性问题)
#Include _List.ahk
#Include _EX.ahk
#Include StringMethod.ahk

#Include TypeFuncAndClass.ahk

#Include AutoClassify.ahk
#Include Everything.ahk
#Include APPLocker.ahk
#Include Bean.ahk
#Include Function.ahk
#Include _Win.ahk
#Include _Wins.ahk
#Include PathObj.ahk
#Include Script.ahk
#Include Ini.ahk
#Include AutoInputBox.ahk

#Include ExcelToList().ahk
#Include Analyze().ahk
#Include Instanof().ahk
#Include getClass().ahk
