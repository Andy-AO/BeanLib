
/*
说明:固定宽度,且自动根据 prompt 换行的InputBox
*/

class AutoInputBox{
	aTextPrefix:="",deFaultText:=["UseClipBoard"],AlwaysOnTop:=false
	;---------------------------------------------------------------------- 
	__New(aTitle,aPrompt){
		this.title:=aTitle
		this.prompt:=aPrompt
		return this
	}
	;------------------------------
	SetAlwaysOnTop(aStr){
		Type.assertBoolean(aStr)
		return this.AlwaysOnTop := aStr
	}	
	;------------------------------
	SetDeFaultText(aStr){
		Type.assertStr(aStr)
		return this.deFaultText := aStr
	}
;---------------------------------------------------------------------- 
	start(){
		aTitle:=this.title
		aPrompt:=this.prompt
		aWeight:=375
		
		lineStringLength:="标题标题标题标题标题标题标题标题标题标题标题".length()

		line:= (aPrompt.length()) / lineStringLength
		
		ahight:=150 + (line*30)
		
		LogPrintln(this.deFaultText,"this.aDeFaultText >>>")
		if (IsObject(this.deFaultText))
			aDeFaultText:=Clipboard

		aDeFaultText:=this.deFaultText
		if(this.AlwaysOnTop){
			Gui + LastFound + OwnDialogs + AlwaysOnTop
		}
		
		InputBox,UserInput,%aTitle%,%aPrompt%,,%aWeight%,%ahight%,,,,,%aDeFaultText%
		
		if (ErrorLevel=1){ ;必须立即判断，不能有间隔
			throwWithSt(_EX.UserCancelled)
		}
			UserInput:=this.aTextPrefix UserInput ;给用户输入的内容增加前缀
			Return UserInput
	}
}

;------class AutoInputBox End
