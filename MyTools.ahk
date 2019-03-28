
/*
说明:基本可以直接使用的一些函数
特别提示:这是我的私人工具箱
*/

;---------------------------------------------------------------------- 
/*
说明:注入专用
*/
class Inject{

		SearchWithOutAira2(){
		
		this.EverthingObj.Setkey(this.sSearchCriteria)
		this.EverthingObj.Search()
		this.searchResultSA:=this.EverthingObj.getSearchResultSA()
		
		_SA.StrReplace(this.searchResultSA,".aria2","",isRegEx:=false)
		ElementCounterObj:=_SA.ElementCounter(this.searchResultSA)
		
		this.searchResultSA:=[]
		for i,v in ElementCounterObj {
			if(v=1)
				this.searchResultSA.Push(i)
		}
		return
	}	
}

;---------------------------------------------------------------------- 
/*
说明:发送快捷方式
*/
SendShortCut(aLinkFileDir){
	
	theSrcFilePath:=SuperCopy()
	
	theSrcFileName:=theSrcFilePath.ExtractFileNameByPathWithOutPostfix()
	theLinkFilePath:=aLinkFileDir "\" theSrcFileName
	
	FolderName:=theSrcFileName
	FolderShortCut := aLinkFileDir "\" FolderName ".lnk"
	
	FileCreateShortCut, %theSrcFilePath%, %FolderShortCut%
	TrayTip,%A_ScriptName% 提醒,快捷方式建立成功
	
	return
}

;---------------------------------------------------------------------- 
