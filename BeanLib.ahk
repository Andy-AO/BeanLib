
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
#Include Core\_toString.ahk
#Include Core\Analyze().ahk
#Include Core\Function.ahk
#Include Core\getClass().ahk
#Include Core\Instanof().ahk
#Include Core\InvisibleCharacter.ahk
#Include Core\StringMethod.ahk
#Include Core\TypeFuncAndClass.ahk
#Include Core\Method.ahk
#Include Core\Function.ahk
#Include Core\ObservableMap.ahk
#Include Core\ObservableObj.ahk
#Include Core\PathObj.ahk
#Include Core\Stack.ahk
#Include Core\Queue.ahk
#Include Core\Timer.ahk
#Include Core\MesToast.ahk

#Include GUI\AccWrapper.ahk

;FuncObj Pack
#Include FuncObj\BeanEnum.ahk
#Include FuncObj\Condition.ahk


;GUI Pack
#Include GUI\_GUI.ahk
#Include GUI\_Win.ahk
#Include GUI\_Wins.ahk
#Include GUI\BeanControl.ahk
#Include GUI\WinEvent.ahk
#Include GUI\AutoGUI.ahk
#Include GUI\AutoInputBox.ahk

;Everthing Pack
#Include Everything.ahk

;APP Pack
#Include APP\AutoClassify.ahk
#Include APP\APPLocker.ahk
#Include APP\TimeChecker.ahk
#Include APP\TimeChecker.ahk
#Include APP\Script.ahk
#Include APP\Switcher.ahk
#Include APP\RunningSpeedTest.ahk

;UMSS Pack
#Include UMSS.ahk

;HotString Pack
#Include HotString.ahk 

;Spliter Pack
#Include Spliter.ahk

;I/O Pack
#Include IO\Ini.ahk
#Include IO\ExcelToList().ahk
#Include IO\JSON.ahk
#Include IO\TextFile.ahk


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
#Include BeanControl.ahk

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