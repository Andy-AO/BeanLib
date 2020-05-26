
class MesToast{
	static Width := 260,Height := 150,FontName := "Microsoft YaHei",period := "1",TransparentThreshold := "5",TransparencyUpperLimit := "255",indexStep := "1"
	,objList := array()
	
	
	static duration := "10",Color := "f0f0f0",SoundFile := "",StatusBarExist := false,hover := false
	
	Hwnd := "DefaultHwnd",title:="DefaultTitle",text:="DefaultText",theTimer := ""
	,index := "DefaultIndex"
	
	;SoundFile在New中加入以统一试试看,现在简单类中测试下
	
	setSoundFile(aSoundFile){
		return this.SoundFile := aSoundFile
	}
	
	getSoundFile(){
		return this.SoundFile
	}
	updateStatusBar(){
		if(this.StatusBarExist){
			Hwnd := this.Hwnd
			theText := this.duration
			Gui, %Hwnd%:Default
			SB_SetText(theText)
		}
		else{
			LogPrintln(this.StatusBarExist,A_LineFile  "("  A_LineNumber  ")"  " : " "this.StatusBarExist >>> `r`n")
			this.CreateStatusBar()
			this.StatusBarExist := true
		}
			
	}	
	
	CreateStatusBar(){
		if(NOT(this.StatusBarExist)){
			Hwnd := this.Hwnd
			theText := this.duration
			Gui, %Hwnd%:Add, StatusBar,,%theText%
		}
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
		this.updateStatusBar()
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
	offTimer(){
		return this.theTimer.off()
	}
	onTimer(){
		return this.theTimer.on()
	}
	CountdownPreCheck(){
		return (this.hover = false)
	}
	countDown(){
		LogPrintln(A_ThisFunc,A_LineFile  "("  A_LineNumber  ")"  " : " "A_ThisFunc >>> `r`n")
		if(this.CountdownPreCheck() = false){
			return this.offTimer()
		}
		if(this.duration <= 0){
			LogPrintln(this.duration,A_LineFile  "("  A_LineNumber  ")"  " : " "this.duration >>> `r`n")
			this.DeleteTimer()
			this.destroy()
			return ""
		}
		else{
			if(this.duration <= MesToast.TransparentThreshold){
				this.TransColor()
			}
			LogPrintln(this.duration,A_LineFile  "("  A_LineNumber  ")"  " : " "this.duration >>> `r`n")
			this.duration--
		}
		return this.updateStatusBar()
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
		if(Type.isObj(this.getSoundFile())){
			Filename := this.getSoundFile().getPath()
			SoundPlay, %Filename%
		}
		else
			SoundPlay, *64	
	}
	MonitorMouse(){
		Critical,On
		;鼠标移动
		WM_SETCURSOR := 0x20
		OnMessage(WM_SETCURSOR, new Method(this.WM_SETCURSOR,this))
		
		;鼠标离开
		WM_MOUSELEAVE := 0x2A3
		OnMessage(WM_MOUSELEAVE, new Method(this.WM_MOUSELEAVE,this))
	}
	WM_SETCURSOR(wParam, lParam, msg, hwnd){
		Critical,On
		if(this.hover = false)
			this.hover := true
	}	
	WM_MOUSELEAVE(wParam, lParam, msg, hwnd){
		Critical,On
		if(this.hover = true){
			this.hover := false
			this.onTimer()
		}
	}
	show(){
		this.playSound()
		Hwnd := this.Hwnd
		,MaxX := this.MaxX,MaxY := this.MaxY
		Gui, %Hwnd%:Show ,NoActivate X%MaxX% Y%MaxY% AutoSize
		_Win.moveToRightCorner("ahk_id" " " this.Hwnd)
		this.MonitorMouse()
		this.theTimer := new Timer(new Method(this.countDown,this),MesToast.period.secToMSec())
		this.theTimer.set()
	}
} ;---------class MesToast End
