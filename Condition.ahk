
/*
说明:条件对象 Condition
*/

;---------------------------------------------------------------------- 
	
class Condition{
action:=Object("check","","repair",Bean.false)
;---------------------------------------------------------------------- 
	__New(aCheckObj,aRepairObj:=""){
		Bean.afFunc(aCheckObj)
		action.check := aCheckObj
		if(aRepairObj!=""){
			Bean.afFunc(aRepairObj)
			action.repair := aRepairObj
		}
		return this
	}

;---------------------------------------------------------------------- 

} ;---------class Condition End
