class _toString{
	str(aStr){
		if(aStr="")
			return "*NS*"
		else
			return aStr
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
