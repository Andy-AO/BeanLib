
;~ protect(Bean)

Class Bean{
static ObjectMetaMethodName:=["_NewEnum","__Init","__New","__Delete","__Get","__call","__Set","Count","Length"]
static LogEnable:=false

;---------------------------------------------------------------------- 

true(aParas*){
	return true
}
;---------------------------------------------------------------------- 

false(aParas*){
	return false
}


;---------------------------------------------------------------------- 
	
	isFunc(aObj){
		if((type.isAction(aObj))OR(type.isFuncObj(aObj))){
			return true
		}
		else{
			return false
		}
	}
;---------------------------------------------------------------------- 
	
	afFunc(aObj){
		theTypeString := Type.ofCode(Type(aObj))
		if (NOT(Bean.isFunc(aObj))){
				throwWithSt(_EX.InvalidPara "1 : 参数不是FuncObj或Active,而是 " theTypeString)			
		}
		return
	}
;---------------------------------------------------------------------- 
	
	isMeta(aMethodName){
		result := _Container.Contains(Bean.ObjectMetaMethodName,aMethodName)
		return result
	}

;---------------------------------------------------------------------- 	
	notMeta(aMethodName){
		result := Not(Bean.isMeta(aMethodName))
		return result
	}

;---------------------------------------------------------------------- 
		
		
	isCall(aMethodName,athis:=""){
		if (IsObject(aMethodName) AND IsObject(athis)){					
			result := _Container.Contains(aMethodName,athis)
			return result
		}
			 
		result := ((aMethodName = "")OR(aMethodName = "Call"))
		return result
	}
;---------------------------------------------------------------------- 
		
		
	notCall(aMethodName){
		result := Not(Bean.isCall(aMethodName))
		return result
	}
	
	
	Class Protect{

		__Call(param*){
			;~ println("Call保护")
			throwWithSt(_EX.NoExistMethod)
			return
		}

		__Set(param*){
			;~ println("Set保护")
			throwWithSt(_EX.NoExistVariate)
			return
		}

		__Get(param*){
			;~ println("Get保护")
			throwWithSt(_EX.NoExistVariate)
			return
		}

;---------------------------------------------------------------------- 

}


}