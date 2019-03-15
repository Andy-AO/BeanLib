
/*
说明:基本可以直接使用的一些函数
特别提示:这是我的私人工具箱,里面的函数不一定保证在所有环境下都可以运行,如果不想要的话可以不同步
*/

	


SendShortCut(aLinkFileDir){
	
	theSrcFilePath:=SuperCopy()
	
	theSrcFileName:=theSrcFilePath.ExtractFileNameFromPathWithOutPostfix()
	theLinkFilePath:=aLinkFileDir "\" theSrcFileName
	
	FolderName:=theSrcFileName
	FolderShortCut := aLinkFileDir "\" FolderName ".lnk"
	
	FileCreateShortCut, %theSrcFilePath%, %FolderShortCut%
	TrayTip,%A_ScriptName% 提醒,快捷方式建立成功
	
	return
}