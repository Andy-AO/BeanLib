
/*
主要用来核对继承关系
*/

Instanof(Obj,Super){
	theList:=""	
	if (Type.isStr(Super)){
		theList:=AnalyzeClassName(Obj)
		return _List.Contains(theList,Super)
	}
	else {
		theList:=Analyze(Obj)
		return _List.Contains(theList,Super)
	}
}
