

/*
说明:Control对象
*/
class BeanControl{
win:="",classNN:=""
;---------------------------------------------------------------------- 
	__New(aWin,aClassNN){
		this.win := aWin
		this.classNN := aClassNN
		return this
	}
;---------------------------------------------------------------------- 
	setText(aNewText){
		ControlSetText , % this.classNN, %aNewText%, % this.win.title
		return aNewText
	}
;---------------------------------------------------------------------- 
	
} ;---------class BeanControl End