

/*
调用 Everthing 进行搜索
*/

;提取自 RunAny - 一劳永逸的快速启动 @hui-Zz
;主要改动: 1.精简方法名 2.调用 __New 时直接获取Dll信息
;需要保证:1.根目录或指定目录下存在 Everthing的DLL  2.Everthing程序正在运行
	;[修改于AHK论坛，IPC方式和everything进行通讯]
	
	
;~ protect(Everything)

class Everything{


key:="",MatchWholeWord:=false,DLL:=false
;---------------------------------------------------------------------- 
;获取EverthingDll

getDll(DLLPath:=""){
	if(DLLPath="")
		DLLPath:=A_ScriptDir
	DLL:=false
	if(FileExist(DLLPath "\Everything.dll")){
		DLL:=DllCall("LoadLibrary", str, "Everything.dll") ? "Everything.dll" : "Everything64.dll"
	}
	else if(FileExist(DLLPath "\Everything64.dll")){
		DLL:=DllCall("LoadLibrary", str, "Everything64.dll") ? "Everything64.dll" : "Everything.dll"
	}
	return DLL
}

;---------------------------------------------------------------------- 


__New(DLLPath:=""){
	

	this.afEverythingExist()
	Dll:=this.getDll(DLLPath)

	if Not(Dll){
	throwWithSt("Not Found Everthing.DLL/Everthing64.DLL.")
	}
	
	this.Dll:=Dll

	this.hModule := DllCall("LoadLibrary", str, this.DLL)

	return this
}

__Delete(){
	DllCall("FreeLibrary", "UInt", this.hModule)
	return
}

;---------------------------------------------------------------------- 
	afEverythingExist(){
		if Not(this.isEverythingExist()){
			throwWithSt("process ""Everything.exe"" is not Exist.")
		}
		return
	}

;---------------------------------------------------------------------- 
	isEverythingExist(){
		Process, Exist , % "Everything.exe"
		return ErrorLevel
	}
;---------------------------------------------------------------------- 

getSearchResultList(){
	theLen:=this.Count()
	Str:=this.GetFullPath(0)

	StrList:=[]

	loop,%theLen%{
		StrList.push(this.GetFullPath(A_Index-1))
	}
	return StrList
}

;---------------------------------------------------------------------- 

;设置关键词
SetKey(aValue){
	this.afEverythingExist()
	this.key := aValue
	DllCall(this.DLL "\Everything_SetSearch",str,this.key)
	return
}

;---------------------------------------------------------------------- 

;设置全字匹配
SetMatchWholeWord(aValue){
	this.MatchWholeWord := aValue
	DllCall(this.DLL "\Everything_SetMatchWholeWord",int,aValue)
	return
}

;执行搜索动作 (执行后直接返回匹配数)
Search(aValue=1){
	this.afEverythingExist()
	DllCall(this.DLL "\Everything_Query",int,aValue)
	return
}

;返回匹配总数
Count(){
	return DllCall(this.DLL "\Everything_GetTotResults")
}

;返回文件名
GetFileName(aValue){
	return StrGet(DllCall(this.DLL "\Everything_GetResultFileName",int,aValue))
}

;返回文件全路径
GetFullPath(aValue,cValue=128){
	VarSetCapacity(bValue,cValue*2)
	DllCall(this.DLL "\Everything_GetResultFullPathName",int,aValue,str,bValue,int,cValue)
	return bValue
}

;获取 Everything 版本
GetVersionString(){
  fmajor := DllCall(this.DLL "\Everything_GetMajorVersion")
  fminor:=DllCall(this.DLL "\Everything_GetMinorVersion")
  frevision:=DllCall(this.DLL "\Everything_GetRevision")
  return Format("{}.{}.{}", fmajor, fminor, frevision)
}


}
