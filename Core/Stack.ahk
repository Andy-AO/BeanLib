﻿
 class Stack{
	list := Array()
	get(){
		return this.list
	}
	set(aList){
		Type.assertList(aList)
		return this.list := aList
	}
	length(){
		return this.get().length()
	}
	
	__New(){
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
	
	
	;AHK-Array有同名方法
	pop(){
		return this.get().pop()
	}
	
	push(aElement){
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