**序列化对象到内存或硬盘**

*Serialization（序列化）是一种将对象以一连串的字节描述的过程；反序列化 deserialization 是一种将这些字节重建成一个对象的过程。*

```autohotkey
保存对象到内存(变量)
size := ObjDump(Object,Variable,DumpBuffer)
保存对象到硬盘(文件)
size := ObjDump(FilePath,Object,DumpBuffer)

```

从内存(变量)读取对象
Obj := ObjLoad(Address)
从硬盘读取对象
Obj := ObjLoad(FilePath)

### 返回 Returns: 
size 文件大小(字节)
### 示例 Example
```autohotkey
theMap := Object("A","a","B","1234") 
StartTime := A_TickCount
FilePath := "D:\AHKs\Dev\SerializationTest.Obj"
size := ObjDump(FilePath,theMap)
LogPrintln(size,A_LineFile  "("  A_LineNumber  ")"  " : " "size >>> `r`n")
SerializationTestObj := ObjLoad(FilePath)
LogPrintln(SerializationTestObj,A_LineFile  "("  A_LineNumber  ")"  " : " "SerializationTestObj >>> `r`n")

```