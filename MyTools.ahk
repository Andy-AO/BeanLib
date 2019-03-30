
/*
说明:基本可以直接使用的一些函数
特别提示:这是我的私人工具箱
*/

;---------------------------------------------------------------------- 

class MyTools{


;---------------------------------------------------------------------- 

	/*
	说明:文件重命名
	*/
	FileRecycle(){
		
		aBeforePath:=SuperCopy()
		SplitPath, aBeforePath, name, dir
		FileRecycle,%aBeforePath%
		
		if(ErrorLevel){
			TrayTip,%A_ScriptName% 提醒,！！！ 删除失败
			return
		}
		
		TrayTip,%A_ScriptName% 提醒,已经把文件 %name% 移动到回收站 
		return
	}
	
;---------------------------------------------------------------------- 

	/*
	说明:文件重命名
	*/
	RenameFile(){
		
		aBeforePath:=SuperCopy()
		
		boxObj:=new AutoInputBox("重命名",aBeforePath)
		
		SplitPath, aBeforePath, name, dir
		
		boxObj.DefaultText:=name
		
		newName:=boxObj.start()
		
		aAfterPath := dir "\" newName
				LogPrintln(aAfterPath,"aAfterPath >>>")
		FileMove,%aBeforePath%,%aAfterPath%
		
		if(ErrorLevel){
			TrayTip,%A_ScriptName% 提醒,！！！ 重命名失败
			return
		}
		
		TrayTip,%A_ScriptName% 提醒,重命名成功`n新名字：%newName%
		return
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
;------------------	class MyTools End

}


;--------------

/*
说明:注入专用
*/
class Inject{

		SearchWithOutAira2(){
		
		this.EverthingObj.Setkey(this.sSearchCriteria)
		this.EverthingObj.Search()
		this.searchResultList:=this.EverthingObj.getSearchResultList()
		
		_List.StrReplace(this.searchResultList,".aria2","",isRegEx:=false)
		ElementCounterObj:=_List.ElementCounter(this.searchResultList)
		
		this.searchResultList:=[]
		for i,v in ElementCounterObj {
			if(v=1)
				this.searchResultList.Push(i)
		}
		return
	}	
}



;------------class Inject End
