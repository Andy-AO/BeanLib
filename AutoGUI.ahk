
/*
说明:用于GUI自动化的类
*/

class AutoGUI{

mainFunc:="",List_condition:={}

;---------------------------------------------------------------------- 

Check(){
	List_condition := this.List_condition
	for i,v in List_condition {
		type.assertObj(v)
		result := v.Call()
		if(Not(result)){
			throwWithSt("条件" i "不符合.")
		}
	}
	return
}
;---------------------------------------------------------------------- 

CheckAnd(){
	List_condition := this.List_condition
	for i,v in List_condition {
		type.assertObj(v)
		result := v.Call()
		if(Not(result)){
			throwWithSt("第" i "个条件不符合.")
		}
	}
	
	return
}
;---------------------------------------------------------------------- 

	__New(aMainFunc){
		this.mainFunc := aMainFunc
		return this
	}

;---------------------------------------------------------------------- 

	start(){
		type.assertObj(this.mainFunc)
		result := this.mainFunc.Call()
		return result
	}

;---------------------------------------------------------------------- 

} ;---------class AutoGUI End


;---------------------------------------------------------------------- 

;---------------------------------------------------------------------- 
