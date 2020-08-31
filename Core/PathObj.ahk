

/*
说明:对路径字符串进行各种操作
*/
;---------------------------------------------------------------------- 					
	Class PathObj{
	
		path := ""
		
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
		__New(aPath){
				this.path:=aPath
				this.assert()
				this.split()  
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
		if(Type.isPath(this.path))
			return
		else{
			this.path := A_WorkingDir "\" this.path
			return Type.assertPath(this.path)
		}
	}
			
}
;--------------------------Class Path End
