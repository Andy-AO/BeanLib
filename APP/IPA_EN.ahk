class IPA_EN{
	static config_path := "D:\AHKs\ahk_lib\APP\IPA_EN.json"
	static Data := ""
	static Hooked := false
	LoadData(){
		this.Data := new JsonFile(this.config_path).load()
	}
	ToggleHook(){
		if(this.Hooked){
			this.UnHook()
		}
		else{
			this.Hook()
		}
	}
	Hook(){
		if(Not this.Hooked){
			if(this.Data == ""){
				this.LoadData()
			}
			this.Hooked := true
			for Key,NewKey in this.Data {
				TheFuncObj:=func("SendText").bind(NewKey)
				Hotkey,+%Key%,%TheFuncObj%,On
			}
		}
	}
	
	UnHook(){
		if(this.Hooked){
			this.Hooked := false
			for Key,NewKey in this.Data {
				Hotkey,+%Key%,Off
			}
		}
	}
}