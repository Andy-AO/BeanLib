
/*
主要用来核对继承关系
*/

Instanof(Obj,Super){
	theSA:=""	
	if (Type.isStr(Super)){
		theSA:=AnalyzeClassName(Obj)
		return _SA.Contains(theSA,Super)
	}
	else {
		theSA:=Analyze(Obj)
		return _SA.Contains(theSA,Super)
	}
}
