﻿
/*
说明:对路径字符串进行各种操作
*/
;---------------------------------------------------------------------- 					
	Class PathObj{
		
		__New(aPath){
				this.path:=aPath
				this.af()
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
		aPath:=this.path
		aRegEx=^[a-zA-Z]:\\(((?![<>:"/\\|?*]).)+((?<![ .])\\)?)*$
		
		absolutePathResult:=aPath.isRegExMatch(aRegEx)
		
		if Not(absolutePathResult){
			Mes:=_EX.InvalidPara . "1"
			throwWithSt(Mes)
		}
		
		return
	}
			
}
;--------------------------Class Path End
