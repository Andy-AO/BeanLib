class UMSS{
Count := 0,key:=""
static keys := Object()
;------------------------------
	IFOn(){
		theFunc := this.Premise.bind(this)
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
		return GetKeyPhysicalState("Tab")
	}
;------------------------------
behavior(FuncObj){
	this.DiscardCacheEvent()
	this.Count++
	result := %FuncObj%()
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
		if(isObject(UMSS.keys[key])){
			return UMSS.keys[key]
		}
		else{
			this.key := key
			this.registerNewKey()
			UMSS.keys[key] := this
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
} ;---------class UMSS End
