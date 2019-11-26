﻿

/*
说明:BeanLib内的通用函数/方法对象
*/
class Method{

	;为了实现Method类的静态方法,参考自 JSON类 的设计,这是解决静态方法问题的一个不错的解决方案
	;这也能说明阅读他人代码的重要性
	class Functor{
		__Call(theMethod, ByRef arg, args*){
			return (new this).Call(theMethod, arg, args*)
		}
	}
;------------------------------
	
	;当方法不依赖于this的时候,可以直接调用 Method 的 For 方法,传入一个参数就可以,简洁而方便
	class for extends Method.Functor{
		Call(theMethod, ByRef Obj,args*){
			Type.assertObj(Obj)
			return new Method(Obj,Obj)
		} 
	} ;---------class for End

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