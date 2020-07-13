
/*
说明:主要是对Acc-ComObj进行分析
*/
Class AccWrapper{
	p_accObj := "",path := AccWrapper.unknown
	;------------------------------
	Static loaded := "",setting := 0,unknown := "UnKnown"
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
	get(p*){
		return this.p_accObj
	}
	;------------------------------
	set(aAccObj,p*){
		return this.p_accObj := aAccObj
	}
	;------------------------------
	ObjectFromPoint(ByRef _idChild_ = "", x = "", y = ""){
		AccWrapper.p_init()
		pt := pacc := ""
		r := DllCall("oleacc\AccessibleObjectFromPoint"
		,"Int64", x==""||y==""?0*DllCall("GetCursorPos","Int64*",pt)+pt:x&0xFFFFFFFF|y<<32
		,"Ptr*", pacc
		,"Ptr", VarSetCapacity(varChild,8+2*A_PtrSize,0)*0+&varChild)
		If(r=0){
			_idChild_:=NumGet(varChild,8,"UInt")
			return	new AccWrapper(ComObjEnwrap(9,pacc,1))
		}
	}
	;------------------------------
	__New(aAccObj){
		this.set(aAccObj) 
	}
	;------------------------------;静态区开始
	p_init(){
		If Not AccWrapper.loaded
			AccWrapper.loaded:=DllCall("LoadLibrary","Str","oleacc","Ptr")
	}
	;------------------------------
	AnalyzeFromPoint(ByRef _idChild_ = "", x = "", y = ""){
		return AccWrapper.ObjectFromPoint(_idChild_,x,y).Analyze(_idChild_)
	}
	;------------------------------
	getStateTextAll(vState){
		vNum := 1,vOutput := ""
		Loop, 30
		{
			if vState & vNum
				vOutput .= AccWrapper.State[vNum] " "
			vNum <<= 1 ;multiply by 2
		}
		vOutput := RTrim(vOutput)
		return Format("{:L}", vOutput)
	}
	;------------------------------
	p_checkAnalyzeResult(aMap){
		if((aMap.ChildCount="")AND(aMap.RoleNum=""))
			return false
		else
			return true
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
		if(AccWrapper.p_checkPathPathList(thePathList))
			return thePathList
		else
			throw(_EX.InvalidPara "acc path 格式错误!")
	}
	;------------------------------
	
	ObjectFromWindow(hWnd, idObject := 0){ 
		AccWrapper.p_init(),pacc := ""
		If	DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
		return	result := new AccWrapper(ComObjEnwrap(9,pacc,1)),result.path := 0
	}

	getRoleText(nRole){
		nSize := DllCall("oleacc\GetRoleText", "Uint", nRole, "Ptr", 0, "Uint", 0)
		VarSetCapacity(sRole, (A_IsUnicode?2:1)*nSize)
		DllCall("oleacc\GetRoleText", "Uint", nRole, "str", sRole, "Uint", nSize+1)
		Return	sRole
	}

	getStateText(nState){
		nSize := DllCall("oleacc\GetStateText", "Uint", nState, "Ptr", 0, "Uint", 0)
		VarSetCapacity(sState, (A_IsUnicode?2:1)*nSize)
		DllCall("oleacc\GetStateText", "Uint", nState, "str", sState, "Uint", nSize+1)
		Return	sState
	}
	;------------------------------ ;静态区结束
;——————————————————————————————————————————————————————————————————————————————	
	;------------------------------ ;转换区开始
	Location(ChildId = 0, byref Position = "") { ; adapted from Sean's code
		try 
			this.get().accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
		catch
			return
		Position := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
		return	{x:NumGet(x,0,"int"), y:NumGet(y,0,"int"), w:NumGet(w,0,"int"), h:NumGet(h,0,"int")}
	}
	Analyze(vChildId := 0){
		oAcc := this.get()
		ComObjError(False)
		theMap := Object()
	
		theMap["RoleNum"] := oAcc.accRole(vChildId)
		theMap["RoleNumHex"] := Format("0x{:X}", theMap["RoleNum"])
		theMap["StateNum"] := oAcc.accState(vChildId)
		theMap["StateNumHex"] := Format("0x{:X}", theMap["StateNum"])
		oRect := this.Location(vChildId)
		theMap["Name"] := oAcc.accName(vChildId)
		theMap["Value"] := oAcc.accValue(vChildId)
		theMap["RoleText"] := AccWrapper.getRoleText(oAcc.accRole(vChildId))
		theMap["StateText"] := AccWrapper.getStateText(oAcc.accState(vChildId))
		theMap["StateTextAll"] := AccWrapper.getStateTextAll(theMap["StateNum"])
		theMap["Action"] := oAcc.accDefaultAction(vChildId)
		theMap["Focus"] := oAcc.accFocus
		theMap["Selection"] := this.getSelection()
		StrReplace(theMap["Selection"], ",",, vCount), vCount += 1
		theMap["SelectionCount"] := (theMap["Selection"] = "") ? 0 : vCount
		theMap["ChildCount"] := oAcc.accChildCount
		theMap["Location"] := Object("x",oRect.x,"y",oRect.y,"w",oRect.w,"h",oRect.h)
		theMap["Description"] := oAcc.accDescription(vChildId)
		theMap["Keyboard"] := oAcc.accKeyboardShortCut(vChildId)
		theMap["Help"] := oAcc.accHelp(vChildId)
		theMap["HelpTopic"] := oAcc.accHelpTopic(vChildId)
		theMap["hWnd"] := this.getWindowHWnd()
		theMap["Path"] := "--" ;not implemented
		oAcc := ""
		ComObjError(True)
		if(AccWrapper.p_checkAnalyzeResult(theMap))
			return theMap
		else
			throw(_EX.AccObjectException)
	}
	;------------------------------
	getWindowHWnd(){
		pacc := this.get(),hWnd := ""
		If	DllCall("oleacc\WindowFromAccessibleObject", "Ptr", IsObject(pacc)?ComObjValue(pacc):pacc, "Ptr*", hWnd)=0
		Return	hWnd
	}
	;------------------------------
	ObjectFromPath(aPath){
		thePathList := AccWrapper.p_pathToPathList(aPath)
		theAccWrapper := this
		for i,v in thePathList {
			theAccWrapper := theAccWrapper.getChild(v)
		}
		return theAccWrapper
	}
	;------------------------------
	p_getQuery(aAccObj) { ; thanks Lexikos - www.autohotkey.com/forum/viewtopic.php?t=81731&p=509530#509530
		try return ComObj(9, ComObjQuery(aAccObj,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
	}
	;------------------------------
	p_Error(p="") {
		setting := AccWrapper.setting 
		return p=""?setting:setting:=p
	}
	;------------------------------
	getChildren(){
		theAccObj := this.get()
		if ComObjType(theAccObj,"Name") != "IAccessible"
			ErrorLevel := "Invalid IAccessible Object"
		else {
			AccWrapper.p_init(), cChildren:=theAccObj.accChildCount, Children:=[]
			if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(theAccObj), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
				Loop %cChildren%
					i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?AccWrapper.p_getQuery(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
				return Children.MaxIndex()?Children:
			} else
				ErrorLevel := "AccessibleChildren DllCall Failed"
		}
		if(AccWrapper.p_Error())
			throw Exception(ErrorLevel,-1)
	}
	;------------------------------
	setChildPath(aChild){
		if(this.path = 0)
			aChild.path := aChild.index
		else if(this.path = AccWrapper.unknown)
			aChild.path := AccWrapper.unknown
		else
			aChild.path := this.path "." aChild.index
		return 
	}
	;------------------------------
	getChild(aIndex){
		maxIndex := this.Analyze().ChildCount
		if(aIndex>maxIndex)
			throw(_Ex.IndexOutOfBounds)
		else
			return theChild := new AccWrapper(this.getChildren()[aIndex]),theChild.index := aIndex,this.setChildPath(theChild)
	}
	;------------------------------;
	getSelection(){
		vSel := this.get().accSelection ;if one item selected, gets index, if multiple items selected, gets indexes as object
		if IsObject(vSel)
		{
			oSel := vSel, vSel := ""
			while oSel.Next(vValue, vType)
				vSel .= (A_Index=1?"":",") vValue
			oSel := ""
		}
		return vSel
	}
	;------------------------------;转换区结束

} ;Class AccWrapper End