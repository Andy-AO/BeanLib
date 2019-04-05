
/*
说明:BeanLib内的通用函数/方法对象
*/

class Action{
	
	isAction:=true
	func:="",funcThis:="",name:=""
	conditions := Object("before","","after","")
	onErrorAction := ""
;---------------------------------------------------------------------- 

	class meta{
		thethis:=""
;---------------------------------------------------------------------- 
	onError(){
		if(IsObject(this.onErrorAction)){
			this.onErrorAction.Call()
		}
		else{
		}
		return
	}
;---------------------------------------------------------------------- 
	onBefore(){
		try{
			this.thethis.conditions.before.Call()
		}
		catch{
			this.onError()
		}
		return
	}
;---------------------------------------------------------------------- 
	onAfter(){
		try{
			this.thethis.conditions.after.Call()
		}
		catch{
			this.onError()
		}
		return
	}
	;---------------------------------------------------------------------- 
		initFunc(aFuncThis,aFunc){
			type.afFuncObj(aFunc)
			this.thethis.func:=aFunc
			this.thethis.funcThis:=aFunc
			return
		}

;---------------------------------------------------------------------- 
	} ;------class Meta   End
;---------------------------------------------------------------------- 	
	__call(aMethodName,aParams*){

        if(aMethodName = funcObjCalled:=""){
			aParams.InsertAt(1,this.funcThis)
			return SmartCall(this.func,aParams*)			
		}
		
		if(ObjHasKey(this.meta,aMethodName)){
			aParams.InsertAt(1,this.meta)
			return SmartCall(this.meta[aMethodName],aParams*)
		}
		else{
			throw Exception(_EX.NoExistMethod)
		}
		return
	}
;---------------------------------------------------------------------- 
	__New(aFuncThis,aFunc){
			this.meta.theThis := this
			this.initFunc(aFunc)
			return this
	}
} ;---------class Action End