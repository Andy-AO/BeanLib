

class FileLocator{

	static WinTitle := "ahk_exe FileLocatorPro.exe"
	static 搜索方式选择框 := "ComboBox1"
	static 专家搜索模式停止键 := "Button7"
	static 专家搜索序号 := "1"
	static 索引搜索序号 := "3"
	static 开始搜索的快捷键 := "{F5}"
	static 搜索进行中 := "FileLocator 搜索进行中..."
	static 在当前结果列表中搜索Pos := "x475 y100"
	static 窗口未能激活 := "FileLocator  窗口未能激活 ！ "
	static 窗口不存在 := "FileLocator 窗口不存在 ！ "
	static 搜索已经结束 := "搜索已经结束，请尽快保存结果！"
	static 已有搜索正在运行中 := "已有搜索正在运行中！ "
	static 自动提醒检查间隔时间 := 0.1

	static SectionName:="状态"
	static key:="提醒"
	static IniPath:="D:\AHKs\Stable\FileLocator.ini"

	Section:=""
;----------------------------------------------------------------------
	提醒(){
		if(this.检测提醒状态()){
			if(this.检测是否有搜索已经在进行()){
				return
			}
			else{
				LogPrintln("提醒","提醒 >>>")
				TrayTip,% A_ScriptName,FileLocator 搜索已经结束！请尽快保存结果！
				SoundPlay *-1
				this.取消提醒状态() 
			}
		}
		else{
			return
		}
		return
	}
;---------------------------------------------------------------------- 

	自动提醒(){
		showToolTip(A_ThisFunc)
		SetTimer(FileLocator.自动提醒检查间隔时间,FileLocator.提醒.Bind(this))
		return
	}

;---------------------------------------------------------------------- 

	检测提醒状态(){
		;~ showToolTip(A_ThisFunc)
		return this.Section.read(FileLocator.key)
	}
;---------------------------------------------------------------------- 

	取消提醒状态(){
		showToolTip(A_ThisFunc)
		this.Section.write(FileLocator.key,"0")
		return
	}

;---------------------------------------------------------------------- 
	CreatSection(){
		showToolTip(A_ThisFunc)
		newIni:=new Ini(FileLocator.IniPath)
		newSection:=newIni.getSection(FileLocator.SectionName)
		this.Section:=newSection
		return
	}

;---------------------------------------------------------------------- 

	设置提醒状态(){
		showToolTip(A_ThisFunc)
		this.Section.write(FileLocator.key,"1")
		return
	}
;---------------------------------------------------------------------- 

	检测是否有搜索已经在进行(){
		showToolTip(A_ThisFunc)
		
		theControl:=FileLocator.专家搜索模式停止键 ;检测「停止」键,有「停止」说明在「运行」
		ControlGet, OutputVar, Enabled , , %theControl%, % FileLocator.WinTitle
		LogPrintln(OutputVar,"OutputVar >>>")
		return OutputVar
	}

	;---------------------------------------------------------------------- 

	全自动索引搜索与文本提取(){
		
		
		this.检查FileLocatorPro窗口是否存在()
		this.如果发现有搜索已经在运行则停止()
		theKeys := this.获取搜索关键词()
		this.确保FileLocatorPro窗口激活()

		this.切换到索引搜索()
		this.填入索引搜索关键词(theKeys)
		Sleep 500
		this.使用快捷键开启搜索()
		Sleep 2800
		this.在当前结果列表中搜索()
		Sleep 650
		this.切换到专家搜索()
		Sleep 300
		this.清空专家搜索文件名称()
		this.使用快捷键开启搜索()
		Sleep 500
		TrayTip,% FileLocator.搜索进行中
		this.设置提醒状态()
		return
		
	}
	;---------------------------------------------------------------------- 
	确保FileLocatorPro窗口激活(onlycheck:=false){
		showToolTip(A_ThisFunc)

		if (winActive(FileLocator.WinTitle)){
			showToolTip(FileLocator.WinTitle)
			WinActivate,% FileLocator.WinTitle
			showToolTip("窗口处于激活状态！！")
			return
		}
		else{
			if(onlycheck){
				TrayTip,% FileLocator.窗口未能激活
				throw Exception(_Ex.NoExistWin)
			}
			WinActivate,% FileLocator.WinTitle
			Sleep 50
			this.确保FileLocatorPro窗口激活(true)
			return
		}
			
		return
	}

