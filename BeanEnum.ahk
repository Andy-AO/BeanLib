

/*
说明:自定义的枚举器
*/
class BeanEnum {
;--------------------------------------------------------------------
	Map := ""
	MaxIndex:=""
	CurrentIndex:=1
;---------------------------------------------------------------------- 
	__New(aMap){
		this.Map := _Container.mapToList(aMap)
		this.MaxIndex := this.Map.key.length()
		this.next:=this.base.next
		return this
	}
;---------------------------------------------------------------------- 
	__Call(methodName,byref k:="", byref v:=""){
		if(methodName = "")or(methodName="next")
			return this.next(k,v)
		else
			throw Exception(_Ex.NoExistMethod)
	}
;---------------------------------------------------------------------- 
	next(byref k:="", byref v:=""){
		if  (this.CurrentIndex > this.MaxIndex)	
			return false
		else{
			v := this.map.value[this.CurrentIndex]
			k := this.map.key[this.CurrentIndex]
			this.CurrentIndex++
			return true
		}
			
	}
;---------------------------------------------------------------------- 
}