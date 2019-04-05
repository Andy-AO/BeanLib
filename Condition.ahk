
/*
说明:条件对象 Condition
*/

;---------------------------------------------------------------------- 
	
class Condition{
action:=Object("check","","repair",Bean.false)
;---------------------------------------------------------------------- 
	__New(aCheckObj,aRepairObj:=""){
		Bean.afFunc(aCheckObj)
		this.action.check := aCheckObj
		if(aRepairObj!=""){
			Bean.afFunc(aRepairObj)
			this.action.repair := aRepairObj
		}
		return this
	}
;---------------------------------------------------------------------- 
	call(){
		checkResult := this.action.check()
		if(checkResult){
			return checkResult
		}
		else{
			repairResult := this.action.repair()
		}	
		return repairResult
	}
;---------------------------------------------------------------------- 

} ;---------class Condition End
