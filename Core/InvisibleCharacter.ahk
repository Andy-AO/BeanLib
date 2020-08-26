
/*
说明:用于处理不可见字符,不确定所列出的不可见字符是否完全,感觉已经覆盖了绝大多数情况
*/



class InvisibleCharacter{
	static CodeList := [0x200b,0x0200c,0x0200d,0x0200e,0x200f
,0x202a,0x202b,0x202c,0x202d,0x202e
,0x2066,0x2067,0x2068,0x2069
,0xfeff
,0x06ec]
,List_Base := ""

List[] 
{
	get {
		if(InvisibleCharacter.List_Base = ""){
			TheCharList := [],theCodeList := InvisibleCharacter.CodeList
			for i,v in theCodeList {
				TheCharList[i] := Chr(v)
			}
			InvisibleCharacter.List_Base := TheCharList
		}
		return InvisibleCharacter.List_Base
	}
	set {
		return 
	}
}

} ;---------class InvisibleCharacter End






