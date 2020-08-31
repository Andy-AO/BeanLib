
/*
说明:操作文本文档
*/

class TextFile{

	static path := Object()
	,Encoding := "UTF-8"
	
	replace(SearchText,ReplaceText, Limit := -1){
		theResult := StrReplace(this.get(), SearchText , ReplaceText, OutputVarCount, Limit)
		this.Set(theResult)
		return OutputVarCount
	}
	
	__New(aPathObj){
		Type.assertObj(aPathObj)
		this.path := aPathObj
	}
	
	get(){
		this.path.assertExist()
		thePath := this.path.getPath()
		FileRead, theText, %thePath%
		return theText
	}
	
	FileAppend(aText){
		dir := this.path.dir
		dirExist := FileExist(dir)
		if(NOT(dirExist)){
			FileCreateDir, %dir%
		}
		FileAppend,% aText, % this.path.getPath(),% this.Encoding
		return ErrorLevel
	}
	
	Set(aText){
		if(FileExist(this.path.getPath()))
			FileDelete,% this.path.getPath()
		this.FileAppend(aText)
		return aText
	}
	
	
} ;---------class TextFile EndTextFile



