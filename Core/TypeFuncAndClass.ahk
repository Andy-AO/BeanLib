	

/*
占用的域
函数 Type(Ever)
类 Type TypeBase
*/
Type(Ever){ 
	
	if (IsObject(Ever))
		theType:=Type.ObjectType(Ever)
	else
		theType:=Type.StringType(Ever)
	
		return theType
}
;---------------------------------------------------------------------- 
Class Type{
	;用于测试的，有继承关系的一些 Inter Class
	Class AA extends Type.BB{
	}
	Class BB extends Type.CC{
	}
	Class CC extends Type.DD{
	}
	Class DD{
	}
;---------------------------------------------------------------------- 
	isObj(Obj){ ;isObj直接调用系统函数就行了，不用绕弯子
		return IsObject(Obj)
	}
	
;---------------------------------------------------------------------- 
	class check{
		ComObj(aObj){
			VarType := ComObjType(aObj)
			Name    := ComObjType(aObj, "Name")
			IID     := ComObjType(aObj, "IID")
			if((IID)AND(Name)AND(IID))
				return true
			else
				return false
		}
		List(aObj){
			len:=aObj.Length(),keyCount:=aObj.Count()
			if ((len=keyCount) AND (len!="") AND (keyCount!="") AND (keyCount!=0) AND (len!=0))
				return true
			else
				return false
		}
		Class(aObj){
			ObjBase:=""
			if ObjHasKey(aObj, "__Class") 
				return Type.Class
			while ObjBase := aObj.base
				if ObjHasKey(ObjBase, "__Class") 
					return Type.ExtendsObj
		}
		FuncObj(aObj){
			if ((aObj.Name!="") AND (aObj.IsOptional(1)!=""))
				return Type.FuncObj
		}
		

		Exception(aObj){
			if (Objhaskey(aObj,"Message") AND (Objhaskey(aObj,"Line")) AND (Objhaskey(aObj,"what")))
				return Type.Exception
		}		

		FileObj(aObj){
			;检查是否为 FileObj 主要的方法就是抽检其中的三个字段
			F1:=aObj.Length=aObj.Length(),F2:=aObj.AtEOF!="",F3:=aObj.Pos!="",FC:=F1+F2+F3=3
			if (FC)
				return Type.FileObj
		}
	}
;---------------------------------------------------------------------- 
	static Switcher:=true
	assertOn(){
		Type.Switcher:=true
		return true
	}
	assertOff(){
		Type.Switcher:=false
		return false
	}
	
;---------------------------------------------------------------------- 
	;通过TypeCode反向查类型值
	ofCode(Code){
		theMap:=TypeBase.__Get
		for Key,Value in theMap{
		if (Code=Value)
			return key
		}
		return false		
	}
		
;---------------------------------------------------------------------- 
;TypeBase 类的原方法的Base 放在这里了,全局变量能少占一个就少占一个吧
	class TypeCallBase{
		static isLen:=2,assertLen:=6,head:=1
		__Call(aThis,aName,aParams*){	
			;获取长度和类型(if或者assert)
			aFuncNameLen:=StrLen(aName)
			;检查一下方法名,如果 少于4 那么肯定是错的，这里没有少于四个字符的方法名
			if ((aFuncNameLen<4) OR (aFuncNameLen="")){
				throwWithSt(_Ex.NoExistMethod)
			}

			ifSub:=SubStr(aName,Type.TypeCallBase.head,len:=Type.TypeCallBase.isLen)
			assertSub:=SubStr(aName,Type.TypeCallBase.head,len:=Type.TypeCallBase.assertLen)

			if(ifSub="is"){
				aFuncName:="is"
				BeginIndex:=Type.TypeCallBase.isLen + 1
			}

			else if(assertSub="assert"){
				aFuncName:="assert"
				BeginIndex:=Type.TypeCallBase.assertLen + 1
			}
			else
				throw(_Ex.NoExistMethod)

			TypeName:=SubStr(aName,BeginIndex,aFuncNameLen)

			;获取目标的代号
			TypeCode:=Type[TypeName]

			;获取代号之后传递过去,根据情况使用断言assert或者判断is
			
			if(ObjHasKey(this,aFuncName)){ 
				OutPut :=this[aFuncName].Call(aThis,TypeCode,aParams,TypeName)
				return OutPut
			}
			else{					
				throwWithSt(_Ex.NoExistMethod)	;如果发现不是is或者assert,那么就说找不到方法
			}
		}
	} ;TypeCallBase Class End
;---------------------------------------------------------------------- 
	;主要是为了实现保护写入,也就是保证里面的东西是常量(必须Get也原函数实现,没法单独实现Set元函数,因为那样的话会直接复写掉,元函数本质是extends)
	class TypeGetBase{ 
		__Call(aThis,aName,aParams*){
			
			if(ObjHasKey(this,aName)){ 
				OutPut :=this[aName]
				return OutPut
			}
			else{
				throwWithSt(_EX.NoExistVariate) ;如果找不到，那么就抛出值不存在异常
				return ""			
			}
		}
	} ;TypeGetBase Class End
;---------------------------------------------------------------------- 
	class TypeSetBase{
		__Call(aThis,aVariateName,aParams*){
			if(ObjHasKey(TypeBase.__Get,aVariateName)){ 
				throwWithSt(_EX.SetConst) ;如果已经存在,那么就抛出常量写入异常
				return ""
			}
			else{					
				throwWithSt(_EX.NoExistVariate)	;如果找不到，那么就抛出变量不存在异常	
			}
		}
	} ;TypeSetBase Class End
;---------------------------------------------------------------------- 直接移植过来的，本来在外面,所以缩进不太对,以后改吧
	ObjectType(aObj){
		
		for i,v in Type.Check {

			if(i != "__Class")AND(i != "Class"){
				LogPrintln(i,A_LineFile  "("  A_LineNumber  ")"  " : " "i >>> `r`n")
				LogPrintln(Type[i],A_LineFile  "("  A_LineNumber  ")"  " : " "Type[i] >>> `r`n")
/*
				funcObj := Type.Check[i]
				LogPrintln(funcObj,A_LineFile  "("  A_LineNumber  ")"  " : " "funcObj >>> `r`n")
*/
			}

			;~ LogPrintln(v,A_LineFile  "("  A_LineNumber  ")"  " : " "v >>> `r`n")
/*
			if(Type.Check[i].call(aObj))
				return Type[i]
*/
		}

		
		if(Type.check.ComObj(aObj))
			return Type.ComObj
		if(Type.check.List(aObj))
			return Type.List
		if(Type.check.Class(aObj))
			return Type.Class
		if(Type.check.FuncObj(aObj))
			return Type.FuncObj
		if(Type.check.Exception(aObj))
			return Type.Exception
		if(Type.check.FileObj(aObj))
			return Type.FileObj
		
		;如果都不是那么就认为只是 Object
		return Type.Obj 
	}
	;------------------------------
	StringType(Str){ ;检查String的类型 ;√
		
		if (Str="")
			return Type.NS
		else if(Str.isNumber()){
			if((Str=1)Or(Str=0))
				return Type.Boolean
			else
				return Type.Number
		}
			
		else
			return Type.Str
	}
;---------------------------------------------------------------------- 
		;这个函数的用处就是转换Code,因为有一些Code覆盖面非常大，主要是Obj,还有Str(覆盖NS)和List(覆盖StrList),这些就不能直接比对先去进行转换
		Swap(TypeCode,aInputTypeCode){
			if(TypeCode=Type["Obj"]){
				if ((aInputTypeCode>=Type["Obj"])AND(aInputTypeCode <= Type.ObjEndCode))
					return TypeCode
				else 
					return aInputTypeCode
			}				
			else if(TypeCode=Type["Str"]){
				if ((aInputTypeCode>=Type["Str"])AND(aInputTypeCode <= Type.StrEndCode))
					return TypeCode
				else 
					return aInputTypeCode
			}
			
			else if(TypeCode=Type["Number"]){
				if ((aInputTypeCode>=Type["Number"])AND(aInputTypeCode <= Type.NumberEndCode))
					return TypeCode
				else 
					return aInputTypeCode
			}
			else
				return aInputTypeCode
	}
;---------------------------------------------------------------------- 
}  ;Type Class End
;---------------------------------------------------------------------- 
Type.base:=new TypeBase()
;---------------------------------------------------------------------- 
Class TypeBase{
	Class __Set extends Type.TypeSetBase{
	}	
	Class __Get extends Type.TypeGetBase{
		
		;这些东西必须是静态的,不要以为最后还要__New,这个域是 "__Get" 的
		
		Static StrEndCode := 19,NumberEndCode := 14
		Static Str:=10,NS:=11,Number:=12,Boolean:=13
		Static List:=130
		Static ObjEndCode := 199
		Static Obj:=100,ExtendsObj:=101,Class:=110,FuncObj:=120,Exception:=121
		Static FileObj:=150
		Static ComObj:=160
	}	
;---------------------------------------------------------------------- 
	
	Class __Call extends Type.TypeCallBase{
		is(TypeCode,aParams,TypeName){
			if (aParams.length()<1)
				throwWithSt(_Ex.TooFewParas)
			theInput:=aParams[1]
			aInputTypeCode:=Type(theInput)
			
			aInputTypeCode:=Type.Swap(TypeCode,aInputTypeCode)
			
			Result:=TypeCode=aInputTypeCode
			
			return Result
		}
;------------------------------
		assert(TypeCode,aParams,TypeName){ ;断言.
			if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
				return
			theIsName:="is" TypeName	
			
			for i,v in aParams {
				theInput:=v
				Result:=this[theIsName](theInput)
				if (NOT(Result)){
					aInputTypeCode:=Type(theInput),ActualTypes:=Type.ofCode(aInputTypeCode)
					MesHead := _Ex.Assert
					Mes = GoalType : "%TypeName%"  ActualTypes : "%ActualTypes%" 
					Mes := MesHead . Mes
					throwWithSt(Mes)
				}
			}
			return true
		}		
;------------------------------
		pa(TypeCode,aParams,TypeName){ ;参数设置
			listIndex := 2
			result := ObjHasKey(aParams,listIndex)
			if(result){
				theIsName:="is" TypeName
				theInput:=aParams[1]
				LogPrintln(theInput,"theInput >>>")
				Result:=this[theIsName](theInput)
				if(Result)
					return theInput
				else{
					Default := aParams[2]
					return Default
				}
			}
			else{
				throwWithSt(_Ex.TooFewParas)
			}
		}
	}
} ;TypeBase Class End

;------------------------------
