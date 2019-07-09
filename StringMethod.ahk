
/*
String Method
1. 是一个依靠[元编程](http://xrvu_zen.gitee.io/wyagd001.github.io/docs/Objects.htm#Meta_Functions)实现的 String 方法，并非类。
2. 主要包含对于String的各种增强操作, 包括但不限于 获取长度，单个字符，转为字符数组，提取汉语拼音首字母...
*/
"".base.base:=StrBase
class StrCallBase{
    __Call(aStr,aName,aParams*){
		if(ObjHasKey(this,aName)){
			return SmartCall(aStr,this[aName],aParams*)
		}
		else{
			if(aStr = "")
				throw Exception("为空字符串调用不存在的方法！")
			else
				throw Exception("为字符串 " aStr " 调用不存在的方法！")
			return
		}
    }
}
class StrBase{

;---------------Inner Class ListSpliter

	class ListSpliter{
;---------------------------------------------------------------------- 
	
		initialize(){
			this.enableDeWeight:=true
			this.enablePreTrimDelimiter:=true
			this.enableTrimBlankAndTab:=true 
			return
		}

;---------------------------------------------------------------------- 
		
		__New(aHayStack,aDelimiter){
			this.initialize()
			this.HayStack:=aHayStack
			this.Delimiter:=aDelimiter
			return this
		}


;---------------------------------------------------------------------- 
			split(){
							
				Type.afStr(this.HayStack)
				if NOT InStr(this.HayStack, this.Delimiter){
						throw Exception("Error01:Not Find Delimiter in this.HayStack`r`n在输入的字符串中，没有发现分隔符.")
				}
				if (this.enableDeWeight){
					this.DelimiterInRegex:=this.Delimiter.RegexEscape()
					this.HayStack := RegExReplace(this.HayStack,this.DelimiterInRegex "{2,}" ,this.Delimiter)
				}
			
				if (this.enablePreTrimDelimiter){
					this.HayStack :=  Trim(this.HayStack,this.Delimiters)
					}
				
				OmitChars:=""
				if (this.enableTrimBlankAndTab){
					OmitChars:=" `t"
				}

				
				theList := StrSplit(this.HayStack , this.Delimiter, OmitChars)
				
				return theList
			}
;---------------------------------------------------------------------- 
		
	}
	
;------- inner class ListSpliter End
    class __Call extends StrCallBase{
;---------------------------------------------------------------------- 
RegexEscape(){
	aRegEx := this
	regexList:=[".","?","+","$","^","[","]","(",")","{","}","*","/","|"]
	return this.Escape(regexList)
}
;---------------------------------------------------------------------- 

Escape(aCharList,aTargetChar:="\"){
	String := this
	Type.afStr(aTargetChar),Type.afStr(String),Type.afList(aCharList)
	if (String="")
		return
	
	aCharList.InsertAt(1,aTargetChar) 
	for index,p in aCharList{
		if instr(String,p){
			Newp:="\" . p
			String:=StrReplace(String,p,Newp)
		}
	}
	return String
}
	;---------------------------------------------------------------------- 

	minToMSec(){ ;isObj直接调用系统函数就行了，不用绕弯子
		min := this
		Type.afNumber(min)
		Sec := min * 60
		return (Sec.SecToMSec())
	}
;------------------------------

