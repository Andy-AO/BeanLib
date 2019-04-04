
/*
说明:BeanLib内的通用函数/方法对象
*/

class Action{
	
	isAction:=true
	func:="",funcThis:=""
	static funcObjCalledName:=["Call",""]
	static objectMethodName:=["_NewEnum","count","length","Push"]
;---------------------------------------------------------------------- 

	class meta{
		actionThis:=""
;---------------------------------------------------------------------- 
		initFunc(aFuncThis,aFunc){
			type.afFuncObj(aFunc)
			this.actionThis.func:=aFunc
			this.actionThis.funcThis:=aFuncThis
			return
		}
;---------------------------------------------------------------------- 
		
	} ;------class Meta   End
	
;---------------------------------------------------------------------- 	
	__call(aMethodName,aParams*){

        if(_List.Contains(Action.funcObjCalledName,aMethodName)){
			aParams.InsertAt(1,this.funcThis)
			return SmartCall(this.func,aParams*)			
		}
		
		else if(ObjHasKey(this.meta,aMethodName)){
			aParams.InsertAt(1,this.meta)
			return SmartCall(this.meta[aMethodName],aParams*)
		}		
		else if (_List.Contains(Action.objectMethodName,aMethodName)){
			return false
		}
		
		else{
			throw Exception(_EX.NoExistMethod)
		}
		return
	}
;---------------------------------------------------------------------- 
	__New(aFuncThis,aFunc){
			LogPrintln(aFuncThis,"aFuncThis >>>")
			this.meta.actionThis := this
			this.initFunc(aFuncThis,aFunc)
			return this
	}
} ;---------class Action End