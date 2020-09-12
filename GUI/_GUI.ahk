
class _GUI{ ;对GUI进行操作的静态类
	static c := new _GUI.c_base()
	;SubCommand
	class c_base{
		__Call(SubCommand,hwndOrName){
			return hwndOrName ":" SubCommand
		}
	} ;---------class c End
	
	static t := new _GUI.t_base()
	;WinTitle
	class t_base{
		__Call(Prefix,content){
			return Prefix " " content
		}
	} ;---------class c End
;------------------------------

	; ****  AddAnimatedGIF function by boiler  ****
	; imagefullpath: must be the full path to the animated GIF image file
	; x, y: optional strings containing position info that would normally follow x and y options, such as 10, "p+3", "m"
	; w, h: optional width and height values that would normally follow w and h options; blank for full size image
	; guiname:  optional name of the gui to add the image to if not the main one
	;
	; function returns the name of the control that was added so that you can modify it (move, hide) with GuiControl
	; can add up to animated GIF images.  to increase the limit, add AG11,AG12,... to the global statement
	;
	AddAnimatedGIF(imagefullpath , x="", y="", w="", h="", guiname = "1"){
		global AG1,AG2,AG3,AG4,AG5,AG6,AG7,AG8,AG9,AG10
		static AGcount:=0, pic
		AGcount++
		html := "<html><body style='background-color: transparent' style='overflow:hidden' leftmargin='0' topmargin='0'><img src='" imagefullpath "' width=" w " height=" h " border=0 padding=0></body></html>"
		Gui, AnimGifxx:Add, Picture, vpic, %imagefullpath%
		GuiControlGet, pic, AnimGifxx:Pos
		Gui, AnimGifxx:Destroy
		Gui, %guiname%:Add, ActiveX, % (x = "" ? " " : " x" x ) . (y = "" ? " " : " y" y ) . (w = "" ? " w" picW : " w" w ) . (h = "" ? " h" picH : " h" h ) " vAG" AGcount, Shell.Explorer
		AG%AGcount%.navigate("about:blank")
		AG%AGcount%.document.write(html)
		return "AG" AGcount
	}

;------------------------------

} ;---------class GUI End

