
class ObservableObj{
	listenerList := []
	;------------------------------
	__New(aObj){
		this.Obj := aObj
		return this
	}
	;------------------------------
	get(){
		return this.obj
	}
	;------------------------------
	set(aObj){
		this.callListener(this, this.Obj, aObj)
		this.Obj := aObj
		return aObj
	}	
	;------------------------------
	addListener(aMethod){
		this.listenerList.push(aMethod)
		return
	}	
	;------------------------------
	callListener(observableObj, oldChange, newChange){
		for i,v in this.listenerList {
			v.call(observableObj, oldChange, newChange)
		}
		return
	}
} ;---------class ObservableObj End