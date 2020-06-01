

class MesToast{
	static Width := 260,Height := 150,FontName := "Microsoft YaHei",period := "1",TransparentThreshold := "5",TransparencyUpperLimit := "255",indexStep := "1"
	,objList := array(),HadMessage := false
	
	static duration := "10",Color := "f0f0f0",SoundFile := "",StatusBarExist := false
	
	Hwnd := "DefaultHwnd",title:="DefaultTitle",text:="DefaultText",theTimer := "" ,TimeIdle := "",UsersOnline := false
	,index := "DefaultIndex"
	
	OnMessage(){
		Critical
		if(NOT(MesToast.HadMessage)){
			WM_CLOSE := 0x10
			WM_MOVE := 0x03
			WM_SHOWWINDOW := 0x18
			OnMessage(WM_SHOWWINDOW, new Method(MesToast.WM_SHOWWINDOW,MesToast))
			OnMessage(WM_CLOSE, new Method(MesToast.WM_CLOSE,MesToast))
			MesToast.HadMessage := true
		}
		return
	}
	WM_SHOWWINDOW(wParam, lParam, msg, hwnd){
		Critical
		LogPrintln(hwnd,A_LineFile  "("  A_LineNumber  ")"  " : " "hwnd >>> `r`n")
	}	
	
	WM_CLOSE(wParam, lParam, msg, hwnd){
		Critical
		LogPrintln(hwnd,A_LineFile  "("  A_LineNumber  ")"  " : " "hwnd >>> `r`n")
	}
	isTop(){
		return this = this.getTopObj()
	}
	
	getTopObj(){
		Critical
		theIndex := theLength := MesToast.objList.length()
		theResult := false
		while(theIndex>0){
			if(MesToast.objList[theIndex] != ""){
				theResult := MesToast.objList[theIndex]
				break
			}
			theIndex --
		}
		return theResult
	}
	
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
		Gui, New , +HwndHwnd +AlwaysOnTop, %aTitle%
		Gui, %Hwnd%:Color, %Color%
		Gui, %Hwnd%:Font , s10, %FontName%
		Gui, %Hwnd%:Add, Edit, r3 w%Width% ReadOnly, %aText%
		if(aDuration!="")
			this.duration := aDuration
		this.Hwnd := Hwnd,this.text := aText,this.title := aTitle
		this.MaxX := _Win.getMonitorWorkArea().Right - Width 
		this.MaxY := _Win.getMonitorWorkArea().Bottom - Height
		this.updateStatusBar()
		this.OnMessage()
	}
	insertToList(){
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
	checkCursorPosition(){
		MouseGetPos, , , id, theControl
		return (id != this.Hwnd)
	}
	checkTimeIdle(){
		if((A_TimeIdle <= this.TimeIdle)OR(this.UsersOnline))
			return this.UsersOnline := true
		else
			return false
	}
	CountdownPreCheck(){
		return (this.checkCursorPosition() AND this.checkTimeIdle() AND this.isTop())
	}
	countDown(){
		if(this.CountdownPreCheck() = false){
			return ""
		}
		if(this.duration <= 0){
			this.DeleteTimer()
			this.destroy()
			return ""
		}
		else{
			if(this.duration <= MesToast.TransparentThreshold){
				this.TransColor()
			}
			this.duration--
		}
		return this.updateStatusBar()
	}
	destroyWin(){
		Hwnd := this.Hwnd
		Gui, %Hwnd%:Destroy
		
	}
	destroyObj(){
		MesToast.objList[this.index] := ""
	}
	destroy(){
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
	UserMonitor(){
		this.UsersOnline := false
		return this.TimeIdle := A_TimeIdle
	}
	show(){
		this.playSound()
		Hwnd := this.Hwnd
		,MaxX := this.MaxX,MaxY := this.MaxY
		Gui, %Hwnd%:Show ,NoActivate X%MaxX% Y%MaxY% AutoSize
		_Win.moveToRightCorner("ahk_id" " " this.Hwnd)
		this.UserMonitor()
		this.theTimer := new Timer(new Method(this.countDown,this),MesToast.period.secToMSec())
		this.theTimer.set()
		this.insertToList()
	}
} ;---------class MesToast End
