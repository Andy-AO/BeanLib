

/*
说明:主要是对Acc-ComObj进行分析
*/
Class _Acc{
	p_checkPathPathList(aPathList){
		for i,v in aPathList {
			if(!(Type.isNumber(v)))
				return false
		}
		return true
	}
	;------------------------------
	p_pathToPathList(aPath){
		thePathList := StrSplit(aPath , Delimiters := ".")
		if(_Acc.p_checkPathPathList(thePathList))
			return thePathList
		else
			throw(_EX.InvalidPara "acc path 格式错误!")
	}
	;------------------------------
	getChild(aAccObj,aIndex){
		maxIndex := _Acc.Analyze(aAccObj).ChildCount
		if(aIndex>maxIndex)
			throw throw(_Ex.IndexOutOfBounds)
		else
			return Acc_Children(aAccObj)[aIndex]
	}
	;------------------------------
	ObjectFromPath(aAccObj,aPath){
		theAccObj := aAccObj
		thePathList := _Acc.p_pathToPathList(aPath)
		for i,v in thePathList {
			theAccObj := _Acc.getChild(theAccObj,v)
		}
		return theAccObj
	}
	AnalyzeFromPoint(ByRef _idChild_ = "", x = "", y = ""){
		return _Acc.Analyze(Acc_ObjectFromPoint(_idChild_,x,y),_idChild_)
	}
	
	Analyze(oAcc,vChildId = 0){
		ComObjError(False)
		theMap := Object()
		
		
		theMap["RoleNum"] := oAcc.accRole(vChildId)
		theMap["RoleNumHex"] := Format("0x{:X}", theMap["RoleNum"])
		theMap["StateNum"] := oAcc.accState(vChildId)
		theMap["StateNumHex"] := Format("0x{:X}", theMap["StateNum"])
		oRect := Acc_Location(oAcc, vChildId)
		theMap["Name"] := oAcc.accName(vChildId)
		theMap["Value"] := oAcc.accValue(vChildId)
		theMap["RoleText"] := Acc_GetRoleText(oAcc.accRole(vChildId))
		theMap["StateText"] := Acc_GetStateText(oAcc.accState(vChildId))
		theMap["StateTextAll"] := JEE_AccGetStateTextAll(theMap["StateNum"])
		theMap["Action"] := oAcc.accDefaultAction(vChildId)
		theMap["Focus"] := oAcc.accFocus
		theMap["Selection"] := JEE_AccSelection(oAcc)
		StrReplace(theMap["Selection"], ",",, vCount), vCount += 1
		theMap["SelectionCount"] := (theMap["Selection"] = "") ? 0 : vCount
		theMap["ChildCount"] := oAcc.accChildCount
		theMap["Location"] := Format("X{} Y{} W{} H{}", oRect.x, oRect.y, oRect.w, oRect.h)
		theMap["Description"] := oAcc.accDescription(vChildId)
		theMap["Keyboard"] := oAcc.accKeyboardShortCut(vChildId)
		theMap["Help"] := oAcc.accHelp(vChildId)
		theMap["HelpTopic"] := oAcc.accHelpTopic(vChildId)
		theMap["hWnd"] := := Acc_WindowFromObject(oAcc)
		theMap["Path"] := "--" ;not implemented
		oAcc := ""
		ComObjError(True)
		if(_Acc.p_checkAnalyzeResult(theMap))
			return theMap
		else
			throw throw(_EX.AccObjectException)
	}
	;------------------------------
	p_checkAnalyzeResult(aMap){
		if((aMap.ChildCount="")AND(aMap.RoleNum=""))
			return false
		else
			return true
	}
} ;Class _Acc End