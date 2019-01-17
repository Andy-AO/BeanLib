
/*
占用的域
函数 Type(Everthing)
类 Type TypeBase
*/

Type(Everthing){ ;提前支持 AHK2 中的特性 ;√		
	
	if (IsObject(Everthing))
		theType:=Type.ObjectType(Everthing)
	else
		theType:=Type.StringType(Everthing)
	
		return theType
}

;---------------------------------------------------------------------- 

Class Type{

		static Switcher:=true
		afOn(){
			Type.Switcher:=true
			return true
		}
		afOff(){
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
;---------------------------------------------------------------------- ;TypeBase 类的原方法的Base 放在这里了,全局变量能少占一个就少占一个吧

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


;主要是为了实现保护写入,也就是保证里面的东西是常量(必须Get也原函数实现,没法单独实现Set元函数,因为那样的话会直接复写掉,元函数本质是extends)
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
		
		
;---------------------------------------------------------------------- 直接移植过来的，本来在外面,所以缩进不太对,以后改吧
ObjectType(Obj){ ;检查Obj的类型(主要是分出 SA 和 非SA) ;√
	;检查一下看看是否为线性的,如果是,那么就是true,不是就返回0
	
	
	try len:=Obj.Length()
	
	catch Ex{
	if (Ex.Message.CharAt(1,9)=0x8002000) ;如果发现抛出异常,并且编号正确，那么就几乎可以肯定是ComObj
		return Type.ComObj
	}
	
	keyCount:=Obj.Count() ;计算长度和Key键数,如果一致,而且均非零非空,那么必定是SimpleArray
	if ((len=keyCount) AND (len!="") AND (keyCount!="") AND (keyCount!=0) AND (len!=0)){
		theType:=Type.SA
	}
		
	else 
		theType:=Type.ObjectSpecificType(Obj)
	
	return theType
}


ObjectSpecificType(Obj){ ;详细检查Obj的类型
	
	ObjBase:=""
	;检查是否为 Class 这个检测方法也是 AHK2 中的方法,看来也没有啥更好的了
    if ObjHasKey(Obj, "__Class") ;检查是否为 Class
        return Type.Class
    while ObjBase := Obj.base
        if ObjHasKey(ObjBase, "__Class") ;检查是否继承自 Class
			return Type.ExtendsObj
	
	;检查是否为 FuncObj 抽检两个字段，基本上就可以断定
	if ((Obj.Name!="") AND (Obj.IsOptional(1)!=""))
		return Type.FuncObj
	
	;检查是否为 FileObj 主要的方法就是抽检其中的三个字段
	F1:=Obj.Length=Obj.Length(),F2:=Obj.AtEOF!="",F3:=Obj.Pos!="",FC:=F1+F2+F3=3
	if (FC)
		return Type.FileObj
	
/*
	;检查是否为 ComObj
	VarType := ComObjType(Obj)  
	if (VarType)
		return Type.ComObj
*/

    return Type.Obj ;如果都不是那么就认为是 Object
}



StringType(Str){ ;检查String的类型 ;√
	
	if (Str="")
		return Type.NS
	else
		return Type.Str
}


;---------------------------------------------------------------------- 
		
		
		;这个函数的用处就是转换Code,因为有一些Code覆盖面非常大，主要是Obj,还有Str(覆盖NS)和SA(覆盖StrSA),这些就不能直接比对先去进行转换
		Swap(TypeCode,aInputTypeCode){
		
		if(TypeCode=Type["Obj"]){
		if ((aInputTypeCode>=Type["Obj"])AND(aInputTypeCode<=Type["ComObj"]))
			return TypeCode
		else 
			return aInputTypeCode
	
		}				
		
		else if(TypeCode=Type["Str"]){
		if ((aInputTypeCode>=Type["Str"])AND(aInputTypeCode<=Type["NS"]))
			return TypeCode
		else 
			return aInputTypeCode
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




