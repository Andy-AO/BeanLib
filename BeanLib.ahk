
;定义 #Include 的工作目录
#Include D:\AHKs\ahk_lib

/*
Core Pack 必须全部导入
其余 Pack 按需导入
*/

#Include Core\Bean.ahk
#Include Core\_Container.ahk
#Include Core\_EX.ahk
#Include Core\_List.ahk
#Include Core\_Map.ahk
#Include Core\Analyze().ahk
#Include Core\Function.ahk
#Include Core\getClass().ahk
#Include Core\Instanof().ahk
#Include Core\StringMethod.ahk
#Include Core\TypeFuncAndClass.ahk
#Include Core\Method.ahk
#Include Core\Function.ahk
#Include Core\ObservableMap.ahk
#Include Core\ObservableObj.ahk


;示例:

/*

;APP Pack
#Include AutoClassify.ahk
#Include APPLocker.ahk
#Include TimeChecker.ahk
#Include Script.ahk

;Everthing Pack
#Include Everything.ahk

;GUI Pack
#Include GUI.ahk
#Include Win.ahk
#Include _Win.ahk
#Include _Wins.ahk
#Include Control.ahk

;FuncObj  Pack
#Include Method.ahk
	#Include BeanEnum.ahk
	#Include Condition.ahk
#Include WinEvent.ahk
#Include AutoGUI.ahk
#Include AutoInputBox.ahk


;UMSS Pack
#Include UMSS.ahk

;HotString Pack
#Include HotString.ahk 

;String Pack
#Include PathObj.ahk
#Include Spliter.ahk

;I/O Pack
#Include Ini.ahk
#Include ExcelToList().ahk
*/