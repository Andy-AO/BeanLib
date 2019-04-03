

/*
说明:用于读写 Ini 文件的 Ini 对象 和 Section 对象
*/
class Ini {
	path:=""
;---------------------------------------------------------------------- 
	
	__New(aPath){
		new PathObj(aPath)
		this.path:=aPath
		return this
	}
;---------------------------------------------------------------------- 
	;引
	readAllIni(){
		FileRead,allIni,% this.path
		this.allIni := allIni
		return
	}
;---------------------------------------------------------------------- 
	;引
	trimBlankLine(){
		_Container.deepDelete(this.theMap,aRegEx:="^(?!.*=).*$")	
		return		
	}
;---------------------------------------------------------------------- 
	;引
	dividedBySection(){	
		theLineSpliter:=new Spliter(this.allIni,"`r`n")
		List:=theLineSpliter.split()		
		theSectionIndexList:=_List.MatchIndexList(List,"\[.*\]")		
		_List.RegExReplace(List,"\[(.*)\]","$1")					
		this.theMap:=_List.getMapByIndex(List,theSectionIndexList*)	
		return
	}
;---------------------------------------------------------------------- 
	;引
	dividedByKeyValue(){
		aSpliter:=new Spliter("","=")
		aSpliter.deleteBlankelement:=false
		aSpliter.elementTrim:=false		
		_Container.deepSplit(this.theMap,aSpliter)	
		return
	}
;---------------------------------------------------------------------- 
	;引
	swapToMap(){
		_Container.swapToMap(this.theMap)	
		LogPrintln(this.theMap,"this.theMap >>>")	
		_Container.shuck(this.theMap)
		LogPrintln(this.theMap,"this.theMap >>>")	
		_Container.swapToMaps(this.theMap)
		return
	}
	
;---------------------------------------------------------------------- 
	getMap(){
		this.readAllIni()
		LogPrintln(this.theMap,"this.theMap >>>")
		this.dividedBySection()
		LogPrintln(this.theMap,"this.theMap >>>")
		this.trimBlankLine()
		LogPrintln(this.theMap,"this.theMap >>>")
		this.dividedByKeyValue()
		LogPrintln(this.theMap,"this.theMap >>>")
		this.swapToMap()	
		;~ LogPrintln(this.theMap,"this.theMap >>>")		
		return this.theMap
	}
;---------------------------------------------------------------------- 
	getSection(aSection){
		newSection:=this.Section.__New(this,aSection)
		return newSection
	}
	
;---------------------------------------------------------------------- 
	class Section{
		theIni:="",section:=""
		;---------------------------------------------------------------------- 
	__New(aIni,aSection){
		this.theIni:=aIni
		this.section:=aSection
		return this
	}
	;---------------------------------------------------------------------- 
		read(aKey,aDefault:=""){
			IniRead, OutVar, % this.theIni.path,  % this.section, %aKey% , %aDefault%
			
			if (aDefault="") AND (OutVar="ERROR")
				throw Exception(_Ex.NoExistKey)
			
			return OutVar
		}		
	;---------------------------------------------------------------------- 
		write(aKey,value){
			IniWrite, %value%, % this.theIni.path, % this.section, %aKey%
			return 
		}		
	;---------------------------------------------------------------------- 
		writeByMap(aMap){
			for aKey , value in aMap {
				IniWrite, %value%, % this.theIni.path, % this.section, %aKey%
			}
			return 
		}		
	
;---------------------------------------------------------------------- 
	
		readInMap(aMap,aKey,aDefault:=""){
			data:=this.read(aKey,aDefault)
			aMap[aKey]:=data
			return
		}	
;---------------------------------------------------------------------- 
		getMap(aKeys*){
			theMap:=getEmptyMap(aKeys*)
			for key,v in theMap {
				this.readInMap(theMap,key,aDefault:="")
			}
			return theMap
		}
;---------------------------------------------------------------------- 
		
	}
}
;-----------class Ini End