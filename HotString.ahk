class HotStringMaps{
	static List := []
;------------------------------
	HotStringCheck(){
		for i,v in HotStringMaps.List {
			result := v.when()
			if(result){
				return v
			}
				
		}
		return false
	}
;------------------------------
	Extract(theHotStringMap){
		local String := ""
		for k,v in theHotStringMap {
			result := HotString.isHotString(v)
			if(result){
				String .= v.Trigger "`t" v.Remarks "`r`n"
			}
			}
		 return String
	}
;------------------------------
	ExtractAndMerge(){
		for k,v in HotStringMaps.List{
			theHotStringMap := v
			String := HotStringMaps.Extract(theHotStringMap)
			HotStringMaps.List[k] := Object("String",String,"Name",v.__class,"When",v.when)
		}
		return
	}
	
} ;HotStringMaps End
;------------------------------
class HotString{

	ContextMatch(){
		return this.PremiseBindFunc.call()
	}

	isHotString(HotStringObj){
		try{
			result := Instanof(HotStringObj,HotString)
		}
		catch Ex{
			return false
		}
		return result
	}
;------------------------------
	Trigger  := behavior := Remarks := ""
	static On := "On",Toggle := "Toggle",Off := "Off"
	Premise := PremiseBindFunc := Object("Null","Null")
;------------------------------
	IFOn(){
		theFunc := this.PremiseBindFunc
		Hotkey, If, % theFunc
		return ErrorLevel
	}
;------------------------------
	IFOff(){
		Hotkey, If 
		return ErrorLevel
	}
;------------------------------
	__New(Trigger,behavior,Remarks,Premise){
		type.assertStr(Trigger),type.assertStr(Remarks),type.assertObj(Premise)
		this.PremiseBindFunc := this.Premise.bind(this)
		this.Premise := Premise,this.Trigger := Trigger,this.behavior := behavior,this.Remarks := Remarks		
		return this
	}
;----------------------------------------------------------------------
	clone(Remarks){
		return HotString.__New(this.Trigger,this.behavior,Remarks)
	}
;----------------------------------------------------------------------
	equal(OtherHotString){
		result := ((Trigger = this.Trigger) AND (behavior = this.behavior))
		return result
	}
;------------------------------
	register(){
		this.IFOn(),Hotstring(this.Trigger,this.behavior),this.IFOff()
		return
	}	
;------------------------------
	create(Trigger,behavior,Remarks,Premise){
		theObj := new HotString(Trigger,behavior,Remarks,Premise)
		theObj.register()
		return theObj
	}
;------------------------------
} ;---------class HotString End