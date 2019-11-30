
/*
说明:Map的工具静态类
*/

class _Map{
	merge(aFirMap,aSecMap){
		result := Object()
		for i,v in aFirMap {
			result[i]:=v
		}
		for i,v in aSecMap {
			result[i]:=v
		}
		return result
	}
}
