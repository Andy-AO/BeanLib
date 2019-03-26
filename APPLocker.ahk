
/*
说明:简单的应用锁
*/

class AppLocker{

	asPath:=[""]
	asUnLockTime:=["",""]
	sCheckIntervalMin:=1

;---------------------------------------------------------------------- 

	__New(aPath,asUnLockTime){
		this.asPath[1]:=aPath
		this.asUnLockTime:=asUnLockTime
		return this
	}
	
;---------------------------------------------------------------------- 

	Lock(){
		Commends:="echo Y|cacls " this.asPath[1] " /p everyone:" "F"
		;~ TrayTip,%A_ScriptName% 提醒,已开锁
		UseCmd(Commends)
		return
	}
	
;---------------------------------------------------------------------- 

	UnLock(){
		Commends:="echo Y|cacls " this.asPath[1] " /p everyone:" "N"
		;~ TrayTip,%A_ScriptName% 提醒,已上锁
		;~ DeBugDeepPrintln(Commends,"Commends >>> ")
		UseCmd(Commends)
		return
}
;---------------------------------------------------------------------- 
		
	AutoLock(){
		targetTime:=getCurrentTime()
		isUnLockTime:=this.CheckTime(targetTime,this.asUnLockTime)
		if(isUnLockTime)
			this.lock()
		else
			this.unLock()
		return
}

;---------------------------------------------------------------------- 

	CheckTime(targetTime,asUnLockTime){
		b1:=targetTime>=asUnLockTime[1]
		b2:=targetTime<=asUnLockTime[2]
		if(b1 AND b2)
			return true
		else
			return false
	}

;---------------------------------------------------------------------- 
	SetTimer(){
		FuncObj:=this.AutoLock.Bind(this)
		SetTimer(this.sCheckIntervalMin,FuncObj)
		return
	}
}

;AppLocker Class End
