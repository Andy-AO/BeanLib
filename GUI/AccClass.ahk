

/*
说明:主要是对Acc-ComObj进行分析
*/
Class AccClass{
	Static loaded := ""
	accObj := ""
	;------------------------------;静态区开始
	p_init(){
		If Not AccClass.loaded
			AccClass.loaded:=DllCall("LoadLibrary","Str","oleacc","Ptr")
	}
	;------------------------------ ;转换区开始
	ObjectFromWindow(hWnd, idObject := 0){ 
		_Acc.p_init(),pacc := ""
		If	DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
		Return	AccClass.__New(ComObjEnwrap(9,pacc,1))
	}
	;------------------------------
	Analyze(vChildId := 0){
		oAcc := this.accObj
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
		theMap["StateTextAll"] := AccClass.getStateTextAll(theMap["StateNum"])
		theMap["Action"] := oAcc.accDefaultAction(vChildId)
		theMap["Focus"] := oAcc.accFocus
		theMap["Selection"] := AccClass.getSelection(oAcc)
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
		if(AccClass.p_checkAnalyzeResult(theMap))
			return theMap
		else
			throw throw(_EX.AccObjectException)
	}
	;------------------------------;转换区结束

	__New(aAccObj){
		this.accObj := aAccObj
		return this
	}
	;------------------------------
	getSelection(aAccObj){
		vSel := aAccObj.accSelection ;if one item selected, gets index, if multiple items selected, gets indexes as object
		if IsObject(vSel)
		{
			oSel := vSel, vSel := ""
			while oSel.Next(vValue, vType)
				vSel .= (A_Index=1?"":",") vValue
			oSel := ""
		}
		return vSel
	}
	;------------------------------
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
		if(AccClass.p_checkPathPathList(thePathList))
			return thePathList
		else
			throw(_EX.InvalidPara "acc path 格式错误!")
	}
	;------------------------------
	getChild(aAccObj,aIndex){
		maxIndex := AccClass.Analyze(aAccObj).ChildCount
		if(aIndex>maxIndex)
			throw throw(_Ex.IndexOutOfBounds)
		else
			return Acc_Children(aAccObj)[aIndex]
	}
	;------------------------------
	ObjectFromPath(aPath){
		theAccObj := this.accObj
		thePathList := AccClass.p_pathToPathList(aPath)
		for i,v in thePathList {
			theAccObj := AccClass.getChild(theAccObj,v)
		}
		return AccClass.__New(theAccObj)
	}
	;------------------------------
	AnalyzeFromPoint(ByRef _idChild_ = "", x = "", y = ""){
		return AccClass.Analyze(Acc_ObjectFromPoint(_idChild_,x,y),_idChild_)
	}
	
	;------------------------------
	p_checkAnalyzeResult(aMap){
		if((aMap.ChildCount="")AND(aMap.RoleNum=""))
			return false
		else
			return true
	}
	;sources: WinUser.h, oleacc.h
		;e.g. STATE_SYSTEM_SELECTED := 0x2
		static State := {0x1:"UNAVAILABLE"
		, 0x2:"SELECTED"
		, 0x4:"FOCUSED"
		, 0x8:"PRESSED"
		, 0x10:"CHECKED"
		, 0x20:"MIXED"
		, 0x40:"READONLY"
		, 0x80:"HOTTRACKED"
		, 0x100:"DEFAULT"
		, 0x200:"EXPANDED"
		, 0x400:"COLLAPSED"
		, 0x800:"BUSY"
		, 0x1000:"FLOATING"
		, 0x2000:"MARQUEED"
		, 0x4000:"ANIMATED"
		, 0x8000:"INVISIBLE"
		, 0x10000:"OFFSCREEN"
		, 0x20000:"SIZEABLE"
		, 0x40000:"MOVEABLE"
		, 0x80000:"SELFVOICING"
		, 0x100000:"FOCUSABLE"
		, 0x200000:"SELECTABLE"
		, 0x400000:"LINKED"
		, 0x800000:"TRAVERSED"
		, 0x1000000:"MULTISELECTABLE"
		, 0x2000000:"EXTSELECTABLE"
		, 0x4000000:"ALERT_LOW"
		, 0x8000000:"ALERT_MEDIUM"
		, 0x10000000:"ALERT_HIGH"
		, 0x20000000:"PROTECTED"
		, 0x40000000:"HASPOPUP"}
	;------------------------------
	
	getStateTextAll(vState){
		vNum := 1,vOutput := ""
		Loop, 30
		{
			if vState & vNum
				vOutput .= AccClass.State[vNum] " "
			vNum <<= 1 ;multiply by 2
		}
		vOutput := RTrim(vOutput)
		return Format("{:L}", vOutput)
	}

} ;Class AccClass End