

RegexAllMatch(Haystack,NeedleRegEx){
	if(RegExMatch(NeedleRegEx,"^[``A-Za-z]*O[``A-Za-z]*\)")){
		TheMatchObjArray := []
		StartPos := 1
		while(FoundPos := RegExMatch(Haystack, NeedleRegEx,TheMatchObj,StartPos)) {
			StartPos := FoundPos + StrLen(TheMatchObj.Value(0))
			TheMatchObjArray.Push(TheMatchObj)
		}
		return TheMatchObjArray
	}
	else
		throwWithSt("The O option was not found in " NeedleRegEx)
}
