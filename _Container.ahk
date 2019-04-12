

/*
说明:线性数组List和关联数组Map的通用处理静态类
*/
class _Container{

/*!
提取所有相同的元素 比如:[{A:1,B:1},{A:2,B:2}]，可以提取A，就变成了 [1,2]
*/
ExtractSameElements(aList,aKey){
	Type.afList(aList)
	result := []
	for i0,map in aList {
		for theKey,v in map {
			if(theKey = akey){
				result.Push(v)
			}
		}
	}
	return result
}


;----------------------------------------------------------------------
/*!
提取Map分别为两个List(Key和Value两个链条,一一对应)
*/
mapToList(aMap){
	listKey:=[],listValue:=[]
	for Key,v in aMap {
		listKey[A_Index]:=Key
		listValue[A_Index]:=v
	}
	return Object("key",listKey,"Value",listValue)
}

;----------------------------------------------------------------------
/*!
脱壳,也就是,如果容器中的元素如果是List,而且只有一个元素,那么就把数组换成元素本身.不能递归.
*/
shuck(aContainer){
	for i,v in aContainer {
		if((type.isList(v))AND(v.length()=1)){
			aContainer[i] := v[1]
		}	
		else{
			_Container.shuck(v)
		}			
	}
	return 
}
;---------------------------------------------------------------------- 
;递归转换List为Map，List的长度必须>1，否则不转换.无法递归,只能转换一层
	swapToMap(aContainer){
		for i,v in aContainer {
			if((type.isList(v))AND(aContainer.length()>1)){
				theMap:=_List.getMapByIndex(v,"1")	
				aContainer[i] := theMap
			}	
			else{
				_Container.swapToMap(v)
			}			
		}
		return 
	}
	
	;---------------------------------------------------------------------- 
;从List-Map结构转换为2DMap
	swapToMaps(aContainer){
		for i0,v0 in aContainer {
			LogPrintln(i0,"i0 >>>")
		
			if(type.isList(v0)){
				innerMap:={}
				for i1,v1 in v0 {
					_Map.merge(innerMap,v1)
				}
				
				aContainer[i0] := innerMap
			}	
			else{
				_Container.swapToMap(v0)
			}			
		}
		return 
	}
;---------------------------------------------------------------------- 
;递归分隔String为List
	deepSplit(aContainer,aSpliter){
		for i,v in aContainer {
			if(type.isStr(v)){
				aSpliter.text := v
				newList := aSpliter.split()
				aContainer[i] := newList
			}
			else{
				_Container.deepSplit(v,aSpliter)
			}
							
		}
		return 
	}
;---------------------------------------------------------------------- 
;递归删除被正则表达式匹配的元素
	deepDelete(aContainer,aRegEx){
		theIndexList:=[]
		for i,v in aContainer {
			if(type.isStr(v)){
				 if(v.isRegExMatch(aRegEx)){
					theIndexList.push(i)
				 }					
			}
			else{
				_Container.deepDelete(v,aRegEx)
			}
				
		}
		
		try{
			_Container.Remove(aContainer,theIndexList)
		}
		catch{}
		return
	}
;---------------------------------------------------------------------- 
;List和Map自动判断的通用删除工具
	remove(aContainer,aIndexList){
		type.afObj(aContainer)
		type.afList(aIndexList)
		if(type.isList(aContainer))
			_list.Remove(aContainer,aIndexList)
		else{
			for key,v in aContainer {
				aContainer.Delete(key)
			}
		}
		return
	}
;---------------------------------------------------------------------- 
;List和Map自动判断的通用删除工具
	delete(aContainer,aIndex){
		type.afObj(aContainer)
		if(type.isList(aContainer))
			aContainer.RemoveAt(aIndex)
		else
			aContainer.Delete(aIndex)
		return
	}
} 
;-----class _Container  End
