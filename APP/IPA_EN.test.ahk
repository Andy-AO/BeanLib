#Include D:\AHKs\ahk_lib
#Include head.tds.ahk

class IPA_EN{
	static config_path := A_ScriptDir "\IPA_EN.md"
	static data := ""
	LoadData(){
		FileRead, ConfigString, % this.config_path
		FoundPos := RegExMatch(Haystack, "O)1\. ([A-Z:])(.) " , OutputVar, StartingPos := 1)
	}
	Hook(){
		if(this.data == ""){
			this.LoadData()
		}
	}
	
	UnHook(){
	}
}
