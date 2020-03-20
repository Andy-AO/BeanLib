class _toString{

	funcObjToString(aObj){
		if (type.isFuncObj(aObj)){
			return aObj.name "()"
		}
		else{
			return "*NotFunc*:"toString(aObj)
		}	
	}
	;------------------------------
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
	;----------------------------------------------------------------------- 
	DeepListToString(List){
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
	
} ;---------class _toString End
