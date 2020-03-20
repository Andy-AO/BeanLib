class _toString{
	str(aStr){
		if(aStr="")
			return "*NS*"
		else
			return aStr
	}
	;------------------------------
	list(aObj){
		ResultString := "["
		if (Type.isList(aObj)){
			for i,v in aObj{
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
	}

	;------------------------------
	obj(aObj){
		ResultString := "{"
		if(aObj.toString()!="")
			return aObj.toString()
		if (aObj.count()=0)
			return "{*Obj*}"
		;如果发现是实例,那么增加实例提示
		if (ObjHasKey(aObj.base,"__Class")){
			ResultString .= "__Instance:" . aObj.base.__Class . ","
		}
		for key,v in aObj{
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
	;------------------------------

	funcObj(aObj){
		if (type.isFuncObj(aObj)){
			return aObj.name "()"
		}
		else{
			return "*NotFunc*:"toString(aObj)
		}	
	}
	;------------------------------
	comObj(aCOMAcc){
		theResult := Object()
		theResult.Value := ComObjValue(aCOMAcc)
		theResult.VarType := ComObjType(aCOMAcc)           ; 需要 [v1.0.91+]
		theResult.Name    := ComObjType(aCOMAcc, "Name")
		theResult.IID     := ComObjType(aCOMAcc, "IID")
		theResult.Class   := ComObjType(aCOMAcc, "Class")  ; 需要 [v1.1.26+]
		theResult.CLSID   := ComObjType(aCOMAcc, "CLSID")  ; 需要 [v1.1.26+]
		return toString(theResult)
	}
	
} ;---------class _toString End
