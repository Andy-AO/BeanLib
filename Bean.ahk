
;~ protect(Bean)

Class Bean{
static ObjectMetaMethodName:=["_NewEnum","__Init","__New","__Delete","__Get","__call","__Set","Count","Length"]

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
		if((type.isActive(aCheckObj))OR(type.isFuncObj(aCheckObj))){
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
				throw Exception(_EX.InvalidPara "1 : 参数不是FuncObj或Active,而是 " theTypeString)			
		}
		return
	}
;---------------------------------------------------------------------- 
	
	isMeta(aMethodName){
		result := _List.Contains(Bean.ObjectMetaMethodName,aMethodName)
		return result
	}

;---------------------------------------------------------------------- 	
	notMeta(aMethodName){
		result := Not(Bean.isMeta(aMethodName))
		return result
	}

;---------------------------------------------------------------------- 
		
		
	isCall(aMethodName){
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
			throw Exception(_EX.NoExistMethod)
			return
		}

		__Set(param*){
			;~ println("Set保护")
			throw Exception(_EX.NoExistVariate)
			return
		}

		__Get(param*){
			;~ println("Get保护")
			throw Exception(_EX.NoExistVariate)
			return
		}

;---------------------------------------------------------------------- 

}


}