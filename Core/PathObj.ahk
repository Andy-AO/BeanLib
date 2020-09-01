

/*
说明:对路径字符串进行各种操作
*/
;---------------------------------------------------------------------- 					
	Class PathObj{
	
		path := ""
		
		replaceName(SearchText,ReplaceText){
			theName := StrReplace(this.name,SearchText,ReplaceText,OutputVarCount)
			if(OutputVarCount != 0)
				return this.reName(theName)
			else
				return false
		}
		
		reName(aName){
			
			Overwrite := Flag := false
			theNewPathObj := new PathObj(aName,new PathObj(this.dir))
			
			if(this.isFile()){
				FileMove, % this.getPath(), % theNewPathObj.getPath(), %Overwrite%
				if(error := Errorlevel){
					LogPrintln(A_LineFile  "("  A_LineNumber  ")"  " : " "文件重命名失败")
				}
			}
			else{
				FileMoveDir,% this.getPath(), % theNewPathObj.getPath() , %Flag%
				if(error := Errorlevel){
					LogPrintln(A_LineFile  "("  A_LineNumber  ")"  " : " "目录重命名失败")
				}
			}
			
			if(error){
				return false
			}
			else{
				return theNewPathObj
			}
		}
		
		__New(aPath,aRootPathObj := ""){
				this.path:=aPath
				if(aRootPathObj != ""){
					Type.assertObj(this.rootPathObj := aRootPathObj)
				}
				this.assert()
				this.split()
				this.format()
		}
		
		isFile(aPath := ""){
			if(aPath = "")
				aPath := this.path
		   return !InStr(FileExist(aPath), "D")
		}
		
		isExist(aPath := ""){
			if(aPath = "")
				aPath := this.path
			return FileExist(this.path)
		}
		
		assertExist(){
			isExist := this.isExist()
			if(NOT(isExist)){
				throw(_EX.NoExistFile "  " this.getPath())
			}
			return isExist
		}
		
		getPath(){
			return this.path
		}
		
		; 用于去除路径尾部多余的'\'
		format(){
			if(this.name != ""){
				this.path := this.dir "\" this.name
			}
			else if(this.name = ""){
				this.path := this.dir
			}
			return
		}
		
		create(aPathList){
			if(Type.isList(aPathList)){
				theResultList := []
				for i,v in aPathList {
					theResultList[i] := new PathObj(v)
				}
				return theResultList
			}
			else if(Type.isStr(aPathList)){
				paths := aPathList
				paths := StrReplace(paths,"`r`n","`n")
				theResultList := StrSplit(paths, Delimiters := "`n")
				return PathObj.create(theResultList)
			}
			else{
				;~ throw()
			}
		}
;---------------------------------------------------------------------- 	
		split(){
			SplitPath, % this.path, name, dir, ext, name_no_ext, drive
			this.name:=name,this.dir:=dir,this.ext:=ext,this.name_no_ext:=name_no_ext,this.drive:=drive
			return
		}
   
;---------------------------------------------------------------------- 
	/*
	说明:用正则表达式检查路径
	*/
	assert(){
		if(Type.isObj(this.rootPathObj)){
			this.path := this.rootPathObj.getPath() "\" this.path
		}
		if(Type.isPath(this.path))
			return
		else{
			this.path := A_WorkingDir "\" this.path
			return Type.assertPath(this.path)
		}
	}
			
}
;--------------------------Class Path End
