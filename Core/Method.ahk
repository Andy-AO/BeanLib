class Method{
	func := Object()
	funcThis := Object()
	bindParas := Object()
	;------------------------------
		for(obj){
		Type.assertObj(Obj)
		return new Method(Obj,Obj)	
	}
	;------------------------------
	__New(aFunc,aFuncThis,aBindParas*){
		this.func := aFunc
		this.funcThis := aFuncThis
		this.bindParas := aBindParas
		return this
	}
	;------------------------------
	call(aCallParas*){
		paras := _List.merge(this.bindParas,aCallParas)
		return SmartCallForFunction(this.func,this.funcThis,paras*)
	}
} ;---------class Method End
