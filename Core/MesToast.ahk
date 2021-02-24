

class MesToast{
	;TODO:解决回到桌面隐藏和任务栏显示问题
	static Width := 260,Height := 150,FontName := "Microsoft YaHei",period := "1",TransparentThreshold := "5",TransparencyUpperLimit := "255",indexStep := "1",AllowPlay := true
	,objList := array(),HadMessage := false,objMap := Object()
	
	static SoundFile := "",StatusBarExist := false
	
	static Hwnd := "DefaultHwnd",title:="DefaultTitle",text:="DefaultText",theTimer := "" ,TimeIdle := "",UsersOnline := false
	,index := "DefaultIndex",Hidden := true,TransparentMode := false,rawDuration := 10,duration := MesToast.rawDuration,Color := "f0f0f0",isDestroyed := false
	
	destroyAll(){
		for i,v in MesToast.objList {
			v.destroy()
		}
		return
	}
	
	ToggleHidden(){
		if(this.Hidden)
			this.Hidden := false
		else
			this.Hidden := true
		return
	}
	
	isTop(){
		return this = this.getTopObj()
	}
	
	reset(){
		if(!this.WinExist){
			throw(_EX.NoExistWin)
		}
		this.deleteTimer()
		this.duration := this.rawDuration
		this.UserMonitor()
		this.updateStatusBar()
		this.createTimer()
		this.playSound()
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
			theBackground := "Background" this.color
			Gui, %Hwnd%:Add, StatusBar,-Theme %theBackground%,%theText%
		}
	}
	__New(aTitle,aText,aDuration := "",AllowPlay := true){
		if(aDuration!="")
			this.duration := aDuration
		this.text := aText,this.title := aTitle
		Width := MesToast.Width,Height := MesToast.Height,FontName := MesToast.FontName,Color := this.Color
		this.MaxX := _Win.getMonitorWorkArea().Right - Width 
		this.MaxY := _Win.getMonitorWorkArea().Bottom - Height
		this.AllowPlay := AllowPlay
		this.OnMessage()
	}
	insertToList(){
		this.index := MesToast.objList.length() + MesToast.indexStep
		MesToast.objList[this.index] := this
	}	
	insertToMap(){
		return MesToast.objMap[this.hwnd] := this
	}
	deleteTimer(){
		this.theTimer.delete()
		,this.theTimer := ""
	}
	getTransparency(){
		return MesToast.TransparencyUpperLimit*(this.duration/MesToast.TransparentThreshold)
	}
	Transparent(){
		if(this.TransparentMode){
			WinTitle := "ahk_id" " " this.hwnd,CustomColor:= this.Color,transparency := this.getTransparency()
			WinSet, TransColor, %CustomColor% %transparency% , %WinTitle%
		}
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
		if((A_TimeIdle <= this.TimeIdle)OR(this.TimeIdle <= "1".SecToMSec())OR(this.UsersOnline))
			return this.UsersOnline := true
		else
			return false
	}
	CountdownPreCheck(){
		return (this.checkCursorPosition() AND this.checkTimeIdle() AND this.isTop())
	}
	winExist(){
		return WinExist("ahk_id" " " this.Hwnd)
	}
	countDown(){
		if(this.CountdownPreCheck() = false){
			return ""
		}
		if((this.duration <= 0) OR (!this.winExist())){
			this.destroy()
			return ""
		}
		else{
			if(this.duration <= MesToast.TransparentThreshold){
				this.Transparent()
			}
			this.duration--
		}
		return this.updateStatusBar()
	}
	destroyWin(){
		Hwnd := this.Hwnd
		Gui, %Hwnd%:Destroy
		
	}	
	hideWin(){
		Hwnd := this.Hwnd
		Gui, %Hwnd%:Hide
		return
	}
	destroyObj(){
		MesToast.objList[this.index] := ""
	}
	destroy(){
		this.deleteTimer()
		this.hideWin()
		this.destroyObj()
		this.isDestroyed := true
	}
	playSound(){
		if(this.AllowPlay){
			if(Type.isObj(this.getSoundFile())){
				Filename := this.getSoundFile().getPath()
				SoundPlay, %Filename%
			}
			else{
				SoundPlay, *64	
			}
		}
	}
	UserMonitor(){
		this.UsersOnline := false
		return this.TimeIdle := A_TimeIdle
	}
	changeWinStyle(){
		theWinTitle := "ahk_id" " " this.Hwnd
		_Win.Analyze(theWinTitle)
		;~ WinSet, Style, -0xC00000, %theWinTitle%  ; Remove the window's title bar 删除窗口的标题栏
		WinSet, ExStyle, +0x80, %theWinTitle%    ; Remove it from the alt-tab list 让他从切换栏中也移除
		WinSet, ExStyle, -0x00040000, %theWinTitle%    ; Turn off WS_EX_APPWINDOW 这个看不懂，反正也是去掉某一个窗口属性
	}
	newGUI(){
		if(this.Hwnd == MesToast.Hwnd){
			Width := MesToast.Width,Height := MesToast.Height,FontName := MesToast.FontName,Color := this.Color
			aText := this.text,aTitle := this.title
			Gui, New , +HwndHwnd +AlwaysOnTop, %aTitle%
			this.Hwnd := Hwnd
			Gui, %Hwnd%:Color, %Color%
			Gui, %Hwnd%:Font , s10, %FontName%
			Gui, %Hwnd%:Add, Edit, r3 w%Width% ReadOnly, %aText%
			this.updateStatusBar()
			return true
		}
		else{
			throw("The notification has already been shown.通知已经被展示过了")
			return false
		}
	}
	beforeShowCheck(){
		if(this.Hidden){
		}
		else{
			throw(_EX.ShownWin)
		}
	}
	show(){
		this.newGUI()		
		this.UserMonitor()
		this.beforeShowCheck()
		this.insertToList()
		this.insertToMap()
		this.playSound()
		Hwnd := this.Hwnd
		,MaxX := this.MaxX,MaxY := this.MaxY
		Gui, %Hwnd%:Show ,NoActivate X%MaxX% Y%MaxY% AutoSize
		this.changeWinStyle()
		_Win.moveToRightCorner("ahk_id" " " this.Hwnd)
		this.createTimer()
	}
	createTimer(){
		this.theTimer := new Timer(new Method(this.countDown,this),MesToast.period.secToMSec())
		this.theTimer.set()
	}
} ;---------class MesToast End
