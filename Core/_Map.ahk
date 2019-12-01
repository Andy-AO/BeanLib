
/*
说明:Map的工具静态类
*/

class _Map{
/*!
合并两个Map,如果元素有重合,那么aSecMap将覆盖aFirMap
*/
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
