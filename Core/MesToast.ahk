
class MesToast{
	static Width := 260,Height := 150,FontName := "Microsoft YaHei",period := "1",TransparentThreshold := "5",TransparencyUpperLimit := "255",indexStep := "1"
	,objList := array()
	
	
	static duration := "10",Color := "f0f0f0",SoundFile := ""
	
	Hwnd := "DefaultHwnd",title:="DefaultTitle",text:="DefaultText",theTimer := ""
	,index := "DefaultIndex"
	
	;SoundFile在New中加入以统一试试看,现在简单类中测试下
	
	setSoundFile(aSoundFile){
		return this.SoundFile := aSoundFile
	}
	
	getSoundFile(){
		return this.SoundFile
	}
	
	__New(aTitle,aText,aDuration := ""){
		Width := MesToast.Width,Height := MesToast.Height,FontName := MesToast.FontName,Color := this.Color
		Gui, New , +HwndHwnd +AlwaysOnTop , %aTitle%
		Gui, %Hwnd%:Color, %Color%
		Gui, %Hwnd%:Font , s10, %FontName%
		Gui, %Hwnd%:Add, Edit, r3 w%Width% ReadOnly, %aText%
		if(aDuration!="")
			this.duration := aDuration
		this.Hwnd := Hwnd
		,this.MaxX := _Win.getMonitorWorkArea().Right - Width 
		,this.MaxY := _Win.getMonitorWorkArea().Bottom - Height
		,this.insertObjList()
	}
	insertObjList(){
		this.index := MesToast.objList.length() + MesToast.indexStep
		MesToast.objList[this.index] := this
	}
	DeleteTimer(){
		this.theTimer.delete()
		,this.theTimer := ""
	}
	getTransparency(){
		return MesToast.TransparencyUpperLimit*(this.duration/MesToast.TransparentThreshold)
	}
	TransColor(){
		WinTitle := "ahk_id" " " this.hwnd,CustomColor:= this.Color,transparency := this.getTransparency()
		WinSet, TransColor, %CustomColor% %transparency% , %WinTitle%
	}
	countDown(){
		LogPrintln(A_ThisFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "A_ThisFunc >>> `r`n")
		if(this.duration <= 0){
			LogPrintln(this.duration,A_LineFile  "("  A_LineNumber  ")"  " : " "this.duration >>> `r`n")
			this.DeleteTimer()
			this.destroy()
		}
		else{
			if(this.duration <= MesToast.TransparentThreshold){
				this.TransColor()
			}
			LogPrintln(this.duration,A_LineFile  "("  A_LineNumber  ")"  " : " "this.duration >>> `r`n")
			this.duration--
		}
	}
	destroyWin(){
		Hwnd := this.Hwnd
		Gui, %Hwnd%:Destroy
	}
	destroyObj(){
		LogPrintln(MesToast.objList[this.index],A_LineFile  "("  A_LineNumber  ")"  " : " "MesToast.objList[this.index] >>> `r`n")
		MesToast.objList[this.index] := ""
		LogPrintln(MesToast.objList[this.index],A_LineFile  "("  A_LineNumber  ")"  " : " "MesToast.objList[this.index] >>> `r`n")
	}
	destroy(){
		LogPrintln(A_ThisFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "A_ThisFunc >>> `r`n")
		this.destroyWin()
		this.destroyObj()
	}
	playSound(){
		Filename := this.getSoundFile().getPath()
		if(Type.isObj(this.getSoundFile()))
			SoundPlay, %Filename%
		else
			SoundPlay, *64	
	}
	show(){
		this.playSound()
		Hwnd := this.Hwnd
		,MaxX := this.MaxX,MaxY := this.MaxY
		Gui, %Hwnd%:Show ,NoActivate X%MaxX% Y%MaxY% AutoSize
		_Win.moveToRightCorner("ahk_id" " " this.Hwnd)
		this.theTimer := new Timer(new Method(this.countDown,this),MesToast.period.secToMSec())
		this.theTimer.set()
	}
} ;---------class MesToast End
