
/*!
Class: _List
数组的增强操作
Author:
BeanLib
https://www.kancloud.cn/xrvu_zen/ahk_lib/902301
https://github.com/Oilj/BeanLib
https://gitee.com/xrvu_zen/BeanLib
License:
LGPLv3
*/
;~ protect(_List)
Class _List{
static RNameList:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
static LetterList:=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
static NumberList:=["1","2","3","4","5","6","7","8","9","0"]
static TheList1:=["List1"]
static TheList2:=["List2"]
static ObjList:=[_List.TheList1,_List.TheList2,_List.TheList1,_List.TheList2,_List.TheList1,_List.TheList2]
;---------------------------------------------------------------------- 
Contains(ListorMap,value){
for k,v in ListorMap{
if (v=value)
	return true
}
return false
}

;---------------------------------------------------------------------- 

excludeRegEx(ExList){
	RegExString:=""
	for i,v in ExList {
		v := v.RegexEscape()
		if(i=ExList.length()){
			RegExString .= v
		}
		else
			RegExString .= v "|"
	}
	result = ^(?!.*(%RegExString%)).*$
	return result
}
;---------------------------------------------------------------------- 
exclude(DataList,ExList){
	RegEx := _List.excludeRegEx(ExList)
	LogPrintln(RegEx,"RegEx >>>")
	return _List.Match(DataList,RegEx)
}
;---------------------------------------------------------------------- 
/*!
Str数组转换为字符串
*/
ToString(Str){
	TheArrayString:=""
	TheArrayString.= "["
	For k, v in Str{
		TheArrayString.="," v
	}
; 去掉尾部多余的","
	TheArrayString := StrReplace(TheArrayString, "," , "", OutputVarCount,1)
	TheArrayString.= "]"
	return TheArrayString
 }
;---------------------------------------------------------------------- 
;返回匹配的元素的indexList
Match(list,aRegEx){
	indexList:=[]
	for i,v in list{
		if(v.isRegExMatch(aRegEx))
			indexList.push(i)
	}
		return indexList
}
;---------------------------------------------------------------------- 
/*!
数组去重
*/
Uniq(List){
	nameArray:=List
	
	hash := {},MarkObj:={}
	for i, name in nameArray
		hash[name] := MarkObj 
	trimmedArray := []
	for name, dummy in hash
		trimmedArray.push(name) ;2019年01月08日 从insert 改为push
	
	NewList:=trimmedArray
	return NewList
}
;~ From:https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array
;----------------------------------------------------------------------
/*!
根据Index List 生成 Map(IndexList应该为顺序数字)
*/
getMapByIndex(aList,aIndexList*){
	
	newList:=[]
	for i,v in aIndexList {
		if(i!=aIndexList.Length())
			newList.push([aIndexList[i]+1,aIndexList[i+1]-1])
		else
			newList.push([aIndexList[i]+1,aList.Length()])
	}
	newMap:={}
	for i,v in newList {
		newMap[aList[aIndexList[i]]]:=_List.CopyOfRange(aList,newList[i][1],newList[i][2])
	}
	return newMap
} ;----------------------------------------------------------------------
/*!
字符串数组内的替换
*/
StrReplace(StrList,SearchText,ReplaceText,isRegEx:=false){
	for i,v in StrList{
		if(isRegEx)
	Newv:=RegExReplace(v,SearchText,ReplaceText)
	else
		Newv:=StrReplace(v,SearchText,ReplaceText)
	StrList[i]:=Newv
	}
	return
}
;----------------------------------------------------------------------
/*!
字符串数组内的正则替换
*/
RegExReplace(StrList,NeedleRegEx,ReplaceText){
	for i,v in StrList{
		Newv := RegExReplace(v, NeedleRegEx , ReplaceText)
		StrList[i]:=Newv
	}
	return
}
;----------------------------------------------------------------------
/*!
按照Index批量移除数组中的元素
*/
Remove(List,IndexList){
	ListLength:=List.length() ;得到数组初始长度
	MarkObj:={} ;得到标记数组
	Counter:=0 ;计数器
	loop,% IndexList.length(){ ;填充MarkObj
		List[IndexList[A_Index]]:=MarkObj
	}
	loop,%ListLength%{
	TheIndex:=A_Index-Counter
		if(List[TheIndex]=MarkObj){
			List.RemoveAt(TheIndex)
			Counter++
		}	
	}
	
return
}
;----------------------------------------------------------------------
/*!
复制并返回数组的一部分
*/
CopyOfRange(List,FromIndex,ToIndex){
	NewList:=[]
	if (FromIndex<1) OR (ToIndex>List.Length()){
		throw Exception (_EX.IndexOutOfBounds)
	}
	if (FromIndex>ToIndex){
		throw Exception ("FromIndex is bigger than ToIndex.")
	}
	for index,v in List{
		if ((index>=FromIndex) AND (index<=ToIndex))
			NewList.push(v)
}
return NewList
}
;----------------------------------------------------------------------
/*!
对数组进行排序,支持顺序,倒序,逆序
*/
;From https://sites.google.com/site/ahkref/custom-functions/sortarray
Sort(StrList, Order="A") {
Array:=StrList
	MaxIndex := ObjMaxIndex(Array)
	if (Order = "R") {
		count := 0
		loop, % MaxIndex
			ObjInsert(Array, ObjRemove(Array, MaxIndex - count++))
		return
	}
	Partitions := "|" ObjMinIndex(Array) "," MaxIndex
	loop {
		comma := InStr(this_partition := SubStr(Partitions, InStr(Partitions, "|", False, 0)+1), ",")
		spos := pivot := SubStr(this_partition, 1, comma-1) , epos := SubStr(this_partition, comma+1)
		if (Order = "A") {
			loop, % epos - spos {
				if (Array[pivot] > Array[A_Index+spos])
					ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))
			}
		} else {
			loop, % epos - spos {
				if (Array[pivot] < Array[A_Index+spos])
					ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))
			}
		}
		Partitions := SubStr(Partitions, 1, InStr(Partitions, "|", False, 0)-1)
		if (pivot - spos) > 1    ;if more than one elements
			Partitions .= "|" spos "," pivot-1        ;the left partition
		if (epos - pivot) > 1    ;if more than one elements
			Partitions .= "|" pivot+1 "," epos        ;the Right partition
	} Until !Partitions
	return
}
;----------------------------------------------------------------------
/*!
统计StrList中所有元素出现的次数
把StrList中所有的元素都放入一个Obj,元素是key,元素出现的次数是value
*/
ElementCounter(List){
	ResultObj:={},marker:=false
	for i,TheObj in List{
		if(i=1){
	ResultObj[TheObj]:=1
	continue
}
	for key,value in ResultObj{
		if(TheObj=key){
			ResultObj[key]++
		break
		}
	
		if(A_Index=ResultObj.count())
			marker:=true
	}
	if(marker)
	ResultObj[TheObj]:=1
	;重置marker
	marker:=false
	} ;外周循环结束
return ResultObj
}
}
/*!
End of class
*/
