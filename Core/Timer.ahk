
class Timer{

	static Priority := 50000
	,Period := "250",func := ""
	
	set(){
		Priority := Timer.Priority
		,FuncObj := this.func
		,aMSec := this.Period
		SetTimer,%FuncObj%,%aMSec%, %Priority%
		return ErrorLevel
	}
	off(){
		FuncObj := this.func
		SetTimer,%FuncObj%,off
	}	
	On(){
		FuncObj := this.func
		SetTimer,%FuncObj%,On
	}
	delete(){
		FuncObj := this.func
		SetTimer,%FuncObj%,Delete
	}
	__New(aFunc,aPeriod := "250"){
		Type.assertNumber(aPeriod)
		Type.assertObj(aFunc)
		this.func := aFunc,this.Period := aPeriod
	}
} ;---------class Timer End
