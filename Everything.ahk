

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
	
	if Not(WinExist("ahk_exe Everything.exe")){
	throw Exception("ahk_exe Everything.exe is not Exist.")
	}
	
	Dll:=this.getDll(DLLPath)

	if Not(Dll){
	throw Exception("Not Found Everthing.DLL/Everthing64.DLL.")
	}
	
	this.Dll:=Dll

	this.hModule := DllCall("LoadLibrary", str, this.DLL)

	return this
}

__Delete(){
	DllCall("FreeLibrary", "UInt", this.hModule)
	return
}

;设置关键词
SetKey(aValue){
	this.key := aValue
	DllCall(this.DLL "\Everything_SetSearch",str,this.key)
	return
}

;设置全字匹配
SetMatchWholeWord(aValue){
	this.MatchWholeWord := aValue
	DllCall(this.DLL "\Everything_SetMatchWholeWord",int,aValue)
	return
}

;执行搜索动作 (执行后直接返回匹配数)
Search(aValue=1){
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

}
