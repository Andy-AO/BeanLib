/*!
Class: _SA
数组的增强操作

Author:
BeanLib

https://www.kancloud.cn/xrvu_zen/ahk_lib/902301
https://github.com/Oilj/BeanLib
https://gitee.com/xrvu_zen/BeanLib

License:
LGPLv3

*/


Class _SA{

static RNameSA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
static LetterSA:=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
static NumberSA:=["1","2","3","4","5","6","7","8","9","0"]

;---------------------------------------------------------------------- 
/*!
字符串数组去重
*/
Uniq(StrSA){
	nameArray:=StrSA

	hash := {},MarkObj:={}
	for i, name in nameArray
		hash[name] := MarkObj

	trimmedArray := []
	for name, dummy in hash
		trimmedArray.Insert(name)
	
	NewStrSA:=trimmedArray

	return NewStrSA
}

;~ From:https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array

;----------------------------------------------------------------------

/*!
字符串数组内的替换
*/

StrReplace(StrSA,SearchText,ReplaceText,isRegEx:=false){
for i,v in StrSA{
	if(isRegEx)
Newv:=RegExReplace(v,SearchText,ReplaceText)
else
	Newv:=StrReplace(v,SearchText,ReplaceText)
StrSA[i]:=Newv
}
return
}


;----------------------------------------------------------------------

/*!
按照Index批量移除数组中的元素
*/

Remove(SA,IndexSA){

	SALength:=SA.length() ;得到数组初始长度
	MarkObj:={} ;得到标记数组
	Counter:=0 ;计数器

	loop,% IndexSA.length(){ ;填充MarkObj
		SA[IndexSA[A_Index]]:=MarkObj
	}
	;~ DeBugDeepPrintln(SA,"SA >>> ")
	loop,%SALength%{
	;~ DeBugDeepPrintln(A_Index,"A_Index >>> ")
	TheIndex:=A_Index-Counter
	;~ DeBugDeepPrintln(TheIndex,"TheIndex >>> ")
		if(SA[TheIndex]=MarkObj){
			SA.RemoveAt(TheIndex)
			Counter++
		}	
	}
	
return
}

;----------------------------------------------------------------------

/*!
复制并返回数组的一部分
*/

CopyOfRange(SA,FromIndex,ToIndex){

	NewSA:=[]

	if (FromIndex<1) OR (ToIndex>SA.Length()){
		throw Exception (_EX.IndexOutOfBounds)
	}

	if (FromIndex>ToIndex){
		throw Exception ("FromIndex is bigger than ToIndex.")
	}

	for index,v in SA{
		if ((index>=FromIndex) AND (index<=ToIndex))
			NewSA.push(v)
}

return NewSA
}

;----------------------------------------------------------------------

/*!
对数组进行排序,支持顺序,倒序,逆序
*/

;From https://sites.google.com/site/ahkref/custom-functions/sortarray


Sort(StrSA, Order="A") {
Array:=StrSA
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
统计StrSA中所有元素出现的次数
把StrSA中所有的元素都放入一个Obj,元素是key,元素出现的次数是value
*/

ElementCounter(StrSA){
	Obj:={}

	for i,Str in StrSA{
		if(i=1){
	obj[Str]:=1
	continue
}

	for key,value in obj{
		if(Str=key){
			obj[key]++
		break
		}
	
		if(A_Index=Obj.count())
			marker:=true
	}

	if(marker)
	obj[Str]:=1

	;重置marker
	marker:=false

	} ;外周循环结束
return Obj
}

}


/*!
End of class
*/
