
;~ protect(Bean)

Class Bean{
static ObjectMetaMethodName:=["_NewEnum","__Init","__New","__Delete","__Get","__call","__Set","Count","Length"]
,LogEnable:=true
,InvisibleCharacterCodeList := [0x200b,0x0200c,0x0200d,0x0200e,0x200f
,0x202a,0x202b,0x202c,0x202d,0x202e
,0x2066,0x2067,0x2068,0x2069
,0xfeff
,0x06ec]
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
		if((type.isMethod(aObj))OR(type.isFuncObj(aObj))){
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