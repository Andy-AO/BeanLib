
/*
说明:Control对象
*/


class Control{
win:="",classNN:=""

;---------------------------------------------------------------------- 

	__New(aWin,aClassNN){
		LogPrintln(aWin,"aWin >>>")
		LogPrintln(aClassNN,"aClassNN >>>")
		this.win := aWin
		this.classNN := aClassNN
		LogPrintln(this.win,"this.win >>>")
		return this
	}

;---------------------------------------------------------------------- 
	setText(aNewText){
		
		LogPrintln(this.win,"this.win >>>")
		
		LogPrintln(aNewText,"aNewText >>>")
		LogPrintln(this.classNN,"this.classNN >>>")
		LogPrintln(this.win.title,"this.win.title >>>")
		
		ControlSetText , % this.classNN, %aNewText%, % this.win.title
		return aNewText
	}

;---------------------------------------------------------------------- 



	
} ;---------class Control End