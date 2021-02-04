/*
随机字符串生成器
*/

RandomStr(aLength = 16, aLowestAsc = 48, aHighestAsc = 122) { ; length, lowest and highest Asc value
	theStr := ""
	Loop, %aLength% {
		Random, r, aLowestAsc, aHighestAsc
		theStr .= Chr(r)
	}
	Return theStr
}
; From：polyethene https://autohotkey.com/board/topic/16860-how-to-generate-a-random-string-chars-like-fghdhfghdf
;------------------------------

GetKeyPhysicalState(key){
	result  := GetKeyState(key,"P")
	return result
}
;---------------------------------------------------------------------- 

rawCall(aMethodName,aThis,aParams*){
		if(ObjHasKey(aThis.base,aMethodName)){
			return SmartCall(aThis.base[aMethodName],aThis,aParams*)
		}		
		else{
			throwWithSt(_EX.NoExistMethod)
		}
		return
}

;---------------------------------------------------------------------- 
;~ /*

loadMethod(this){
	this.Method:={},class:=this.base
	for name,Obj in class {
		pullIt := (type.isFuncObj(obj)) AND (Bean.notMeta(name))
		if(pullIt){
			this.Method[name] := new Method(obj,this)
		}
	}
	return 
}
;~ */
;----------------------------------------------------------------------
/*
如果扑空会抛出异常的 FuncObj 获取器
*/
getFunc(aFuncName){
	type.assertStr(aFuncName)
	theFunc := Func(aFuncName)
	if Not(IsObject(theFunc)){
		throwWithSt(_Ex.NoExistFunctionName)
	}
	return theFunc
}
;---------------------------------------------------------------------- 
/*
根据 Keys* 生成空的 Map
*/
getEmptyMap(aKeys*){
	theParaList:=[]
	for i,v in aKeys {
		theParaList.push(v)
		theParaList.push("")
	}
	return Object(theParaList*)
}

;---------------------------------------------------------------------- 

WinActivateByPath(aWinPath,aDetectHiddenWindows:=""){
		theWinId:=_Win.getIdByPath(aWinPath,aDetectHiddenWindows)
		WinActivate,%theWinId%
		return theWinId
	}



;---------------------------------------------------------------------- 

/*
获取当前线程方案的标识，用于解决多线程操作问题。aThisFunc 参数需要在调用处填写 A_ThisFunc。
*/
getFuncId(aThisFunc){
	String := aThisFunc " : " A_Min A_Sec A_MSec
	return String
}

;---------------------------------------------------------------------- 



/*
字符串转换为字符数字
*/
StringToCharArray(S){
	
	TheArray:=[],Sub:=""

	if(S="")
	return TheArray
	
	else{
	loop,% StrLen(S){
		Sub:=SubStr(S,A_Index,1)
		TheArray.Push(Sub)
	}
}
return TheArray
}

;---------------------------------------------------------------------- 

/*
批量移动文件
*/
	bulkMoveFile(aPathList,aDestPattern){
		Overwrite:=false
		type.assertObj(aPathList)
		for i,v in aPathList {
			SourcePattern:=v
			try{
				FileMove, %SourcePattern%, %aDestPattern% , %Overwrite%
			}
			catch,ex{
				throwWithSt(_EX.MoveFailed " : " SourcePattern)
			}
		}
		return aPathList.Length()
	}
