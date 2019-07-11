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
		for k,v in theHotStringMap {
			result := HotString.isHotString(v)
			if(result){
				String .= v.Trigger "  " v.Remarks "`r`n"
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
	;~ mark := "HotString"
	Trigger  := behavior := Remarks := ""
	static On := "On",Toggle := "Toggle",Off := "Off"
;------------------------------
	IFOn(){
		theFunc := this.Premise.bind(this)
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
		type.afStr(Trigger),type.afStr(Remarks),type.afObj(Premise)
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