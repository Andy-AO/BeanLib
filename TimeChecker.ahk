
class TimeChecker{
		__New(){
			return this
		}
		
BlackList_Base := "",WhiteList_Base := ""
;------------------------------
	BlackList[index:=""]
	{
		get {
			if(index="")
				return this.BlackList_Base
			else
				return this.BlackList_Base[index]
		}
		set {
			Type.afList(value)
			return this.BlackList_Base:=value
		}
	}
	
;------------------------------
	WhiteList[index:=""]
	{
		get {
			if(index="")
				return this.WhiteList_Base
			else
				return this.WhiteList_Base[index]
		}
		set {
			Type.afList(value)
			return this.WhiteList_Base:=value
		}
	}
;------------------------------
	CheckByBlackList(){
		Type.afList(this.BlackList)
		currentTime:=getCurrentTime()
		b1:=currentTime<this.BlackList[1]
		b2:=currentTime>this.BlackList[2]
		if(b1 OR b2)
			return true
		else
			return false
	}
;------------------------------
	CheckByWhiteList(){
		Type.afList(this.WhiteList)
		currentTime:=getCurrentTime()
		b1:=currentTime>=this.WhiteList[1]
		b2:=currentTime<=this.WhiteList[2]
		if(b1 AND b2)
			return true
		else
			return false
	}
} ;---------class TimeCheck End