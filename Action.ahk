
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
	
;---------------------------------------------------------------------- 	
	__call(aMethodName,aParams*){

        if(Bean.isCall(aMethodName)){
			aParams.InsertAt(1,this.funcThis)
			return SmartCall(this.func,aParams*)			
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