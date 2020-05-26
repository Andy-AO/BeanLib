

/*
说明:简单的应用锁
*/
class AppLocker{
	asPath := [""]
	sCheckIntervalSec := "5".MinToMsec()
	TimeCheckerObj:=""
;---------------------------------------------------------------------- 
	__New(aPath,asUnLockTime){
		this.TimeCheckerObj :=new TimeChecker()
		this.TimeCheckerObj.WhiteList := asUnLockTime
		this.asPath[1]:=aPath
		return this
	}
	
;---------------------------------------------------------------------- 
	UnLock(){
		Commends:="echo Y|cacls " this.asPath[1] " /p everyone:" "F"
		UseCmd(Commends)
		return
	}
	
;---------------------------------------------------------------------- 
	Lock(){
		Commends:="echo Y|cacls " this.asPath[1] " /p everyone:" "N"
		UseCmd(Commends)
		return
}
;---------------------------------------------------------------------- 
		
	AutoLock(){
		isUnLockTime:=this.TimeCheckerObj.CheckByWhiteList()
		if(isUnLockTime)
			this.unlock()
		else
			this.Lock()
		return
}

;---------------------------------------------------------------------- 
	SetTimer(){
		FuncObj:=this.AutoLock.Bind(this)
		theTimer := new Timer(FuncObj,this.sCheckIntervalSec),theTimer.set()
		return
	}
}
;AppLocker Class End
