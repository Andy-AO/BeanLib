
	GetKeyPhysicalState(key){
		result  := GetKeyState(key,"P")
		return result
	}
;---------------------------------------------------------------------- 

showObj(aObj,aList:=""){

;---------------------------------------------------------------------- 

	theMap:= Object("__Class",aObj.base.__Class) ;DeBug

;---------------------------------------------------------------------- 
	
	for key,value in aObj {
		if(Bean.isFunc(value))
			theMap[key]:=value
	}		

;---------------------------------------------------------------------- 
		
	if(type.isList(aList)){
		for index,value in aList {
				theMap[value]:=aObj[value]
		}	
	}	
	
	return theMap
}

;---------------------------------------------------------------------- 

funcObjToString(aObj){
	if (type.isFuncObj(aObj)){
		return aObj.name "()"
	}
	else{
		return "*NotFunc*:"toString(aObj)
	}	
}

;---------------------------------------------------------------------- 

rawCall(aThis,aMethodName,aParams*){
		if(ObjHasKey(aThis.base,aMethodName)){
			return SmartCall(aThis,aThis.base[aMethodName],aParams*)
		}		
		else{
			throwWithSt(_EX.NoExistMethod)
		}
		return
}

;---------------------------------------------------------------------- 
;~ /*

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
;~ */
;----------------------------------------------------------------------
/*
如果扑空会抛出异常的 FuncObj 获取器
*/
getFunc(aFuncName){
	type.afStr(aFuncName)
	theFunc := Func(aFuncName)
	if Not(IsObject(theFunc)){
		throwWithSt(_Ex.NoExistFunctionName)
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
				throwWithSt(_EX.MoveFailed " : " SourcePattern)
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

	SetTimer(aMSec,FuncObj){
		;~ aMSec := aMSec*6000
		Type.afObj(FuncObj)
		Type.afNumber(aMSec)
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
		throwWithSt(ExMes)
		
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
	if(Bean.LogEnable){
		stdout(TheText)
	}
	return
}
;---------------------------------------------------------------------- 
println(TheText){
	if(Bean.LogEnable){
		stdoutln(TheText)
	}
	return
}	

;---------------------------------------------------------------------- 

LogPrintln(Obj:="",prefix:="",postfix:=""){
	theString:=prefix toString(Obj) postfix ;DeBug
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
			throwWithSt("The " index "th element in the array is invalid.")
		
	}

	TheArrayString := StrReplace(TheArrayString, "," , "", OutputVarCount,1)
	TheArrayString.= "]"
	return TheArrayString
}

;---------------------------------------------------------------------- 


toString(Obj){
	
	if(ObjHasKey(Obj,"__toString")){
		if(type.isList(theList:=Obj.__toString)){
			mapwinObj := showObj(Obj,theList)
			return toString(mapwinObj)		
		}
		else{
			mapwinObj := showObj(Obj)
			return toString(mapwinObj)	
		}
	}
	
	ResultString:="",ListString:="",ListString.= "[",ObjectString:="",ObjectString.="{"
	
	if (Type.isStr(Obj)){
		if(Obj="")
			return "*NS*"
		else
			return Obj
	}
	
		
	if (Type.isFuncObj(Obj)){
		return funcObjToString(Obj)
	}
	
	;---------------------------------------------------------------------- 
	
	if (Type.isList(Obj)) ;如果是List,那么开头应该是"["
		ResultString:=ListString
	else {
		if (Type.isObj(Obj)) ;如果是Obj数组,那么开头应该是"{"
		ResultString:=ObjectString
	}	
;---------------------------------------------------------------------- 
	



;---------------------------------------------------------------------- 

	if (Type.isList(Obj)){
		
		for i,v in Obj{
				
			if (A_Index!=1)
				symbol:=","
			else 
				symbol:=""
				
			if (Type.isObj(v)){ 
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
				return "{*Obj*}"
			
			for key,v in Obj{
					
				theKey:=toString(Key) 
				
				if (A_Index!=1)
					symbol:=","
				else 
					symbol:=""
					
					
				if (Type.isObj(v)){ ;key一定是用""包裹的,value则不

						theV:=toString(v) ;DeBug


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


Traceback(actual:=false){
	r := [], i := 0, n := actual ? 0 : A_AhkVersion<"2" ? 1 : 2
	Loop
	{
		theEx := Exception(".", offset := -(A_Index + n))
		if (theEx.What == offset)
			break
		r[++i] := { "file": theEx.file, "line": theEx.Line, "caller": theEx.What, "offset": offset + n }
	}
	return r
}

 ;~ From：https://www.autohotkey.com/boards/viewtopic.php?t=6001

;------------------------------

StackTrace(Mes){
		out := "Stack trace:"
		Traceback := Traceback()
		headStr := "`r`n" "-Stack Trace ~ ~~" "  " "Mes:" Mes "`r`n"
		stdoutln(headStr,Encoding:="UTF-8")
		for i, info in Traceback
		{
			Snippet := info.File "(" info.line ")" " : ==> " "offset:" info.offset " "  "caller:" info.caller " "
			stdoutln(Snippet,Encoding:="UTF-8")
		}

		return out
}

;------------------------------

	throwWithSt(Mes,EnableEx := true){ 
		if(IsObject(Mes)){
			theTipString = %A_ThisFunc% : Mes 暂时仅支持Str类型.
			TrayTip,%A_ScriptName%,%theTipString% 
			return
		}
		StackTrace(Mes)
		if(EnableEx){
			throw,Exception(Mes)
		}
		return 
	}
	
	;------------------------------

	throw(Mes,EnableEx := true){ 
		throwWithSt(Mes,EnableEx)
		return 
	}
	
;------------------------------
TrayTip(aTitle,aTipString){
	TrayTip,%aTitle%,%theTipString% 
	return
}

;------------------------------
	
InstanceCheck(this){
	if(this.InstanceExist){
		throw(_Ex.SingletonClass)
		return false
	}
	else{
		this.InstanceExist := true
		return true
	}
}