;---------------------------------------------------------------------- 
/*
静默执行WindowsCMD命令行
*/
UseCMD(command){
	local
	CMDreturn:=""
	cmdFN:="RunAnyCtrlCMD"
	try{
		RunWait,% ComSpec " /C " command " > ""%Temp%\" cmdFN ".log""",, Hide
		FileRead, CMDreturn, %A_Temp%\%cmdFN%.log
		FileDelete,%A_Temp%\%cmdFN%.log
	}
	catch{}
	return CMDreturn
}
; 来源:https://autohotkey.com/boards/viewtopic.php?t=48132&p=215348
; 【后台静默运行cmd命令缓存文本取值 @hui-Zz】
;---------------------------------------------------------------------- 
;---------------------------------------------------------------------- 
/*
获取用于检查时间的字符串
*/
getCurrentTime(){
	return A_Hour A_Min
}
;---------------------------------------------------------------------- 

/*
获取窗口ID
*/
	GetWinId(WinTitle="A"){ ;没有再目录上写明,因为用不到,没必要
		WinGet,WinId,ID,%WinTitle%
		return "ahk_id " WinId
	}
	

;---------------------------------------------------------------------- 
/*
通用断言
*/
	assert(Boolean,Mes:="No Info"){
			
		if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
			return
		
		if(Boolean) ;如果表达式为true,那么就不触发 throw
			return Boolean
		
		ExMes:=_EX.assertfirm . " Mes : " . Mes
		throwWithSt(ExMes)
		
		return Boolean
	}


;--------------***-------------------------------- 
/*
说明:打印字符到控制台
*/

;---------------------------------------------------------------------- 
stdout(TheText,Encoding:="UTF-8"){
	try{
		FileAppend,% TheText,*,% Encoding
	}
	catch,ex{
		return ex
	}
	return
}
;----------------------------------------------------------------------- 
stdoutln(TheText,Encoding:="UTF-8"){
	stdout(TheText "`r`n",Encoding)
	return
}
;----------------------------------------------------------------------- 
print(TheText){
	if(Bean.LogEnable){
		stdout(TheText)
	}
	return
}
;---------------------------------------------------------------------- 
println(TheText){
	if(Bean.LogEnable){
		stdoutln(TheText)
	}
	return
}	

;---------------------------------------------------------------------- 

LogPrintln(Obj:="",prefix:="",postfix:=""){
	theString:=prefix toString(Obj) postfix ;DeBug
	println(theString)
	return
}

;---------------------------------------------------------------------- 


toString(aObj){
	
	;~ stdoutln("Type(aObj,true):" Type(aObj,true))	
	
	theCodeName := Type(aObj,true)
	if(ObjHasKey(_toString,theCodeName))
		return _toString[theCodeName](aObj)
	else if(Type.isStr(aObj))
		return _toString.Str(aObj)
	else if(Type.isObj(aObj))
		return _toString.obj(aObj)
	else
		throw(_Ex.UnknownType)
	return
}

;---------------------------------------------------------------------- 


Traceback(actual:=false){
	r := [], i := 0, n := actual ? 0 : A_AhkVersion<"2" ? 1 : 2
	Loop
	{
		theEx := Exception(".", offset := -(A_Index + n))
		if (theEx.What == offset)
			break
		r[++i] := { "file": theEx.file, "line": theEx.Line, "caller": theEx.What, "offset": offset + n }
	}
	return r
}

 ;~ From：https://www.autohotkey.com/boards/viewtopic.php?t=6001

;------------------------------

StackTrace(Mes){
		out := ""
		Traceback := Traceback()
		headStr := "`r`n" "-Stack Trace ~ ~~" "  " "Mes:" Mes "`r`n"
		out .= headStr "`r`n"
		for i, info in Traceback
		{
			Snippet := info.File "(" info.line ")" " : ==> " "offset:" info.offset " "  "caller:" info.caller " "
			out .= Snippet "`r`n"
		}
		return out
}

;------------------------------

	throwWithSt(Mes,EnableEx := true){ 
		if(IsObject(Mes)){
			theTipString = %A_ThisFunc% : Mes 暂时仅支持Str类型.
			theMesToast := new MesToast(A_ScriptName,"theTipString"),theMesToast.show()  
			return
		}
		stdoutln(StackTrace(Mes),Encoding:="UTF-8")
		if(EnableEx){
			throw,Exception(Mes)
		}
		return 
	}
	
	;------------------------------

	throw(Mes,EnableEx := true){ 
		throwWithSt(Mes,EnableEx)
		return 
	}
	
;------------------------------
	
InstanceCheck(this){
	if(this.InstanceExist){
		throw(_Ex.SingletonClass)
		return false
	}
	else{
		this.InstanceExist := true
		return true
	}
}

;------------------------------
;------------------------------
ObjDump(obj,ByRef var:="",mode:=0){
  If IsObject(var){ ; FileAppend mode
    If FileExist(obj){
      FileDelete,%obj%
      If ErrorLevel
        return
    }
    f:=FileOpen(obj,"rw-rwd","CP0"),VarSetCapacity(v,sz:=RawObjectSize(var,mode)+8,0)
    ,RawObject(var,NumPut(sz-8,0+(ptr:=&v),"Int64"),mode),count:=sz//65536
    Loop % count
      f.RawWrite(ptr+0,65536),ptr+=65536
    return sz,f.RawWrite(ptr+0,Mod(sz,65536)),f.Close()
  } else if !IsByRef(var)
		return RawObjectSize(obj,mode)+8
  else return sz,VarSetCapacity(var,sz:=RawObjectSize(obj,mode)+8,0),RawObject(obj,NumPut(sz-8,&var,"Int64"),mode)
}
RawObject(obj,addr,buf:=0,objects:=0){
  ; Type.Enum:    Char.1 UChar.2 Short.3 UShort.4 Int.5 UInt.6 Int64.7 UInt64.8 Double.9 String.10 Object.11
  ; Negative for keys and positive for values
  if !objects
    objects:={(""):0,(obj):0}
  else objects[obj]:=(++objects[""])
  for k,v in obj
  { ; 9 = Int64 for size and Char for type
    If !(kIsString:=0)&&IsObject(k){
      If objects.HasKey(k)
        NumPut(-12,addr+0,"Char"),NumPut(objects[k],addr+1,"Int64"),addr+=9
      else NumPut(-11,addr+0,"Char"),NumPut(sz:=RawObjectSize(k,buf),addr+1,"Int64"),RawObject(k,addr+9,buf,objects),addr+=sz+9
    }else if (k+0=""||k ""!=k+0||k~="\s")
      kIsString:=true,NumPut(-10,addr+0,"Char"),NumPut(sz:=StrPut(k,addr+9)*2,addr+1,"Int64"),addr+=sz+9
    else NumPut( InStr(k,".")?-9:k>4294967295?-8:k>65535?-6:k>255?-4:k>-1?-2:k>-129?-1:k>-32769?-3:k>-2147483649?-5:-7,addr+0,"Char")
        ,NumPut(k,addr+1,InStr(k,".")?"Double":k>4294967295?"UInt64":k>65535?"UInt":k>255?"UShort":k>-1?"UChar":k>-129?"Char":k>-32769?"Short":k>-2147483649?"Int":"Int64")
        ,addr+=InStr(k,".")||k>4294967295?9:k>65535?5:k>255?3:k>-129?2:k>-32769?3:k>-2147483649?5:9
    If IsObject(v){
      if objects.HasKey(v)
        NumPut( 12,addr+0,"Char"),NumPut(objects[v],addr+1,"Int64"),addr+=9
      else NumPut( 11,addr+0,"Char"),NumPut(sz:=RawObjectSize(v,buf),addr+1,"Int64"),RawObject(v,addr+9,buf,objects),addr+=sz+9
    }else if (v+0=""||v ""!=v+0||v~="\s")
      NumPut( 10,addr+0,"Char"),NumPut(sz:=buf?obj.GetCapacity(kIsString?"" k:k):StrPut(v)*2,addr+1,"Int64"),DllCall("RtlMoveMemory","PTR",addr+9,"PTR",buf?obj.GetAddress(kIsString?"" k:k):&v,"PTR",sz),addr+=sz+9
    else NumPut(InStr(v,".")?9:v>4294967295?8:v>65535?6:v>255?4:v>-1?2:v>-129?1:v>-32769?3:v>-2147483649?5:7,addr+0,"Char")
        ,NumPut(v,addr+1,InStr(v,".")?"Double":v>4294967295?"UInt64":v>65535?"UInt":v>255?"UShort":v>-1?"UChar":v>-129?"Char":v>-32769?"Short":v>-2147483649?"Int":"Int64")
        ,addr+=InStr(v,".")||v>4294967295?9:v>65535?5:v>255?3:v>-129?2:v>-32769?3:v>-2147483649?5:9
  }
}

;------------------------------

RawObjectSize(obj,buf:=0,objects:=0){
  if !objects
    objects:={(obj):1}
  else if !objects.HasKey(obj)
    objects[obj]:=1
  sz:=0
  for k,v in obj
  {
    If !(kIsString:=0)&&IsObject(k)
      sz+=objects.HasKey(k)?9:RawObjectSize(k,buf,objects)+9
    else if (k+0=""||k ""!=k+0||k~="\s")
      kIsString:=true,sz+=StrPut(k)*2+9
    else sz+=InStr(k,".")||k>4294967295?9:k>65535?5:k>255?3:k>-129?2:k>-32769?3:k>-2147483649?5:9
    If IsObject(v)
      sz+=objects.HasKey(v)?9:RawObjectSize(v,buf,objects)+9
    else if (v+0=""||v ""!=v+0||v~="\s")
      sz+=(buf?obj.GetCapacity(kIsString?"" k:k):StrPut(v)*2)+9
    else sz+=InStr(v,".")||v>4294967295?9:v>65535?5:v>255?3:v>-129?2:v>-32769?3:v>-2147483649?5:9
  }
  return sz
}

;------------------------------
ObjLoad(addr,objects:=0){
  If (addr+0=""){ ; FileRead Mode
    If !FileExist(addr)
      return
    FileGetSize,sz,%addr%
    FileRead,v,*c %addr%
    If ErrorLevel||!sz
      return
    addr:=&v
  }
  obj:=[],end:=addr+8+(sz:=NumGet(addr+0,"Int64")),addr+=8
  if !objects
    objects:={0:obj}
  else objects.Push(obj)
  While addr<end{ ; 9 = Int64 for size and Char for type
    If !(kIsString:=0)&&NumGet(addr+0,"Char")=-12
      k:=objects[NumGet(addr+1,"Int64")],addr+=9
    else if NumGet(addr+0,"Char")=-11
      k:=ObjLoad(addr+1,objects),addr+=9+NumGet(addr+1,"Int64")
    else if NumGet(addr+0,"Char")=-10
      kIsString:=true,sz:=NumGet(addr+1,"Int64"),k:=StrGet(addr+9),addr+=sz+9
    else k:=NumGet(addr+1,SubStr("Char  UChar Short UShortInt   UInt  Int64 UInt64Double",(sz:=-NumGet(addr+0,"Char"))*6-5,6)),addr+=SubStr("112244888",sz,1)+1
    If NumGet(addr+0,"Char")= 12
      obj[kIsString?"" k:k]:=objects[NumGet(addr+1,"Int64")],addr+=9
    else if NumGet(addr+0,"Char")= 11
      obj[kIsString?"" k:k]:=ObjLoad(addr+1,objects),addr+=9+NumGet(addr+1,"Int64")
    else if NumGet(addr+0,"Char")= 10
      obj[kIsString?"" k:k]:=StrGet(addr+9),obj.SetCapacity(kIsString?"" k:k,sz:=NumGet(addr+1,"Int64")),DllCall("RtlMoveMemory","PTR",obj.GetAddress(kIsString?"" k:k),"PTR",addr+9,"PTR",sz),addr+=sz+9
    else obj[kIsString?"" k:k]:=NumGet(addr+1,SubStr("Char  UChar Short UShortInt   UInt  Int64 UInt64Double",(sz:=NumGet(addr+0,"Char"))*6-5,6)),addr+=SubStr("112244888",sz,1)+1
  }
  return obj
}
;------------------------------
class Function{

	func := Object()
	bindParas := Object()
	
	__New(aMethodName,aBindParas*){
		this.func := getFunc(aMethodName)
		this.bindParas := aBindParas
		return this
	}
	;------------------------------
	call(aCallParas*){
		paras := _List.merge(this.bindParas,aCallParas)
		return SmartCallForFunction(this.func,paras*)
	}
} ;---------class Function End



;------------------------------


; ==================================================================================================================================
; Function:       Notifies about changes within folders.
;                 This is a rewrite of HotKeyIt's WatchDirectory() released at
;                    http://www.autohotkey.com/board/topic/60125-ahk-lv2-watchdirectory-report-directory-changes/
; Tested with:    AHK 1.1.23.01 (A32/U32/U64)
; Tested on:      Win 10 Pro x64
; Usage:          WatchFolder(Folder, UserFunc[, SubTree := False[, Watch := 3]])
; Parameters:
;     Folder      -  The full qualified path of the folder to be watched.
;                    Pass the string "**PAUSE" and set UserFunc to either True or False to pause respectively resume watching.
;                    Pass the string "**END" and an arbitrary value in UserFunc to completely stop watching anytime.
;                    If not, it will be done internally on exit.
;     UserFunc    -  The name of a user-defined function to call on changes. The function must accept at least two parameters:
;                    1: The path of the affected folder. The final backslash is not included even if it is a drive's root
;                       directory (e.g. C:).
;                    2: An array of change notifications containing the following keys:
;                       Action:  One of the integer values specified as FILE_ACTION_... (see below).
;                                In case of renaming Action is set to FILE_ACTION_RENAMED (4).
;                       Name:    The full path of the changed file or folder.
;                       OldName: The previous path in case of renaming, otherwise not used.
;                       IsDir:   True if Name is a directory; otherwise False. In case of Action 2 (removed) IsDir is always False.
;                    Pass the string "**DEL" to remove the directory from the list of watched folders.
;     SubTree     -  Set to true if you want the whole subtree to be watched (i.e. the contents of all sub-folders).
;                    Default: False - sub-folders aren't watched.
;     Watch       -  The kind of changes to watch for. This can be one or any combination of the FILE_NOTIFY_CHANGES_...
;                    values specified below.
;                    Default: 0x03 - FILE_NOTIFY_CHANGE_FILE_NAME + FILE_NOTIFY_CHANGE_DIR_NAME
; Return values:
;     Returns True on success; otherwise False.
; Change history:
;     1.0.02.00/2016-11-30/just me        -  bug-fix for closing handles with the '**END' option.
;     1.0.01.00/2016-03-14/just me        -  bug-fix for multiple folders
;     1.0.00.00/2015-06-21/just me        -  initial release
; License:
;     The Unlicense -> http://unlicense.org/
; Remarks:
;     Due to the limits of the API function WaitForMultipleObjects() you cannot watch more than MAXIMUM_WAIT_OBJECTS (64)
;     folders simultaneously.
; MSDN:
;     ReadDirectoryChangesW          msdn.microsoft.com/en-us/library/aa365465(v=vs.85).aspx
;     FILE_NOTIFY_CHANGE_FILE_NAME   = 1   (0x00000001) : Notify about renaming, creating, or deleting a file.
;     FILE_NOTIFY_CHANGE_DIR_NAME    = 2   (0x00000002) : Notify about creating or deleting a directory.
;     FILE_NOTIFY_CHANGE_ATTRIBUTES  = 4   (0x00000004) : Notify about attribute changes.
;     FILE_NOTIFY_CHANGE_SIZE        = 8   (0x00000008) : Notify about any file-size change.
;     FILE_NOTIFY_CHANGE_LAST_WRITE  = 16  (0x00000010) : Notify about any change to the last write-time of files.
;     FILE_NOTIFY_CHANGE_LAST_ACCESS = 32  (0x00000020) : Notify about any change to the last access time of files.
;     FILE_NOTIFY_CHANGE_CREATION    = 64  (0x00000040) : Notify about any change to the creation time of files.
;     FILE_NOTIFY_CHANGE_SECURITY    = 256 (0x00000100) : Notify about any security-descriptor change.
;     FILE_NOTIFY_INFORMATION        msdn.microsoft.com/en-us/library/aa364391(v=vs.85).aspx
;     FILE_ACTION_ADDED              = 1   (0x00000001) : The file was added to the directory.
;     FILE_ACTION_REMOVED            = 2   (0x00000002) : The file was removed from the directory.
;     FILE_ACTION_MODIFIED           = 3   (0x00000003) : The file was modified.
;     FILE_ACTION_RENAMED            = 4   (0x00000004) : The file was renamed (not defined by Microsoft).
;     FILE_ACTION_RENAMED_OLD_NAME   = 4   (0x00000004) : The file was renamed and this is the old name.
;     FILE_ACTION_RENAMED_NEW_NAME   = 5   (0x00000005) : The file was renamed and this is the new name.
;     GetOverlappedResult            msdn.microsoft.com/en-us/library/ms683209(v=vs.85).aspx
;     CreateFile                     msdn.microsoft.com/en-us/library/aa363858(v=vs.85).aspx
;     FILE_FLAG_BACKUP_SEMANTICS     = 0x02000000
;     FILE_FLAG_OVERLAPPED           = 0x40000000
; ==================================================================================================================================
WatchFolder(Folder, UserFunc, SubTree := False, Watch := 0x03) {
   Static DummyObject := {Base: {__Delete: Func("WatchFolder").Bind("**END", "")}}
   Static TimerID := "**" . A_TickCount
   Static TimerFunc := Func("WatchFolder").Bind(TimerID, "")
   Static MAXIMUM_WAIT_OBJECTS := 64
   Static MAX_DIR_PATH := 260 - 12 + 1
   Static SizeOfLongPath := MAX_DIR_PATH << !!A_IsUnicode
   Static SizeOfFNI := 0xFFFF ; size of the FILE_NOTIFY_INFORMATION structure buffer (64 KB)
   Static SizeOfOVL := 32     ; size of the OVERLAPPED structure (64-bit)
   Static WatchedFolders := {}
   Static EventArray := []
   Static HandleArray := []
   Static WaitObjects := 0
   Static BytesRead := 0
   Static Paused := False
   ; ===============================================================================================================================
   If (Folder = "")
      Return False
   SetTimer, % TimerFunc, Off
   RebuildWaitObjects := False
   ; ===============================================================================================================================
   If (Folder = TimerID) { ; called by timer
      If (ObjCount := EventArray.Length()) && !Paused {
         ObjIndex := DllCall("WaitForMultipleObjects", "UInt", ObjCount, "Ptr", &WaitObjects, "Int", 0, "UInt", 0, "UInt")
         While (ObjIndex >= 0) && (ObjIndex < ObjCount) {
            FolderName := WatchedFolders[ObjIndex + 1]
            D := WatchedFolders[FolderName]
            If DllCall("GetOverlappedResult", "Ptr", D.Handle, "Ptr", D.OVLAddr, "UIntP", BytesRead, "Int", True) {
               Changes := []
               FNIAddr := D.FNIAddr
               FNIMax := FNIAddr + BytesRead
               OffSet := 0
               PrevIndex := 0
               PrevAction := 0
               PrevName := ""
               Loop {
                  FNIAddr += Offset
                  OffSet := NumGet(FNIAddr + 0, "UInt")
                  Action := NumGet(FNIAddr + 4, "UInt")
                  Length := NumGet(FNIAddr + 8, "UInt") // 2
                  Name   := FolderName . "\" . StrGet(FNIAddr + 12, Length, "UTF-16")
                  IsDir  := InStr(FileExist(Name), "D") ? 1 : 0
                  If (Name = PrevName) {
                     If (Action = PrevAction)
                        Continue
                     If (Action = 1) && (PrevAction = 2) {
                        PrevAction := Action
                        Changes.RemoveAt(PrevIndex--)
                        Continue
                     }
                  }
                  If (Action = 4)
                     PrevIndex := Changes.Push({Action: Action, OldName: Name, IsDir: 0})
                  Else If (Action = 5) && (PrevAction = 4) {
                     Changes[PrevIndex, "Name"] := Name
                     Changes[PrevIndex, "IsDir"] := IsDir
                  }
                  Else
                     PrevIndex := Changes.Push({Action: Action, Name: Name, IsDir: IsDir})
                  PrevAction := Action
                  PrevName := Name
               } Until (Offset = 0) || ((FNIAddr + Offset) > FNIMax)
               If (Changes.Length() > 0)
                  D.Func.Call(FolderName, Changes)
               DllCall("ResetEvent", "Ptr", EventArray[D.Index])
               DllCall("ReadDirectoryChangesW", "Ptr", D.Handle, "Ptr", D.FNIAddr, "UInt", SizeOfFNI, "Int", D.SubTree
                                              , "UInt", D.Watch, "UInt", 0, "Ptr", D.OVLAddr, "Ptr", 0)
            }
            ObjIndex := DllCall("WaitForMultipleObjects", "UInt", ObjCount, "Ptr", &WaitObjects, "Int", 0, "UInt", 0, "UInt")
            Sleep, 0
         }
      }
   }
   ; ===============================================================================================================================
   Else If (Folder = "**PAUSE") { ; called to pause/resume watching
      Paused := !!UserFunc
      RebuildObjects := Paused
   }
   ; ===============================================================================================================================
   Else If (Folder = "**END") { ; called to stop watching
      For K, D In WatchedFolders
         If K Is Not Integer
            DllCall("CloseHandle", "Ptr", D.Handle)
      For Each, Event In EventArray
         DllCall("CloseHandle", "Ptr", Event)
      WatchedFolders := {}
      EventArray := []
      Paused := False
      Return True
   }
   ; ===============================================================================================================================
   Else { ; called to add, update, or remove folders
      Folder := RTrim(Folder, "\")
      VarSetCapacity(LongPath, SizeOfLongPath, 0)
      If !DllCall("GetLongPathName", "Str", Folder, "Ptr", &LongPath, "UInt", SizeOfLongPath)
         Return False
      VarSetCapacity(LongPath, -1)
      Folder := LongPath
      If (WatchedFolders[Folder]) { ; update or remove
         Handle := WatchedFolders[Folder, "Handle"]
         Index  := WatchedFolders[Folder, "Index"]
         DllCall("CloseHandle", "Ptr", Handle)
         DllCall("CloseHandle", "Ptr", EventArray[Index])
         EventArray.RemoveAt(Index)
         WatchedFolders.RemoveAt(Index)
         WatchedFolders.Delete(Folder)
         RebuildWaitObjects := True
      }
      If InStr(FileExist(Folder), "D") && (UserFunc <> "**DEL") && (EventArray.Length() < MAXIMUM_WAIT_OBJECTS) {
         If (IsFunc(UserFunc) && (UserFunc := Func(UserFunc)) && (UserFunc.MinParams >= 2)) && (Watch &= 0x017F) {
            Handle := DllCall("CreateFile", "Str", Folder . "\", "UInt", 0x01, "UInt", 0x07, "Ptr",0, "UInt", 0x03
                                          , "UInt", 0x42000000, "Ptr", 0, "UPtr")
            If (Handle > 0) {
               Event := DllCall("CreateEvent", "Ptr", 0, "Int", 1, "Int", 0, "Ptr", 0)
               Index := EventArray.Push(Event)
               WatchedFolders[Index] := Folder
               WatchedFolders[Folder] := {Func: UserFunc, Handle: Handle, Index: Index, SubTree: !!SubTree, Watch: Watch}
               WatchedFolders[Folder].SetCapacity("FNIBuff", SizeOfFNI)
               FNIAddr := WatchedFolders[Folder].GetAddress("FNIBuff")
               DllCall("RtlZeroMemory", "Ptr", FNIAddr, "Ptr", SizeOfFNI)
               WatchedFolders[Folder, "FNIAddr"] := FNIAddr
               WatchedFolders[Folder].SetCapacity("OVLBuff", SizeOfOVL)
               OVLAddr := WatchedFolders[Folder].GetAddress("OVLBuff")
               DllCall("RtlZeroMemory", "Ptr", OVLAddr, "Ptr", SizeOfOVL)
               NumPut(Event, OVLAddr + 8, A_PtrSize * 2, "Ptr")
               WatchedFolders[Folder, "OVLAddr"] := OVLAddr
               DllCall("ReadDirectoryChangesW", "Ptr", Handle, "Ptr", FNIAddr, "UInt", SizeOfFNI, "Int", SubTree
                                              , "UInt", Watch, "UInt", 0, "Ptr", OVLAddr, "Ptr", 0)
               RebuildWaitObjects := True
            }
         }
      }
      If (RebuildWaitObjects) {
         VarSetCapacity(WaitObjects, MAXIMUM_WAIT_OBJECTS * A_PtrSize, 0)
         OffSet := &WaitObjects
         For Index, Event In EventArray
            Offset := NumPut(Event, Offset + 0, 0, "Ptr")
      }
   }
   ; ===============================================================================================================================
   If (EventArray.Length() > 0)
      SetTimer, % TimerFunc, -100
   Return (RebuildWaitObjects) ; returns True on success, otherwise False
}