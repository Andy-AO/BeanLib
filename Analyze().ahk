
/*
用于分析对象(Object)的继承(extends)关系
*/

;---------------------------------------------------------------------- 

AnalyzeClassName(Obj){ ;返回Obj的所有Base的ClassName
	StrSA:=[],ObjSA:=Analyze(Obj)
	for i,Obj in ObjSA{
		TheStr:=Obj.__Class
		if((isObject(Obj))AND(TheStr=""))
			StrSA.Push("*NotClass*")
		else if(TheStr="")
			StrSA.Push("*NS*")
		else
		StrSA.Push(TheStr)
	}
	return StrSA
}
;---------------------------------------------------------------------- 
Analyze(Obj){ ;返回元素的所有Base
	SA:=[],ObjSA:=[],ObjSA[1]:=Obj,StrSA:=[],StrSA[1]:=Obj.__Class,counter:=1
	type.afObj(Obj)
	loop{	
		TheBase:=ObjSA[A_Index].base
		if(counter>1)
			return ObjSA
		if(TheBase="") OR (TheBase.__Class=""){ ;除了检查base之外,还必须检查其__Class
			counter++
			continue
		}
			
		else
			counter:=1		
		
		ObjSA.push(TheBase)
		
	}
	
	return ObjSA
}

;---------------------------------------------------------------------- 
