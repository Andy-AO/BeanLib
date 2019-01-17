
/*
获取对象的 Class
*/

getClass(Obj){
	
	Type.afObj(Obj)
	
	theBase:=Obj.base
	if(Type.isClass(theBase))
		return theBase
	else return false		

}
