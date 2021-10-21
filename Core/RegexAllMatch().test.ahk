#Include D:\AHKs\ahk_lib
#Include head.tds.ahk

#Include %A_ScriptDir%
#Include RegexAllMatch().ahk

/*
返回匹配对象数组
*/

MatchObjectArray := RegexAllMatch(Haystack:="ABC`r`nDEF`r`n", NeedleRegEx:="Om)^(\w)(\w)")
AHKTest.eq(MatchObjectArray[1].Value(0),"AB")
AHKTest.eq(MatchObjectArray[2].Value(0),"DE")

/*
如果没有匹配到，那么返回空数组
*/
AHKTest.eq(RegexAllMatch(Haystack:="123", NeedleRegEx:="Om)^abc").Length(),0)


/*
如果没有O选项，会抛出异常
*/
funcobj_1(){
	RegexAllMatch(Haystack:="123", NeedleRegEx:="m).")
}
AHKTest.throw(Func("funcobj_1"))


