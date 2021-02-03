
class Timer{

	static Priority := 50000
	,Periodbase := "250",func := "",isSingle := false
	
		Period[]
		{
			get {
				if(this.isSingle = ""){
					this.isSingle := false
				}
					
				if(this.isSingle){
					return ("-" Abs(this.Periodbase))
				}
				else{
					return Abs(this.Periodbase)
				}

			}
			set {
				return this.Periodbase := Abs(value)
			}
		}
		
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
	__New(aFunc,aPeriod := "250",isSingle := false){
		Type.assertNumber(aPeriod)
		Type.assertObj(aFunc)
		this.func := aFunc,this.Period := aPeriod,this.isSingle := isSingle
	}
} ;---------class Timer End
