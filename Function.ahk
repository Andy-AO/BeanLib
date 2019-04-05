;---------------------------------------------------------------------- 

loadAction(this){
	this.action:={},class:=this.base
	for name,Obj in class {
		pullIt := (type.isFuncObj(obj)) AND (Bean.notMeta(name))
		if(pullIt){
			this.action[name] := new Action(this,obj)
		}
	}
	return 
}
;----------------------------------------------------------------------
/*
如果扑空会抛出异常的 FuncObj 获取器
*/
getFunc(aFuncName){
	type.afStr(aFuncName)
	theFunc := Func(aFuncName)
	if Not(IsObject(theFunc)){
		throw Exception(_Ex.NoExistFunctionName)
	}
	return theFunc
}
;---------------------------------------------------------------------- 
/*
根据 Keys* 生成空的 Map
*/
getEmptyMap(aKeys*){
	theParaList:=[]
	for i,v in aKeys {
		theParaList.push(v)
		theParaList.push("")
	}
	return Object(theParaList*)
}

;---------------------------------------------------------------------- 

WinActivateByPath(aWinPath,aDetectHiddenWindows:=""){
		theWinId:=_Win.getIdByPath(aWinPath,aDetectHiddenWindows)
		WinActivate,%theWinId%
		LogPrintln(theWinId,"theWinId >>>")
		return theWinId
	}




;---------------------------------------------------------------------- 

	SelectWinByPathFromAnalyzeWins(aPathObj,aAnalyzeWins){
		newAnalyzeWins:=[]
		for i,v in aAnalyzeWins {
			theAnalyzeWin:=v
		
			if(theAnalyzeWin.WinPath=aPathObj.path)
				newAnalyzeWins.push(theAnalyzeWin)
		}	
		return newAnalyzeWins
	}


;---------------------------------------------------------------------- 

/*
获取当前线程方案的标识，用于解决多线程操作问题。aThisFunc 参数需要在调用处填写 A_ThisFunc。
*/
getFuncId(aThisFunc){
	String := aThisFunc " : " A_Min A_Sec A_MSec
	return String
}

;---------------------------------------------------------------------- 



/*
字符串转换为字符数字
*/
StringToCharArray(S){
	
	TheArray:=[],Sub:=""

	if(S="")
	return TheArray
	
	else{
	loop,% StrLen(S){
		Sub:=SubStr(S,A_Index,1)
		TheArray.Push(Sub)
	}
}
return TheArray
}

;---------------------------------------------------------------------- 

/*
批量移动文件
*/
	bulkMoveFile(aPathList,aDestPattern){
		Overwrite:=false
		type.afObj(aPathList)
		for i,v in aPathList {
			SourcePattern:=v
			FileMove, %SourcePattern%, %aDestPattern% , %Overwrite%
			if ErrorLevel
				throw Exception(_EX.MoveFailed " : " SourcePattern)
		}
		return aPathList.Length()
	}
