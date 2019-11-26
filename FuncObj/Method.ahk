

/*
说明:BeanLib内的通用函数/方法对象
*/
class Method{


	for(ByRef obj){
		Type.assertObj(Obj)
		return new Method(Obj,Obj)	
	}
;------------------------------

	isMethod:=true
	;可能是表示这个ClassInstance支持toString()方法
	__toString := []
	;Method的主角:Func
	func:=""
	;Function的第一个参数(this参数)
	funcThis:=""

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
			result := SmartCall(this.func,this.funcThis,aParams*)
			return result
		}
		;为了使得Method称为Func,所以通过__call接管,并且使用rawCall调用
		;是否有第二条道路,已经忘记,之前忽略注释是个错误,要在变量名尽量体现原意的前提下再尽量使用注释
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
	__New(aFunc,aFuncThis){
			this._NewEnum:=this.base._NewEnum
			this.theThis := this
			rawCall("initFunc",this,aFuncThis,aFunc)
			return this
	}
} ;---------class Method End