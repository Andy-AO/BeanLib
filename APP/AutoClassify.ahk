

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
			firstPara = 提醒
			secondPara = %theMes%
			theMesToast := new MesToast(firstPara,secondPara),theMesToast.show() 
			return
		}

		
		if(Counter){
			firstPara = %A_ScriptName% 提醒
			secondPara = 移动完毕!共移动%Counter%个文件.
			theMesToast := new MesToast(firstPara,secondPara),theMesToast.show() 
		}
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
		theTimer := new Timer(FuncObj,this.sCheckIntervalMsec),theTimer.set()
		return
	}
}
;AppLocker Class End
