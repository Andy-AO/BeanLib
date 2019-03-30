
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