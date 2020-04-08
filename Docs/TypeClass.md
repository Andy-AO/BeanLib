# TypeClass Class

1.  性质：实例类
2.	开发目的：提供与Type有关的测试对象

## 域 Fields

```AutoHotKey
Class TypeClass{
	static staticPath := "D:\AHKs\ahk_lib\Test\LibTest_toString().ahk"
	ComObj := AccWrapper.ObjectFromPoint(vChildId).get()
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
```

