

 class Stack{
	list := Array()
	maxIndex := ""
	isOutOfBounds(aIndex){
		if(this.maxIndex="")
			return false
		else
			return aIndex > this.maxIndex
	}
	get(){
		return this.list
	}
	set(aList){
		Type.assertList(aList)
		if(this.isOutOfBounds(aList.Length()))
			throw(_Ex.IndexOutOfBounds)
		return this.list := _List.clone(aList)
	}
	length(){
		return this.get().length()
	}
	
	__New(aMaxIndex := ""){
		if(aMaxIndex != "")
			Type.assertNumber(aMaxIndex)
		this.maxIndex := aMaxIndex
	}
	
	empty(){
		if(this.length() = 0)
			return true
		else
			return false
	}
	
	peek(){
		return this.get()[this.length()]
	}
	class Enum{
		list := "",CurrentIndex := "",lastIndex := 1
	;---------------------------------------------------------------------- 
		__New(aList){
			this.list := aList
			this.CurrentIndex := this.list.length()
			this.next:=this.base.next
		}
	;---------------------------------------------------------------------- 
		__Call(methodName,byref v:=""){
			if(methodName = "")or(methodName="next")
				return this.next(v)
			else
				throwWithSt(_Ex.NoExistMethod)
		}
	;---------------------------------------------------------------------- 
		next(byref v:=""){
			if  (this.CurrentIndex < this.lastIndex)	
				return false
			else{
				v := this.list[this.CurrentIndex]
				this.CurrentIndex--
				return true
			}
				
		}
	;---------------------------------------------------------------------- 
	}
	getEnum(){
		return new Stack.Enum(this.get())
	}
	
	;AHK-Array有同名方法
	pop(){
		return this.get().pop()
	}
	Cut(){
		return this.get().RemoveAt(1)
	}
	push(aElement){
		if(this.isOutOfBounds(this.get().Length()))
			this.Cut()
		return this.get().push(aElement)
	}
	
	search(aElement){
		thePos := this.get().Length()
		while(thePos>0){
			if(aElement =  this.get()[thePos])
				return thePos
			else
				thePos--
		}
		return false
	}
} ;---------class Stack End