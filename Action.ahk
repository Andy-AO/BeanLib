
/*
说明:BeanLib内的通用函数/方法对象
*/

class Action{
	
	isAction:=true
	func:="",funcThis:=""
	conditions := Object("before","","after","")

;---------------------------------------------------------------------- 

		initFunc(aFuncThis,aFunc){
			LogPrintln("InitFunc运行中","""InitFunc运行中"" >>>")
			type.afFuncObj(aFunc)
			this.func:=aFunc
			this.funcThis:=aFuncThis
			return
		}
		onError(){
			throw Exception("onError！ onError！ onError！	")
			return
		}
;---------------------------------------------------------------------- 
		onBefore(){
			LogPrintln("onBefore运行中！","onBefore运行中！ onBefore运行中！运行中！")
			LogPrintln(this.conditions.before,"this.conditions.before >>>")
			result := this.conditions.before.call()
			if (result = false)
				rawCall(this,"onError")
			return
		}
;---------------------------------------------------------------------- 
		call(aParams*){
			rawCall(this,"onBefore")
			result := SmartCall(this.funcThis,this.func,aParams*)
			return result
		}
;---------------------------------------------------------------------- 	
	__call(aMethodName,aParams*){

        if(Bean.isCall(aMethodName)){
			rawCall(this,"call",aParams*)
		}
		else if (Bean.isMeta(aMethodName)){
			return false
		}
		else{
			throw Exception(_EX.NoExistMethod)
		}
		return
	}
;---------------------------------------------------------------------- 
	__New(aFuncThis,aFunc){
			rawCall(this,"initFunc",aFuncThis,aFunc)
			return this
	}
} ;---------class Action End