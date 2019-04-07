

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


;---------------------------------------------------------------------- 

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
/*
说明:超星图书下载自动化
*/
class AutoPDG{
	ClassNN := Object("booktitle","TEdit10")
	downLoadWinTitle := "修改、新建CX BOOK 下载任务"
;------------------------------------------------------------------ 
	initWinObj(){
		this.downLoadWinObj := new Win(this.downLoadWinTitle)
		return
	}
;---------------------------------------------------------------------- 
	initControlObj(){
		this.bookTitleControl :=New Control(this.downLoadWinObj,this.ClassNN.booktitle)
		return
	}

;---------------------------------------------------------------------- 

	SetTitle(){
		this.bookTitleControl.setText("测试")
		return
	}

;---------------------------------------------------------------------- 
	chechDownloadWinActive(){
		LogPrintln(this.downLoadWinObj,"this.downLoadWinObj >>>")
		return this.downLoadWinObj.isActive()
	}
;---------------------------------------------------------------------- 

initAction(){
	theCondition := new Condition(this.action.chechDownloadWinActive)
	LogPrintln(theCondition,"theCondition >>>")
	this.action.SetTitle.conditions["before"] := theCondition
	return
}
;---------------------------------------------------------------------- 

initClickOkAction(){

	okButtonPos := DownLoadWinObj.getPosObj(981,270)
	okButtonPos.aNotActivate:=true
	this.clickOkAction := new Action(okButtonPos.click)	
	return
}

;---------------------------------------------------------------------- 
	__New(){
		loadAction(this)
		this.initWinObj()
		this.initControlObj()
		this.initAction()
		return this
	}
;---------------------------------------------------------------------- 
	
	autoFill(){		
		Critical,on	
		this.load()			
		return
	}
	
;---------------------------------------------------------------------- 
		
		loadMapFromFile(map){
			this.loadMap:=map
			FileRead, theMes, % map["mesPath"]
			this.loadMap["mes"]:=theMes
			return
		}


;---------------------------------------------------------------------- 

	loadFakeData(){
		theMesPath = D:\MyDocs\重要文档\超星自动下载数据\测试用报文.txt
		this.loadMap["title"]:=getCurrentTime() A_Sec A_MSec 
		FileRead, theMes, %theMesPath%
		this.loadMap["mes"] := theMes
	}

;---------------------------------------------------------------------- 
	load(){
		
		Critical,on
			
		this.loadFakeData(v)
		
		this.fill()

		Sleep 200
		
		WinActivate ,% this.CxCandyEntWinTiTle
		ControlClick,% this.CxCandyEnt新建Control,% this.CxCandyEntWinTiTle


		return
	}
				
;---------------------------------------------------------------------- 
		fill(){
			SetWinDelay, 200
			
			this.action.setTitle.Call()
			
					
			return
			ControlSetText , % this.标题Control, % this.loadMap["title"], % this.WinTitle
			ControlClick , % this.报文Control, % this.WinTitle
			SendByClip(this.loadMap["mes"])	
			WinActivate ,% this.WinTitle
			return
		}

;---------------------------------------------------------------------- 
	processInput(aInput){
		if(aInput.isNumber()){
			this.tempMap["Page"]:=aInput
			showToolTip("页码被成功捕获: " this.tempMap["Page"] "`n" "当前标题: " this.tempMap["title"])
		}
		
		else{
			this.tempMap["title"]:=this.tempMap["title"] aInput "_"
			showToolTip("当前标题: " this.tempMap["title"])
		}
		
		return
	}
;---------------------------------------------------------------------- 
	makeBook(){
		this.checkInput()
		this.mes:=this.getMes()
		this.write()
		this.resetTempMap()
		return
	}
;---------------------------------------------------------------------- 
	makeMap(){
		this.tempMap["mes"]:=this.mes
		this.tempMap["mesPath"] := this.dir "\报文\" this.tempMap["title"] ".txt"
		showToolTip("已生成: " this.tempMap["title"])
		palyMesSound()
		return
	}
		
;---------------------------------------------------------------------- 
	writeMesInText(){
		FileAppend , % this.tempMap["mes"], % this.tempMap["mesPath"]
		return
	}
;---------------------------------------------------------------------- 
	writeMapInIni(){
		theSectionName := this.tempMap["title"]
		theSection:=this.Ini.getSection(theSectionName)
		this.deleteMesKeyValue()
		theSection.writeByMap(this.tempMap)
		return
	}
;---------------------------------------------------------------------- 
	
	write(){
		this.makeMap()		
		this.writeMesInText()
		this.writeMapInIni()
		return
	}
;---------------------------------------------------------------------- 
			
	deleteMesKeyValue(){
		this.tempMap.Delete("mes")
		return
	}
;---------------------------------------------------------------------- 
	
	resetTempMap(){
		this.tempMap:=Object("title","","Page","","mes","","mesPath","")		
		return
	}
;---------------------------------------------------------------------- 
	checkInput(){
		if(this.tempMap["title"]=""){
			throw 标题不存在
		}
		if(this.tempMap["Page"]=""){
			throw 页码不存在
		}
		else{
			this.tempMap["title"].=this.tempMap["Page"] "页"
		}
		return
	}
	;---------------------------------------------------------------------- 
	getMes(){
		WinTitle:="百发百中报文嗅探器"
		if Not WinExist(WinTitle)
			throw Exception(_EX.NoExistWin)
		ControlClick, Button1, %WinTitle%
		ControlGetText, theMes , Edit1, %WinTitle%
		return theMes
	}
} 	;-------------------- class AutoPDG End
