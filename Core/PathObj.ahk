
/*
说明:对路径字符串进行各种操作
*/
;---------------------------------------------------------------------- 					
	Class PathObj{
		
		__New(aPath){
				this.path:=aPath
				this.assert()
				this.split()
			return this
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

	af(){
		return Type.assertPath(this.path)
	}
			
}
;--------------------------Class Path End
