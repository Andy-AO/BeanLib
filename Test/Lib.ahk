Class TypeClass{
	static staticPath := "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"
	ComObj := Acc_ObjectFromPoint(vChildId)
	Obj := Object()
	ExtendsObj := new AutoInputBox("输入要增加的页码","输入要增加的页码")
	Class := AutoInputBox
	FuncObj := new Function("toString")
	Exception := Exception(_Ex.IndexOutOfBounds)
	Path := Str := TypeClass.staticPath
	NS := ""
	Number := "123456789"
	Boolean := false
	FileObj :=  FileOpen(TypeClass.staticPath,"r")
}

TypeClassInstance := new TypeClass()


;------------------------------

MapFactory(aMap,aKeyFunc:="",aValueFunc:=""){
     theReturn := "",Type.assertObj(aKeyFunc),Type.assertObj(aValueFunc)
     for k,v in aMap {
          theKeyStr := theValueStr := ""
          theKeyStr := aKeyFunc.call(k)
          theValueStr := aValueFunc.call(v)
          theResult := theKeyStr ":" theValueStr
          theReturn .= theResult "`r`n"
     }
     return theReturn
}
