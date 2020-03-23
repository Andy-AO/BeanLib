Class TypeClass{
	ComObj := Acc_ObjectFromPoint(vChildId)
	Obj := Object()
	ExtendsObj := new AutoInputBox("输入要增加的页码","输入要增加的页码")
	Class := AutoInputBox
	FuncObj := new Function("toString")
	Exception := Exception(_Ex.IndexOutOfBounds)
	Path := Str := "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"
	NS := ""
	Number := "123456789"
	Boolean := false
	FileObj :=  FileOpen(TypeClass.Path,"r")
}

TypeClassInstance := new TypeClass()