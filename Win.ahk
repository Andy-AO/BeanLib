﻿
/*
说明:Win对象
*/


class Win{
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
		Type.afNumber(aX),Type.afNumber(aY)
		this.x:=aX,this.y:=aY
		return
	}
;---------------------------------------------------------------------- 
	pos[aPara*]{
		get {
			return "x" this.x " y" this.y
		}
		set {
			throw Exception(_EX.SetConst)
			return
		}
	}

;---------------------------------------------------------------------- 

	} ;---------class Pos End

;---------------------------------------------------------------------- 
	
} ;---------class Win End