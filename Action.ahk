
/*
说明:BeanLib内的通用函数/方法对象
*/

class Action{
	
	isAction:=true
	func:="",funcThis:=""
	before:="",after:=""

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
			theObj := this.before
			type.afObj(theObj)
			LogPrintln(theObj,"theObj >>>")
			result := theObj.call()
			if (result = false)
				rawCall(this,"onError")
			return
		}

;---------------------------------------------------------------------- 

name[]{
    get {
		theName := this.func.name
		if(theName="")
			return "NS*"
		else
			return theName
    }
    set {
	return False
    }
}
;---------------------------------------------------------------------- 

beforeName[]{
    get {
		theObj := this.before
		if (type.isFuncObj(theObj)){
			return theObj.name
		}
		else{
			return toString(theObj)
		}
    }
    set {
	return False
    }
}
;---------------------------------------------------------------------- 

afterName[]{
    get {
		theObj := this.after
		if (type.isFuncObj(theObj)){
			return theObj.name
		}
		else{
			return toString(theObj)
		}
    }
    set {
	return False
    }
}
;---------------------------------------------------------------------- 
		toString(){			
			theFuncName := this.name
			theBeforeName := this.beforeName
			theAfterName := this.afterName
			theClassName := this.__Class
			resultString = {Type:%theClassName%,Func:%theFuncName%,Before:%theBeforeName%,After:%theAfterName%}
			return resultString
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
			result := rawCall(this,"call",aParams*)
			return result
		}
		else if (aMethodName = "toString"){
			result := rawCall(this,"toString",aParams*)
			return result
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