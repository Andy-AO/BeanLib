
class UMSS extends UMSSWithOutDestroy{
	registeredKeys := Object()
	;------------------------------
	__New(aKey){
		this.base.base := new UMSSWithOutDestroy(aKey)
		return this
	}
	;------------------------------
	register(keyName,theFunc,Options:=""){ 
		this.registeredKeys[keyName] := theFunc
		this.base.base.register(keyName,theFunc,Options)
		return
	}
	;------------------------------
	Unregister(keyName){
		this.base.base.Unregister(keyName)
		return
	}
} ;---------class UMSS End

class UMSSWithOutDestroy{
Count := 0,key:=""
static keys := Object()
premiseFunc := ""
;------------------------------
	Unregister(keyName){
		if(this.premiseFunc != ""){
			this.IFOn()
			this.IFOff()
		}
		return
	}
;------------------------------
	IFOn(){
		if(this.premiseFunc == "")
			this.premiseFunc := this.Premise.bind(this)
		theFunc := this.premiseFunc
		Hotkey, If, % theFunc
		return
	}
;------------------------------
	IFOff(){
		Hotkey, If 
		return 
	}
;------------------------------
	premise(){
		return GetKeyPhysicalState(this.key)
	}
;------------------------------
	behavior(FuncObj){
		this.DiscardCacheEvent()
		this.Count++
		result := FuncObj.Call()
		return result
	}
;------------------------------
	register(keyName,theFunc,Options:=""){
		Func := this.behavior.Bind(this,theFunc)
		this.IFOn()
		hotkey,% keyName,% Func,% Options
		this.IFOff()
		return
	}
;------------------------------
	 registerNewKey(){
		theFunc := this.SendSrcKeyWhenItIsUp.bind(this)
		hotkey,% this.key,% theFunc,I100
		return
	 }
;------------------------------
	__New(key){
		if(isObject(UMSSWithOutDestroy.keys[key])){
			return UMSSWithOutDestroy.keys[key]
		}
		else{
			this.key := key
			this.registerNewKey()
			UMSSWithOutDestroy.keys[key] := this
			return this
		}
	}
;------------------------------
										
SendSrcKeyWhenItIsUp(){
		this.DiscardSelfEvent()
		KeyWait,% this.key
			this.SendSrcKey(this.key)
	return
}
;------------------------------
	SendSrcKey(EnableBlind:=true){
		if(this.Count>0){
			this.Count := 0
		}
		else{
			Key := this.Key
			if(EnableBlind)
				Send,{Blind}{%Key%}
			else 
				Send,{%Key%}
		}
		return
	}	
;------------------------------
	DiscardCacheEvent(thePriority := 0x7fffffff){
		Thread, Interrupt , 0, 0
		Thread, Priority, %thePriority%
		return
	}
	DiscardSelfEvent(thePriority := -0x80000000){
		Thread, Interrupt , 0, 0
		Thread, Priority, %thePriority%
		return
	}
} ;---------class UMSSWithOutDestroy End
