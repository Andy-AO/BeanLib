
/*
说明:Win对象
*/


class Win{
	__toString := ["title"]
/*
	_NewEnum(){
		return new BeanEnum(Object("title",this.title))
	}
*/

	title:=""
	__New(atitle){
		this.title:=atitle
		return this
	}

;---------------------------------------------------------------------- 
	clone(){
		it = this.__New()
		return it
	}

;---------------------------------------------------------------------- 
	equal(){
		result := true
		return result
	}
;---------------------------------------------------------------------- 
	isActive(){
		return WinActive(this.title)
	}
	
	;---------------------------------------------------------------------- 
	isExist(){
		return WinExist(this.title)
	}
	
	
;---------------------------------------------------------------------- 
	getPosObj(aX,aY){
		return this.Pos.__New(this,aX,aY)
	}
;---------------------------------------------------------------------- 

	class Pos{
	x:="",y:="",win:="",aWhichButton:="L",aClickCount:="1",aNotActivate:=false
		__New(aWin,aX,aY){
			this.setPos(aX,aY)
			this.win:=aWin
			return this
		}

;---------------------------------------------------------------------- 
getNAString(boolean){
	if(boolean)
		return "NA"
	else
		return
}
;---------------------------------------------------------------------- 

	click(){
		Options := "Pos " this.getNAString(aNotActivate)
		LogPrintln(Options,"Options >>>")
		LogPrintln(this.win.title,"this.win.title >>>")
		LogPrintln(this.pos,"this.pos >>>")
		
		ControlClick ,% this.pos, % this.win.title, ,%aWhichButton% , %aClickCount%, %Options%
		return
	}
;---------------------------------------------------------------------- 
	
	setPos(aX,aY){
		Type.assertNumber(aX),Type.assertNumber(aY)
		this.x:=aX,this.y:=aY
		return
	}
;---------------------------------------------------------------------- 
	pos[aPara*]{
		get {
			return "x" this.x " y" this.y
		}
		set {
			throwWithSt(_EX.SetConst)
			return
		}
	}

;---------------------------------------------------------------------- 

	} ;---------class Pos End

;---------------------------------------------------------------------- 
	
} ;---------class Win End