
;---------------------------------------------------------------------- 
/*
获取窗口ID
*/
GetWinID(WinTitle="A"){ ;没有再目录上写明,因为用不到,没必要
WinGet,WinID,ID,%WinTitle%
return WinID
}
;---------------------------------------------------------------------- 
/*
通用断言
*/
	af(Boolean,Mes:="No Info"){
			
	if(Type.Switcher=false) ;如果断言开关关闭,那么就不启用断言
		return
	
	if(Boolean) ;如果表达式为true,那么就不触发 throw
		return Boolean
	
		ExMes:=_EX.Affirm . " Mes : " . Mes
		throw Exception(ExMes)
		
		return Boolean
	}

;---------------------------------------------------------------------- 
/*
对任意对象添加 读/写/调用 保护
*/

Protect(Obj){
	
	thebase:={},baseSA:=[]
	
	type.afObj(Obj)
	
	baseSA:=Analyze(Obj)
	baselen:=baseSA.length()
	
	if(baselen=1){ ;如果长度只有一的话，那么就直接用Obj即可
	thebase:=obj
	}
	
	
	loop,% baselen-1 {
	thebase:=Obj.base
	}
	
	thebase.base:=Bean.Protect
	return
}



;---------------------------------------------------------------------- 