	SecToMSec(){ ;isObj直接调用系统函数就行了，不用绕弯子
		sec := this
		Type.afNumber(sec)
		return (Sec*1000)
	}
;----------------------------------------------------------------------  Start	
		length(){
			return StrLen(this)
		}
;---------------------------------------------------------------------- 
	isRegExMatch(aRegEx,aRegExOption:="i)"){
		aString:=this
		RegExMatch(aString,aRegExOption aRegEx,MatchedPart)
		return (MatchedPart=aString)
	}
;---------------------------------------------------------------------- 
	getListSpliter(Delimiters:="`|"){
		return StrBase.ListSpliter.__New(this,Delimiters)
	}
;---------------------------------------------------------------------- 		
		ToList(){
			return StringToCharArray(this)
		}		
;---------------------------------------------------------------------- 		
		ExtractFileNameByPath(){
			NeedleRegEx=([^<>/\\\|:""\*\?]+)\.\w+$
			Haystack:=this
			FoundPos := RegExMatch(Haystack, NeedleRegEx,FileName)
			return FileName
		}	
;---------------------------------------------------------------------- 		
		SplitPath(){
			NeedleRegEx=([^<>/\\\|:""\*\?]+)\.\w+$
			Haystack:=this
			FoundPos := RegExMatch(Haystack, NeedleRegEx,FileName)
			return FileName
		}	
;---------------------------------------------------------------------- 		
		ExtractFileNameByPathWithOutPostfix(){
			FileName:=this.ExtractFileNameByPath()
			asFileName:=FileName.SplitFileName()
			pureFileName:=asFileName[1]
			return pureFileName
		}		
;---------------------------------------------------------------------- 		
		SplitFileName(){
			NeedleRegEx=^(.*)(\.)(.*)
			Haystack:=this
			pureFileName := RegExReplace(Haystack, NeedleRegEx,"$1")
			postfix := RegExReplace(Haystack, NeedleRegEx,"$3")
			return [pureFileName,postfix]
		}		
		
;---------------------------------------------------------------------- 
	CharAt(aIndex){
		len:=1
		if((aIndex>StrLen(this)) OR (aIndex<1)){
			throw Exception(_Ex.IndexOutOfBounds)
		}
		
		Sub:=SubStr(this,aIndex,len)
		return Sub
	}
	;---------------------------------------------------------------------- 
	isNumber(){
		aRegEx:="[0-9]+"		
		return this.isRegExMatch(aRegEx,aRegExOption:="i)")
	}
	
		
;---------------------------------------------------------------------- 
		py(){
	Str:=this,newStr:=""
	static FirstTable  := [ 0xB0C5, 0xB2C1, 0xB4EE, 0xB6EA, 0xB7A2, 0xB8C1, 0xB9FE, 0xBBF7, 0xBFA6, 0xC0AC, 0xC2E8
		, 0xC4C3, 0xC5B6, 0xC5BE, 0xC6DA, 0xC8BB, 0xC8F6, 0xCBFA, 0xCDDA, 0xCEF4, 0xD1B9, 0xD4D1, 0xD7FA ]
	static FirstLetter := StrSplit("ABCDEFGHJKLMNOPQRSTWXYZ")
	static SecondTable := [ StrSplit("CJWGNSPGCGNEGYPBTYYZDXYKYGTZJNMJQMBSGZSCYJSYYFPGKBZGYDYWJKGKLJSWKPJQHYJWRDZLSYMRYPYWWCCKZNKYYG")
		, StrSplit("TTNGJEYKKZYTCJNMCYLQLYPYSFQRPZSLWBTGKJFYXJWZLTBNCXJJJJTXDTTSQZYCDXXHGCKBPHFFSSTYBGMXLPBYLLBHLX")
		, StrSplit("SMZMYJHSOJNGHDZQYKLGJHSGQZHXQGKXZZWYSCSCJXYEYXADZPMDSSMZJZQJYZCJJFWQJBDZBXGZNZCPWHWXHQKMWFBPBY")
		, StrSplit("DTJZZKXHYLYGXFPTYJYYZPSZLFCHMQSHGMXXSXJYQDCSBBQBEFSJYHWWGZKPYLQBGLDLCDTNMAYDDKSSNGYCSGXLYZAYPN")
		, StrSplit("PTSDKDYLHGYMYLCXPYCJNDQJWXQXFYYFJLEJPZRXCCQWQQSBZKYMGPLBMJRQCFLNYMYQMSQYRBCJTHZTQFRXQHXMQJCJLY")
		, StrSplit("QGJMSHZKBSWYEMYLTXFSYDXWLYCJQXSJNQBSCTYHBFTDCYZDJWYGHQFRXWCKQKXEBPTLPXJZSRMEBWHJLBJSLYYSMDXLCL")
		, StrSplit("QKXLHXJRZJMFQHXHWYWSBHTRXXGLHQHFNMGYKLDYXZPYLGGSMTCFBAJJZYLJTYANJGBJPLQGSZYQYAXBKYSECJSZNSLYZH")
		, StrSplit("ZXLZCGHPXZHZNYTDSBCJKDLZAYFFYDLEBBGQYZKXGLDNDNYSKJSHDLYXBCGHXYPKDJMMZNGMMCLGWZSZXZJFZNMLZZTHCS")
		, StrSplit("YDBDLLSCDDNLKJYKJSYCJLKWHQASDKNHCSGAGHDAASHTCPLCPQYBSZMPJLPCJOQLCDHJJYSPRCHNWJNLHLYYQYYWZPTCZG")
		, StrSplit("WWMZFFJQQQQYXACLBHKDJXDGMMYDJXZLLSYGXGKJRYWZWYCLZMSSJZLDBYDCFCXYHLXCHYZJQSQQAGMNYXPFRKSSBJLYXY")
		, StrSplit("SYGLNSCMHCWWMNZJJLXXHCHSYZSTTXRYCYXBYHCSMXJSZNPWGPXXTAYBGAJCXLYXDCCWZOCWKCCSBNHCPDYZNFCYYTYCKX")
		, StrSplit("KYBSQKKYTQQXFCMCHCYKELZQBSQYJQCCLMTHSYWHMKTLKJLYCXWHEQQHTQKZPQSQSCFYMMDMGBWHWLGSLLYSDLMLXPTHMJ")
		, StrSplit("HWLJZYHZJXKTXJLHXRSWLWZJCBXMHZQXSDZPSGFCSGLSXYMJSHXPJXWMYQKSMYPLRTHBXFTPMHYXLCHLHLZYLXGSSSSTCL")
		, StrSplit("SLDCLRPBHZHXYYFHBMGDMYCNQQWLQHJJCYWJZYEJJDHPBLQXTQKWHLCHQXAGTLXLJXMSLJHTZKZJECXJCJNMFBYCSFYWYB")
		, StrSplit("JZGNYSDZSQYRSLJPCLPWXSDWEJBJCBCNAYTWGMPAPCLYQPCLZXSBNMSGGFNZJJBZSFZYNTXHPLQKZCZWALSBCZJXSYZGWK")
		, StrSplit("YPSGXFZFCDKHJGXTLQFSGDSLQWZKXTMHSBGZMJZRGLYJBPMLMSXLZJQQHZYJCZYDJWFMJKLDDPMJEGXYHYLXHLQYQHKYCW")
		, StrSplit("CJMYYXNATJHYCCXZPCQLBZWWYTWBQCMLPMYRJCCCXFPZNZZLJPLXXYZTZLGDLTCKLYRZZGQTTJHHHJLJAXFGFJZSLCFDQZ")
		, StrSplit("LCLGJDJZSNZLLJPJQDCCLCJXMYZFTSXGCGSBRZXJQQCTZHGYQTJQQLZXJYLYLBCYAMCSTYLPDJBYREGKLZYZHLYSZQLZNW")
		, StrSplit("CZCLLWJQJJJKDGJZOLBBZPPGLGHTGZXYGHZMYCNQSYCYHBHGXKAMTXYXNBSKYZZGJZLQJTFCJXDYGJQJJPMGWGJJJPKQSB")
		, StrSplit("GBMMCJSSCLPQPDXCDYYKYPCJDDYYGYWRHJRTGZNYQLDKLJSZZGZQZJGDYKSHPZMTLCPWNJYFYZDJCNMWESCYGLBTZZGMSS")
		, StrSplit("LLYXYSXXBSJSBBSGGHFJLYPMZJNLYYWDQSHZXTYYWHMCYHYWDBXBTLMSYYYFSXJCBDXXLHJHFSSXZQHFZMZCZTQCXZXRTT")
		, StrSplit("DJHNRYZQQMTQDMMGNYDXMJGDXCDYZBFFALLZTDLTFXMXQZDNGWQDBDCZJDXBZGSQQDDJCMBKZFFXMKDMDSYYSZCMLJDSYN")
		, StrSplit("SPRSKMKMPCKLGTBQTFZSWTFGGLYPLLJZHGJJGYPZLTCSMCNBTJBQFKDHBYZGKPBBYMTDSSXTBNPDKLEYCJNYCDYKZTDHQH")
		, StrSplit("SYZSCTARLLTKZLGECLLKJLQJAQNBDKKGHPJTZQKSECSHALQFMMGJNLYJBBTMLYZXDXJPLDLPCQDHZYCBZSCZBZMSLJFLKR")
		, StrSplit("ZJSNFRGJHXPDHYJYBZGDLQCSEZGXLBLGYXTWMABCHECMWYJYZLLJJYHLGNDJLSLYGKDZPZXJYYZLWCXSZFGWYYDLYHCLJS")
		, StrSplit("CMBJHBLYZLYCBLYDPDQYSXQZBYTDKYXJYYCNRJMPDJGKLCLJBCTBJDDBBLBLCZQRPYXJCJLZCSHLTOLJNMDDDLNGKATHQH")
		, StrSplit("JHYKHEZNMSHRPHQQJCHGMFPRXHJGDYCHGHLYRZQLCYQJNZSQTKQJYMSZSWLCFQQQXYFGGYPTQWLMCRNFKKFSYYLQBMQAMM")
		, StrSplit("MYXCTPSHCPTXXZZSMPHPSHMCLMLDQFYQXSZYJDJJZZHQPDSZGLSTJBCKBXYQZJSGPSXQZQZRQTBDKYXZKHHGFLBCSMDLDG")
		, StrSplit("DZDBLZYYCXNNCSYBZBFGLZZXSWMSCCMQNJQSBDQSJTXXMBLTXZCLZSHZCXRQJGJYLXZFJPHYMZQQYDFQJJLZZNZJCDGZYG")
		, StrSplit("CTXMZYSCTLKPHTXHTLBJXJLXSCDQXCBBTJFQZFSLTJBTKQBXXJJLJCHCZDBZJDCZJDCPRNPQCJPFCZLCLZXZDMXMPHJSGZ")
		, StrSplit("GSZZQLYLWTJPFSYASMCJBTZYYCWMYTZSJJLJCQLWZMALBXYFBPNLSFHTGJWEJJXXGLLJSTGSHJQLZFKCGNNNSZFDEQFHBS")
		, StrSplit("AQTGYLBXMMYGSZLDYDQMJJRGBJTKGDHGKBLQKBDMBYLXWCXYTTYBKMRTJZXQJBHLMHMJJZMQASLDCYXYQDLQCAFYWYXQHZ") ]
	static nothing := VarSetCapacity(var, 2)
	if !RegExMatch(str, "[^\x{00}-\x{ff}]")
		return str
	loop, Parse, str
	{
		StrPut(A_LoopField, &var, "CP936")
		H := NumGet(var, 0, "UChar")
		L := NumGet(var, 1, "UChar")
		if (H < 0xB0 || L < 0xA1 || H > 0xF7 || L = 0xFF)
		{
			newStr .= A_LoopField
			continue
		}
		if (H < 0xD8)//(H >= 0xB0 && H <=0xD7)
		{
			W := (H << 8) | L
			For key, value in FirstTable
			{
				if (W < value)
				{
					newStr .= FirstLetter[key]
					break
				}
			}
		}
		else
			newStr .= SecondTable[ H - 0xD8 + 1 ][ L - 0xA1 + 1 ]
	}
	return newStr
}
;----------------------------------------------------------------------  End		
	}	
}	
;---------------------------------------------------------------------- 
/*
断言参数长度是否符合 Func 的需求
*/
afParaLength(aFunc,aParaList){
	Type.afObj(aFunc),Type.afObj(aParaList)
	tooFew:= (aParaList.Length()<aFunc.MinParams)
	tooMany:= (aParaList.Length()>aFunc.MaxParams) AND NOT(aFunc.IsVariadic)
	
	if (tooFew)
		throw Exception(_EX.TooFewParas)
	if (tooMany)
		throw Exception(_EX.TooManyParas)
	return
}
;---------------------------------------------------------------------- 
/*
自动为 Func 绑定参数
*/
AutoBind(aFunc,aParaList,aFirstPara){
	aParaList.InsertAt(1,aFirstPara)
	afParaLength(aFunc,aParaList)
	BoundFunc:=aFunc.Bind(aParaList*)
	return BoundFunc
}
;---------------------------------------------------------------------- 
/*
SmartCall 智能运行
*/
SmartCall(aThis,aFunc,aParams*){
	aParams.InsertAt(1,aThis)
	afParaLength(aFunc,aParams)
	result := %aFunc%(aParams*)
	return result
}
