
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
	bulkMoveFile(aPathSA,aDestPattern){
		Overwrite:=false
		type.afObj(aPathSA)
		for i,v in aPathSA {
			SourcePattern:=v
			FileMove, %SourcePattern%, %aDestPattern% , %Overwrite%
			if ErrorLevel
				throw Exception(_EX.MoveFailed " : " SourcePattern)
		}
		return aPathSA.Length()
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
	GetWinID(WinTitle="A"){ ;没有再目录上写明,因为用不到,没必要
		WinGet,WinID,ID,%WinTitle%
		return WinID
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

;---------------------------------------------------------------------- 
/*
对任意对象添加 读/写/调用 保护
*/
;01月23日-如果目标 Extends 自其他对象,也会对其他对象造成连带影响;而且,也不能用于 __New 中,会造成第二次的对象生成失败,所以先下架
/*
Protect(Obj){
	
	thebase:={},baseSA:=[]
	
	type.afObj(Obj)
	
	baseSA:=Analyze(Obj)
	baselen:=baseSA.length()
	
	if(baselen=1){ ;如果长度只有一的话，那么就直接用Obj即可
	thebase:=obj
	}
	
	
	loop,% baselen-1 {
	thebase:=Obj.base
	}
	
	thebase.base:=Bean.Protect
	return
}


*/

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
PrintSA(obj){
	Type.afSA(obj)
	print(_SA.ToString(obj))
	return
 }
;----------------------------------------------------------------------- 
DeepPrintSA(SA){
	theString:=DeepSAtoString(SA)
	print(theString)
	return theString
}
;---------------------------------------------------------------------- 
PrintlnSA(obj){
	Type.afSA(obj)
	println(_SA.ToString(obj))
	return
 }
;---------------------------------------------------------------------- 
DeepPrintlnSA(SA){
	theString:=DeepSAtoString(SA)
	println(theString)
	return theString
}
;----------------------------------------------------------------------- 
DeepSAtoString(SA){
	
	TheArrayString:=""
	TheArrayString.= "["
		
	for index,v in SA{
		
		if (Type.isSA(v))
			TheArrayString.="," DeepSAtoString(v)
		
		else if (Type.isSA(v))
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
	
	ResultString:="",SAString:="",SAString.= "[",ObjectString:="",ObjectString.="{"
	
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
	
	if (Type.isSA(Obj)) ;如果是SA,那么开头应该是"["
		ResultString:=SAString

;---------------------------------------------------------------------- 

	if (Type.isSA(Obj)){
		
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