	;---------------------------------------------------------------------- 
	获取搜索关键词(){
		boxObj:=new AutoInputBox(A_ThisFunc)	
		boxObj.DefaultText:=Clipboard	
		theKeys:=boxObj.start()
		return theKeys
	}

	;---------------------------------------------------------------------- 

	激活搜索窗口(){
		
		if WinExist(FileLocator.WinTitle)
			WinActivate,% FileLocator.WinTitle
		else 
			return 0
		return 1
	}



;---------------------------------------------------------------------- 

	在当前结果列表中搜索(){
		showToolTip(A_ThisFunc)
		ControlClick,% FileLocator.在当前结果列表中搜索Pos,% FileLocator.WinTitle,,,,NA
		return
	}

;---------------------------------------------------------------------- 

	使用快捷键开启搜索(){
		showToolTip(A_ThisFunc)
		
		
		ControlSend ,ahk_parent , % FileLocator.开始搜索的快捷键, % FileLocator.WinTitle
		Sleep 150
		return
	}

	;---------------------------------------------------------------------- 

	填入索引搜索关键词(theKeys){
		showToolTip(A_ThisFunc)
		
		theControl:="Edit2"
		目标关键词 = %theKeys%
		ControlSetText , %theControl%, %目标关键词%, % FileLocator.WinTitle
		return
	}

	;---------------------------------------------------------------------- 
	清空专家搜索文件名称(){
		showToolTip(A_ThisFunc)
		
		theControl:="Edit2"
		目标关键词 := ""
		ControlSetText , %theControl%, %目标关键词%, % FileLocator.WinTitle
		return
	}

	;---------------------------------------------------------------------- 
	填入专家搜索关键词(){
		showToolTip(A_ThisFunc)
		
		theControl:="Edit3"
		目标关键词 = 目标关键词-专家
		ControlSetText , %theControl%, %目标关键词%, % FileLocator.WinTitle
		return
	}

	;---------------------------------------------------------------------- 

	切换到专家搜索(){
		showToolTip(A_ThisFunc)
		
		theControl:=FileLocator.搜索方式选择框
		ControlGet, OutputVar, List , Count Focused, %theControl%, % FileLocator.WinTitle
		LogPrintln(OutputVar,"OutputVar >>>")
	Control, Choose,% FileLocator.专家搜索序号, %theControl%, % FileLocator.WinTitle
		return
	}

	;---------------------------------------------------------------------- 

	切换到索引搜索(){
		showToolTip(A_ThisFunc)
		
		theControl:=FileLocator.搜索方式选择框
		ControlGet, OutputVar, List , Count Focused, %theControl%, % FileLocator.WinTitle
		Control, Choose,% FileLocator.索引搜索序号, %theControl%, % FileLocator.WinTitle
		return
	}

	;---------------------------------------------------------------------- 
	如果发现有搜索已经在运行则停止(){
		if(this.检测是否有搜索已经在进行()){
			String = 
			TrayTip,% FileLocatorPro.已有搜索正在运行中
			throw String
		}
		return
	}
	;---------------------------------------------------------------------- 
	检查FileLocatorPro窗口是否存在(){
		showToolTip(A_ThisFunc)
		
		if winExist(FileLocator.WinTitle)
			return
		else{
			TrayTip,% FileLocator.窗口不存在
			throw Exception(_Ex.NoExistWin)
		}
			
		return
	}

;---------------------------------------------------------------------- 

	__New(){
		this.CreatSection()
		this.自动提醒()
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
} ;---------class FileLocator End
