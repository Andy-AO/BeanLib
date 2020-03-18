
	GetKeyPhysicalState(key){
		result  := GetKeyState(key,"P")
		return result
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
comObjToString(aCOMAcc){
	theResult := Object()
	theResult.Value := ComObjValue(aCOMAcc)
	theResult.VarType := ComObjType(aCOMAcc)           ; 需要 [v1.0.91+]
	theResult.Name    := ComObjType(aCOMAcc, "Name")
	theResult.IID     := ComObjType(aCOMAcc, "IID")
	theResult.Class   := ComObjType(aCOMAcc, "Class")  ; 需要 [v1.1.26+]
	theResult.CLSID   := ComObjType(aCOMAcc, "CLSID")  ; 需要 [v1.1.26+]
	return toString(theResult)
}

;---------------------------------------------------------------------- 

rawCall(aMethodName,aThis,aParams*){
		if(ObjHasKey(aThis.base,aMethodName)){
			return SmartCall(aThis.base[aMethodName],aThis,aParams*)
		}		
		else{
			throwWithSt(_EX.NoExistMethod)
		}
		return
}

;---------------------------------------------------------------------- 
;~ /*

loadMethod(this){
	this.Method:={},class:=this.base
	for name,Obj in class {
		pullIt := (type.isFuncObj(obj)) AND (Bean.notMeta(name))
		if(pullIt){
			this.Method[name] := new Method(obj,this)
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
	type.assertStr(aFuncName)
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
		type.assertObj(aPathList)
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
		Type.assertObj(FuncObj)
		Type.assertNumber(aMSec)
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
	assert(Boolean,Mes:="No Info"){
			
		if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
			return
		
		if(Boolean) ;如果表达式为true,那么就不触发 throw
			return Boolean
		
		ExMes:=_EX.assertfirm . " Mes : " . Mes
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
	Type.assertList(obj)
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
	Type.assertList(obj)
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
	
	ResultString:="",ListString := "[",ObjectString:="{"
	
	if (Type.isStr(Obj)){
		if(Obj="")
			return "*NS*"
		else
			return Obj
	}

	if (Type.isFuncObj(Obj)){
		return funcObjToString(Obj)
	}
	
	if (Type.isComObj(Obj)){
		return comObjToString(Obj)
	}
	
	;---------------------------------------------------------------------- 
	
	if (Type.isList(Obj)) ;如果是List,那么开头应该是"["
		ResultString:=ListString
	else {
		if (Type.isObj(Obj)) ;如果是Obj数组,那么开头应该是"{"
		ResultString:=ObjectString
	}	

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
	
	
	else if (Type.isObj(Obj)){
		
			if(Obj.toString()!="")
				return Obj.toString()
		
			if (Obj.count()=0)
				return "{*Obj*}"
			
			;如果发现是实例,那么增加实例提示
			if (ObjHasKey(Obj.base,"__Class")){
				ResultString .= "__Instance:" . Obj.base.__Class . ","
			}
			
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
	LogPrintln(aTitle,"aTitle >>>")
	LogPrintln(aTipString,"aTipString >>>")
	TrayTip,%aTitle%,%aTipString% 
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

;------------------------------
;------------------------------
ObjDump(obj,ByRef var:="",mode:=0){
  If IsObject(var){ ; FileAppend mode
    If FileExist(obj){
      FileDelete,%obj%
      If ErrorLevel
        return
    }
    f:=FileOpen(obj,"rw-rwd","CP0"),VarSetCapacity(v,sz:=RawObjectSize(var,mode)+8,0)
    ,RawObject(var,NumPut(sz-8,0+(ptr:=&v),"Int64"),mode),count:=sz//65536
    Loop % count
      f.RawWrite(ptr+0,65536),ptr+=65536
    return sz,f.RawWrite(ptr+0,Mod(sz,65536)),f.Close()
  } else if !IsByRef(var)
		return RawObjectSize(obj,mode)+8
  else return sz,VarSetCapacity(var,sz:=RawObjectSize(obj,mode)+8,0),RawObject(obj,NumPut(sz-8,&var,"Int64"),mode)
}
RawObject(obj,addr,buf:=0,objects:=0){
  ; Type.Enum:    Char.1 UChar.2 Short.3 UShort.4 Int.5 UInt.6 Int64.7 UInt64.8 Double.9 String.10 Object.11
  ; Negative for keys and positive for values
  if !objects
    objects:={(""):0,(obj):0}
  else objects[obj]:=(++objects[""])
  for k,v in obj
  { ; 9 = Int64 for size and Char for type
    If !(kIsString:=0)&&IsObject(k){
      If objects.HasKey(k)
        NumPut(-12,addr+0,"Char"),NumPut(objects[k],addr+1,"Int64"),addr+=9
      else NumPut(-11,addr+0,"Char"),NumPut(sz:=RawObjectSize(k,buf),addr+1,"Int64"),RawObject(k,addr+9,buf,objects),addr+=sz+9
    }else if (k+0=""||k ""!=k+0||k~="\s")
      kIsString:=true,NumPut(-10,addr+0,"Char"),NumPut(sz:=StrPut(k,addr+9)*2,addr+1,"Int64"),addr+=sz+9
    else NumPut( InStr(k,".")?-9:k>4294967295?-8:k>65535?-6:k>255?-4:k>-1?-2:k>-129?-1:k>-32769?-3:k>-2147483649?-5:-7,addr+0,"Char")
        ,NumPut(k,addr+1,InStr(k,".")?"Double":k>4294967295?"UInt64":k>65535?"UInt":k>255?"UShort":k>-1?"UChar":k>-129?"Char":k>-32769?"Short":k>-2147483649?"Int":"Int64")
        ,addr+=InStr(k,".")||k>4294967295?9:k>65535?5:k>255?3:k>-129?2:k>-32769?3:k>-2147483649?5:9
    If IsObject(v){
      if objects.HasKey(v)
        NumPut( 12,addr+0,"Char"),NumPut(objects[v],addr+1,"Int64"),addr+=9
      else NumPut( 11,addr+0,"Char"),NumPut(sz:=RawObjectSize(v,buf),addr+1,"Int64"),RawObject(v,addr+9,buf,objects),addr+=sz+9
    }else if (v+0=""||v ""!=v+0||v~="\s")
      NumPut( 10,addr+0,"Char"),NumPut(sz:=buf?obj.GetCapacity(kIsString?"" k:k):StrPut(v)*2,addr+1,"Int64"),DllCall("RtlMoveMemory","PTR",addr+9,"PTR",buf?obj.GetAddress(kIsString?"" k:k):&v,"PTR",sz),addr+=sz+9
    else NumPut(InStr(v,".")?9:v>4294967295?8:v>65535?6:v>255?4:v>-1?2:v>-129?1:v>-32769?3:v>-2147483649?5:7,addr+0,"Char")
        ,NumPut(v,addr+1,InStr(v,".")?"Double":v>4294967295?"UInt64":v>65535?"UInt":v>255?"UShort":v>-1?"UChar":v>-129?"Char":v>-32769?"Short":v>-2147483649?"Int":"Int64")
        ,addr+=InStr(v,".")||v>4294967295?9:v>65535?5:v>255?3:v>-129?2:v>-32769?3:v>-2147483649?5:9
  }
}

;------------------------------

RawObjectSize(obj,buf:=0,objects:=0){
  if !objects
    objects:={(obj):1}
  else if !objects.HasKey(obj)
    objects[obj]:=1
  sz:=0
  for k,v in obj
  {
    If !(kIsString:=0)&&IsObject(k)
      sz+=objects.HasKey(k)?9:RawObjectSize(k,buf,objects)+9
    else if (k+0=""||k ""!=k+0||k~="\s")
      kIsString:=true,sz+=StrPut(k)*2+9
    else sz+=InStr(k,".")||k>4294967295?9:k>65535?5:k>255?3:k>-129?2:k>-32769?3:k>-2147483649?5:9
    If IsObject(v)
      sz+=objects.HasKey(v)?9:RawObjectSize(v,buf,objects)+9
    else if (v+0=""||v ""!=v+0||v~="\s")
      sz+=(buf?obj.GetCapacity(kIsString?"" k:k):StrPut(v)*2)+9
    else sz+=InStr(v,".")||v>4294967295?9:v>65535?5:v>255?3:v>-129?2:v>-32769?3:v>-2147483649?5:9
  }
  return sz
}

;------------------------------
ObjLoad(addr,objects:=0){
  If (addr+0=""){ ; FileRead Mode
    If !FileExist(addr)
      return
    FileGetSize,sz,%addr%
    FileRead,v,*c %addr%
    If ErrorLevel||!sz
      return
    addr:=&v
  }
  obj:=[],end:=addr+8+(sz:=NumGet(addr+0,"Int64")),addr+=8
  if !objects
    objects:={0:obj}
  else objects.Push(obj)
  While addr<end{ ; 9 = Int64 for size and Char for type
    If !(kIsString:=0)&&NumGet(addr+0,"Char")=-12
      k:=objects[NumGet(addr+1,"Int64")],addr+=9
    else if NumGet(addr+0,"Char")=-11
      k:=ObjLoad(addr+1,objects),addr+=9+NumGet(addr+1,"Int64")
    else if NumGet(addr+0,"Char")=-10
      kIsString:=true,sz:=NumGet(addr+1,"Int64"),k:=StrGet(addr+9),addr+=sz+9
    else k:=NumGet(addr+1,SubStr("Char  UChar Short UShortInt   UInt  Int64 UInt64Double",(sz:=-NumGet(addr+0,"Char"))*6-5,6)),addr+=SubStr("112244888",sz,1)+1
    If NumGet(addr+0,"Char")= 12
      obj[kIsString?"" k:k]:=objects[NumGet(addr+1,"Int64")],addr+=9
    else if NumGet(addr+0,"Char")= 11
      obj[kIsString?"" k:k]:=ObjLoad(addr+1,objects),addr+=9+NumGet(addr+1,"Int64")
    else if NumGet(addr+0,"Char")= 10
      obj[kIsString?"" k:k]:=StrGet(addr+9),obj.SetCapacity(kIsString?"" k:k,sz:=NumGet(addr+1,"Int64")),DllCall("RtlMoveMemory","PTR",obj.GetAddress(kIsString?"" k:k),"PTR",addr+9,"PTR",sz),addr+=sz+9
    else obj[kIsString?"" k:k]:=NumGet(addr+1,SubStr("Char  UChar Short UShortInt   UInt  Int64 UInt64Double",(sz:=NumGet(addr+0,"Char"))*6-5,6)),addr+=SubStr("112244888",sz,1)+1
  }
  return obj
}
;------------------------------
class Function{

	func := Object()
	bindParas := Object()
	
	__New(aMethodName,aBindParas*){
		this.func := getFunc(aMethodName)
		this.bindParas := aBindParas
		return this
	}
	;------------------------------
	call(aCallParas*){
		paras := _List.merge(this.bindParas,aCallParas)
		return SmartCallForFunction(this.func,paras*)
	}
} ;---------class Function End
