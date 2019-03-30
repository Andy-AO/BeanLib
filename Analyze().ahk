
/*
用于分析对象(Object)的继承(extends)关系
*/

;---------------------------------------------------------------------- 

AnalyzeClassName(Obj){ ;返回Obj的所有Base的ClassName
	StrList:=[],ObjList:=Analyze(Obj)
	for i,Obj in ObjList{
		TheStr:=Obj.__Class
		if((isObject(Obj))AND(TheStr=""))
			StrList.Push("*NotClass*")
		else if(TheStr="")
			StrList.Push("*NS*")
		else
		StrList.Push(TheStr)
	}
	return StrList
}
;---------------------------------------------------------------------- 
Analyze(Obj){ ;返回元素的所有Base
	List:=[],ObjList:=[],ObjList[1]:=Obj,StrList:=[],StrList[1]:=Obj.__Class,counter:=1
	type.afObj(Obj)
	loop{	
		TheBase:=ObjList[A_Index].base
		if(counter>1)
			return ObjList
		if(TheBase="") OR (TheBase.__Class=""){ ;除了检查base之外,还必须检查其__Class
			counter++
			continue
		}
			
		else
			counter:=1		
		
		ObjList.push(TheBase)
		
	}
	
	return ObjList
}

;---------------------------------------------------------------------- 
