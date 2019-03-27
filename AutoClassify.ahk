
/*
说明:文件自动分类(依赖 Everything Class)
*/

class AutoClassify{
	sSearchCriteria:=[""],sDestPattern:="",searchResultSA:="",EverthingObj:=""
	sCheckIntervalMin:=0.5
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
		this.EverthingObj.Search()
		this.searchResultSA:=this.EverthingObj.getSearchResultSA()
		DeBugDeepPrintln(this.searchResultSA,"this.searchResultSA >>> ")
		return
	}

;---------------------------------------------------------------------- 
	remove(){
		Counter:=bulkMoveFile(this.searchResultSA,this.sDestPattern)
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
	SetTimer(sCheckIntervalMin:=0.5){
		FuncObj:=this.SearchAndRemove.Bind(this)
		this.sCheckIntervalMin:=sCheckIntervalMin
		SetTimer(this.sCheckIntervalMin,FuncObj)
		
		return
	}
}

;AppLocker Class End
