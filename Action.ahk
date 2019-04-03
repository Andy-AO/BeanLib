
/*
说明:BeanLib内的通用函数/方法对象
*/

class Action{

	func:="",name:=""
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
;---------------------------------------------------------------------- 
	call(){
		this.onBefore()
		resultFuncObj := this.thethis.func
		theResult := %resultFuncObj%()
		this.onAfter()
		return theResult
	}
;---------------------------------------------------------------------- 
		initName(aName){
			if(aName!=""){
				this.thethis.name:=aName
			}
			else{
				this.getNameByFunc()			
			}
			return
		}

	;---------------------------------------------------------------------- 
		initFunc(aFunc){
			if(type.isObj(aFunc)){
				this.thethis.func:=aFunc
			}
			else{
				this.thethis.func:=getFunc(aFunc)
			}
			return
		}

;---------------------------------------------------------------------- 
	getNameByFunc(){
		theName:=this.thethis.func.Name
			if(theName!=""){
				this.thethis.name:=theName
			}
			else{
				throw Exception(_Ex.InvalidPara "2 : " "未输入Action Name")
			}	
		return
	}

;---------------------------------------------------------------------- 
	} ;------class Meta   End
;---------------------------------------------------------------------- 	
	__call(methodName,aParams*){
        if (methodName = "")
            methodName = call
		theMeta:=this.meta
		if(ObjHasKey(theMeta,methodName)){
			BoundFunc := AutoBind(theMeta[methodName],aParams,theMeta)
			result := %BoundFunc%()
			return result
		}		
		return
	}
;---------------------------------------------------------------------- 
	__New(aFunc,aName:=""){
			this.meta.theThis := this
			type.afStr(aName)
			this.initFunc(aFunc)
			this.initName(aName)
			return this
	}
} ;---------class Action End