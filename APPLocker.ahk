

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
		;~ TrayTip,%A_ScriptName% 提醒,已开锁
		UseCmd(Commends)
		return
	}
	
;---------------------------------------------------------------------- 
	Lock(){
		Commends:="echo Y|cacls " this.asPath[1] " /p everyone:" "N"
		;~ TrayTip,%A_ScriptName% 提醒,已上锁
		UseCmd(Commends)
		return
}
;---------------------------------------------------------------------- 
		
	AutoLock(){
		isUnLockTime:=this.TimeCheckerObj.CheckByWhiteList()
		LogPrintln(isUnLockTime,"isUnLockTime >>>")
		if(isUnLockTime)
			this.unlock()
		else
			this.Lock()
		return
}
;---------------------------------------------------------------------- 
	CheckTime(asUnLockTime){
		currentTime:=getCurrentTime()
		b1:=currentTime>=asUnLockTime[1]
		b2:=currentTime<=asUnLockTime[2]
		if(b1 AND b2)
			return true
		else
			return false
	}
;---------------------------------------------------------------------- 
	SetTimer(){
		FuncObj:=this.AutoLock.Bind(this)
		SetTimer(this.sCheckIntervalSec,FuncObj)
		return
	}
}
;AppLocker Class End
