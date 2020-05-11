

/*
说明:文件自动分类(依赖 Everything Class)
*/
class AutoClassify{
	sSearchCriteria:=[""],sDestPattern:="",searchResultList:="",EverthingObj:=""
	sCheckIntervalMsec:=0.5
;---------------------------------------------------------------------- 
	__New(sSearchCriteria,sDestPattern){
		this.sSearchCriteria:=sSearchCriteria
		this.sDestPattern:=sDestPattern
		this.BuildSearchObj()
		return this
	}
;--------------------------------------------------------------------- 
	BuildSearchObj(){
		this.EverthingObj:=new Everything()
		this.EverthingObj.Setkey(this.sSearchCriteria)
		return
	}
;---------------------------------------------------------------------- 
	Search(){
		this.EverthingObj.Setkey(this.sSearchCriteria)
		this.EverthingObj.Search()
		this.searchResultList:=this.EverthingObj.getSearchResultList()
		return
	}
;---------------------------------------------------------------------- 
	remove(){
		try{
			Counter:=bulkMoveFile(this.searchResultList,this.sDestPattern)
		}

		catch,ex{
			LogPrintln(ex,A_LineFile  "("  A_LineNumber  ")"  " : " "ex >>> `r`n")
			theMes := "移动失败:" ex.Message
			TrayTip,提醒,%theMes%
			return
		}

		
		if(Counter)
			TrayTip,%A_ScriptName% 提醒,移动完毕!共移动%Counter%个文件.
		return
	}
;---------------------------------------------------------------------- 
	SearchAndRemove(){
		this.Search()
		this.remove()
		return	
	}
;---------------------------------------------------------------------- 
	SetTimer(sCheckIntervalMsec){
		FuncObj:=this.SearchAndRemove.Bind(this)
		this.sCheckIntervalMsec:=sCheckIntervalMsec
		SetTimer(this.sCheckIntervalMsec,FuncObj)
		
		return
	}
}
;AppLocker Class End
