﻿
/*
说明:条件对象 Condition
*/

;---------------------------------------------------------------------- 
	
class Condition{
check := ""
repair := Bean.false
;---------------------------------------------------------------------- 

repairName[]{
    get {
		theObj := this.repair
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

checkName[]{
    get {
		theObj := this.check
		if (type.isFuncObj(theObj)){
			return theObj.name
		}
		else{
			return "*NotFunc*:"toString(theObj)
		}
    }
    set {
	return False
    }
}

;---------------------------------------------------------------------- 

		toString(){
			;~ return methodsToString(this.Check,this.Repair)
			
			
			theCheckName := methodToString(this.Check)
			theRepairName := methodToString(this.Repair)
			
			
			theClassName := this.__Class
			resultString = {Type:%theClassName%,check:%theCheckName%,Repair:%theRepairName%}
			return resultString
		}
;---------------------------------------------------------------------- 
	__New(aCheckObj,aRepairObj:=""){
		Bean.afFunc(aCheckObj)
		this.check := aCheckObj
		if(aRepairObj!=""){
			Bean.afFunc(aRepairObj)
			this.repair := aRepairObj
		}
		return this
	}
;---------------------------------------------------------------------- 
	call(){
		LogPrintln(this.check,"this.check >>>")
		checkResult := this.check()
		if(checkResult){
			return checkResult
		}
		else{
			repairResult := this.repair()
		}	
		return repairResult
	}
;---------------------------------------------------------------------- 

} ;---------class Condition End
