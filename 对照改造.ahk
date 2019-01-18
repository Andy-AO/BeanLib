
/*
用于对任意AHK脚本进行操作
*/


Class Type{

		
;---------------------------------------------------------------------- 

class TypeCallBase{ 
    __Call(aThis,aName,aParams*){	
		aNameLen:=StrLen(aName)
		aFuncName:=SubStr(aName,aFuncNameBegin:=1,aFuncNameLen:=2)
		;检查一下方法名,如果 少于4 那么肯定是错的，这里没有少于四个字符的方法名
		if ((aNameLen<4) OR (aNameLen="")){
		throw Exception(_Ex.NoExistMethod)
		}
		
		;获取目标的代号
		
		TypeName:=SubStr(aName,BeginIndex:=3,aNameLen)
		TypeCode:=Type[TypeName]
		;~ return aFuncName
		;获取代号之后传递过去,根据情况使用断言af或者判断is
		
		if(ObjHasKey(this,aFuncName)){ 
			OutPut :=this[aFuncName].Call(aThis,TypeCode,aParams,TypeName)
			return OutPut
		}
		else{					
			throw Exception(_Ex.NoExistMethod)	;如果发现不是is或者af,那么就说找不到方法
		}
    }
}

;---------------------------------------------------------------------- 


class TypeGetBase{ 
    __Call(aThis,aName,aParams*){
		
		if(ObjHasKey(this,aName)){ 
			OutPut :=this[aName]
			return OutPut
		}
		else{					
			return ""		
		}
    }
}

;---------------------------------------------------------------------- 
		
;主要是为了实现保护写入,也就是保证里面的东西是常量
class TypeSetBase{
    __Call(aParams*){		
		throw Exception(_EX.SetConst)
		return ""
    }
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
	
	Static Str:=10,NS:=11
	
	Static SA:=130
	
	Static Obj:=100,ExtendsObj:=101,Class:=110,FuncObj:=120
	
	Static FileObj:=150
	
	Static ComObj:=160
	}	
	
;---------------------------------------------------------------------- 

	

	Class __Call extends Type.TypeCallBase{
	
	is(TypeCode,aParams,TypeName){
		
	if (aParams.length()<1)
		throw Exception(_Ex.TooFewParas)
	theInput:=aParams[1]
	aInputTypeCode:=Type(theInput)
	
	if ((TypeCode=Type["Obj"]) OR (TypeCode=Type["Str"])) ;对于这两个范围很大的特殊优待
	aInputTypeCode:=Type.Swap(TypeCode,aInputTypeCode)
	
	Result:=TypeCode=aInputTypeCode
	
	return Result
	}
	
	
	af(TypeCode,aParams,TypeName){ ;断言.
		
	if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
		return
	
	;不能直接调用is,要转接之后调用
	theIsName:="is" TypeName
	theInput:=aParams[1]
	Result:=this[theIsName](theInput)
	if (Result)
		return Result
	else{
		aInputTypeCode:=Type(theInput),ActualTypes:=Type.ofCode(aInputTypeCode)
		Mess=Affirm! GoalType : "%TypeName%"  ActualTypes : "%ActualTypes%"  
		throw Exception(Mess)
	}		
	Result:=this.isisis(TypeCode,aParams) 
	return Result
	}
	
	}	

} ;TypeBase Class End




