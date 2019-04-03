
/*
说明:字符串分割器
*/

class Spliter{
	text:="",delimiters:=""
	
	elementTrim:=" `t"
	deleteBlankelement:=true
;---------------------------------------------------------------------- 
	__New(text,delimiters){
		this.text := text
		this.delimiters := delimiters
		return this
	}
;---------------------------------------------------------------------- 
	split(){
		theList:= StrSplit(this.text , this.delimiters,this.elementTrim)
		newList:=[]
		for i,v in theList {
			if(v!="")
				newList.Push(v)
		}
		return newList
	}
}
;--------class Spliter End