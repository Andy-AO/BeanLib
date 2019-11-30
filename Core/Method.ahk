

/*
说明:BeanLib内的通用函数/方法对象
*/
class Method{

	for(ByRef obj){
		Type.assertObj(Obj)
		return new Method(Obj,Obj)	
	}
;------------------------------
	;Method的主角:Func
	;Function的第一个参数(this参数)
	funcThis:=""
	func := Object()
	bindParas := Object()

;---------------------------------------------------------------------- 
	
	;枚举时只返回 func 和 funcThis
	_NewEnum(){
		return new BeanEnum(Object("func",this.func,"funcThis",this.funcThis))
	}

;---------------------------------------------------------------------- 
	initFunc(aFuncThis,aFunc){
		type.assertFuncObj(aFunc)
		this.func:=aFunc
		this.funcThis:=aFuncThis
		return
	}
;---------------------------------------------------------------------- 
	call(aParams*){
		aParams := _List.merge(this.bindParas,aParams)
		result := SmartCall(this.func,this.funcThis,aParams*)
		return result
	}
;---------------------------------------------------------------------- 	
	__call(aMethodName:="",aParams*){
		iscall := Bean.isCall(aMethodName,this)
        if(iscall){
			result := rawCall("call",this,aParams*)
			return result
		}
		else if (Bean.isMeta(aMethodName)){
			return false
		}
		else{
			throwWithSt(_EX.NoExistMethod)
		}
		return
	}
;---------------------------------------------------------------------- 
	__New(aFunc,aFuncThis,aBindParas*){
			this._NewEnum:=this.base._NewEnum
			this.theThis := this
			this.bindParas := aBindParas
			rawCall("initFunc",this,aFuncThis,aFunc)
			return this
	}
} ;---------class Method End