;---------------------------------------------------------------------- 
/*
静默执行WindowsCMD命令行
*/
UseCMD(command){
	local
	CMDreturn:=""
	cmdFN:="RunAnyCtrlCMD"
	try{
		RunWait,% ComSpec " /C " command " > ""%Temp%\" cmdFN ".log""",, Hide
		FileRead, CMDreturn, %A_Temp%\%cmdFN%.log
		FileDelete,%A_Temp%\%cmdFN%.log
	}
	catch{}
	return CMDreturn
}
; 来源:https://autohotkey.com/boards/viewtopic.php?t=48132&p=215348
; 【后台静默运行cmd命令缓存文本取值 @hui-Zz】
;---------------------------------------------------------------------- 
/*
定时执行FuncObj
*/

	SetTimer(aMin,FuncObj){
		Type.afObj(FuncObj)
		aMSec:=aMin*1000*60
		Priority:=50000
		SetTimer,%FuncObj%,%aMSec%, %Priority%
		return
	}
;---------------------------------------------------------------------- 
/*
获取用于检查时间的字符串
*/
getCurrentTime(){
	return A_Hour A_Min
}
;---------------------------------------------------------------------- 
/*
获取窗口ID
*/
	GetWinId(WinTitle="A"){ ;没有再目录上写明,因为用不到,没必要
		WinGet,WinId,ID,%WinTitle%
		return "ahk_id " WinId
	}
;---------------------------------------------------------------------- 
/*
通用断言
*/
	af(Boolean,Mes:="No Info"){
			
		if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
			return
		
		if(Boolean) ;如果表达式为true,那么就不触发 throw
			return Boolean
		
		ExMes:=_EX.Affirm . " Mes : " . Mes
		throw Exception(ExMes)
		
		return Boolean
	}


;--------------***-------------------------------- 
/*
说明:打印字符到控制台
*/

;---------------------------------------------------------------------- 
stdout(TheText,Encoding:="UTF-8"){
	FileAppend,% TheText,*,% Encoding
	return
}
;----------------------------------------------------------------------- 
stdoutln(TheText,Encoding:="UTF-8"){
	stdout(TheText "`r`n",Encoding)
	return
}
;----------------------------------------------------------------------- 
print(TheText){
	stdout(TheText)
	return
}
;---------------------------------------------------------------------- 
println(TheText){
	stdoutln(TheText)
	return
	;---------------------------------------------------------------------- 
	text:=TheText "`r`n"
	print(text)
	return
}	

;---------------------------------------------------------------------- 

LogPrintln(Obj:="",prefix:="",postfix:=""){
	theString:=prefix toString(Obj) postfix
	println(theString)
	return
}
;---------------------------------------------------------------------- 

DeepPrintln(Obj){
	println(toString(Obj))
	return
}

;----------------------------------------------------------------------- 
PrintList(obj){
	Type.afList(obj)
	print(_List.ToString(obj))
	return
 }
;----------------------------------------------------------------------- 
DeepPrintList(List){
	theString:=DeepListtoString(List)
	print(theString)
	return theString
}
;---------------------------------------------------------------------- 
PrintlnList(obj){
	Type.afList(obj)
	println(_List.ToString(obj))
	return
 }
;---------------------------------------------------------------------- 
DeepPrintlnList(List){
	theString:=DeepListtoString(List)
	println(theString)
	return theString
}
;----------------------------------------------------------------------- 
DeepListtoString(List){
	
	TheArrayString:=""
	TheArrayString.= "["
		
	for index,v in List{
		
		if (Type.isList(v))
			TheArrayString.="," DeepListtoString(v)
		
		else if (Type.isList(v))
			TheArrayString.="," v
		
		else
			throw Exception("The " index "th element in the array is invalid.")
		
	}

	TheArrayString := StrReplace(TheArrayString, "," , "", OutputVarCount,1)
	TheArrayString.= "]"
	return TheArrayString
}

;---------------------------------------------------------------------- 


toString(Obj){
	
	ResultString:="",ListString:="",ListString.= "[",ObjectString:="",ObjectString.="{"
	
	if (Type.isStr(Obj)){
		if(Obj="")
			return "*NS*"
		else
			return Obj
	}
		
;---------------------------------------------------------------------- 
	
	if (Type.isObj(Obj)) ;如果是Obj数组,那么开头应该是"{"
		ResultString:=ObjectString
;---------------------------------------------------------------------- 
	
	if (Type.isList(Obj)) ;如果是List,那么开头应该是"["
		ResultString:=ListString

;---------------------------------------------------------------------- 

	if (Type.isList(Obj)){
		
		for i,v in Obj{
				
			if (A_Index!=1)
				symbol:=","
			else 
				symbol:=""
				
			if (Type.isObj(v)){ 
				if (v.count()=0)
				ResultString.=symbol "{*Object*}"
				
				else
				ResultString.=symbol toString(v)
			}
												
			else if (v="")
				ResultString.=symbol "*NS*"
				
			else
				ResultString.=symbol v
		}
		ResultString.= "]" ;添加右侧的中括号并出厂		 
		return ResultString
		
	}
	

;---------------------------------------------------------------------- 
			
	else if (Type.isObj(Obj)){
		
			if (Obj.count()=0)
				return "{*Object*}"
			
			for key,v in Obj{
					
				theKey:=toString(Key)
				
				if (A_Index!=1)
					symbol:=","
				else 
					symbol:=""
					
					
				if (Type.isObj(v)){ ;key一定是用""包裹的,value则不
					
					if (v.count()=0)
					theV:="{*Object*}"
					
					
					else{
						theV:=toString(v)
					}

					TheSubString=%symbol%%theKey%:%theV%
					ResultString.=TheSubString
				} 
				
				else{
					if(v="")
						ds:="*NS*"
					else
						ds:=v
					TheSubString=%symbol%%theKey%:%DS%
					ResultString.=TheSubString
				}
			
		}
			ResultString.= "}"
			return ResultString
	}
	
}
;--------------***-------------------------------- 

