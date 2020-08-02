
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
		
		getPath(){
			return this.path
		}
		__New(aPath){
				this.path:=aPath
				this.assert()
				this.split()
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
